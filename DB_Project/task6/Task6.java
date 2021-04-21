public class Task6 {
    public static void main(String[] args){
        try{

            Employee e = new Employee();
            Employee ee = new Employee();
            
            e.insert();
            ee.insert();

            new CreateState().closeConnection();
			
		} 
		catch(Exception e){
			System.out.println(e);
		}
    }
}