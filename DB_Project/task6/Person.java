import java.sql.*;
import java.util.*;

public class Person{
    private Connection conn;
    public Person(Connection con)
    {
        this.conn = con;
    }
    public ArrayList getPerson(int pid){
        ArrayList<String> list = new ArrayList();
        try{
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select * from person where person.personid = "+pid);
        int colcount = result.getMetaData().getColumnCount();
            while(result.next()){
                for(int i = 1; i != colcount+1;i++){
                    list.add(result.getString(i));
                }
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
        return list;
    }

    public ArrayList haskills(int pid){
        ArrayList<String> skills = new ArrayList<>();
        try{
        
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select sid from hasskill where persid = "+pid);
            while(result.next()){
                    skills.add(result.getString(1));
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return skills;
    }
    
    public ArrayList skillFromTakenCourses(int pid){
        ArrayList<String> skills = new ArrayList<>();
        try{
        
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select skillzid from teaches where coursenumb in(select coursecode from takes where peid = "+pid+")");
            while(result.next()){
                    skills.add(result.getString(1));
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return skills;
    }

}