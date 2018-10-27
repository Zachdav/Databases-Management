package edu.uga.DIYDB.main;

import java.sql.Connection;

/*****************************************************************************************
 * @file  TestTupleGenerator.java
 *
 * @author   Sadiq Charaniya, John Miller
 */

/*****************************************************************************************
 * This class tests the TupleGenerator on the Student Registration Database defined in the
 * Kifer, Bernstein and Lewis 2006 database textbook (see figure 3.6).  The primary keys
 * (see figure 3.6) and foreign keys (see example 3.2.2) are as given in the textbook.
 */
public class TestTupleGenerator
{
    /*************************************************************************************
     * The main method is the driver for TestGenerator.
     * @param args  the command-line arguments
     */
    public static void main (String [] args)
    {
        TupleGenerator test = new TupleGeneratorImpl();
        Connection conn = DatabaseAccess.mysql_connect();
        // TupleGenerator selectRange = new TupleGeneratorImpl() ;


        test.addRelSchema ("Student",
                "id name address status",
                "Integer String String String",
                "id",
                null);
        
        test.addRelSchema ("Department",
                "id deptName",
                "Integer String",
                "id",
                null);

        test.addRelSchema ("Professor",
                "id name deptId",
                "Integer String Integer",
                "id",
                new String [][] {{ "deptId", "Department", "id" }});

        test.addRelSchema ("Course",
                "crsCode deptId crsName descry",
                "Integer Integer String String",
                "crsCode",
                new String [][] {{ "deptId", "Department", "id" }});

        test.addRelSchema ("Teaching",
                "profId crsCode semester",
                "Integer Integer String",
                "profId crsCode semester",
                new String [][] {{ "profId", "Professor", "id" },
                        { "crsCode", "Course", "crsCode" }});

        test.addRelSchema ("Transcript",
                "studId crsCode semester grade",
                "Integer Integer String String",
                "studId crsCode semester",
                new String [][] {{ "studId", "Student", "id"},
                        { "crsCode", "Course", "crsCode" }});
        



        int[] nTuples = new int[] {10000,100,1000,2000,5000,5000};

        Comparable[][][] resultTestSelect = test.generate(nTuples);
        Table studentTable = new Table("Student", "id name address status", "Integer String String String", "id");
        Table departmentTable = new Table("Department", "id deptName", "Integer String", "id");
        Table professorTable = new Table("Professor", "id name deptId", "Integer String Integer", "id");
        Table courseTable = new Table("Course", "crsCode deptId crsName descry", "Integer Integer String String", "crsCode");
        Table teachingTable = new Table("Teaching", "profId crsCode semester", "Integer Integer String", "profId crsCode semester");
        Table transcriptTable = new Table("Transcript", "studId crsCode semester grade", "Integer Integer String String", "studId crsCode semester");
        
        // for each table
        for (int i = 0; i < resultTestSelect.length; i++) {
        	// for each generated tuple for that table
            for (int j = 0; j < resultTestSelect[i].length; j++) {
            	String insertQuery = "INSERT INTO ";
            	// insert generated tuple into:
            	switch(i) {
            	case 0: // Student table
            		insertQuery += "Student VALUES ";
            		studentTable.insert(resultTestSelect[i][j]);
            		break;
            	case 1: // Department table
            		insertQuery += "Department VALUES ";
            		departmentTable.insert(resultTestSelect[i][j]);
            		break;
            	case 2: // Professor table
            		insertQuery += "Professor VALUES ";
            		professorTable.insert(resultTestSelect[i][j]);
            		break;
            	case 3: // Course table
            		insertQuery += "Course VALUES ";
            		courseTable.insert(resultTestSelect[i][j]);
            		break;
            	case 4: // Teaching table
            		insertQuery += "Teaching VALUES ";
            		teachingTable.insert(resultTestSelect[i][j]);
            		break;
            	case 5: // Transcript table
            		insertQuery += "Transcript VALUES ";
            		transcriptTable.insert(resultTestSelect[i][j]);
            		break;
            	default:
            	} // switch
            	
            	// grab tuple column values and build insert query
            	insertQuery += "(";
            	for(int k = 0; k < resultTestSelect[i][j].length; k++) {
            		if(resultTestSelect[i][j][k] instanceof String) insertQuery += "'";
        			insertQuery += resultTestSelect[i][j][k].toString();
        			if(resultTestSelect[i][j][k] instanceof String) insertQuery += "'";
        			if(k < resultTestSelect[i][j].length-1) insertQuery += ", ";
        		}
            	insertQuery += ");";
      
            	// execute query to insert tuple into mysql db table
            	DatabaseAccess.execute_query(conn, insertQuery);
            } // for
        } // for
        
        DatabaseAccess.mysql_close(conn);

    } // main

} // TestTupleGenerator
