import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class BusinessProcessesManager {

    public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args){

        try{

            //Connect to Databse
            ConnectToDBAZ ct = new ConnectToDBAZ();

            //Get Connection
            Connection conn = ct.getConn();

            //loop control
            int optionChosen = 0;
            boolean quit     = false;

            while (!quit){
                System.out.println("\n-----------------------------------------------------------------------");
                System.out.println("\nChoose a Business Process:");
                System.out.println("1 - Company AZ Hires a new Employee");
                System.out.println("2 - Company GV transfer a worker from one factory to another factory");
                System.out.println("3 - Company GV makes a deal with Company Exchange Market (EM)");
                System.out.println("4 - Company AZ and company GV exchange their CIOs");
                System.out.println("5 - LD collects job information from AZ and GV");
                System.out.println("6 - Quit Program\n");
                System.out.print("Enter an option: ");
                optionChosen = sc.nextInt();

                switch(optionChosen){
    
                    case(1):
                        break;
                    case(2):
                        new Process2().main(null);
                        break;
                    case(3):
                        new Process3().main(null);
                        break;
                    case(4):
                        new Process4().main(null);
                        break;
                    case(5):
                        break;
                    case(6):
                        System.out.println("\nBye, see ya soon!");
                        quit = true;
                        break;
                    default:
                        System.out.println("-----------------------------------------------------------------------");
                        System.out.println("\n***ATTENTION: Please Enter an Option between 1-6");
                }
            }

            //close scanner
            sc.close();
            //Close DB Connection
            ct.closeConnection();
		}
		catch(Exception e){ 
			System.out.println(e);
		}
    }
}