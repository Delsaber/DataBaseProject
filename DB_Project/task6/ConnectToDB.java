import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ConnectToDB {

    private Connection conn;
    private Statement state;
    
    public ConnectToDB(){

        try{
            System.out.println("creating");
            //Step 2 Load the driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            //Step 3 Create the connection object
            conn = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "lgcencir", "grdKCMd4");

            //Step 4 Create the Statement Object
            state = conn.createStatement();

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public Statement getState(){
        return state;
    }

    public void closeConnection(){
        try{
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
