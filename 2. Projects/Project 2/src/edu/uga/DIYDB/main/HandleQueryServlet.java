package edu.uga.DIYDB.main;

import java.io.IOException;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapperBuilder;
import freemarker.template.SimpleHash;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

/**
 * Servlet implementation class HandleQueryServlet. This will handle the SQL requests 
 * from the main page and return result sets in the form of html as HTTP responses.
 * 
 * @author Brandon Canaday
 */
@WebServlet("/HandleQueryServlet")
public class HandleQueryServlet extends HttpServlet {
	
	// ---------- VARIABLES ----------
	
	private static final long serialVersionUID = 1L;
	Configuration fm_config = null;
	private String template_location = "/WEB-INF/templates";

	// ---------- CONSTRUCTOR ----------

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HandleQueryServlet() {
		super();
	} // Constructor

	/**
	 * This is currently being used to setup the Freemarker templating engine.
	 */
	public void init() {
		// Create your Configuration instance, and specify if up to what FreeMarker
		// version (here 2.3.25) do you want to apply the fixes that are not 100%
		// backward-compatible. See the Configuration JavaDoc for details.
		fm_config = new Configuration(Configuration.VERSION_2_3_25);

		// Specify the source where the template files come from.
		fm_config.setServletContextForTemplateLoading(getServletContext(), template_location);

		// Sets how errors will appear.
		// During web page *development* TemplateExceptionHandler.HTML_DEBUG_HANDLER is better.
		// This handler outputs the stack trace information to the client, formatting it so 
		// that it will be usually well readable in the browser, and then re-throws the exception.
		//		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		fm_config.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);

		// Don't log exceptions inside FreeMarker that it will thrown at you anyway:
		// Specifies if TemplateException-s thrown by template processing are logged by FreeMarker or not. 
		//		cfg.setLogTemplateExceptions(false);
	} // init
	
	// ---------- GET AND POST ----------

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// check if all params exist
		if( request.getParameter("search_button") != null &&
		    request.getParameter("sql-query") != null &&
		   !request.getParameter("sql-query").isEmpty() ) {
			runTemplate(request, response);
		} else {
			// missing required param
			request.getRequestDispatcher("index.html").forward(request, response);
		} // if/else
	} // doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	} // doPost
	
	// ---------- OTHER METHODS ----------
	
	/**
	 * 
	 * This takes in the HTTP req object, grabs the SQL query and limits it to the first
	 * 100 results, and then attempts to execute it and create an HTML table from which
	 * the freemarker template page will built and returned. Note, the query is assumed 
	 * to be valid and appropriate for the given database. An exception will be thrown if
	 * it is not.
	 * 
	 * @param request the HTTP req obj
	 * @param response the HTTP res obj
	 */
	public void runTemplate(HttpServletRequest request, HttpServletResponse response) {
		// these lines never change
		Template template = null;
		DefaultObjectWrapperBuilder df = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
		SimpleHash templateData = new SimpleHash(df.build());
		
		// gets the necessary template parameters from either session object or POST[]
		String query = request.getParameter("sql-query");
		// remove semicolon if necessary
		if(query.endsWith(";")) query = query.substring(0, query.length()-1);
		// limit query to first 100 results
		String queryLimited = query + " LIMIT 100";
		String table_html = fetchTableResults(queryLimited);
		
		// place template params in hash map to be accessed by results.ftl
		templateData.put("query", queryLimited);
		templateData.put("results", table_html);
		
		// attempt to load the template
		try {
			template = fm_config.getTemplate("results.ftl");
			response.setContentType("text/html");
			Writer out = response.getWriter();
			template.process(templateData, out);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} // try/catch
	} // runTemplate
	
	/**
	 * Calls execute query on the given SQL string, gets the result set, and convert the
	 * tuples and table data in an HTML table structure.
	 * 
	 * @param query the given SQL string
	 * @return an HTML table
	 */
	private String fetchTableResults(String query) {
		Connection con = null;
    	ResultSet rset = null;
    	String html = "";
    	con = DatabaseAccess.mysql_connect();
    	rset = DatabaseAccess.execute_query(con, query);
		html = tableResultsToHTML(rset);
		DatabaseAccess.mysql_close(con);
    	return html;
	} // fetchTableResults

	/**
	 * Converts a result set of tuples and metadata into an HTML table.
	 * 
	 * @param rset the given result set to convert
	 * @return an HTML table
	 */
	private String tableResultsToHTML(ResultSet rset) {
		String html = "";
		ResultSetMetaData rsmd = null;
		String[] col_names = null;
		int num_cols = 0;
		try {
			rsmd = rset.getMetaData();
			num_cols = rsmd.getColumnCount();
			col_names = new String[num_cols];
			// retrieves all the column labels for the table and stores them in an array
			for(int i = 0; i < num_cols; i++) {
				col_names[i] = rsmd.getColumnLabel(i+1);
			} // for
			// now, create the html table to format the result set data
			html += "<table class='result-set'>"; 
			html += "<tr class='result-row'>";
			for(int i = 0; i < num_cols; i++) { // create column headers
				html += "<th>" + col_names[i] + "</th>";
			} // for
			html += "</tr>";
			while(rset.next()) {
				html += "<tr class='result-row'>";
				for(int i = 1; i <= num_cols; i++) {
					html += "<td>";
					html = (rset.getObject(i) == null) ? // protects against null column values
							html + "NULL" : html + rset.getObject(i).toString();
					html += "</td>";
				} // for
				html += "</tr>";
			} // while
			html += "</table>";
		} catch(SQLException e) {
			e.printStackTrace();
		} // try/catch
		return html;
	} // tableResultsToHTML
	
} // HandleQueryServlet
