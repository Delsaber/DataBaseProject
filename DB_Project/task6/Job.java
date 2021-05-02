import java.sql.*;
import java.util.*;

public class Job{
    private Connection conn;
    public Job(Connection con)
    {
        this.conn = con;
    }

    public void insertJob(int jobid,int skillcode, ){
        Random rand = new Random();
       int max = getMaxRow();
       try{
        String sql = "INSERT INTO jobs VALUES("+max+", "+max+", "+ +")";

           conn.prepareStatement(sql);
       }
       catch(Exception e){
        System.out.println(e);
    }
    }

    public int getMaxRow(){
        int max = 0;
        try{
            Statement state = conn.createStatement();
            ResultSet result = state.executeQuery("SELECT count(*) from jobs");
            while(result.next()){
            max = (result.getInt(1));
        }
        }
        catch(Exception e){
            System.out.println(e);
        }
        return max;
    }

    public ArrayList requiresSkill(int jobid){
        ArrayList<String> rskills = new ArrayList<>();
        try{
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select skillcode from requires where rsid = "+jobid);
            while(result.next()){
                    rskills.add(result.getString(1));
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return rskills;
    }

    
}