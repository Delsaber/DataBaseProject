------------GV---------------------------------------------------------------------

DROP TABLE FACTORY;
DROP TABLE CONTRACT;
DROP TABLE PURCHASE;
DROP TABLE SUPPLIER;
DROP TABLE PRODUCT;
DROP TABLE MATERIAL;   
DROP TABLE CUSTOMER;

CREATE TABLE MATERIAL(
    MaterialCode_M varchar(5),
    MaterialName varchar(20),
    Quantity int,
    Unit varchar(20),
    MinLevel varchar(5),
    
    PRIMARY KEY(MaterialCode_M)
);

CREATE TABLE PRODUCT(
    ProductCode_P char(5),
    ProductName varchar(20),
    Description_P varchar(300),
    Quantity_P int,
    Unit_P varchar(7),
    AvgCost int,
    MaterialCode_P varchar(5),
    
    PRIMARY KEY(ProductCode_P),
    FOREIGN KEY(MaterialCode_P) REFERENCES MATERIAL(MaterialCode_M)
);

CREATE TABLE FACTORY(
    FactoryID char(5),
    FactoryName varchar(20),
    Address varchar(100),
    ZipCode char(5),
    Phone char(7),
    ProductCode_F char(5),
    Manager_F varchar(30),
    Quantity_F int,
    
    PRIMARY KEY(FactoryID),
    FOREIGN KEY(ProductCode_F) REFERENCES PRODUCT(ProductCode_P)
);

CREATE TABLE WORKER(
    WorkerID char(5),
    FactoryID_W char(5),
    Name_W varchar(20),
    
    PRIMARY KEY(WorkerID),
    FOREIGN KEY(FactoryID_W) REFERENCES FACTORY(FactoryID)
);

INSERT INTO WORKER VALUES('99991', '00001', 'Tommy Nguyen');
INSERT INTO WORKER VALUES('99992', '00001', 'Timmy Nguyen');
INSERT INTO WORKER VALUES('99993', '00002', 'Tammy Nguyen');
INSERT INTO WORKER VALUES('99994', '00002', 'Cynthia Nguyen');
INSERT INTO WORKER VALUES('99995', '00003', 'Kim Nguyen');
INSERT INTO WORKER VALUES('99996', '00003', 'John Nguyen');
INSERT INTO WORKER VALUES('99997', '00004', 'Ricardo Garay');
INSERT INTO WORKER VALUES('99998', '00004', 'Luis Cenci');

CREATE TABLE SUPPLIER(
    CompanyID_S varchar(20),
    Website varchar(50),
    ContactEmail_S varchar(20),
    
    PRIMARY KEY(CompanyID_S)
);

CREATE TABLE CUSTOMER(
    CompanyID_C varchar(20),
    ContactPerson varchar(20),
    ContactEmail_C varchar(20),
    
    PRIMARY KEY(CompanyID_C)
);

CREATE TABLE CONTRACT(
    ContractID char(5),
    CustomerID varchar(20),
    Date_C varchar(10),
    SaleAmount int,
    PaySchedule char(7),
    ProductCode_C char(5),
    Quantity_C int,
    
    PRIMARY KEY(ContractID),
    FOREIGN KEY(CustomerID) REFERENCES CUSTOMER(CompanyID_C),
    FOREIGN KEY(ProductCode_C) REFERENCES PRODUCT(ProductCode_P)
);


CREATE TABLE PURCHASE(
    PurchaseNum int,
    SupplierID varchar(20),
    SupplierOrderNum int,
    BookDate varchar(14),
    PayDate varchar(14),
    Note varchar(300),
    MaterialCode_Pur varchar(5),
    Quantity_Pur int,
    
    PRIMARY KEY(PurchaseNum),
    FOREIGN KEY(SupplierID) REFERENCES SUPPLIER(CompanyID_S),
    FOREIGN KEY(MaterialCode_Pur) REFERENCES MATERIAL(MaterialCode_M)
);

INSERT INTO MATERIAL VALUES('0000A', 'Adamantium', 20, 'X', 'X');
INSERT INTO MATERIAL VALUES('0000B', 'Orichalcum', 30, 'X', 'X'); 
INSERT INTO MATERIAL VALUES('0000C', 'Topaz', 40, 'X', 'X'); 
INSERT INTO MATERIAL VALUES('0000D', 'Gold', 50, 'X', 'X'); 
INSERT INTO MATERIAL VALUES('0000E', 'Diamond', 10, 'X', 'X'); 
INSERT INTO MATERIAL VALUES('0000F', 'Sapphire', 5, 'X', 'X'); 

INSERT INTO PRODUCT VALUES('00003', 'Hilt', 'This a Hilt', 5, 'X', 100, '0000C');
INSERT INTO PRODUCT VALUES('00004', 'Sword', 'This a sword', 5, 'X', 100, '0000D');
INSERT INTO PRODUCT VALUES('00005', 'Shield', 'This a shield', 10, 'X', 200, '0000E'); 
INSERT INTO PRODUCT VALUES('00006', 'Helmet', 'This a helmet', 15, 'X', 300, '0000F'); 

INSERT INTO FACTORY VALUES('00004', 'Hilt-Makers', '555 Hilt Ave. Marrero, LA', '70406', '5551237', '00003', 'Luis Nguyen', 70);
INSERT INTO FACTORY VALUES('00001', 'Sword-Makers', '555 Sword Ave. Metairie, LA', '70006', '5551234', '00004', 'Luis Cenci', 100);
INSERT INTO FACTORY VALUES('00002', 'Shield-Makers', '555 Shield St. Kenner, LA', '70001', '5551235', '00005', 'Tommy Nguyen', 200); 
INSERT INTO FACTORY VALUES('00003', 'Helmet-Makers', '555 Helmet Ct. New Orleans, LA', '70121', '5551236', '00006', 'Sammi Zervigon', 150); 

INSERT INTO SUPPLIER VALUES('SS00001', 'www.swordmats.com', 'swordmats@gmail.com');
INSERT INTO SUPPLIER VALUES('SS00002', 'www.shieldmats.com', 'shieldmats@gmail.com'); 
INSERT INTO SUPPLIER VALUES('SS00003', 'www.helmetmats.com', 'helmetmats@gmail.com'); 

INSERT INTO CUSTOMER VALUES('0000X', 'Moe Hickory', 'hickory@gmail.com');
INSERT INTO CUSTOMER VALUES('0000Y', 'Larry Dickory', 'dickory@gmail.com'); 
INSERT INTO CUSTOMER VALUES('0000Z', 'Curley Dock', 'dock@gmail.com'); 

INSERT INTO CONTRACT VALUES('00001', '0000X', '11/2021', 10250, 'Weekly', '00004', 50);
INSERT INTO CONTRACT VALUES('00002', '0000Y', '12/2018', 12500, 'Weekly', '00005', 30); 
INSERT INTO CONTRACT VALUES('00003', '0000Z', '11/2018', 8525, 'Weekly', '00006', 44); 
INSERT INTO CONTRACT VALUES('00004', '0000Z', '10/2018', 25525, 'Weekly', '00003', 15); 

INSERT INTO PURCHASE VALUES(10000, 'SS00001', 1, '11/2021', '11/2021', 'They give us sword mats', '0000A', 500);
INSERT INTO PURCHASE VALUES(20000, 'SS00002', 2, '12/2018', '05/2018', 'They give us shield mats', '0000B', 300); 
INSERT INTO PURCHASE VALUES(30000, 'SS00003', 3, '11/2018', '11/2018', 'They give us helmet mats', '0000C', 250); 
 

