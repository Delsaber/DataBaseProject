import java.sql.Connection;
import java.sql.ResultSet;

public class Task6 {
    public static void main(String[] args){
        try{

            //Connect to Databse
            ConnectToDB ct = new ConnectToDB();

            //Get Connection
            Connection conn = ct.getConn();

            /**                             EMPLOYE                               */

            System.out.println("-------Employee--------");
            
            Employee e;
            ResultSet result;

            /*
            * Create a new employee 
            * Get All Employees in the Database
            * Close Prepared Statement of Employee After done with Result Set
            */
            e = new Employee(17, 1, 3, "Luis", "Cenci", 110000, "Male", "luisgcenci@gmail.com", "Nickel Loop St", "504-499-555", "70458", conn);
            result = e.getAllEmployees();
            while(result.next()){
                System.out.println(result.getInt(1) + "," + result.getString(4) + " " + result.getString(5));
            }
            e.closePs();

            /*  
            * Create a new instance of employee to access the class's methods
            * Delete Employee with id = 17 from the DB 
            * Get All Employees in the Database
            */

            e = new Employee(conn);
            e.deleteFromDB(17);
            result = e.getAllEmployees();
            while(result.next()){
                System.out.println(result.getInt(1) + "," + result.getString(4) + " " + result.getString(5));
            }
            e.closePs();

            /**                             Customer                               */

            System.out.println("-------Customer--------");

            Customer c;

            /*
            * Create a new Customer 
            * Get All Customers in the Database
            * Close Prepared Statement of Customer After done with Result Set
            */
            c = new Customer(6, "Luis", "Cenci", "504-499-555", conn);
            result = c.getAllCustomers();
            while(result.next()){
                System.out.println(result.getInt(1) + "," + result.getString(2) + " " + result.getString(3));
            }
            c.closePs();

            /*  
            * Create a new instance of customer to access the class's methods
            * Delete Customer with id = 6 from the DB 
            * Get All Customers in the Database
            */

            c = new Customer(conn);
            c.deleteFromDB(6);
            result = c.getAllCustomers();
            while(result.next()){
                System.out.println(result.getInt(1) + "," + result.getString(2) + " " + result.getString(3));
            }
            c.closePs();

            //Close DB Connection
            ct.closeConnection();
		}
		catch(Exception e){
			System.out.println(e);
		}
    }
}