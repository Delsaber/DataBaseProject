import java.sql.*;
import java.io.*;
import java.util.*;
public class Task7 {
        public static void main(String[] args){
        try{
            ArrayList<String> list = new ArrayList();
            //Connect to Databse
            ConnectToDB ct = new ConnectToDB();

            //Get Connection
            Connection conn = ct.getConn();
            //con.get
            
            Person myguy = new Person(conn);
            Job jobs = new Job(conn);
            //System.out.println(myguy.skillFromTakenCourses(1));
           // System.out.println(myguy.haskills(1));
            //System.out.println(myguy.getPerson(1));
            //System.out.println(jobs.requiresSkill(1));
            jobs.insertJob();
            

        }
        catch(Exception e){
            System.out.println(e);
        }
}}