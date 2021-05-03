import java.sql.*;
import java.util.*;
import java.io.*;
public class Problem7a{
    
    public ConnectToDBLD ld  = new ConnectToDBLD();
    public  Connection ldcn = ld.getConn();
    public Person myguy = new Person(ldcn);
    public  void run(){
        try{
            //get pid and jobid
            System.out.println("enter a pid for the new employee");
            Scanner input = new Scanner(System.in);
            int pid = input.nextInt();
            System.out.println("\nenter a jid for the new employee");
            int jid = input.nextInt();
            System.out.println("employee data:\n-------------------------------------------------------\n"+dataAndSkills(pid)+"\n");
            //get transcript new employee transscript
            File file = new File("transcript"+pid+".txt");
            Scanner reader = new Scanner(file);
            String transcript = reader.nextLine();
            String[] courses = transcript.split(", ");
            ArrayList<String> skills = new ArrayList<String>();
            for(String course:courses){
                String [] details = course.split(": ");
                skillFromCourses(details[0],skills);
                myguy.insertintotakes(pid,myguy.courseNum(details[0]),details[1]);
            }
            //skills from courses - selftaught skills
            ArrayList<String> selftaught = myguy.haskills(pid);
            int count = 1;
            System.out.println("skills not derived from taken classes\n-------------------------------------------------------");
            for (String skill: selftaught){
                if(!skills.contains(skill)){
                    System.out.println(count+"\t"+myguy.skillidToSkillname(skill));
                    count = count+1;
                }
            }
            System.out.println("adding skills database......\n----------------------------------------------------------------------");
            myguy.insertSkills(pid,skills);
            Job jerb = new Job(ldcn);
            int[] pskill = {4,5,9,7,21,3,10};
            //jerb.insertJob(20,"CEO", "2 days", "5/2021",80000,100000,"salary","Job Descritpion",pskill);
            if(count >2){

                while(true){
                System.out.println("employee has too many self-claimed skill would you like to rescind the job offer?\n y for yes\n n for no");
                    char value = input.next().charAt(0);
                if(value == 'y'){
                    System.out.println("Job offer has been recinded");
                    break;
                }
                else if(value == 'n'){
                    System.out.println("You now have a new employee");
                    myguy.insertIntoWorks(pid,(""+jid));
                    break;
                }
                else{
                    System.out.println("Invalid choice");
                }
            }}
            ArrayList<String> allSkills = myguy.haskills(pid);
            ArrayList<String> requiredskills = jerb.requiresSkill(jid);
            ArrayList<String> missingSkills = new ArrayList<String>();
            for (String skill: requiredskills){
                if (!allSkills.contains(skill)){
                    missingSkills.add(skill);
                }
            }
            System.out.println("Recomended courses are:\n---------------------------------------------------------\n");
            for(String skill: missingSkills){
            System.out.println(myguy.coruseNumFromSkill(skill)+" "+myguy.skillidToSkillname(skill));
            }
            input.close();
            

        }
        catch(Exception e){
            System.out.println(e);
        }
    }
    public ArrayList<String> dataAndSkills(int pid){
            ArrayList<String> join = myguy.getPerson(pid);
            //join.addAll(myguy.haskills(pid));
            return join;
        }
    public void skillFromCourses(String course,ArrayList join){
            join.addAll(myguy.skillFromTakenCourses(course));
        }
    
}