---------------------LD-----------------------------------------------------------------------------

DROP TABLE jobs;
DROP TABLE company;
DROP TABLE gics;
DROP TABLE requires;
DROP TABLE works;
DROP TABLE hasskill;
DROP TABLE PERSON;
DROP TABLE position;
drop table section;
drop table PREREQUISITE;
drop  table course;
drop table teaches;
DROP TABLE skills;

set define off;
CREATE TABLE position(
    pid number(3) NOT NULL PRIMARY KEY,
    pname VARCHAR(100),
    sdates varchar(20),
    edates varchar(20),
    paylow number(10),
    payhigh number(10),
    paytype varchar(10),
  Jobdesc VARCHAR(4000));

CREATE TABLE requires(
rsid number(3) , skillcode number (3),constraint rskillfk FOREIGN KEY (rsid) references position(pid));

CREATE TABLE company(
cid number(3) NOT NULL PRIMARY KEY, 
cname varchar(100), 
location varchar(100),
igid number(10),
gid number(10),
Website varchar (1000));

CREATE TABLE skills(
sid number(10) NOT NULL PRIMARY KEY,
sname varchar (40));

CREATE TABLE gics(
gicsid number(10) NOT NULL PRIMARY KEY,
gname varchar (20),
parentid number(10));

CREATE TABLE jobs(
jid number(3) NOT NULL PRIMARY KEY, 
posid number(3), 
skillid number(3),
companyid number(3), 
employeetype varchar (20),
constraint positionfk FOREIGN KEY (posid)References position(pid),
constraint companyfk FOREIGN KEY (companyid)References company(cid),
constraint skillfk FOREIGN key(skillid) References skills(sid));

CREATE TABLE course(
coursenumber number(5) NOT NULL PRIMARY KEY,
coursename varchar (40),
lvl number (2),
des varchar(500)
);


CREATE TABLE section(
sectionid number(5) ,
corid number (5),
constraint sectionfk FOREIGN KEY (corid) References course(coursenumber),
skcode number (10));

CREATE table PREREQUISITE (
courseid number(5),
pcorse number (5),
FOREIGN KEY (courseid) References course(coursenumber),
FOREIGN KEY (pcorse) References course(coursenumber));

CREATE TABLE teaches(
    coursenumb number (5),
    skillzid number(3),
    FOREIGN KEY (skillzid) REFERENCES skills(sid)
);
INSERT INTO skills VALUES (1,'support');
INSERT INTO skills VALUES (2,'sales');
INSERT INTO skills VALUES (3,'customer service');
INSERT INTO skills VALUES (4,'leadership');
INSERT INTO skills VALUES (5,'organization');
INSERT INTO skills VALUES (6,'probleming solving');
INSERT INTO skills VALUES (7,'trained');
INSERT INTO skills VALUES (8,'corprate management');
INSERT INTO skills VALUES (9,'object oreinted programming');
INSERT INTO skills VALUES (10,'IDE');
INSERT INTO skills VALUES (11,'version control software');
INSERT INTO skills VALUES (12,'cybersecurity');
INSERT INTO skills VALUES (13,'cryptology');
INSERT INTO skills VALUES (14,'knowledge of networking software');
INSERT INTO skills VALUES (15,'knowledge of networking hardware');
INSERT INTO skills VALUES (16,'knowledge of software');
INSERT INTO skills VALUES (17,'knowledge of pc hardware');
INSERT INTO skills VALUES (18,'unit testing');
INSERT INTO skills VALUES (19,'coding');
INSERT INTO skills VALUES (20,'pc hardware');
INSERT INTO skills VALUES (21,'customer service');

INSERT INTO course VALUES (1001,'corprate management',5,'teaches how to mange workers');
INSERT INTO course VALUES (1002,'java1',1,'teaches basic programing ideas');
INSERT INTO course VALUES (1003,'java2',2,'teaches advance programing ideas');
INSERT INTO course VALUES (1004,'cybersecurity',4,'teaches cybersecurity fundementals');
INSERT INTO course VALUES (1005,'cryptology',4,'teaches public key encryption and hash function');
INSERT INTO course VALUES (1006,'networks',4,'teaches protocools,how routers work, and socket programing');
INSERT INTO course VALUES (1007,'systems',3,'teaches multi-threading');
INSERT INTO course VALUES (1008,'software enginneering',4,'teaches softeare devlopment with a team');
INSERT INTO course VALUES (1009,'comptia a+',3,'teaches computer hardware and computer mantince techniques');

INSERT INTO PREREQUISITE VALUES (1003,1002);
INSERT INTO PREREQUISITE VALUES (1004,1007);
INSERT INTO PREREQUISITE VALUES (1005,1004);
INSERT INTO PREREQUISITE VALUES (1006,1003);
INSERT INTO PREREQUISITE VALUES (1007,1003);
INSERT INTO PREREQUISITE VALUES (1008,1003);


INSERT INTO teaches VALUES (1001,4);
INSERT INTO teaches VALUES (1001,5);
INSERT INTO teaches VALUES (1001,8);
INSERT INTO teaches VALUES (1001,9);
INSERT INTO teaches VALUES (1001,10);
INSERT INTO teaches VALUES (1002,19);
INSERT INTO teaches VALUES (1002,9);
INSERT INTO teaches VALUES (1002,6);
INSERT INTO teaches VALUES (1002,11);
INSERT INTO teaches VALUES (1003,19);
INSERT INTO teaches VALUES (1003,9);
INSERT INTO teaches VALUES (1003,6);
INSERT INTO teaches VALUES (1003,11);
INSERT INTO teaches VALUES (1003,18);
INSERT INTO teaches VALUES (1004,12);
INSERT INTO teaches VALUES (1004,13);
INSERT INTO teaches VALUES (1004,14);
INSERT INTO teaches VALUES (1005,13);
INSERT INTO teaches VALUES (1005,12);
INSERT INTO teaches VALUES (1006,14);
INSERT INTO teaches VALUES (1006,19);
INSERT INTO teaches VALUES (1006,9);
INSERT INTO teaches VALUES (1006,6);
INSERT INTO teaches VALUES (1006,15);
INSERT INTO teaches VALUES (1007,16);
INSERT INTO teaches VALUES (1007,19);
INSERT INTO teaches VALUES (1007,9);
INSERT INTO teaches VALUES (1007,6);
INSERT INTO teaches VALUES (1008,16);
INSERT INTO teaches VALUES (1008,19);
INSERT INTO teaches VALUES (1008,9);
INSERT INTO teaches VALUES (1008,6);
INSERT INTO teaches VALUES (1009,1);
INSERT INTO teaches VALUES (1009,20);


INSERT INTO section VALUES (1,'1001',1000);
INSERT INTO section VALUES (2,'1001',1000);
INSERT INTO section VALUES (3,'1001',1000);
INSERT INTO section VALUES (4,'1002',300);
INSERT INTO section VALUES (5,'1002',300);
INSERT INTO section VALUES (6,'1002',300);
INSERT INTO section VALUES (7,'1003',300);
INSERT INTO section VALUES (8,'1003',300);
INSERT INTO section VALUES (9,'1003',300);
INSERT INTO section VALUES (10,'1004',300);
INSERT INTO section VALUES (11,'1004',300);
INSERT INTO section VALUES (12,'1004',300);
INSERT INTO section VALUES (13,'1005',300);
INSERT INTO section VALUES (14,'1005',300);
INSERT INTO section VALUES (15,'1005',300);
INSERT INTO section VALUES (16,'1006',300);
INSERT INTO section VALUES (17,'1006',300);
INSERT INTO section VALUES (18,'1006',300);
INSERT INTO section VALUES (19,'1007',300);
INSERT INTO section VALUES (20,'1007',300);
INSERT INTO section VALUES (21,'1007',300);
INSERT INTO section VALUES (22,'1008',300);
INSERT INTO section VALUES (23,'1008',300);
INSERT INTO section VALUES (24,'1008',300);
INSERT INTO section VALUES (25,'1009',500);
INSERT INTO section VALUES (26,'1009',500);
INSERT INTO section VALUES (27,'1009',500);


INSERT INTO teaches VALUES (2011,7);
INSERT INTO teaches VALUES (2010,7);
INSERT INTO teaches VALUES (2011,3);
INSERT INTO course VALUES (2011,'dummy data',1,'teaches dummy your data');
INSERT INTO course VALUES (2010,'dummy data',2,'teaches dummy your data');



INSERT INTO gics VALUES (1, 'healthcare', NULL);
INSERT INTO gics VALUES (110, 'medical', '1');
INSERT INTO gics VALUES (120, 'rehab', '1');
INSERT INTO gics VALUES (2, 'hospatility', NULL);
INSERT INTO gics VALUES (210, 'Hotels', '2');
INSERT INTO gics VALUES (220, 'cpnvention center', '2');
INSERT INTO gics VALUES (3, 'marketing', NULL);
INSERT INTO gics VALUES (31, 'marketing', '3');
INSERT INTO gics VALUES (4, 'education', NULL);
INSERT INTO gics VALUES (410, 'highered', '4');
INSERT INTO gics VALUES (420, 'k-12', '4');
INSERT INTO gics VALUES (5, 'tech', NULL);
INSERT INTO gics VALUES (510, 'software', '5');
INSERT INTO gics VALUES (520, 'information tech', '5');
INSERT INTO gics VALUES (6, 'government', NULL);
INSERT INTO gics VALUES (610, 'louisiana goverment', '6');
INSERT INTO gics VALUES (10, 'goods', NULL);
INSERT INTO gics VALUES (1010, 'system integrator', '10');
INSERT INTO gics VALUES (1020, 'equiptment', '10');
INSERT INTO gics VALUES (8, 'utilies', NULL);
INSERT INTO gics VALUES (810, 'entergy', '8');
INSERT INTO gics VALUES (820, 'internet', '8');
INSERT INTO gics VALUES (9, 'finance', NULL);
INSERT INTO gics VALUES (910, 'bank', '9');
INSERT INTO gics VALUES (920, 'tax', '9');
INSERT INTO gics VALUES (930, 'realty', '9');
INSERT INTO gics VALUES (940, 'insurance', '9');
INSERT INTO gics VALUES (11, 'political', NULL);
INSERT INTO gics VALUES (1110, 'nonprofit', '11');
INSERT INTO gics VALUES (12, 'consumergoods', NULL);
INSERT INTO gics VALUES (1210, 'electronics', '12');

INSERT INTO position VALUES (25, 'Head of Library Information Technology', '5 hour', NULL, 20000, 30000, 'salary', 'The Head of Library Information Technology is an innovative and imaginative professional overseeing a talented staff of research library...');
INSERT INTO requires VALUES (25, 11);
INSERT INTO requires VALUES (25, 19);
INSERT INTO position VALUES (26, 'End User Support Specialist', '18 day', NULL, 40000, 60000, 'salary', 'Review end-to-end customer support processes to proactively identify gaps and prioritize/execute IT process improvements that increase customer satisfaction and...');
INSERT INTO requires VALUES (26, 21);
INSERT INTO requires VALUES (26, 8);
INSERT INTO position VALUES (27, 'Help Desk Technician', '30+ day', NULL, 15000, 30000, 'salary', 'Consulting company searching for the right candidate to join our team as an IT Help Desk Technician. UTSI is a premier I.T....');
INSERT INTO requires VALUES (27, 2);
INSERT INTO requires VALUES (27, 4);
INSERT INTO position VALUES (28, 'Sr Systems Engineer', '3 day', '1/2018', 20000, 30000, 'salary', 'Engage customer contacts at both a strategic, business focused and tactical, IT technology level. Assess the customer’s IT organization’s ability to respond to...');
INSERT INTO requires VALUES (28, 17);
INSERT INTO requires VALUES (28, 18);
INSERT INTO position VALUES (29, 'Junior IT Specialist', '30+ day', NULL, 40000, 60000, 'salary', 'We have an exciting opportunity for a Junior IT Specialist to join our team. Bay State brings together experienced IT professionals and the latest state-of-the...');
INSERT INTO requires VALUES (29, 21);
INSERT INTO requires VALUES (29, 3);
INSERT INTO position VALUES (30, 'PC Technician', '30+ day', NULL, 20000, 30000, 'salary', 'Microsoft Certified IT Professional (MCITP):. Installing, configuring and maintaining desktop and laptop PCs and peripherals, such as printers....');
INSERT INTO requires VALUES (30, 20);
INSERT INTO requires VALUES (30, 20);
INSERT INTO position VALUES (31, 'Technical Support Engineer', '3 day', '2/2015', 20000, 30000, 'salary', 'The Technical Support Engineer is responsible for providing business critical technical support to highly skilled customer and partner IT and functional staff,...');
INSERT INTO requires VALUES (31, 17);
INSERT INTO requires VALUES (31, 18);
INSERT INTO position VALUES (32, 'HELP DESK - TECHNOLOGY DEPARTMENT', '25 day', NULL, 15000, 30000, 'salary', 'The Help Desk plays a critical role in the operation of the Technology Department. Perform hands on fixes at the desktop level, including installing and...');
INSERT INTO requires VALUES (32, 1);
INSERT INTO requires VALUES (32, 16);
INSERT INTO position VALUES (33, 'HIS Help Desk Analyst', '3 day', '4/2021', 15000, 30000, 'salary', 'Technical Manager, the Help Desk Analyst is responsible for the user support of computer applications and hardware. Under the general direction of the I.T....');
INSERT INTO requires VALUES (33, 2);
INSERT INTO requires VALUES (33, 9);
INSERT INTO position VALUES (34, 'Cyber Security Specialist Junior (Government)', '16 day', NULL, 40000, 60000, 'salary', 'High school Diploma or General Equivalency Diploma (GED) 2-4 years experience Under immediate supervision, responsible for all aspects of Information Systems');
INSERT INTO requires VALUES (34, 12);
INSERT INTO requires VALUES (34, 2);
INSERT INTO position VALUES (35, 'HELP DESK - TECHNOLOGY DEPARTMENT', '25 day', '4/2016', 15000, 30000, 'salary', 'The Help Desk plays a critical role in the operation of the Technology Department. Perform hands on fixes at the desktop level, including installing and...');
INSERT INTO requires VALUES (35, 5);
INSERT INTO requires VALUES (35, 13);
INSERT INTO position VALUES (36, 'Junior Cyber Security Specialist', '7 day', '2/2017', 40000, 60000, 'salary', 'Bay State brings together experienced IT professionals and the latest state-of-the-art technology tools, practices, and products to support projects and task...');
INSERT INTO requires VALUES (36, 14);
INSERT INTO requires VALUES (36, 5);
INSERT INTO position VALUES (37, 'PC Technician', '17 day', NULL, 20000, 30000, 'salary', 'Additional responsibilities will include telephone lines, and teleconference support, responding to Help Desk issues, and conducting user training....');
INSERT INTO requires VALUES (37, 6);
INSERT INTO requires VALUES (37, 16);
INSERT INTO position VALUES (38, 'Cyber Security Specialist', '18 day', '4/2018', 40000, 60000, 'salary', 'IT:. Under broad direction, operate and manage all aspects of Information Systems (IS), data availability, integrity, authentication, confidentiality, and non...');
INSERT INTO requires VALUES (38, 18);
INSERT INTO requires VALUES (38, 8);
INSERT INTO position VALUES (39, 'IT Consultant', '28 day', '3/2020', 20000, 30000, 'salary', 'NRLC is looking for an IT Consultant to assist in managing an established shared network with 10-15 computers....');
INSERT INTO requires VALUES (39, 12);
INSERT INTO requires VALUES (39, 6);
INSERT INTO position VALUES (40, 'Need a Application project manager', '18 day', NULL, 30000, 50000, 'salary', '> Proficiency in CMMI/SEI IT project management processes. Need a Applications Project manager....');
INSERT INTO requires VALUES (40, 3);
INSERT INTO requires VALUES (40, 17);
INSERT INTO position VALUES (41, 'Network Technician', '30+ day', NULL, 20000, 30000, 'salary', 'A degree is not required for this job but it would be a plus. Responsibilities of Job....');
INSERT INTO requires VALUES (41, 19);
INSERT INTO requires VALUES (41, 1);
INSERT INTO position VALUES (42, 'Technical Account Manager', '18 day', NULL, 30000, 50000, 'salary', 'The TAM must be a change agent by articulating the case for change and helping our customers Evolve their IT Maturity, drive productive use of Microsoft...');
INSERT INTO requires VALUES (42, 17);
INSERT INTO requires VALUES (42, 12);
INSERT INTO position VALUES (43, 'Cyber Security Analyst', '11 day', '2/2015', 50000, 70000, 'salary', 'Performing evaluation tasks on clients'' products and their IT environment. Under minimal supervision, involved in assessing complex IT infrastructures, systems,...');
INSERT INTO requires VALUES (43, 2);
INSERT INTO requires VALUES (43, 21);
INSERT INTO position VALUES (44, 'Support Specialist- PSH', '1 da', NULL, 40000, 60000, 'salary', 'It is not to be construed as an exhaustive statement of duties, responsibilities or requirements. This position is responsible for overall management of housing...');
INSERT INTO requires VALUES (44, 7);
INSERT INTO requires VALUES (44, 8);
INSERT INTO position VALUES (45, 'Revenue Tax Officer 1', '4 day', '3/2015', 20000, 30000, 'salary', 'It is a requirement that all Revenue employees must adhere to all tax laws of the State of Louisiana. If you do not have a score prior to applying to this...');
INSERT INTO requires VALUES (45, 5);
INSERT INTO requires VALUES (45, 16);
INSERT INTO position VALUES (46, 'Geek Squad Double Agent - Covert Computer Repair - Houma, LA', '18 day', NULL, 10000, 20000, 'salary', 'Does the thought of solving solutions for thousands of clients from your own desk and in their home sound like the best job ever?...');
INSERT INTO requires VALUES (46, 20);
INSERT INTO requires VALUES (46, 8);
INSERT INTO position VALUES (47, 'Security Compliance Analyst', '29 day', NULL, 50000, 70000, 'salary', 'Our staff maintain expertise spanning a wide spectrum of IT management, technology, and service solutions. Repeatedly recognized as an elite public sector IT...');
INSERT INTO requires VALUES (47, 11);
INSERT INTO requires VALUES (47, 7);
INSERT INTO position VALUES (48, 'Support Specialist- PSH', '1 da', NULL, 40000, 60000, 'salary', 'It is not to be construed as an exhaustive statement of duties, responsibilities or requirements. This position is responsible for overall management of housing...');
INSERT INTO requires VALUES (48, 19);
INSERT INTO requires VALUES (48, 12);
INSERT INTO position VALUES (49, 'IT Specialist, Sr/ OT Engineer I/II- Oper Tech', '5 day', NULL, 40000, 60000, 'salary', 'Bachelor’s Degree Engineering Discipline or Experience Equivalent, EIT helpful - desired as relevant, IT or Engineering experience (will review IT Degrees)....');
INSERT INTO requires VALUES (49, 12);
INSERT INTO requires VALUES (49, 15);
INSERT INTO position VALUES (50, 'Information Systems Auditor', '30+ day', '2/2017', 20000, 40000, 'salary', 'Performs general information systems control reviews for simple to complex IT environments. CapinCrouse is looking for an Information Systems Auditor to be...');
INSERT INTO requires VALUES (50, 8);
INSERT INTO requires VALUES (50, 6);

INSERT INTO company VALUES (34, 'Louisiana State Government', 'New Orleans, LA', '6', '610', 'https://www.indeed.com/rc/clk?jk=37da381b0797ba14&fccid=e0f35a124e6f113c');
INSERT INTO company VALUES (35, 'Knight Point Systems', 'Stennis Space Center, MS', '5', '520', 'https://www.indeed.com/rc/clk?jk=fdbede9aee82d101&fccid=c0309bed6539b87e');
INSERT INTO company VALUES (36, 'Volunteers of America - New Orleans', 'New Orleans, LA', '1', '120', 'https://www.indeed.com/rc/clk?jk=cac7b17a7a8184a2&fccid=2945920d6a3cdd92');
INSERT INTO company VALUES (37, 'Entergy', 'Killona, LA', '8', '810', 'https://www.indeed.com/rc/clk?jk=c68c2a08ba449c0f&fccid=4ba02d8aeaa3e74a');
INSERT INTO company VALUES (38, 'CapinCrouse LLP', 'New Orleans, LA', '9', '920', 'https://www.indeed.com/rc/clk?jk=ad086c2eba85d17a&fccid=8eba5bacc3d96bf6');
INSERT INTO company VALUES (39, 'Capriccio Software, Inc.', 'New Orleans, LA', '5', '510', 'https://www.indeed.com/rc/clk?jk=bcaa471f23723e5d&fccid=504120812bd53c30');
INSERT INTO company VALUES (40, 'Hewlett Packard Enterprise', 'New Orleans, LA', '10', '1010', 'https://www.indeed.com/rc/clk?jk=8c911242b0c0bce9&fccid=216eb700022de6f6');
INSERT INTO company VALUES (41, 'Ochsner Health System', 'New Orleans, LA', '1', '110', 'https://www.indeed.com/rc/clk?jk=9f933808df1a76ff&fccid=ef34ff29d760a6f2');
INSERT INTO company VALUES (42, 'Deloitte', 'New Orleans, LA', '9', '920', 'https://www.indeed.com/rc/clk?jk=92e081dd3d0651e2&fccid=9e215d88a6b33622');
INSERT INTO company VALUES (43, 'K2 Realty', 'Covington, LA 70433', '9', '930', 'https://www.indeed.com/company/K2-realty/jobs/Technical-Support-55a188f4e547ba41?fccid=a8698a8ab9b0280c');
INSERT INTO company VALUES (44, 'PSI Pax', 'New Orleans, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=4328815d64741951&fccid=758bc63e5b967bdf');
INSERT INTO company VALUES (45, 'Anntoine Marketing and Design', 'New Orleans, LA', '3', '31', 'https://www.indeed.com/company/Anntoine-Marketing-and-Design/jobs/Front-End-Web-Developer-30454b34f112d0e6?fccid=43d9c59f8bc9a58e');
INSERT INTO company VALUES (46, 'Network Logic, LLC', 'Mandeville, LA 70471', '5', '520', 'https://www.indeed.com/company/Network-Logic,-LLC/jobs/Network-Tech-17a6e7274dca0c46?fccid=eec4652733761613');
INSERT INTO company VALUES (47, 'Bellwether Technology', 'New Orleans, LA 70130 (Lower Garden District area)', '5', '520', 'https://www.indeed.com/rc/clk?jk=0070c89b851f433b&fccid=9246a04bc0770376');
INSERT INTO company VALUES (48, 'MILVETS Systems Technology, Inc.', 'New Orleans, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=98cc3c4cb60f0c37&fccid=bc61725f7ac26e7b');
INSERT INTO company VALUES (49, 'Catapult Consultants, LLC', 'New Orleans, LA', '5', '510', 'https://www.indeed.com/rc/clk?jk=a8905826118cc538&fccid=2ef1c0aa55f82227');
INSERT INTO company VALUES (50, 'CSRA', 'Stennis Space Center, MS', '5', '520', 'https://www.indeed.com/rc/clk?jk=181c0ff969418c22&fccid=0e18721ba57279e5');
INSERT INTO company VALUES (51, 'Pan-American Life Insurance Group', 'New Orleans, LA', '9', '940', 'https://www.indeed.com/rc/clk?jk=d127edaf56c77b1f&fccid=44a60fd5f29788e0');
INSERT INTO company VALUES (52, 'Aventure Technologies, LLC', 'New Orleans, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=18270403849b0428&fccid=265aa8abb6daba68');
INSERT INTO company VALUES (53, 'In-Telecom Consulting', 'Slidell, LA', '5', '510', 'https://www.indeed.com/company/In--Telecom-Consulting/jobs/Help-Desk-Technician-6a74f1833174041c?fccid=eb755b9dde89fd1a');
INSERT INTO company VALUES (54, 'Abacus Technology Corporation', 'Stennis Space Center, MS', '5', '520', 'https://www.indeed.com/rc/clk?jk=8e7a6d1c5b0523dd&fccid=9b23f360c9f83ff0');
INSERT INTO company VALUES (55, 'Creole Gardens Guesthouse', 'New Orleans, LA', '2', '210', 'https://www.indeed.com/rc/clk?jk=c8b78d1d3699e6db&fccid=259c1488e8517c41');
INSERT INTO company VALUES (56, 'Whetstone Education', 'New Orleans, LA', '4', '420', 'https://www.indeed.com/company/Whetstone-Education/jobs/Software-Developer-74a1f84251acf9e9?fccid=7506d823742f237a');
INSERT INTO company VALUES (57, 'H2 Performance Consulting', 'New Orleans, LA', '5', '510', 'https://www.indeed.com/rc/clk?jk=3c7ca62ea5c5d6c9&fccid=e26388c1e2a22dd7');
INSERT INTO company VALUES (58, 'Laitram LLC', 'New Orleans, LA 70123', '10', '1020', 'https://www.indeed.com/rc/clk?jk=405a715ee81f5b02&fccid=06c0065578ad0db6');
INSERT INTO company VALUES (59, 'Booz Allen Hamilton', 'New Orleans, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=49ce91b73e6da01a&fccid=4e041af1d0af1bc8');
INSERT INTO company VALUES (60, 'La Health Solutions', 'Slidell, LA 70458', '1', '110', 'https://www.indeed.com/company/La-Health-Solutions/jobs/Medical-Data-Entry-Genius-0425332037aec768?fccid=55b611e25019dd77');
INSERT INTO company VALUES (61, 'Hornbeck Offshore', 'Covington, LA 70433', '10', '1020', 'https://www.indeed.com/company/Hornbeck-Offshore/jobs/IT-Help-Desk-b457e80657cfecc2?fccid=270ec55cf0d510e1');
INSERT INTO company VALUES (62, 'zlien', 'New Orleans, LA 70130 (Lower Garden District area)', '5', '510', 'https://www.indeed.com/rc/clk?jk=eea7d6bb82bdda80&fccid=bac8e1cdec7d5d6c');
INSERT INTO company VALUES (63, 'Grand Family Dentistry', 'Mandeville, LA', '1', '110', 'https://www.indeed.com/company/Grand-Family-Dentistry/jobs/Office-Administrator-4dac0b089960324f?fccid=5e5fc9c2845d5f54');
INSERT INTO company VALUES (64, 'Ernest N. Morial Convention Center', 'New Orleans, LA', '2', '220', 'https://www.indeed.com/rc/clk?jk=7a0074fbf25a929b&fccid=ada99f53cdd1f9cd');
INSERT INTO company VALUES (65, 'The Lynd Company', 'New Orleans, LA', '9', '930', 'https://www.indeed.com/rc/clk?jk=c215dae41f5c3204&fccid=a6273440d811796a');
INSERT INTO company VALUES (66, 'PosiGen, LLC', 'Jefferson, LA 70121', '10', '1020', 'https://www.indeed.com/rc/clk?jk=d4fdb9499f53ddc4&fccid=a19e8da745403832');

INSERT INTO jobs VALUES (1, 1, 7, 1, 'full time');
INSERT INTO jobs VALUES (2, 2, 7, 2, 'full time');
INSERT INTO jobs VALUES (3, 3, 7, 3, 'full time');
INSERT INTO jobs VALUES (4, 4, 8, 4, 'full time');
INSERT INTO jobs VALUES (5, 5, 3, 3, 'full time');
INSERT INTO jobs VALUES (6, 6, 4, 5, 'full time');
INSERT INTO jobs VALUES (7, 7, 3, 6, 'full time');
INSERT INTO jobs VALUES (8, 8, 8, 7, 'full time');
INSERT INTO jobs VALUES (9, 9, NULL, 8, 'full time');
INSERT INTO jobs VALUES (10, 10, 7, 3, 'full time');
INSERT INTO jobs VALUES (11, 11, 7, 9, 'full time');
INSERT INTO jobs VALUES (12, 12, 4, 10, 'full time');
INSERT INTO jobs VALUES (13, 13, NULL, 11, 'full time');
INSERT INTO jobs VALUES (14, 14, NULL, 12, 'full time');
INSERT INTO jobs VALUES (15, 15, NULL, 7, 'full time');
INSERT INTO jobs VALUES (16, 16, 7, 13, 'full time');
INSERT INTO jobs VALUES (17, 17, NULL, 14, 'full time');
INSERT INTO jobs VALUES (18, 18, 1, 7, 'full time');
INSERT INTO jobs VALUES (19, 19, 1, 15, 'full time');
INSERT INTO jobs VALUES (20, 20, NULL, 16, 'full time');
INSERT INTO jobs VALUES (21, 21, NULL, 17, 'full time');
INSERT INTO jobs VALUES (22, 22, 4, 7, 'full time');
INSERT INTO jobs VALUES (23, 23, 1, 18, 'full time');
INSERT INTO jobs VALUES (24, 24, 4, 7, 'full time');

CREATE TABLE PERSON
(
    Personid number(10),
    Name VARCHAR(50),
    address varchar(100),
    email varchar(50) check (email like '%@%'),
    gender varchar(1)check (gender in('M','F')),
    phonenum varchar(12) check (phonenum like '%%%-%%%-%%%%'),
	unique (personid)
);

CREATE TABLE works
(
	perid number(3),
	werkid number(3),
	constraint personfk1 FOREIGN KEY (perid)
 	References person(personid));
CREATE TABLE hasskill
(
	persid number(3),
	sid number(3),
	constraint personfk FOREIGN KEY (persid)References person(personid));

INSERT INTO person VALUES (25, 'Kevin', '5395 Tchoupitoulas Street', 'Kevin37@google.com', 'M', '744-222-2958');
INSERT INTO person VALUES (26, 'Kevin', '7198 Basin Street', 'Kevin35@yahoo.com', 'M', '833-809-9234');
INSERT INTO person VALUES (27, 'Thanh', '5563 Freret Street', 'Thanh12@google.com', 'M', '593-712-7907');
INSERT INTO person VALUES (28, 'Joshua', '12851 Royal Street', 'Joshua19@yahoo.com', 'F', '073-475-7343');
INSERT INTO person VALUES (29, 'Pablo', '6371 Martin Luther King Jr. Boulevard', 'Pablo18@yahoo.com', 'M', '965-075-7176');
INSERT INTO person VALUES (30, 'Nicholas', '13692 Peters Street', 'Nicholas17@yahoo.com', 'F', '755-040-6607');
INSERT INTO person VALUES (31, 'Sauryha', '7444 Prytania Street', 'Sauryha6@google.com', 'M', '325-622-6127');
INSERT INTO person VALUES (32, 'Nicholas', '10974 Julia Street', 'Nicholas5@outlook.com', 'F', '709-077-9297');
INSERT INTO person VALUES (33, 'Truc', '17405 Pearl Street', 'Truc27@yahoo.com', 'M', '412-139-8168');
INSERT INTO person VALUES (34, 'Sean', '3289 Oak Street', 'Sean37@yahoo.com', 'M', '959-048-6376');
INSERT INTO person VALUES (35, 'Tre', '2411 Howard Avenue', 'Tre35@outlook.com', 'F', '293-839-5358');
INSERT INTO person VALUES (36, 'Nicholas', '15293 Calliope Street', 'Nicholas16@outlook.com', 'M', '658-189-4251');
INSERT INTO person VALUES (37, 'Ricardo', '3571 Freret Street', 'Ricardo3@google.com', 'F', '206-777-4250');
INSERT INTO person VALUES (38, 'Stephen', '2452 Tchoupitoulas Street', 'Stephen1@outlook.com', 'F', '961-210-5453');
INSERT INTO person VALUES (39, 'Thanh', '18710 Jackson Avenue', 'Thanh27@google.com', 'F', '384-404-9845');
INSERT INTO person VALUES (40, 'Pablo', '9323 St. Peter Street', 'Pablo24@google.com', 'F', '226-397-5388');
INSERT INTO person VALUES (41, 'Truc', '18085 Toulouse Street', 'Truc29@yahoo.com', 'M', '532-371-5754');
INSERT INTO person VALUES (42, 'Patrick', '8153 Jeff Davis Parkway', 'Patrick15@google.com', 'F', '374-030-3045');
INSERT INTO person VALUES (43, 'Sean', '13016 Freret Street', 'Sean34@outlook.com', 'F', '244-241-0037');
INSERT INTO person VALUES (44, 'Patrick', '16572 Claiborne Avenue', 'Patrick7@google.com', 'F', '722-375-3183');
INSERT INTO person VALUES (45, 'Tommy', '9103 Poydras Street', 'Tommy28@yahoo.com', 'F', '378-992-9497');
INSERT INTO person VALUES (46, 'Ricardo', '3766 Freret Street', 'Ricardo38@google.com', 'F', '448-781-9074');
INSERT INTO person VALUES (47, 'Sean', '7990 Elysian Fields Avenue', 'Sean14@google.com', 'M', '569-322-0143');
INSERT INTO person VALUES (48, 'Tommy', '12149 St. Philip Street', 'Tommy39@outlook.com', 'M', '433-461-9330');
INSERT INTO person VALUES (49, 'Shayna', '11961 Gentilly Boulevard', 'Shayna24@yahoo.com', 'F', '098-239-3895');
INSERT INTO person VALUES (50, 'Truc', '11020 Jackson Avenue', 'Truc37@outlook.com', 'F', '104-581-7108');

INSERT INTO works VALUES (1, 66);
INSERT INTO works VALUES (1, 44);
INSERT INTO works VALUES (1, 87);
INSERT INTO works VALUES (2, NULL);
INSERT INTO works VALUES (3, NULL);
INSERT INTO works VALUES (4, NULL);
INSERT INTO works VALUES (5, NULL);
INSERT INTO works VALUES (6, NULL);
INSERT INTO works VALUES (7, 29);
INSERT INTO works VALUES (7, 14);
INSERT INTO works VALUES (7, 45);
INSERT INTO works VALUES (8, 38);
INSERT INTO works VALUES (8, 9);
INSERT INTO works VALUES (8, 96);
INSERT INTO works VALUES (9, 68);
INSERT INTO works VALUES (9, 3);
INSERT INTO works VALUES (10, NULL);
INSERT INTO works VALUES (11, 86);
INSERT INTO works VALUES (11, 59);
INSERT INTO works VALUES (11, 22);
INSERT INTO works VALUES (11, 90);
INSERT INTO works VALUES (12, 97);
INSERT INTO works VALUES (12, 67);
INSERT INTO works VALUES (12, 44);
INSERT INTO works VALUES (13, 29);
INSERT INTO works VALUES (14, 51);
INSERT INTO works VALUES (14, 59);
INSERT INTO works VALUES (15, NULL);
INSERT INTO works VALUES (16, 69);
INSERT INTO works VALUES (16, 85);
INSERT INTO works VALUES (16, 57);
INSERT INTO works VALUES (17, 24);
INSERT INTO works VALUES (17, 81);
INSERT INTO works VALUES (18, 20);
INSERT INTO works VALUES (19, 80);
INSERT INTO works VALUES (19, 72);
INSERT INTO works VALUES (19, 49);
INSERT INTO works VALUES (20, 95);
INSERT INTO works VALUES (21, 48);
INSERT INTO works VALUES (21, 24);
INSERT INTO works VALUES (22, 61);
INSERT INTO works VALUES (22, 97);
INSERT INTO works VALUES (22, 100);
INSERT INTO works VALUES (23, 43);
INSERT INTO works VALUES (24, 5);
INSERT INTO works VALUES (24, 62);

INSERT INTO hasskill VALUES (1, 15);
INSERT INTO hasskill VALUES (1, 17);
INSERT INTO hasskill VALUES (1, 2);
INSERT INTO hasskill VALUES (2, 6);
INSERT INTO hasskill VALUES (2, 2);
INSERT INTO hasskill VALUES (2, 5);
INSERT INTO hasskill VALUES (2, 1);
INSERT INTO hasskill VALUES (3, 9);
INSERT INTO hasskill VALUES (3, 18);
INSERT INTO hasskill VALUES (3, 6);
INSERT INTO hasskill VALUES (4, 4);
INSERT INTO hasskill VALUES (4, 9);
INSERT INTO hasskill VALUES (4, 20);
INSERT INTO hasskill VALUES (4, 7);
INSERT INTO hasskill VALUES (5, 11);
INSERT INTO hasskill VALUES (5, 8);
INSERT INTO hasskill VALUES (6, 17);
INSERT INTO hasskill VALUES (6, 21);
INSERT INTO hasskill VALUES (6, 9);
INSERT INTO hasskill VALUES (7, 11);
INSERT INTO hasskill VALUES (7, 10);
INSERT INTO hasskill VALUES (8, 6);
INSERT INTO hasskill VALUES (8, 11);
INSERT INTO hasskill VALUES (9, 14);
INSERT INTO hasskill VALUES (9, 12);
INSERT INTO hasskill VALUES (9, 14);
INSERT INTO hasskill VALUES (9, 12);
INSERT INTO hasskill VALUES (10, 1);
INSERT INTO hasskill VALUES (10, 3);
INSERT INTO hasskill VALUES (10, 11);
INSERT INTO hasskill VALUES (11, 11);
INSERT INTO hasskill VALUES (11, 3);
INSERT INTO hasskill VALUES (11, 3);
INSERT INTO hasskill VALUES (11, 17);
INSERT INTO hasskill VALUES (12, 17);
INSERT INTO hasskill VALUES (12, 6);
INSERT INTO hasskill VALUES (12, 1);
INSERT INTO hasskill VALUES (13, 3);
INSERT INTO hasskill VALUES (13, 20);
INSERT INTO hasskill VALUES (13, 19);
INSERT INTO hasskill VALUES (14, 14);
INSERT INTO hasskill VALUES (14, 11);
INSERT INTO hasskill VALUES (14, 5);
INSERT INTO hasskill VALUES (15, 2);
INSERT INTO hasskill VALUES (15, 16);
INSERT INTO hasskill VALUES (15, 6);
INSERT INTO hasskill VALUES (15, 20);
INSERT INTO hasskill VALUES (16, 18);
INSERT INTO hasskill VALUES (16, 3);
INSERT INTO hasskill VALUES (16, 21);
INSERT INTO hasskill VALUES (16, 18);
INSERT INTO hasskill VALUES (17, 5);
INSERT INTO hasskill VALUES (18, 18);
INSERT INTO hasskill VALUES (18, 1);
INSERT INTO hasskill VALUES (19, 19);
INSERT INTO hasskill VALUES (19, 12);
INSERT INTO hasskill VALUES (19, 7);
INSERT INTO hasskill VALUES (20, 12);
INSERT INTO hasskill VALUES (21, 20);
INSERT INTO hasskill VALUES (21, 8);
INSERT INTO hasskill VALUES (21, 8);
INSERT INTO hasskill VALUES (22, 20);
INSERT INTO hasskill VALUES (23, 3);
INSERT INTO hasskill VALUES (23, 5);
INSERT INTO hasskill VALUES (23, 14);
INSERT INTO hasskill VALUES (23, 11);
INSERT INTO hasskill VALUES (24, 20);
INSERT INTO hasskill VALUES (25, 6);
INSERT INTO hasskill VALUES (25, 13);
INSERT INTO hasskill VALUES (25, 7);
INSERT INTO hasskill VALUES (26, 1);
INSERT INTO hasskill VALUES (27, 7);
INSERT INTO hasskill VALUES (27, 2);
INSERT INTO hasskill VALUES (28, 9);
INSERT INTO hasskill VALUES (28, 5);
INSERT INTO hasskill VALUES (28, 16);
INSERT INTO hasskill VALUES (29, 6);
INSERT INTO hasskill VALUES (29, 5);
INSERT INTO hasskill VALUES (29, 9);
INSERT INTO hasskill VALUES (30, 15);
INSERT INTO hasskill VALUES (31, 9);
INSERT INTO hasskill VALUES (32, 11);
INSERT INTO hasskill VALUES (32, 20);
INSERT INTO hasskill VALUES (33, 19);
INSERT INTO hasskill VALUES (33, 16);
INSERT INTO hasskill VALUES (34, 10);
INSERT INTO hasskill VALUES (34, 16);
INSERT INTO hasskill VALUES (34, 10);
INSERT INTO hasskill VALUES (35, 5);
INSERT INTO hasskill VALUES (35, 19);
INSERT INTO hasskill VALUES (35, 17);
INSERT INTO hasskill VALUES (36, 19);
INSERT INTO hasskill VALUES (36, 19);
INSERT INTO hasskill VALUES (36, 15);
INSERT INTO hasskill VALUES (37, 14);
INSERT INTO hasskill VALUES (37, 8);
INSERT INTO hasskill VALUES (37, 2);
INSERT INTO hasskill VALUES (38, 18);
INSERT INTO hasskill VALUES (38, 1);
INSERT INTO hasskill VALUES (39, 1);
INSERT INTO hasskill VALUES (39, 8);
INSERT INTO hasskill VALUES (39, 16);
INSERT INTO hasskill VALUES (40, 3);
INSERT INTO hasskill VALUES (40, 13);
INSERT INTO hasskill VALUES (40, 14);
INSERT INTO hasskill VALUES (40, 11);
INSERT INTO hasskill VALUES (41, 7);
INSERT INTO hasskill VALUES (41, 20);
INSERT INTO hasskill VALUES (42, 15);
INSERT INTO hasskill VALUES (42, 10);
INSERT INTO hasskill VALUES (42, 12);
INSERT INTO hasskill VALUES (42, 2);
INSERT INTO hasskill VALUES (43, 2);
INSERT INTO hasskill VALUES (43, 12);
INSERT INTO hasskill VALUES (43, 21);
INSERT INTO hasskill VALUES (43, 17);
INSERT INTO hasskill VALUES (44, 1);
INSERT INTO hasskill VALUES (44, 8);
INSERT INTO hasskill VALUES (44, 20);
INSERT INTO hasskill VALUES (44, 1);
INSERT INTO hasskill VALUES (45, 16);
INSERT INTO hasskill VALUES (45, 7);
INSERT INTO hasskill VALUES (46, 3);
INSERT INTO hasskill VALUES (47, 8);
INSERT INTO hasskill VALUES (47, 3);
INSERT INTO hasskill VALUES (47, 7);
INSERT INTO hasskill VALUES (48, 1);
INSERT INTO hasskill VALUES (49, 1);
INSERT INTO hasskill VALUES (49, 18);
INSERT INTO hasskill VALUES (50, 12);
INSERT INTO hasskill VALUES (50, 17);
INSERT INTO hasskill VALUES (50, 13);

DROP TABLE works;
DROP TABLE hasskill;
DROP TABLE PERSON;

CREATE TABLE PERSON
(
    Personid number(10),
    Name VARCHAR(50),
    address varchar(100),
    email varchar(50) check (email like '%@%'),
    gender varchar(1)check (gender in('M','F')),
    phonenum varchar(12) check (phonenum like '%%%-%%%-%%%%'),
	unique (personid)
);

CREATE TABLE works
(
	perid number(3),
	werkid number(3),
	constraint personfk1 FOREIGN KEY (perid)
 	References person(personid));
CREATE TABLE hasskill
(
	persid number(3),
	sid number(3),
	constraint personfk FOREIGN KEY (persid)References person(personid));

INSERT INTO person VALUES (1, 'Matthew', '9256 Jeff Davis Parkway', 'Matthew19@google.com', 'M', '581-675-8454');
INSERT INTO person VALUES (2, 'Veronica', '4587 Poydras Street', 'Veronica20@yahoo.com', 'F', '989-943-9814');
INSERT INTO person VALUES (3, 'Patrick', '12487 St. Claude Avenue', 'Patrick39@google.com', 'M', '299-133-2425');
INSERT INTO person VALUES (4, 'Jondrielle', '16497 Magnolia Street', 'Jondrielle22@yahoo.com', 'F', '263-376-7519');
INSERT INTO person VALUES (5, 'Mark', '13705 Frenchmen Street', 'Mark12@outlook.com', 'M', '214-916-0582');
INSERT INTO person VALUES (6, 'Sarah', '444 Rampart Street', 'Sarah26@google.com', 'M', '582-275-9049');
INSERT INTO person VALUES (7, 'Joseph', '6073 Dauphine Street', 'Joseph8@google.com', 'F', '144-267-2288');
INSERT INTO person VALUES (8, 'Mikolas', '1424 Canal Street', 'Mikolas7@yahoo.com', 'M', '043-794-2734');
INSERT INTO person VALUES (9, 'Roy', '1930 Orleans Street', 'Roy27@google.com', 'M', '467-210-0787');
INSERT INTO person VALUES (10, 'Joshua', '14886 Oak Street', 'Joshua10@outlook.com', 'F', '026-217-2545');
INSERT INTO person VALUES (11, 'Tre', '15266 Camp Street', 'Tre36@google.com', 'F', '768-904-4715');
INSERT INTO person VALUES (12, 'Viet', '9952 Jackson Avenue', 'Viet12@outlook.com', 'F', '772-866-8606');
INSERT INTO person VALUES (13, 'Sarah', '1548 Gentilly Boulevard', 'Sarah38@outlook.com', 'M', '295-525-6654');
INSERT INTO person VALUES (14, 'Thanh', '7387 Lafayette Street', 'Thanh12@google.com', 'M', '796-111-8923');
INSERT INTO person VALUES (15, 'Nicholas', '2761 Esplanade Avenue', 'Nicholas6@yahoo.com', 'F', '864-631-5540');
INSERT INTO person VALUES (16, 'Jondrielle', '5458 Pontchartrain Expressway', 'Jondrielle35@yahoo.com', 'M', '845-456-6659');
INSERT INTO person VALUES (17, 'Joshua', '17460 Pontchartrain Expressway', 'Joshua11@yahoo.com', 'F', '868-089-7060');
INSERT INTO person VALUES (18, 'Jondrielle', '4141 Bayou Road', 'Jondrielle12@outlook.com', 'M', '334-914-7886');
INSERT INTO person VALUES (19, 'Sean', '9624 Upperline Street', 'Sean40@outlook.com', 'M', '205-112-9850');
INSERT INTO person VALUES (20, 'Pablo', '525 Bayou Road', 'Pablo22@google.com', 'M', '896-563-3116');
INSERT INTO person VALUES (21, 'Matthew', '19552 Gravier Street', 'Matthew20@yahoo.com', 'F', '005-016-2166');
INSERT INTO person VALUES (22, 'Roy', '4511 St. Louis Street', 'Roy36@google.com', 'M', '068-139-5560');
INSERT INTO person VALUES (23, 'Tre', '3836 Orleans Street', 'Tre2@yahoo.com', 'M', '657-081-0085');
INSERT INTO person VALUES (24, 'Joshua', '7051 Julia Street', 'Joshua28@yahoo.com', 'M', '154-107-4920');
INSERT INTO person VALUES (25, 'Kevin', '5395 Tchoupitoulas Street', 'Kevin37@google.com', 'M', '744-222-2958');
INSERT INTO person VALUES (26, 'Kevin', '7198 Basin Street', 'Kevin35@yahoo.com', 'M', '833-809-9234');
INSERT INTO person VALUES (27, 'Thanh', '5563 Freret Street', 'Thanh12@google.com', 'M', '593-712-7907');
INSERT INTO person VALUES (28, 'Joshua', '12851 Royal Street', 'Joshua19@yahoo.com', 'F', '073-475-7343');
INSERT INTO person VALUES (29, 'Pablo', '6371 Martin Luther King Jr. Boulevard', 'Pablo18@yahoo.com', 'M', '965-075-7176');
INSERT INTO person VALUES (30, 'Nicholas', '13692 Peters Street', 'Nicholas17@yahoo.com', 'F', '755-040-6607');
INSERT INTO person VALUES (31, 'Sauryha', '7444 Prytania Street', 'Sauryha6@google.com', 'M', '325-622-6127');
INSERT INTO person VALUES (32, 'Nicholas', '10974 Julia Street', 'Nicholas5@outlook.com', 'F', '709-077-9297');
INSERT INTO person VALUES (33, 'Truc', '17405 Pearl Street', 'Truc27@yahoo.com', 'M', '412-139-8168');
INSERT INTO person VALUES (34, 'Sean', '3289 Oak Street', 'Sean37@yahoo.com', 'M', '959-048-6376');
INSERT INTO person VALUES (35, 'Tre', '2411 Howard Avenue', 'Tre35@outlook.com', 'F', '293-839-5358');
INSERT INTO person VALUES (36, 'Nicholas', '15293 Calliope Street', 'Nicholas16@outlook.com', 'M', '658-189-4251');
INSERT INTO person VALUES (37, 'Ricardo', '3571 Freret Street', 'Ricardo3@google.com', 'F', '206-777-4250');
INSERT INTO person VALUES (38, 'Stephen', '2452 Tchoupitoulas Street', 'Stephen1@outlook.com', 'F', '961-210-5453');
INSERT INTO person VALUES (39, 'Thanh', '18710 Jackson Avenue', 'Thanh27@google.com', 'F', '384-404-9845');
INSERT INTO person VALUES (40, 'Pablo', '9323 St. Peter Street', 'Pablo24@google.com', 'F', '226-397-5388');
INSERT INTO person VALUES (41, 'Truc', '18085 Toulouse Street', 'Truc29@yahoo.com', 'M', '532-371-5754');
INSERT INTO person VALUES (42, 'Patrick', '8153 Jeff Davis Parkway', 'Patrick15@google.com', 'F', '374-030-3045');
INSERT INTO person VALUES (43, 'Sean', '13016 Freret Street', 'Sean34@outlook.com', 'F', '244-241-0037');
INSERT INTO person VALUES (44, 'Patrick', '16572 Claiborne Avenue', 'Patrick7@google.com', 'F', '722-375-3183');
INSERT INTO person VALUES (45, 'Tommy', '9103 Poydras Street', 'Tommy28@yahoo.com', 'F', '378-992-9497');
INSERT INTO person VALUES (46, 'Ricardo', '3766 Freret Street', 'Ricardo38@google.com', 'F', '448-781-9074');
INSERT INTO person VALUES (47, 'Sean', '7990 Elysian Fields Avenue', 'Sean14@google.com', 'M', '569-322-0143');
INSERT INTO person VALUES (48, 'Tommy', '12149 St. Philip Street', 'Tommy39@outlook.com', 'M', '433-461-9330');
INSERT INTO person VALUES (49, 'Shayna', '11961 Gentilly Boulevard', 'Shayna24@yahoo.com', 'F', '098-239-3895');
INSERT INTO person VALUES (50, 'Truc', '11020 Jackson Avenue', 'Truc37@outlook.com', 'F', '104-581-7108');
INSERT INTO works VALUES (1, 66);
INSERT INTO works VALUES (1, 44);
INSERT INTO works VALUES (1, 87);
INSERT INTO works VALUES (2, NULL);
INSERT INTO works VALUES (3, NULL);
INSERT INTO works VALUES (4, NULL);
INSERT INTO works VALUES (5, NULL);
INSERT INTO works VALUES (6, NULL);
INSERT INTO works VALUES (7, 29);
INSERT INTO works VALUES (7, 14);
INSERT INTO works VALUES (7, 45);
INSERT INTO works VALUES (8, 38);
INSERT INTO works VALUES (8, 9);
INSERT INTO works VALUES (8, 96);
INSERT INTO works VALUES (9, 68);
INSERT INTO works VALUES (9, 3);
INSERT INTO works VALUES (10, NULL);
INSERT INTO works VALUES (11, 86);
INSERT INTO works VALUES (11, 59);
INSERT INTO works VALUES (11, 22);
INSERT INTO works VALUES (11, 90);
INSERT INTO works VALUES (12, 97);
INSERT INTO works VALUES (12, 67);
INSERT INTO works VALUES (12, 44);
INSERT INTO works VALUES (13, 29);
INSERT INTO works VALUES (14, 51);
INSERT INTO works VALUES (14, 59);
INSERT INTO works VALUES (15, NULL);
INSERT INTO works VALUES (16, 69);
INSERT INTO works VALUES (16, 85);
INSERT INTO works VALUES (16, 57);
INSERT INTO works VALUES (17, 24);
INSERT INTO works VALUES (17, 81);
INSERT INTO works VALUES (18, 20);
INSERT INTO works VALUES (19, 80);
INSERT INTO works VALUES (19, 72);
INSERT INTO works VALUES (19, 49);
INSERT INTO works VALUES (20, 95);
INSERT INTO works VALUES (21, 48);
INSERT INTO works VALUES (21, 24);
INSERT INTO works VALUES (22, 61);
INSERT INTO works VALUES (22, 97);
INSERT INTO works VALUES (22, 100);
INSERT INTO works VALUES (23, 43);
INSERT INTO works VALUES (24, 5);
INSERT INTO works VALUES (24, 62);
INSERT INTO works VALUES (25, 87);
INSERT INTO works VALUES (25, 16);
INSERT INTO works VALUES (26, 6);
INSERT INTO works VALUES (26, 91);
INSERT INTO works VALUES (26, 85);
INSERT INTO works VALUES (26, 68);
INSERT INTO works VALUES (27, 68);
INSERT INTO works VALUES (27, 22);
INSERT INTO works VALUES (27, 51);
INSERT INTO works VALUES (27, 27);
INSERT INTO works VALUES (28, NULL);
INSERT INTO works VALUES (29, 92);
INSERT INTO works VALUES (29, 64);
INSERT INTO works VALUES (29, 81);
INSERT INTO works VALUES (29, 90);
INSERT INTO works VALUES (30, NULL);
INSERT INTO works VALUES (31, NULL);
INSERT INTO works VALUES (32, 13);
INSERT INTO works VALUES (32, 53);
INSERT INTO works VALUES (33, 23);
INSERT INTO works VALUES (33, 58);
INSERT INTO works VALUES (33, 27);
INSERT INTO works VALUES (34, 99);
INSERT INTO works VALUES (34, 27);
INSERT INTO works VALUES (34, 3);
INSERT INTO works VALUES (35, NULL);
INSERT INTO works VALUES (36, NULL);
INSERT INTO works VALUES (37, 56);
INSERT INTO works VALUES (37, 2);
INSERT INTO works VALUES (38, 45);
INSERT INTO works VALUES (38, 15);
INSERT INTO works VALUES (39, 62);
INSERT INTO works VALUES (40, 10);
INSERT INTO works VALUES (40, 6);
INSERT INTO works VALUES (40, 34);
INSERT INTO works VALUES (41, 59);
INSERT INTO works VALUES (41, 23);
INSERT INTO works VALUES (42, NULL);
INSERT INTO works VALUES (43, NULL);
INSERT INTO works VALUES (44, 16);
INSERT INTO works VALUES (44, 77);
INSERT INTO works VALUES (44, 19);
INSERT INTO works VALUES (45, 54);
INSERT INTO works VALUES (45, 98);
INSERT INTO works VALUES (46, 39);
INSERT INTO works VALUES (47, 23);
INSERT INTO works VALUES (48, NULL);
INSERT INTO works VALUES (49, 19);
INSERT INTO works VALUES (49, 53);
INSERT INTO works VALUES (49, 8);
INSERT INTO works VALUES (50, NULL);
INSERT INTO hasskill VALUES (1, 15);
INSERT INTO hasskill VALUES (1, 17);
INSERT INTO hasskill VALUES (1, 2);
INSERT INTO hasskill VALUES (2, 6);
INSERT INTO hasskill VALUES (2, 2);
INSERT INTO hasskill VALUES (2, 5);
INSERT INTO hasskill VALUES (2, 1);
INSERT INTO hasskill VALUES (3, 9);
INSERT INTO hasskill VALUES (3, 18);
INSERT INTO hasskill VALUES (3, 6);
INSERT INTO hasskill VALUES (4, 4);
INSERT INTO hasskill VALUES (4, 9);
INSERT INTO hasskill VALUES (4, 20);
INSERT INTO hasskill VALUES (4, 7);
INSERT INTO hasskill VALUES (5, 11);
INSERT INTO hasskill VALUES (5, 8);
INSERT INTO hasskill VALUES (6, 17);
INSERT INTO hasskill VALUES (6, 21);
INSERT INTO hasskill VALUES (6, 9);
INSERT INTO hasskill VALUES (7, 11);
INSERT INTO hasskill VALUES (7, 10);
INSERT INTO hasskill VALUES (8, 6);
INSERT INTO hasskill VALUES (8, 11);
INSERT INTO hasskill VALUES (9, 14);
INSERT INTO hasskill VALUES (9, 12);
INSERT INTO hasskill VALUES (9, 14);
INSERT INTO hasskill VALUES (9, 12);
INSERT INTO hasskill VALUES (10, 1);
INSERT INTO hasskill VALUES (10, 3);
INSERT INTO hasskill VALUES (10, 11);
INSERT INTO hasskill VALUES (11, 11);
INSERT INTO hasskill VALUES (11, 3);
INSERT INTO hasskill VALUES (11, 3);
INSERT INTO hasskill VALUES (11, 17);
INSERT INTO hasskill VALUES (12, 17);
INSERT INTO hasskill VALUES (12, 6);
INSERT INTO hasskill VALUES (12, 1);
INSERT INTO hasskill VALUES (13, 3);
INSERT INTO hasskill VALUES (13, 20);
INSERT INTO hasskill VALUES (13, 19);
INSERT INTO hasskill VALUES (14, 14);
INSERT INTO hasskill VALUES (14, 11);
INSERT INTO hasskill VALUES (14, 5);
INSERT INTO hasskill VALUES (15, 2);
INSERT INTO hasskill VALUES (15, 16);
INSERT INTO hasskill VALUES (15, 6);
INSERT INTO hasskill VALUES (15, 20);
INSERT INTO hasskill VALUES (16, 18);
INSERT INTO hasskill VALUES (16, 3);
INSERT INTO hasskill VALUES (16, 21);
INSERT INTO hasskill VALUES (16, 18);
INSERT INTO hasskill VALUES (17, 5);
INSERT INTO hasskill VALUES (18, 18);
INSERT INTO hasskill VALUES (18, 1);
INSERT INTO hasskill VALUES (19, 19);
INSERT INTO hasskill VALUES (19, 12);
INSERT INTO hasskill VALUES (19, 7);
INSERT INTO hasskill VALUES (20, 12);
INSERT INTO hasskill VALUES (21, 20);
INSERT INTO hasskill VALUES (21, 8);
INSERT INTO hasskill VALUES (21, 8);
INSERT INTO hasskill VALUES (22, 20);
INSERT INTO hasskill VALUES (23, 3);
INSERT INTO hasskill VALUES (23, 5);
INSERT INTO hasskill VALUES (23, 14);
INSERT INTO hasskill VALUES (23, 11);
INSERT INTO hasskill VALUES (24, 20);
INSERT INTO hasskill VALUES (25, 6);
INSERT INTO hasskill VALUES (25, 13);
INSERT INTO hasskill VALUES (25, 7);
INSERT INTO hasskill VALUES (26, 1);
INSERT INTO hasskill VALUES (27, 7);
INSERT INTO hasskill VALUES (27, 2);
INSERT INTO hasskill VALUES (28, 9);
INSERT INTO hasskill VALUES (28, 5);
INSERT INTO hasskill VALUES (28, 16);
INSERT INTO hasskill VALUES (29, 6);
INSERT INTO hasskill VALUES (29, 5);
INSERT INTO hasskill VALUES (29, 9);
INSERT INTO hasskill VALUES (30, 15);
INSERT INTO hasskill VALUES (31, 9);
INSERT INTO hasskill VALUES (32, 11);
INSERT INTO hasskill VALUES (32, 20);
INSERT INTO hasskill VALUES (33, 19);
INSERT INTO hasskill VALUES (33, 16);
INSERT INTO hasskill VALUES (34, 10);
INSERT INTO hasskill VALUES (34, 16);
INSERT INTO hasskill VALUES (34, 10);
INSERT INTO hasskill VALUES (35, 5);
INSERT INTO hasskill VALUES (35, 19);
INSERT INTO hasskill VALUES (35, 17);
INSERT INTO hasskill VALUES (36, 19);
INSERT INTO hasskill VALUES (36, 19);
INSERT INTO hasskill VALUES (36, 15);
INSERT INTO hasskill VALUES (37, 14);
INSERT INTO hasskill VALUES (37, 8);
INSERT INTO hasskill VALUES (37, 2);
INSERT INTO hasskill VALUES (38, 18);
INSERT INTO hasskill VALUES (38, 1);
INSERT INTO hasskill VALUES (39, 1);
INSERT INTO hasskill VALUES (39, 8);
INSERT INTO hasskill VALUES (39, 16);
INSERT INTO hasskill VALUES (40, 3);
INSERT INTO hasskill VALUES (40, 13);
INSERT INTO hasskill VALUES (40, 14);
INSERT INTO hasskill VALUES (40, 11);
INSERT INTO hasskill VALUES (41, 7);
INSERT INTO hasskill VALUES (41, 20);
INSERT INTO hasskill VALUES (42, 15);
INSERT INTO hasskill VALUES (42, 10);
INSERT INTO hasskill VALUES (42, 12);
INSERT INTO hasskill VALUES (42, 2);
INSERT INTO hasskill VALUES (43, 2);
INSERT INTO hasskill VALUES (43, 12);
INSERT INTO hasskill VALUES (43, 21);
INSERT INTO hasskill VALUES (43, 17);
INSERT INTO hasskill VALUES (44, 1);
INSERT INTO hasskill VALUES (44, 8);
INSERT INTO hasskill VALUES (44, 20);
INSERT INTO hasskill VALUES (44, 1);
INSERT INTO hasskill VALUES (45, 16);
INSERT INTO hasskill VALUES (45, 7);
INSERT INTO hasskill VALUES (46, 3);
INSERT INTO hasskill VALUES (47, 8);
INSERT INTO hasskill VALUES (47, 3);
INSERT INTO hasskill VALUES (47, 7);
INSERT INTO hasskill VALUES (48, 1);
INSERT INTO hasskill VALUES (49, 1);
INSERT INTO hasskill VALUES (49, 18);
INSERT INTO hasskill VALUES (50, 12);
INSERT INTO hasskill VALUES (50, 17);
INSERT INTO hasskill VALUES (50, 13);