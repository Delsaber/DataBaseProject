
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.*;

class Process2{
	public static void main(String args[]){
		String factory_t = "";
		String factory_r = "";
		String worker = "";
		String name = "";
		PreparedStatement ps;
		Scanner scan = new Scanner(System.in);
		
		try{
			//Step 2 Load the driver class
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//Step 3 Create the connection object
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "rjgaray", "VrHX7Ngg"); //Change these to your user/pass

			//Step 4 Create the Statement Object
			Statement state = conn.createStatement();
			
			System.out.println("Enter Factory ID of Factory Transferring Worker\n");
			factory_t = scan.nextLine();
			System.out.println("Enter Factory ID of Factory Receiving Worker\n");
			factory_r = scan.nextLine();
			System.out.println("Enter Worker ID\n");
			worker = scan.nextLine();
						
			String sql = "SELECT Name_W FROM Worker WHERE FactoryID_W = ? AND WorkerID = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, factory_t);
			ps.setString(2, worker);
			
			//Step 6 Close the Database Connection
			ResultSet result = ps.executeQuery();
	
			
			if (result.next())
			{
				name = result.getString(1);
				
				sql = "SELECT * FROM FACTORY WHERE FactoryID = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, factory_r);
				result = ps.executeQuery();
				
				if(result.next()) 
				{
					sql = "DELETE FROM WORKER WHERE WorkerID = ?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, worker);
					ps.executeQuery();
					
					sql = "INSERT INTO WORKER VALUES(?, ?, ?)";
					ps = conn.prepareStatement(sql);
					ps.setString(1, worker);
					ps.setString(2, factory_r);
					ps.setString(3, name);
					ps.executeQuery();
					
					System.out.println("Worker Transferred.");
				} else
					System.out.println("No such factory exists to transfer this employee to.");
				
			} else
				System.out.println("No such employee works at that factory.");
			//Step 6 Close the Database Connection
			sql = "SELECT * FROM WORKER";
			ps = conn.prepareStatement(sql);
			result = ps.executeQuery();
			
//			while(result.next()){
//                System.out.println(result.getString(1) + "," + result.getString(2) + " " + result.getString(3));
//            }
			
			conn.close();
		} 
		catch(Exception e){
			System.out.println(e);
		}
		scan.close();
	}	
}
