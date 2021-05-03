
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.*;

class Process5T implements Runnable{
	
	private Thread t;
	
	Process5T()
	{
		System.out.println("Creating Process5 Thread.");
	}
	
	public void run() {
		ArrayList<String> GV_ids = new ArrayList<String>();
		ArrayList<String> LDG_ids = new ArrayList<String>();
		ArrayList<Integer> AZ_ids = new ArrayList<Integer>();
		ArrayList<Integer> LDA_ids = new ArrayList<Integer>();
		
		int i;
		PreparedStatement ps;
		
		//Connect to Database
        ConnectToDBGV gv = new ConnectToDBGV();
        ConnectToDBAZ az = new ConnectToDBAZ();
        ConnectToDBLD ld = new ConnectToDBLD();
        
        //Get DBs Connections
        Connection connGV = gv.getConn();
        Connection connAZ = az.getConn();
		Connection connLD = ld.getConn();
		
		while(true) {
			try{	
				//Initialize states of everything at beginning of update.
				String sql = "SELECT GV_WorkerID FROM Worker_GV";
				ps = connLD.prepareStatement(sql);
				ResultSet resultLDG = ps.executeQuery();
				
				while(resultLDG.next())
				{
					LDG_ids.add(resultLDG.getString(1));
				}
				
				sql = "SELECT AZ_EmployeeID FROM Employee_AZ";
				ps = connLD.prepareStatement(sql);
				ResultSet resultLDA = ps.executeQuery();
				
				while(resultLDA.next())
				{
					LDA_ids.add(resultLDA.getInt(1));
					
				}
				
				sql = "SELECT E_EmployeeID FROM Employee";
				ps = connAZ.prepareStatement(sql);
				ResultSet resultAZOriginal = ps.executeQuery();
				
				while(resultAZOriginal.next())
				{
					AZ_ids.add(resultAZOriginal.getInt(1));
					
				}
				
				sql = "SELECT WorkerID FROM WORKER";
				ps = connGV.prepareStatement(sql);
				ResultSet resultGVOriginal = ps.executeQuery();
				
				while(resultGVOriginal.next())
				{
					GV_ids.add(resultGVOriginal.getString(1));
				
				}
				
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
						//--------------------------------------------------------------------
					} else {
						sql = "SELECT * from Worker WHERE WorkerID = ?";
						ps = connGV.prepareStatement(sql);
						ps.setString(1, GV_ids.get(i));
						resultGV = ps.executeQuery();
						
						sql = "SELECT * from Worker_GV WHERE GV_WorkerID = ?";
						ps = connLD.prepareStatement(sql);
						ps.setString(1, GV_ids.get(i));
						resultLD = ps.executeQuery();
						
						if(!(resultGV==resultLD)) 
						{
							//The deletes that were done since the last update---------------------
							sql = "DELETE FROM Worker_GV WHERE GV_WorkerID = ?";
							ps = connLD.prepareStatement(sql);
							ps.setString(1, GV_ids.get(i));
							ps.executeQuery();
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
							//--------------------------------------------------------------------
						}
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
						//--------------------------------------------------------------------
					}
				}	
				
				//All instances of AZ_ids not found in LDA_ids will be added, 
				//LDG_changes will then be iterated over and added from Worker(in GV) to Worker_GV(in LD)
				for(i = 0; i < (AZ_ids.size()); i++ ) 
				{
					if(!LDA_ids.contains(AZ_ids.get(i)))
					{
						//The inserts that were done since the last update---------------------				
						sql = "SELECT * from Employee WHERE E_EmployeeID = ?";
						ps = connAZ.prepareStatement(sql);
						ps.setInt(1, AZ_ids.get(i));
						resultAZ = ps.executeQuery();
						
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
						//--------------------------------------------------------------------
					} else {
						sql = "SELECT * from Employee WHERE E_EmployeeID = ?";
						ps = connAZ.prepareStatement(sql);
						ps.setInt(1, AZ_ids.get(i));
						resultAZ = ps.executeQuery();
						
						sql = "SELECT * from Employee_AZ WHERE AZ_EmployeeID = ?";
						ps = connLD.prepareStatement(sql);
						ps.setInt(1, AZ_ids.get(i));
						resultLD = ps.executeQuery();
						
						if(!(resultAZ == resultLD)) 
						{
							//The deletes that were done since the last update---------------------
							sql = "DELETE FROM Employee_AZ WHERE AZ_EmployeeID = ?";
							ps = connLD.prepareStatement(sql);
							ps.setInt(1, AZ_ids.get(i));
							ps.executeQuery();
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
						//--------------------------------------------------------------------
					}
				}	
				//Step 6 Close the Database Connection
				connGV.close();
				connAZ.close();
				connLD.close();
			} 
			catch(Exception e){
				System.out.println(e);
			}
			
		}
		//System.out.println("Process5 Ending.");
	}
	
	public void start () {
	      System.out.println("Starting Process5");
	      if (t == null) {
	         t = new Thread (this, "Process5");
	         t.start ();
	      }
	   }
}

public class Process5 {
	
	public static void main(String args[]) {
		Process5T P5 = new Process5T();
		P5.start();
	}
}
