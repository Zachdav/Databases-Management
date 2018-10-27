package edu.uga.DIYDB.main;

/****************************************************************************************
 * @file  Table.java
 *
 * @author   John Miller
 */

import java.io.*;
import java.util.*;
import java.util.function.*;
import java.util.stream.*;

import static java.lang.Boolean.*;
import static java.lang.System.out;

/****************************************************************************************
 * This class implements relational database tables (including attribute names, domains
 * and a list of tuples.  Five basic relational algebra operators are provided: project,
 * select, union, minus and join. The insert data manipulation operator is also provided.
 * Missing are update and delete data manipulation operators.
 */
public class Table implements Serializable {
	
    /** Relative path for storage directory
     */
    private static final String DIR = "store" + File.separator;

    /** Filename extension for database files
     */
    private static final String EXT = ".dbf";

    /** Counter for naming temporary tables.
     */
    private static int count = 0;

    /** Table name.
     */
    private final String name;

    /** Array of attribute names.
     */
    private final String[] attribute;

    /** Array of attribute domains: a domain may be
     *  integer types: Long, Integer, Short, Byte
     *  real types: Double, Float
     *  string types: Character, String
     */
    private final Class[] domain;

    /** Collection of tuples (data storage).
     */
    private final List<Comparable[]> tuples;

    /** Primary key. 
     */
    private final String[] key;

    /** Index into tuples (maps key to tuple number).
     */
    private final Map<KeyType, Comparable[]> index;

    //----------------------------------------------------------------------------------
    // Constructors
    //----------------------------------------------------------------------------------

    /************************************************************************************
     * Construct an empty table from the meta-data specifications.
     *
     * @param _name       the name of the relation
     * @param _attribute  the string containing attributes names
     * @param _domain     the string containing attribute domains (data types)
     * @param _key        the primary key
     */  
    public Table(String _name, String[] _attribute, Class[] _domain, String[] _key) {
        name      = _name;
        attribute = _attribute;
        domain    = _domain;
        key       = _key;
        tuples    = new ArrayList<>();
        index     = new TreeMap<>();
//      index     = new LinkedHashMap <> (KeyType.class, Comparable [].class); // this shows an error
    } // constructor

    /************************************************************************************
     * Construct a table from the meta-data specifications and data in _tuples list.
     *
     * @param _name       the name of the relation
     * @param _attribute  the string containing attributes names
     * @param _domain     the string containing attribute domains (data types)
     * @param _key        the primary key
     * @param _tuple      the list of tuples containing the data
     */  
    public Table(String _name, String[] _attribute, Class[] _domain, String [] _key, List<Comparable[]> _tuples) {
        name      = _name;
        attribute = _attribute;
        domain    = _domain;
        key       = _key;
        tuples    = _tuples;
        index     = new TreeMap<>(); // also try BPTreeMap, LinHashMap or ExtHashMap
    } // constructor

    /************************************************************************************
     * Construct an empty table from the raw string specifications.
     *
     * @param name        the name of the relation
     * @param attributes  the string containing attributes names
     * @param domains     the string containing attribute domains (data types)
     */
    public Table(String name, String attributes, String domains, String _key) {
        this(name, attributes.split(" "), findClass(domains.split(" ")), _key.split(" "));
        out.println("DDL> create table " + name + " (" + attributes + ")");
    } // constructor

    //----------------------------------------------------------------------------------
    // Public Methods
    //----------------------------------------------------------------------------------

    /************************************************************************************
     * Project the tuples onto a lower dimension by keeping only the given attributes.
     * Check whether the original key is included in the projection.
     *
     * #usage movie.project ("title year studioNo")
     * 
     * @author BRANDON CANADAY
     * @date 1/24/18
     *
     * @param attributes  the attributes to project onto
     * @return  a table of projected tuples
     */
    public Table project(String attributes) {
        out.println("RA> " + name + ".project (" + attributes + ")");
        String[] attrs     = attributes.split(" ");
        
        // ----- start my code
        
        // check to see if valid column names for this table
        for(int i = 0; i < attrs.length; i++) {
        	if(col(attrs[i]) == -1) {
        		// column name doesn't exist for this table
        		out.println("project ERROR: "+attrs[i]+" is not a valid column name for this table");
                return null;
        	} // if
        } // for
        
        // ----- end my code
        
        Class[]  colDomain = extractDom(match(attrs), domain);
        String[] newKey    = (Arrays.asList(attrs).containsAll(Arrays.asList(key))) ? key : attrs;

        List<Comparable[]> rows = new ArrayList<>();
        
        // ----- start my code
        
        for(int i = 0; i < tuples.size(); i++) {
        	Comparable[] projectedTuple = extract(tuples.get(i), attrs);
        	boolean isDuplicate = false;
        	
        	// check to see if tuple already added to rows
        	for(int j = 0; j < rows.size(); j++) {
        		if(isDuplicate(projectedTuple, rows.get(j))) {
        			isDuplicate = true;
        			break;
        		} // if
        	} // for
      
        	if(!isDuplicate) rows.add(projectedTuple);
        } // for
        
        // ----- end my code

        return new Table(name + count++, attrs, colDomain, newKey, rows);
    } // project

    /************************************************************************************
     * Select the tuples satisfying the given predicate (Boolean function).
     *
     * #usage movie.select(t -> t[movie.col("year")].equals(1977))
     *
     * @param predicate  the check condition for tuples
     * @return  a table with tuples satisfying the predicate
     */
    public Table select(Predicate<Comparable[]> predicate) {
        out.println("RA> " + name + ".select (" + predicate + ")");
        return new Table(name + count++, attribute, domain, key,
                   tuples.stream().filter(t -> predicate.test(t))
                                   .collect(Collectors.toList()));
    } // select

    /************************************************************************************
     * Select the tuples satisfying the given key predicate (key = value).  Use an index
     * (Map) to retrieve the tuple with the given key value.
     * 
     * @author BRANDON CANADAY
     * @date 1/25/18
     *
     * @param keyVal  the given key value
     * @return  a table with the tuple satisfying the key predicate
     */
    public Table select(KeyType keyVal) {
        out.println("RA> " + name + ".select (" + keyVal + ")");

        List<Comparable[]> rows = new ArrayList<>();

        // ----- start my code
        
        boolean matched = false;
        // try to find tuple matching given key values
        for(int i = 0; i < tuples.size(); i++) {
        	// get primary key values(s) for current tuple
        	KeyType currKey = new KeyType(extract(tuples.get(i), key));
            // check if given key values match current tuples key values
            if(keyVal.equals(currKey)) {
            	rows.add(tuples.get(i));
        		matched = true;
        		break;
            } // if
        } // for
        	
        // ----- end my code

        return new Table(name + count++, attribute, domain, key, rows);
    } // select

    /************************************************************************************
     * Union this table and table2.  Check that the two tables are compatible.
     *
     * #usage movie.union (show)
     * 
     * @author BRANDON CANADAY
     * @date 1/25/18
     *
     * @param table2  the rhs table in the union operation
     * @return  a table representing the union
     */
    public Table union(Table table2) {
        out.println ("RA> " + name + ".union (" + table2.name + ")");
        if(!compatible(table2)) {
        	out.println("union ERROR: tables are not union compatible");
        	return null;
        } // if

        List<Comparable[]> rows = new ArrayList<>();
        
        // ----- start my code

        // add tuples from this table
        for(int i = 0; i < tuples.size(); i++) {
        	Comparable[] currTuple = tuples.get(i);
        	boolean isDuplicate = false;
        	
        	// check to see if tuple already added to rows
        	for(int j = 0; j < rows.size(); j++) {
        		if(isDuplicate(currTuple, rows.get(j))) {
        			isDuplicate = true;
        			break;
        		} // if
        	} // for
        	
        	// add the tuple only if not already there
        	if(!isDuplicate) rows.add(currTuple);
        } // for
        
        // add tuples from the given table
        for(int i = 0; i < table2.getTuples().size(); i++) {
        	Comparable[] currTuple = table2.getTuples().get(i);
        	boolean isDuplicate = false;
        	
        	// check to see if tuple already added to rows
        	for(int j = 0; j < rows.size(); j++) {
        		if(isDuplicate(currTuple, rows.get(j))) {
        			isDuplicate = true;
        			break;
        		} // if
        	} // for
        	
        	// add the tuple only if not already there
        	if(!isDuplicate) rows.add(currTuple);
        } // for
        
        // ----- end my code

        return new Table(name + count++, attribute, domain, key, rows);
    } // union

    /************************************************************************************
     * Take the difference of this table and table2.  Check that the two tables are
     * compatible.
     *
     * #usage movie.minus (show)
     * 
     * @author BRANDON CANADAY
     * @date 1/25/18
     *
     * @param table2  The rhs table in the minus operation
     * @return  a table representing the difference
     */
    public Table minus(Table table2) {
        out.println("RA> " + name + ".minus (" + table2.name + ")");
        if(!compatible(table2)) {
        	out.println("minus ERROR: tables are not union compatible");
        	return null;
        } // if

        List<Comparable[]> rows = new ArrayList<>();

        // ----- start my code
        
        for(int i = 0; i < tuples.size(); i++) {
        	Comparable[] currTuple = tuples.get(i);
        	boolean inOtherTable = false;
        	
        	// check if tuple is in other table
        	for(int j = 0; j < table2.getTuples().size(); j++) {
        		if(isDuplicate(currTuple, table2.getTuples().get(j))) {
        			inOtherTable = true;
        			break;
        		} // if
        	} // for
        	
        	// add the tuple only if not in other table
        	if(!inOtherTable) rows.add(currTuple);
        } // for
        
        // ----- end my code

        return new Table(name + count++, attribute, domain, key, rows);
    } // minus

    /************************************************************************************
     * Join this table and table2 by performing an "equi-join".  Tuples from both tables
     * are compared requiring attributes1 to equal attributes2.  Disambiguate attribute
     * names by append "2" to the end of any duplicate attribute name.
     *
     * #usage movie.join ("studioNo", "name", studio)
     * 
     * @author JACOB AMBROSE
     * @date 1/28/18
     *
     * @param attribute1  the attributes of this table to be compared (Foreign Key)
     * @param attribute2  the attributes of table2 to be compared (Primary Key)
     * @param table2      the rhs table in the join operation
     * @return  a table with tuples satisfying the equality predicate
     */
    public Table join(String attributes1, String attributes2, Table table2) {
        out.println("RA> " + name + ".join(" + attributes1 + ", " + attributes2 + ", "
                                               + table2.getName() + ")");

     
        String[] t_attrs = attributes1.split(" ");
        String[] u_attrs = attributes2.split(" ");

        List<Comparable[]> rows = new ArrayList<>();

        //  start code
        
        //checks to see if all attribute names are correct
        for(int i = 0; i < t_attrs.length; i++) {
        		if(col(t_attrs[i])== -1)  {
        			out.println("Join ERROR: attributes not found");
        			return null;
        		}//if
        }//for
        for(int i = 0; i < u_attrs.length; i++) {
    			if(table2.col(u_attrs[i])== -1)  {
    				out.println("Join ERROR: attributes not found");
    				return null;
    			}//if
        }//for
        //checks to see if domains are compatable
        Class [] d1 = extractDom(match(t_attrs), domain);
        Class [] d2 = table2.extractDom(table2.match(u_attrs), table2.domain);
        for(int i = 0; i < d1.length; i++)
        		if(!d1[i].equals(d2[i])) {
        			out.println("Join ERROR: attributes not compatable");
        			return null;
        		}//if
        
        // add tuples from this table
        for(int i = 0; i < tuples.size(); i++) {
        		Comparable[] currTuple = tuples.get(i);
        		
        		//get table1 attr to compare
        		Comparable[] compTuple = extract(currTuple, t_attrs);
        	
        		Comparable[] tupleToAdd = null;
        		//for find the tuple in table2
        		for(int j = 0; j < table2.getTuples().size(); j++) {
        			Comparable[] currTuple2 = table2.getTuples().get(j);
        			Comparable[] compTuple2 = table2.extract(currTuple2, u_attrs);
        			if(isDuplicate(compTuple, compTuple2)) {
        				tupleToAdd = currTuple2;
        				break;
        			}//if
        		}//for
        		
        		//if not found
        		if(tupleToAdd == null) {
        			out.println("Join ERROR: primary key not found in table2");
            		return null;
        		}//if
        		
        		//create the new tuple
        		Comparable[] newTuple =  new Comparable[currTuple.length + tupleToAdd.length];
        		for(int j = 0; j < currTuple.length; j++) {
        			newTuple[j] = currTuple[j];
        		}//for
        		for(int j = 0; j < tupleToAdd.length; j++) {
        			newTuple[j+currTuple.length] = tupleToAdd[j];
        		}//for
        	
        		rows.add(newTuple);
        } // for
        
      
        //create new attribute names from table2.
        String[] newAttr = new String[table2.attribute.length];
        for(int i = 0; i < newAttr.length; i++) {
        		if(col(table2.attribute[i]) > 0) newAttr[i] = table2.attribute[i].concat("2");
        		else newAttr[i] = table2.attribute[i];
        }//for

        return new Table(name + count++, ArrayUtil.concat(attribute, table2.attribute),
                                          ArrayUtil.concat(domain, table2.domain), key, rows);
        //end code
        
    } // join

    /************************************************************************************
     * Join this table and table2 by performing an "natural join".  Tuples from both tables
     * are compared requiring common attributes to be equal.  The duplicate column is also
     * eliminated.
     *
     * #usage movieStar.join (starsIn)
     *
     * @author JACOB AMBROSE
     * @date 1/28/18
     *
     * @param table2  the rhs table in the join operation
     * @return  a table with tuples satisfying the equality predicate
     */
    public Table join(Table table2) {
        out.println("RA> " + name + ".join(" + table2.getName() + ")");

        List<Comparable[]> rows = new ArrayList<>();

        //  start code
        
        //checks if need to do crossproduct
        for(int i = 0; i < table2.key.length; i++)
        		if(col(table2.key[i]) == -1) return crossProduct(table2);
        
        //get list of attributes for foreign keys
        int [] fkeys = match(table2.key);
        String[] attr1 = new String[fkeys.length];
        for(int i = 0; i < fkeys.length; i++) {
        		attr1[i] = attribute[fkeys[i]];
        }//for
        String[] attr2 = new String[fkeys.length];
        for(int i = 0; i < fkeys.length; i++) {
        		attr2[i] = table2.attribute[fkeys[i]];
        }//for
        
        //get list of attributes to include in table2
        String[] attrFromT2 = new String[table2.attribute.length - attr2.length];
        Boolean inCols = false;
        for(int i = 0, j = 0; i < table2.attribute.length; i++) {
        		for(int k = 0; k < attr2.length; k++)
        			if(attr2[k].equals(table2.attribute[i])) inCols = true;
        		if(!inCols) {
        			attrFromT2[j] = table2.attribute[i];
        			j++;
        		}//if
        		inCols = false;
        	}//for
        
       for(int i = 0; i < attrFromT2.length; i ++)
    	   		out.println(attrFromT2[i].toString());
        
        // add tuples from this table
        for(int i = 0; i < tuples.size(); i++) {
        		Comparable[] currTuple = tuples.get(i);
        		
        		//get table1 attr to compare
        		Comparable[] compTuple = extract(currTuple, attr1);
        	
        		Comparable [] tupleToAdd = null;
        		//for find the tuple in table2
        		for(int j = 0; j < table2.getTuples().size(); j++) {
        			Comparable[] currTuple2 = table2.getTuples().get(j);
        			Comparable[] compTuple2 = table2.extract(currTuple2, attr2);
        			if(isDuplicate(compTuple, compTuple2)) {
        				tupleToAdd = extract(currTuple2, attrFromT2);
        				break;
        			}//if
        		}//for
        		
        		Comparable[] newTuple;
        		//create the new tuple
        		if(!(tupleToAdd == null)) {
        			newTuple =  new Comparable[currTuple.length + tupleToAdd.length];
        			for(int j = 0; j < currTuple.length; j++) {
        				newTuple[j] = currTuple[j];
        			}//for
        			for(int j = 0; j < tupleToAdd.length; j++) {
        				newTuple[j+currTuple.length] = tupleToAdd[j];
        			}//for
        		}else {
        			newTuple =  new Comparable[currTuple.length];
        			for(int j = 0; j < currTuple.length; j++) {
        				newTuple[j] = currTuple[j];
        			}//for
        		}//if else
        			
        		rows.add(newTuple);
        } // for
        
        //find domain of attributes
        Class[] domainFromT2 = table2.extractDom(match(attrFromT2), table2.domain);

        // FIXed to select from attributes
        return new Table(name + count++, ArrayUtil.concat(attribute, attrFromT2),
                                          ArrayUtil.concat(domain, domainFromT2), key, rows);
        //end code
    } // join
    
    //start my code
    
    /************************************************************************************
     * Computes corssproduct of table and table2
     *
     * #usage movieStar.join (starsIn)
     *
     * @author JACOB AMBROSE
     * @date 1/29/18
     *
     * @param table2  the rhs table in the join operation
     * @return  a table with tuples satisfying the equality predicate
     */
    public Table crossProduct(Table table2) {
        out.println("RA> " + name + ".join(" + table2.getName() + ")");

        List<Comparable[]> rows = new ArrayList<>();
        
        // add tuples from this table
        for(int i = 0; i < tuples.size(); i++) {
        		Comparable[] currTuple = tuples.get(i);
        	
        		for(int j = 0; j < table2.getTuples().size(); j++) {
        			Comparable[] currTuple2 = table2.getTuples().get(j);
        			
        			//create the new tuple
            		Comparable[] newTuple =  new Comparable[currTuple.length + currTuple2.length];
            		for(int k = 0; k < currTuple.length; k++) {
            			newTuple[k] = currTuple[k];
            		}//for
            		for(int k = 0; k < currTuple2.length; k++) {
            			newTuple[k+currTuple.length] = currTuple2[k];
            		}//for
            	
            		rows.add(newTuple);
        			
        		}//for
        		
        } // for

        // FIXed to select from attributes
        return new Table(name + count++, ArrayUtil.concat(attribute, table2.attribute),
                                          ArrayUtil.concat(domain, table2.domain), key, rows);
        //end code
    } // cross Product

    /************************************************************************************
     * Return the column position for the given attribute name.
     *
     * @param attr  the given attribute name
     * @return  a column position
     */
    public int col(String attr) {
        for(int i = 0; i < attribute.length; i++) {
           if(attr.equals(attribute[i])) return i;
        } // for
        return -1; // not found
    } // col

    /************************************************************************************
     * Insert a tuple to the table.
     *
     * #usage movie.insert ("'Star_Wars'", 1977, 124, "T", "Fox", 12345)
     *
     * @param tup  the array of attribute values forming the tuple
     * @return  whether insertion was successful
     */
    public boolean insert(Comparable[] tup) {
        out.println("DML> insert into " + name + " values ( " + Arrays.toString(tup) + " )");
        if(typeCheck(tup)) {
            tuples.add(tup);
            Comparable[] keyVal = new Comparable[key.length];
            int [] cols = match(key);
            for(int j = 0; j < keyVal.length; j++) {
            	keyVal[j] = tup[cols[j]];
            } // for
            index.put(new KeyType(keyVal), tup);
            return true;
        } else {
            return false;
        } // if
    } // insert

    /************************************************************************************
     * Get the name of the table.
     *
     * @return  the table's name
     */
    public String getName() {
        return name;
    } // getName

    /************************************************************************************
     * Print this table.
     */
    public void print() {
        out.println("\n Table " + name);
        out.print("|-");
        for(int i = 0; i < attribute.length; i++) {
        	out.print("---------------");
        } // for
        out.println("-|");
        out.print("| ");
        for(String a : attribute) {
        	out.printf("%15s", a);
        } // for
        out.println(" |");
        out.print("|-");
        for(int i = 0; i < attribute.length; i++) {
        	out.print("---------------");
        } // for
        out.println("-|");
        for(Comparable[] tup : tuples) {
            out.print("| ");
            for(Comparable attr : tup) {
            	out.printf("%15s", attr);
            } // for
            out.println(" |");
        } // for
        out.print("|-");
        for(int i = 0; i < attribute.length; i++) {
        	out.print ("---------------");
        } // for
        out.println("-|");
    } // print

    /************************************************************************************
     * Print this table's index (Map).
     */
    public void printIndex() {
        out.println("\n Index for " + name);
        out.println("-------------------");
        for(Map.Entry<KeyType, Comparable[]> e : index.entrySet()) {
            out.println(e.getKey() + " -> " + Arrays.toString(e.getValue()));
        } // for
        out.println("-------------------");
    } // printIndex

    /************************************************************************************
     * Load the table with the given name into memory. 
     *
     * @param name  the name of the table to load
     */
    public static Table load(String name) {
        Table tab = null;
        try {
            ObjectInputStream ois = new ObjectInputStream(new FileInputStream(DIR + name + EXT));
            tab = (Table) ois.readObject();
            ois.close();
        } catch(IOException ex) {
            out.println("load: IO Exception");
            ex.printStackTrace();
        } catch(ClassNotFoundException ex) {
            out.println("load: Class Not Found Exception");
            ex.printStackTrace();
        } // try
        return tab;
    } // load

    /************************************************************************************
     * Save this table in a file.
     */
    public void save() {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(DIR + name + EXT));
            oos.writeObject(this);
            oos.close();
        } catch(IOException ex) {
            out.println("save: IO Exception");
            ex.printStackTrace();
        } // try
    } // save
    
    /************************************************************************************
     * Returns the tuples for the table as a list.
     * 
     * **Note: this method was not here originally (needed for methods taking Table as parameter)
     *
     * @author BRANDON CANADAY
     * @date 1/25/18
     *
     * @return  tuples of the table
     */
    public List<Comparable[]> getTuples() {
    	return tuples;
    } // getTuples

    //----------------------------------------------------------------------------------
    // Private Methods
    //----------------------------------------------------------------------------------

    /************************************************************************************
     * Determine whether the two tables (this and table2) are compatible, i.e., have
     * the same number of attributes each with the same corresponding domain.
     *
     * @param table2  the rhs table
     * @return  whether the two tables are compatible
     */
    private boolean compatible(Table table2) {
        if(domain.length != table2.domain.length) {
            out.println("compatible ERROR: table have different arity");
            return false;
        } // if
        for(int j = 0; j < domain.length; j++) {
            if(domain[j] != table2.domain[j]) {
                out.println("compatible ERROR: tables disagree on domain " + j);
                return false;
            } // if
        } // for
        return true;
    } // compatible

    /************************************************************************************
     * Match the column and attribute names to determine the domains.
     *
     * @param column  the array of column names
     * @return  an array of column index positions
     */
    private int[] match(String[] column) {
        int[] colPos = new int[column.length];
        
        for(int j = 0; j < column.length; j++) {
            boolean matched = false;
            for(int k = 0; k < attribute.length; k++) {
                if(column[j].equals(attribute[k])) {
                    matched = true;
                    colPos[j] = k;
                } // for
            } // for
            if(!matched) {
                out.println("match: domain not found for " + column[j]);
            } // if
        } // for

        return colPos;
    } // match

    /************************************************************************************
     * Extract the attributes specified by the column array from tuple t.
     *
     * @param t       the tuple to extract from
     * @param column  the array of column names
     * @return  a smaller tuple extracted from tuple t 
     */
    private Comparable[] extract(Comparable[] t, String[] column) {
        Comparable[] tup = new Comparable[column.length];
        int[] colPos = match(column);
        for(int j = 0; j < column.length; j++) {
        	tup[j] = t[colPos[j]];
        } // for
        return tup;
    } // extract
    
    /************************************************************************************
     * Checks to see if two tuples are exactly the same (same size, same types, same values).
     * 
     * **Note: this method was not here originally
     * 
     * @author: BRANDON CANADAY
     * @date: 1/24/18
     *
     * @param t1  a tuple as a list of attribute values
     * @param t2  a tuple as a list of attribute values
     * @return  whether the tuples are of the same size && types && values
     */
    private boolean isDuplicate(Comparable[] t1, Comparable[] t2) {
    	
    	// ----- start my code
    	
    	// length check
    	if(t1.length != t2.length) return false;
    	
        for(int i = 0; i < t1.length; i++) {
        	// type check
            if(t1[i].getClass() != t2[i].getClass()) return false;
            // value check
            if(!t1[i].equals(t2[i])) return false;
        } // for
        
        // ----- end my code
        
        return true;
    } // isDuplicate

    /************************************************************************************
     * Check the size of the tuple (number of elements in list) as well as the type of
     * each value to ensure it is from the right domain.
     * 
     * @author: BRANDON CANADAY
     * @date: 1/22/18
     *
     * @edited: Zachary Davis
     * @date: 1/29/18
     *
     * @param t  the tuple as a list of attribute values
     * @return  whether the tuple has the right size and values that comply
     *          with the given domains
     */
    private boolean typeCheck(Comparable[] t) {
    	
    	// ----- start my code
    	Double X = new Double(0.0);
    	Float Y = new Float(0.0);
    	
    	
    	if(domain.length != t.length) {
            out.println("typeCheck ERROR: tuple has different arity");
            return false;
        } // if
        for(int j = 0; j < domain.length; j++) {
        		if(domain[j] != t[j].getClass()) {
        			if((X.getClass() == t[j].getClass()) && (Y.getClass() == domain[j])) {
            			return true;
            	}//if
                else {
                		out.println("typeCheck ERROR: tuple disagrees with table domain " + j);
                		return false;
                }//else
            } // if
        } // for
        
        // ----- end my code
        
        return true;
    } // typeCheck

    /************************************************************************************
     * Find the classes in the "java.lang" package with given names.
     *
     * @param className  the array of class name (e.g., {"Integer", "String"})
     * @return  an array of Java classes
     */
    private static Class[] findClass(String[] className) {
        Class[] classArray = new Class[className.length];

        for(int i = 0; i < className.length; i++) {
            try {
                classArray[i] = Class.forName("java.lang." + className[i]);
            } catch(ClassNotFoundException ex) {
                out.println("findClass: " + ex);
            } // try
        } // for

        return classArray;
    } // findClass

    /************************************************************************************
     * Extract the corresponding domains.
     *
     * @param colPos the column positions to extract.
     * @param group  where to extract from
     * @return  the extracted domains
     */
    private Class[] extractDom(int[] colPos, Class[] group) {
        Class[] obj = new Class[colPos.length];

        for (int j = 0; j < colPos.length; j++) {
            obj[j] = group[colPos[j]];
        } // for

        return obj;
    } // extractDom

} // Table

