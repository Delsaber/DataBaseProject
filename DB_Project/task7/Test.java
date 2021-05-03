import java.sql.Connection;

public class Test {
    
    public static void main(String[] args){
        
        //Connect to Databse
        ConnectToDBAZ az = new ConnectToDBAZ();
        ConnectToDBGV gv = new ConnectToDBGV();
        ConnectToDBLD ld = new ConnectToDBLD();


        //Get DBs Connections
        Connection connAz = az.getConn();
        Connection connGv = gv.getConn();
        

        //Close DBs Connections
        az.closeConnection();
        gv.closeConnection();
    }
}
