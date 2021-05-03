import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.LinkedBlockingQueue;


public class Process5{

	public static boolean quit = false;
	public static LinkedBlockingQueue<Integer> threadStopSignal    = new LinkedBlockingQueue<>();
	public static void main(String args[]) {
		ArrayList<String> GV_ids = new ArrayList<String>();
		ArrayList<String> LDG_ids = new ArrayList<String>();
		ArrayList<Integer> AZ_ids = new ArrayList<Integer>();
		ArrayList<Integer> LDA_ids = new ArrayList<Integer>();
		
		int i;
		PreparedStatement ps;

		new Thread(){

			public void run(){
				
				try{
					threadStopSignal.take();
					new Process5().stopThread();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}.start();

		while(!quit) {
			try{

				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection connGV = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "rjgaray", "VrHX7Ngg");
				Connection connAZ = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "lgcencir", "grdKCMd4");
				Connection connLD = DriverManager.getConnection("jdbc:oracle:thin:@dbsvcs.cs.uno.edu:1521:orcl", "ttngu105", "PmP3X4pN");

				//Initialize states of everything at beginning of update.
				String sql = "SELECT GV_WorkerID FROM Worker_GV";
				ps = connLD.prepareStatement(sql);
				ResultSet resultLDG = ps.executeQuery();
				
				while(resultLDG.next())
				{
					LDG_ids.add(resultLDG.getString(1));
				}
				ps.close();
				
				sql = "SELECT AZ_EmployeeID FROM Employee_AZ";
				ps = connLD.prepareStatement(sql);
				ResultSet resultLDA = ps.executeQuery();
				
				while(resultLDA.next())
				{
					LDA_ids.add(resultLDA.getInt(1));
					
				}
				ps.close();
				
				sql = "SELECT E_EmployeeID FROM Employee";
				ps = connAZ.prepareStatement(sql);
				ResultSet resultAZOriginal = ps.executeQuery();
				
				while(resultAZOriginal.next())
				{
					AZ_ids.add(resultAZOriginal.getInt(1));
					
				}
				ps.close();
				
				sql = "SELECT WorkerID FROM WORKER";
				ps = connGV.prepareStatement(sql);
				ResultSet resultGVOriginal = ps.executeQuery();
				
				while(resultGVOriginal.next())
				{
					GV_ids.add(resultGVOriginal.getString(1));
				
				}
				ps.close();

				ResultSet resultGV;
				ResultSet resultAZ;
				ResultSet resultLD;
							
				
				//All instances of GV_ids not found in LDG_ids 
				for(i = 0; i < (GV_ids.size()); i++ ) 
				{
					if(!LDG_ids.contains(GV_ids.get(i)))
					{
						//The inserts that were done since the last update---------------------
						sql = "SELECT * from Worker WHERE WorkerID = ?";
						ps = connGV.prepareStatement(sql);
						ps.setString(1, GV_ids.get(i));
						resultGV = ps.executeQuery();
						
						sql = "INSERT INTO Worker_GV VALUES(?, ?, ?)";
						ps = connLD.prepareStatement(sql);
						
						
						while(resultGV.next()) 
						{
							ps.setString(1, resultGV.getString(1));
							ps.setString(2, resultGV.getString(2));
							ps.setString(3, resultGV.getString(3));
						}	

						ps.executeQuery();
						ps.close();
						//--------------------------------------------------------------------
					} else {

						PreparedStatement resultGVps;
						PreparedStatement resultLDps;

						sql = "SELECT * from Worker WHERE WorkerID = ?";
						resultGVps = connGV.prepareStatement(sql);
						resultGVps.setString(1, GV_ids.get(i));
						resultGV = resultGVps.executeQuery();
						
						sql = "SELECT * from Worker_GV WHERE GV_WorkerID = ?";
						resultLDps = connLD.prepareStatement(sql);
						resultLDps.setString(1, GV_ids.get(i));
						resultLD = resultLDps.executeQuery();
						
						if(!(resultGV==resultLD)) 
						{
							//The deletes that were done since the last update---------------------
							sql = "DELETE FROM Worker_GV WHERE GV_WorkerID = ?";
							ps = connLD.prepareStatement(sql);
							ps.setString(1, GV_ids.get(i));
							ps.executeQuery();
							ps.close();
							//--------------------------------------------------------------------
							
							//The inserts that were done since the last update---------------------						
							sql = "INSERT INTO Worker_GV VALUES(?, ?, ?)";
							ps = connLD.prepareStatement(sql);
							
							while(resultGV.next()) 
							{
								ps.setString(1, resultGV.getString(1));
								ps.setString(2, resultGV.getString(2));
								ps.setString(3, resultGV.getString(3));
							}	
							ps.executeQuery();
							ps.close();
							//--------------------------------------------------------------------
						}

						resultGVps.close();
						resultLDps.close();
					}
				}	
				
				//Handles all the deletes by finding all instances of LDG_ids not found in GV_ids
				for(i = 0; i < (LDG_ids.size() - 1); i++ ) 
				{
					if(!GV_ids.contains(LDG_ids.get(i)))
					{
						//The deletes that were done since the last update---------------------
						sql = "DELETE FROM Worker_GV WHERE GV_WorkerID = ?";
						ps = connLD.prepareStatement(sql);
						ps.setString(1, GV_ids.get(i));
						ps.executeQuery();
						ps.close();
						//--------------------------------------------------------------------
					}
				}	
				
				//All instances of AZ_ids not found in LDA_ids will be added, 
				//LDG_changes will then be iterated over and added from Worker(in GV) to Worker_GV(in LD)
				for(i = 0; i < (AZ_ids.size()); i++ ) 
				{
					if(!LDA_ids.contains(AZ_ids.get(i)))
					{	
						PreparedStatement psResultAZ;

						//The inserts that were done since the last update---------------------				
						sql = "SELECT * from Employee WHERE E_EmployeeID = ?";
						psResultAZ = connAZ.prepareStatement(sql);
						psResultAZ.setInt(1, AZ_ids.get(i));
						resultAZ = psResultAZ.executeQuery();
						
						sql = "INSERT INTO Employee_AZ VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
						ps = connLD.prepareStatement(sql);
						
						while(resultAZ.next()) 
						{
							ps.setInt(1, resultAZ.getInt(1));
							ps.setInt(2, resultAZ.getInt(2));
							ps.setInt(3, resultAZ.getInt(3));
							ps.setString(4, resultAZ.getString(4));
							ps.setString(5, resultAZ.getString(5));
							ps.setInt(6, resultAZ.getInt(6));
							ps.setString(7, resultAZ.getString(7));
							ps.setString(8, resultAZ.getString(8));
							ps.setString(9, resultAZ.getString(9));
							ps.setString(10, resultAZ.getString(10));
							ps.setString(11, resultAZ.getString(11));
							ps.executeQuery();
							ps.close();
						}

						psResultAZ.close();
						//--------------------------------------------------------------------
					} else {
						PreparedStatement resultAZPs;
						PreparedStatement resultLDPs;

						sql = "SELECT * from Employee WHERE E_EmployeeID = ?";
						resultAZPs = connAZ.prepareStatement(sql);
						resultAZPs.setInt(1, AZ_ids.get(i));
						resultAZ = resultAZPs.executeQuery();
						
						sql = "SELECT * from Employee_AZ WHERE AZ_EmployeeID = ?";
						resultLDPs = connLD.prepareStatement(sql);
						resultLDPs.setInt(1, AZ_ids.get(i));
						resultLD = resultLDPs.executeQuery();
						
						if(!(resultAZ == resultLD)) 
						{
							//The deletes that were done since the last update---------------------
							sql = "DELETE FROM Employee_AZ WHERE AZ_EmployeeID = ?";
							ps = connLD.prepareStatement(sql);
							ps.setInt(1, AZ_ids.get(i));
							ps.executeQuery();
							ps.close();

							//--------------------------------------------------------------------
							
							//The inserts that were done since the last update---------------------										
							sql = "INSERT INTO Employee_AZ VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
							ps = connLD.prepareStatement(sql);
							
							while(resultAZ.next()) 
							{
								ps.setInt(1, resultAZ.getInt(1));
								ps.setInt(2, resultAZ.getInt(2));
								ps.setInt(3, resultAZ.getInt(3));
								ps.setString(4, resultAZ.getString(4));
								ps.setString(5, resultAZ.getString(5));
								ps.setInt(6, resultAZ.getInt(6));
								ps.setString(7, resultAZ.getString(7));
								ps.setString(8, resultAZ.getString(8));
								ps.setString(9, resultAZ.getString(9));
								ps.setString(10, resultAZ.getString(10));
								ps.setString(11, resultAZ.getString(11));
								ps.executeQuery();
							}
							ps.close();
							resultAZPs.close();
							resultLDPs.close();
							//--------------------------------------------------------------------
						}
					}
				}	
				
				//Handles all the deletes by finding all instances of LDA_ids not found in AZ_ids
				for(i = 0; i < (LDA_ids.size()); i++ ) 
				{
					if(!AZ_ids.contains(LDA_ids.get(i)))
					{
						//The deletes that were done since the last update---------------------
						sql = "DELETE FROM Employee_AZ WHERE AZ_EmployeeID = ?";
						ps = connLD.prepareStatement(sql);
						ps.setInt(1, AZ_ids.get(i));
						ps.executeQuery();
						ps.close();
						//--------------------------------------------------------------------
					}
				}

				//Step 6 Close the Database Connection
				connGV.close();
				connAZ.close();
				connLD.close();
				ps.close();

				TimeUnit.SECONDS.sleep(3);
			} 
			catch(Exception e){
				e.printStackTrace();
			}
		}

		System.out.println("Process 5 finished!");

		// try{
		// 	//Step 6 Close the Database Connection
		// 	connGV.close();
		// 	connAZ.close();
		// 	connLD.close();
		// }catch(Exception e){
		// 	e.printStackTrace();
		// }
		//System.out.println("Process5 Ending.");
	}	

	public void stopThread(){
		quit = true;
	}
}
