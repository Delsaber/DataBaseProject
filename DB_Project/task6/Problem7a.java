import java.sql.*;
import java.util.*;
public class Problem7a{
    public ConnectToDB ct = new ConnectToDB();
    public  Connection conn = ct.getConn();
    public  void run(){
        try{
            System.out.println("enter a pid for the new employee");
            Scanner spid = new Scanner(System.in);
            System.out.println("a jid for the new employee");
            Scanner sjid = new Scanner(System.in);

            dataAndSkills(spid.nextInt());
            
            

        }
        catch(Exception e){
            System.out.println(e);
        }
    }
     public ArrayList<String> dataAndSkills(int pid){
            Person myguy = new Person(conn);
            ArrayList<String> join = myguy.getPerson(pid);
            join.addAll(myguy.haskills(pid));
            System.out.println(join);
            return join;
        }
}