import java.sql.*;
import java.util.*;
import java.time.*;
import java.time.format.DateTimeFormatter;

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
    public String skillidToSkillname(String skillid){
        String skillname = "";
        try{
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select sname from skills where sid = "+skillid);
        while(result.next()){
            skillname = result.getString(1);
        }
        }
        catch(Exception e){
            System.out.println(e);
        }
        return skillname;
    }

    public ArrayList haskills(int pid){
        ArrayList<String> skills = new ArrayList<>();
        try{
        
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select * from hasskill where persid = "+pid);
            while(result.next()){
                    skills.add(result.getString(2));
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return skills;
    }
    
    public ArrayList skillFromTakenCourses(String className){
        ArrayList<String> skills = new ArrayList<>();
        try{
        
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select skillzid from teaches where coursenumb in(select COURSENUMBER from course where coursename = \'"+className+"\')");
            while(result.next()){
                    skills.add(result.getString(1));
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return skills;
    }
    public void insertSkills(int personid,ArrayList<String> list){
        for(String skill:list){
            String sql = "INSERT INTO hasskill values("+personid+","+skill+")";
            try{
                PreparedStatement ps = this.conn.prepareStatement(sql);
                ps.execute();
                ps.close();
                }catch(Exception e){
                    System.out.println(e);
                }
        }
    }
    public int courseNum(String className){
        int corusenum = 0;
        try{
        
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select COURSENUMBER from course where coursename = \'"+className+"\'");
            while(result.next()){
                corusenum = result.getInt(1);
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return corusenum;
    }
    public int coruseNumFromSkill(String skillid){
        int corusenum = 0;
        try{
        
        Statement state = conn.createStatement();
        ResultSet result = state.executeQuery("select COURSENUMB from teaches where Skillzid = \'"+skillid+"\'");
            while(result.next()){
                corusenum = result.getInt(1);
            }
        
        }
        catch(Exception e){
            System.out.println(e);
        }
        return corusenum;
    }
    public void insertintotakes(int pid, int course, String findate){
        String sql = SQLformat(pid, "takes", course, findate);
        try{
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.execute();
        ps.close();
        }catch(Exception e){
            System.out.println(e);
        }

    }
    public void insertIntoWorks(int pid, String jid){
        String sql = SQLformat(pid, "works", jid);
        try{
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        int month = currentDate.getMonthValue();
        String monthYear = month+"/"+year;
        PreparedStatement ps= this.conn.prepareStatement(sql);
        ps.execute();
        ps.close();
        }catch(Exception e){
            System.out.println(e);
        }

    }
    public String SQLformat(int pid, String table, int one, String two){
        String sql =  "INSERT INTO "+table+" VALUES("+pid+", "+one+", \'"+two+"\')";
        return sql;
    }
    public String SQLformat(int pid, String table, String one){
        String sql =  "INSERT INTO "+table+" VALUES("+pid+", \'"+one+"\')";
        return sql;
    }

}