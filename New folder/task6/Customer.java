import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class Customer {

    private int id;
    private String fName; 
    private String lName; 
    private String phoneNumber;
    private Connection conn;
    private PreparedStatement ps;

    public Customer(
        int id, 
        String fName, 
        String lName, 
        String phoneNumber,
        Connection conn
        ){
        
        this.id = id;
        this.fName = fName;
        this.lName = lName;
        this.phoneNumber = phoneNumber;
        this.conn = conn;

        insertToDB();
    }

    public Customer(Connection conn){
        this.conn = conn;
    }

    public Connection getConn(){
        return this.conn;
    }

    public void insertToDB(int id, String fName, String lName, String phoneNumber){
        try{
            String sql = "INSERT INTO CUSTOMER VALUES(?, ?, ?, ?)";

            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, id);
            this.ps.setString(2, fName);
            this.ps.setString(3, lName);
            this.ps.setString(4, phoneNumber);

            this.ps.execute();
            this.ps.close();
            
            System.out.println("\n***Customer Inserted!\n");
            
        }catch(Exception e){
			System.out.println(e);
		}
    }

    public void insertToDB(){
        try{
            String sql = "INSERT INTO CUSTOMER VALUES(?, ?, ?, ?)";

            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, this.id);
            this.ps.setString(2, this.fName);
            this.ps.setString(3, this.lName);
            this.ps.setString(4, this.phoneNumber);

            this.ps.execute();
            this.ps.close();
            
            System.out.println("\n***Customer Inserted!\n");
            
        }catch(Exception e){
			System.out.println(e);
		}
    }

    public void deleteFromDB(){
        try{

            String sql = "DELETE FROM CUSTOMER WHERE C_CustomerID = ?";
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, this.id);
            this.ps.execute();
            this.ps.close();

            System.out.println("\n***Employee Deleted\n");

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void deleteFromDB(int id){
        try{

            String sql = "DELETE FROM CUSTOMER WHERE C_CustomerID = ?";
            this.ps = this.conn.prepareStatement(sql);
            this.ps.setInt(1, id);
            this.ps.execute();
            this.ps.close();

            System.out.println("\n***Customer Deleted\n");

        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public ResultSet getAllCustomers(){

        ResultSet result = null;

        try{
            String sql = "SELECT * FROM CUSTOMER";
            this.ps = this.conn.prepareStatement(sql);
            result = ps.executeQuery();

        }catch( Exception e){
            e.printStackTrace();
        }

        return result;
    }

    public void closePs(){

        try{
            this.ps.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}