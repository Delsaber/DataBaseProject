import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ConnectToDBLD {

    private Connection conn;
    private String DB_name;
    
    public ConnectToDBLD(){

        this.DB_name = "LD DataBase";

        try{
            System.out.printf("\nConnecting to %s...\n\n", DB_name);

            //Step 2 Load the driver class
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            //Step 3 Create the connection object
            this.conn = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "ttngu105", "PmP3X4pN");
            
            System.out.printf("Connected to %s!\n\n", DB_name);

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
            System.out.printf("\nConnection to %s Closed!\n", DB_name);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
