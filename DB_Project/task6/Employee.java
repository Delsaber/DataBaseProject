import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Employee {

    private int id;
    private int storeId;
    private int positionId; 
    private String fName; 
    private String lName; 
    private int salary;
    private String gender;
    private String email;
    private String address;
    private String phoneNumber;
    private String zipCode;
    private Statement state;

    public Employee(
        int id, 
        int storeId, 
        int positionId, 
        String fName, 
        String lName, 
        int salary, 
        String gender,
        String email,
        String address,
        String phoneNumber,
        String zipCode
        ){
        
        this.id = id;
        this.storeId = storeId;
        this.positionId = positionId;
        this.fName = fName;
        this.lName = lName;
        this.salary = salary;
        this.gender = gender;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.zipCode = zipCode;
        this.state = new CreateState().getState();
    }

    public Employee(){
        this.state = new CreateState().getState();
    }

    public Statement getState(){
        return this.state;
    }

    public void insert(){
        try{

            //Step 5 Execute Query
            ResultSet result = this.state.executeQuery("SELECT * FROM EMPLOYEE");
            
            while(result.next()){
                System.out.println(result.getInt(1) + " " + result.getString(2) + " " + result.getString(3));
            }
            
        }catch(Exception e){
			System.out.println(e);
		}

    }

    
}


// CREATE TABLE EMPLOYEE(
//     E_EmployeeID int,
//     E_StoreID int,
//     E_PositionID int,
//     E_FName varchar(20),
//     E_LName varchar(20),
//     E_Salary int,
//     E_Gender varchar(10),
//     E_Email varchar(30),
//     E_Address varchar(100),
//     E_PhoneNumber varchar(20),
//     E_ZipCode varchar(20),
    
//     PRIMARY KEY(E_EmployeeID),
//     FOREIGN KEY(E_StoreID) REFERENCES STORE(ST_StoreID),
//     FOREIGN KEY(E_PositionID) REFERENCES POSITION(P_PositionID)
// );