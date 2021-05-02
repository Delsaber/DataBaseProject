DROP TABLE PURCHASE;
DROP TABLE SALES;
DROP TABLE SUPPLIER;
DROP TABLE CUSTOMER;
DROP TABLE EMPLOYEE;
DROP TABLE INVENTORY;
DROP TABLE STORE;
DROP TABLE SKILL_REQUIRED;
DROP TABLE POSITION;
DROP TABLE SKILL;

ALTER SESSION SET NLS_DATE_FORMAT = 'MM-DD-YYYY';
  
CREATE TABLE SKILL(
    SK_SkillCode int,
    SK_Level varchar(20),
    SK_Description varchar(100),
    SK_Title varchar(20),
    
    PRIMARY KEY(SK_SkillCode)
);

INSERT INTO SKILL VALUES(2210, 'Begginer', 'Pellentesque habitant morbi tristique.', 'Programming Design');
INSERT INTO SKILL VALUES(2410, 'Begginer', 'Pellentesque habitant morbi tristique.', 'Java');
INSERT INTO SKILL VALUES(2512, 'Begginer', 'Pellentesque habitant morbi tristique.', 'Figma');
INSERT INTO SKILL VALUES(3666, 'Intermediate', 'Pellentesque habitant morbi tristique.', 'DSA');
INSERT INTO SKILL VALUES(3111, 'Intermediate', 'Pellentesque habitant morbi tristique.', 'Assembly');
INSERT INTO SKILL VALUES(4222, 'Advanced', 'Pellentesque habitant morbi tristique.', 'Data Science');
INSERT INTO SKILL VALUES(4322, 'Advanced', 'Pellentesque habitant morbi tristique.', 'Int. Soft. Eng.');

CREATE TABLE POSITION(
    P_PositionID int,
    P_Title varchar(20),
    P_Description varchar(100),
    P_PayRangeLow int,
    P_PayRangeHigh int,
    
    PRIMARY KEY(P_PositionID)
);

INSERT INTO POSITION VALUES(1, 'Software Engineer', 'Pellentesque habitant morbi tristique.', 70000, 120000);
INSERT INTO POSITION VALUES(2, 'Software Developer', 'Pellentesque habitant morbi tristique.', 60000, 110000);
INSERT INTO POSITION VALUES(3, 'Data Scientist', 'Pellentesque habitant morbi tristique.', 90000, 140000);
INSERT INTO POSITION VALUES(4, 'UX Designer', 'Pellentesque habitant morbi tristique.', 50000, 90000);

CREATE TABLE SKILL_REQUIRED(
    SR_PositionID int,
    SR_SkillCode int,
    
    FOREIGN KEY (SR_PositionID) REFERENCES POSITION(P_PositionID),
    FOREIGN KEY (SR_SkillCode) REFERENCES Skill(SK_SkillCode)
);

INSERT INTO SKILL_REQUIRED VALUES(1, 2210);
INSERT INTO SKILL_REQUIRED VALUES(1, 2410);
INSERT INTO SKILL_REQUIRED VALUES(1, 3666);
INSERT INTO SKILL_REQUIRED VALUES(1, 3111);
INSERT INTO SKILL_REQUIRED VALUES(1, 4322);

INSERT INTO SKILL_REQUIRED VALUES(2, 2210);
INSERT INTO SKILL_REQUIRED VALUES(2, 2410);
INSERT INTO SKILL_REQUIRED VALUES(2, 3666);
INSERT INTO SKILL_REQUIRED VALUES(2, 3111);

INSERT INTO SKILL_REQUIRED VALUES(3, 2210);
INSERT INTO SKILL_REQUIRED VALUES(3, 2410);
INSERT INTO SKILL_REQUIRED VALUES(3, 3666);
INSERT INTO SKILL_REQUIRED VALUES(3, 3111);
INSERT INTO SKILL_REQUIRED VALUES(3, 4222);

INSERT INTO SKILL_REQUIRED VALUES(4, 2210);
INSERT INTO SKILL_REQUIRED VALUES(4, 2410);
INSERT INTO SKILL_REQUIRED VALUES(4, 2512);

CREATE TABLE STORE(
    ST_StoreID int,
    ST_Address varchar(100),
    ST_Phone_Number varchar(20),
    ST_Zip_Code varchar(20),
    
    PRIMARY KEY(ST_StoreID)
);

INSERT INTO STORE VALUES(1, '250 New Orleans Ave, New Orleans, LA', '504-444-222', '70522');
INSERT INTO STORE VALUES(2, '440 New York Ave, New York, NY', '222-124-322', '44522');

CREATE TABLE SUPPLIER(
    SU_SupplierID int,
    SU_Name varchar(20),
    SU_Address varchar(100),

    PRIMARY KEY(SU_SupplierID)
);

INSERT INTO SUPPLIER VALUES (1, 'Tires 100%', '122 Wood Creek St');
INSERT INTO SUPPLIER VALUES (2, 'Best Windows', '2 Red Rd');

CREATE TABLE INVENTORY(
    I_ItemNum varchar(6),
    I_StoreID int,
    I_ShelfCode int,
    I_Title varchar(20),
    I_Description varchar(100),
    I_AvgCost int,
    I_Unit varchar(10),
    I_MinLevel int,
    I_ItemQuantity int,
    I_ItemPrice int,
    
    PRIMARY KEY(I_ItemNum),
    FOREIGN KEY(I_StoreID) REFERENCES STORE(ST_StoreID)
);

INSERT INTO INVENTORY VALUES('IT1000', 1, 1000, 'Tire', 'Pellentesque habitant morbi tristique.', 266, 'EA', 20, 30, 400);
INSERT INTO INVENTORY VALUES('IT1001', 1, 1001, 'Window', 'Pellentesque habitant morbi tristique.', 266, 'EA', 10, 8, 350);
INSERT INTO INVENTORY VALUES('IT1002', 1, 1002, 'Plastic Bump', 'Pellentesque habitant morbi tristique.', 266, 'EA', 15, 14, 280);
INSERT INTO INVENTORY VALUES('IT1004', 1, 1003, 'Interior Light', 'Pellentesque habitant morbi tristique.', 266, 'EA', 50, 52, 75);

CREATE TABLE PURCHASE(
    P_PurchaseNum varchar(5),
    P_ItemNum varchar(6),
    P_SupplierID int,
    P_Date date,
    P_Quantity int,
    P_Price int,
    P_Note varchar(100),
    
    PRIMARY KEY(P_PurchaseNum),
    FOREIGN KEY(P_ItemNum) REFERENCES INVENTORY(I_ItemNum),
    FOREIGN KEY(P_SupplierID) REFERENCES SUPPLIER(SU_SupplierID)
);

INSERT INTO PURCHASE VALUES('P0001', 'IT1000', 1, TO_DATE('04/05/2017'), 100, 400, 'Purchase Note.');
INSERT INTO PURCHASE VALUES('P0002', 'IT1001', 1, TO_DATE('03/25/2018'), 80, 350, 'Purchase Note.');
INSERT INTO PURCHASE VALUES('P0003', 'IT1002', 1, TO_DATE('02/11/2016'), 120, 280, 'Purchase Note.');
INSERT INTO PURCHASE VALUES('P0004', 'IT1004', 1, TO_DATE('01/19/2016'), 150, 75, 'Purchase Note.');

CREATE TABLE EMPLOYEE(
    E_EmployeeID int,
    E_StoreID int,
    E_PositionID int,
    E_FName varchar(20),
    E_LName varchar(20),
    E_Salary int,
    E_Gender varchar(10),
    E_Email varchar(30),
    E_Address varchar(100),
    E_PhoneNumber varchar(20),
    E_ZipCode varchar(20),
    
    PRIMARY KEY(E_EmployeeID),
    FOREIGN KEY(E_StoreID) REFERENCES STORE(ST_StoreID),
    FOREIGN KEY(E_PositionID) REFERENCES POSITION(P_PositionID)
);

INSERT INTO EMPLOYEE VALUES (1, 1, 1, 'Luan', 'Ferrari', 80000, 'Male', 'luan@gmail.com', '99 Wood St', '504-111-111', '70222');
INSERT INTO EMPLOYEE VALUES (2, 1, 1, 'Ashley', 'Alvarez', 90000, 'Female', 'ashley@gmail.com', '1144 Pine St', '504-111-111', '70211');
INSERT INTO EMPLOYEE VALUES (3, 1, 1, 'Ricardo', 'Derick', 110000, 'Male', 'ricardo@gmail.com', '22 Tree St', '504-111-111', '70422');
INSERT INTO EMPLOYEE VALUES (4, 1, 2, 'Luis', 'Quintano', 65000, 'Male', 'luis@gmail.com', '4 Boat St', '504-111-111', '70341');
INSERT INTO EMPLOYEE VALUES (5, 1, 2, 'Josh', 'Smith', 78500, 'Male', 'josh@gmail.com', '7722 England Ave', '504-111-111', '70112');
INSERT INTO EMPLOYEE VALUES (6, 1, 2, 'John', 'Alzent', 105000, 'Male', 'john@gmail.com', '555 Ragnar St', '504-111-111', '70323');
INSERT INTO EMPLOYEE VALUES (7, 1, 3, 'Patrick', 'Smith', 95000, 'Male', 'patrick@gmail.com', '1442 Ecbert St', '504-111-111', '70414');
INSERT INTO EMPLOYEE VALUES (8, 1, 3, 'Ingrid', 'Intrucet', 110000, 'Female', 'ingrid@gmail.com', '11 Blue St', '504-111-111', '70123');
INSERT INTO EMPLOYEE VALUES (9, 1, 3, 'Patricia', 'Margaret', 140000, 'Female', 'patricia@gmail.com', '5111 Maple Ridge', '504-111-111', '70123');
INSERT INTO EMPLOYEE VALUES (10, 1, 4, 'Robin', 'Patterson', 65000, 'Female', 'robin@gmail.com', '444 Artisan St', '504-111-111', '70222');
INSERT INTO EMPLOYEE VALUES (11, 1, 4, 'Ted', 'Mosby', 85000, 'Male', 'ted@gmail.com', '421 Apple St', '504-111-111', '70422');
INSERT INTO EMPLOYEE VALUES (12, 1, 4, 'Victoria', 'Lewis', 72000, 'Female', 'victoria@gmail.com', '132 Industrial Rd', '504-111-111', '70142');

INSERT INTO EMPLOYEE VALUES (13, 2, 1, 'Andre', 'Santos', 80000, 'Male', 'andre@gmail.com', '2 Brooklin St', '222-111-111', '40222');
INSERT INTO EMPLOYEE VALUES (14, 2, 2, 'James', 'Smith', 65000, 'Male', 'ted@gmail.com', '421 Building Ave', '222-467-442', '40422');
INSERT INTO EMPLOYEE VALUES (15, 2, 3, 'Robert', 'Hernandez', 95000, 'Male', 'victoria@gmail.com', '11 Statue Rd', '222-112-141', '40142');
INSERT INTO EMPLOYEE VALUES (16, 2, 4, 'Maria', 'Garcia', 72000, 'Female', 'victoria@gmail.com', '70800 Main Ave', '222-122-331', '40142');



CREATE TABLE CUSTOMER(
    C_CustomerID int,
    C_FirstName varchar(20),
    C_LastName varchar(20),
    C_PhoneNumber varchar(20),
    
    PRIMARY KEY(C_CustomerID)
);

INSERT INTO CUSTOMER VALUES(1, 'Ronald', 'Smith', '504-111-222');
INSERT INTO CUSTOMER VALUES(2, 'John', 'Brown', '504-121-242');
INSERT INTO CUSTOMER VALUES(3, 'Garcia', 'Wilson', '504-311-122');
INSERT INTO CUSTOMER VALUES(4, 'Thomas', 'Edson', '504-117-922');
INSERT INTO CUSTOMER VALUES(5, 'David', 'Miller', '504-181-882');

CREATE TABLE SALES(
    SA_InvoiceNum varchar(4),
    SA_CustomerID int,
    SA_ItemNum varchar(6),
    SA_Date date,
    SA_Quantity int,
    SA_Price number,
    SA_Note varchar(100),
    
    PRIMARY KEY(SA_InvoiceNum),
    FOREIGN KEY(SA_ItemNum) REFERENCES INVENTORY(I_ItemNum),
    FOREIGN KEY(SA_CustomerID) REFERENCES CUSTOMER(C_CustomerID)
);

--2019 to 2021
INSERT INTO SALES VALUES('S001', 1, 'IT1000', TO_DATE('01/05/2020'), 5, 2000, 'This is a note');
INSERT INTO SALES VALUES('S002', 2, 'IT1001', TO_DATE('01/05/2020'), 1, 350, 'This is a note');
INSERT INTO SALES VALUES('S003', 2, 'IT1000', TO_DATE('06/12/2020'), 2, 800, 'This is a note');
INSERT INTO SALES VALUES('S004', 3, 'IT1004', TO_DATE('03/17/2019'), 7, 525, 'This is a note');
INSERT INTO SALES VALUES('S005', 4, 'IT1000', TO_DATE('01/05/2020'), 1, 400, 'This is a note');
INSERT INTO SALES VALUES('S006', 4, 'IT1001', TO_DATE('04/08/2021'), 3, 1050, 'This is a note');
INSERT INTO SALES VALUES('S007', 5, 'IT1002', TO_DATE('02/28/2020'), 2, 560, 'This is a note');
--2018
INSERT INTO SALES VALUES('S008', 5, 'IT1000', TO_DATE('03/01/2018'), 1, 400, 'This is a note');
INSERT INTO SALES VALUES('S009', 5, 'IT1000', TO_DATE('03/21/2018'), 4, 1600, 'This is a note');
INSERT INTO SALES VALUES('S010', 5, 'IT1001', TO_DATE('04/27/2018'), 7, 2450, 'This is a note');
INSERT INTO SALES VALUES('S011', 5, 'IT1001', TO_DATE('01/12/2018'), 3, 1050, 'This is a note');
INSERT INTO SALES VALUES('S012', 5, 'IT1002', TO_DATE('11/04/2018'), 5, 1400, 'This is a note');
INSERT INTO SALES VALUES('S013', 5, 'IT1002', TO_DATE('12/15/2018'), 6, 1680, 'This is a note');
INSERT INTO SALES VALUES('S014', 5, 'IT1004', TO_DATE('08/23/2018'), 4, 300, 'This is a note');
INSERT INTO SALES VALUES('S015', 5, 'IT1004', TO_DATE('06/28/2018'), 3, 225, 'This is a note');






