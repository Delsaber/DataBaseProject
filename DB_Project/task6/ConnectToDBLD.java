import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ConnectToDB {

    private Connection conn;
    
    public ConnectToDB(){

        try{
            System.out.println("Connecting to DB...");
            //Step 2 Load the driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            //Step 3 Create the connection object
            this.conn = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "ttngu105", "Motherfer123");

            System.out.println("Connected to DB!");

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public Connection getConn(){
        return this.conn;
    }

    public void closeConnection(){
        try{
            conn.close();
            System.out.println("\nConnection to DB Closed!\n");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
