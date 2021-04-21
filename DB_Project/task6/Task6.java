import java.sql.Statement;

public class Task6 {
    public static void main(String[] args){
        try{
            ConnectToDB ct = new ConnectToDB();
            Statement state = ct.getState();
            
            Employee e = new Employee(state);
            Employee ee = new Employee(state);
            
            e.insert();
            ee.insert();

            ct.closeConnection();
		}
		catch(Exception e){
			System.out.println(e);
		}
    }
}