---------------------LD-----------------------------------------------------------------------------
DROP TABLE takes;
DROP TABLE jobs;
DROP TABLE company;
DROP TABLE gics;
DROP TABLE requires;
DROP TABLE skills;
DROP TABLE works;
DROP TABLE hasskill;
DROP TABLE PERSON;
drop table teaches;
DROP TABLE position;
drop table section;
drop table PREREQUISITE;
drop  table course;



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
 
CREATE TABLE teaches(
coursenumb number(5),
skillzid number(3)
);

CREATE TABLE section(
sectionid number(5) NOT NULL PRIMARY KEY,
corid number (5),
price number (4),
constraint sectionfk FOREIGN KEY (corid) References course(coursenumber));

CREATE table PREREQUISITE (
courseid number(5),
pcorse number (5),
FOREIGN KEY (courseid) References course(coursenumber),
FOREIGN KEY (pcorse) References course(coursenumber));

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
    
create table takes
    (
    peid number (3),
    coursecode number (4),
    sectcode number(3),
    completed varchar(10) check (completed like '%%/%%/%%%%'),
    constraint persfk FOREIGN key (peid) references person(personid));
    

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

INSERT INTO takes values(1,1004,11,'05/21/2021');
INSERT INTO takes values(1,1005,13,'05/21/2021');
INSERT INTO takes values(2,1004,11,'05/21/2021');
INSERT INTO takes values(2,1005,13,'05/21/2021');

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
INSERT INTO position VALUES (1, 'IT Specialist', '12 day', NULL, 40000, 60000, 'salary', 'We have an exciting opportunity for an IT Specialist to join our team. Bay State brings together experienced IT professionals and the latest state-of-the-art...');
INSERT INTO requires VALUES (1, 1);
INSERT INTO requires VALUES (1, 15);
INSERT INTO position VALUES (2, 'IT Specialist Junior (Government)', '16 day', '1/2021', 40000, 60000, 'salary', 'High School Diploma or General Equivalency Diploma (GED) Install, configure, service, repair, and maintain information technology systems in both a stand');
INSERT INTO requires VALUES (2, 9);
INSERT INTO requires VALUES (2, 1);
INSERT INTO position VALUES (3, 'Information Technology Specialist', '10 day', NULL, 40000, 60000, 'salary', 'Responsibilities: * Apply specialized knowledge in a single discipline such as assembly/integration, cross-discipline functions, data engineering, industry');
INSERT INTO requires VALUES (3, 7);
INSERT INTO requires VALUES (3, 3);
INSERT INTO position VALUES (4, 'Director of Information Technology', '4 day', '3/2017', 80000, 100000, 'salary', 'At Hyatt, we believe our guests select Hyatt because of our caring and attentive associates who are focused on providing efficient service and meaningful');
INSERT INTO requires VALUES (4, 17);
INSERT INTO requires VALUES (4, 10);
INSERT INTO position VALUES (5, 'IT Help Desk', '10 day', '4/2017', 15000, 30000, 'salary', 'One (1) year experience in IT required including at least one (1) year of customer service experience in IT....');
INSERT INTO requires VALUES (5, 20);
INSERT INTO requires VALUES (5, 15);
INSERT INTO position VALUES (6, 'IT Manager', '4 day', NULL, 30000, 50000, 'salary', 'Maintain IT audit compliance. Plan and budget all aspects of IT environment. Communicate and enforce adherence to all company IT security standards, practices...');
INSERT INTO requires VALUES (6, 15);
INSERT INTO requires VALUES (6, 8);
INSERT INTO position VALUES (7, 'IT Help Desk / Service Desk - Tier I Support', '12 day', NULL, 15000, 30000, 'salary', 'An IT Help Desk / Service Desk - Tier I Support professional is responsible for supporting end-user devices. Three or more years of professional level technical...');
INSERT INTO requires VALUES (7, 15);
INSERT INTO requires VALUES (7, 1);
INSERT INTO position VALUES (8, 'IT Director- Ancillary and Financial Systems', '5 day', NULL, 80000, 100000, 'salary', 'IT Director - Ancillary and Financial Systems. Prepares needed reports for all IT functions. Analyzes the operating and capital budgets and expenditures for...');
INSERT INTO requires VALUES (8, 21);
INSERT INTO requires VALUES (8, 14);
INSERT INTO position VALUES (9, 'PC Technician', '12 day', NULL, 20000, 30000, 'salary', 'The PC Technician must have technical knowledge of Windows 7, 8/8.1, 10, OSX environments, network and PC operating systems, including printers and wireless...');
INSERT INTO requires VALUES (9, 21);
INSERT INTO requires VALUES (9, 18);
INSERT INTO position VALUES (10, 'Information Technology Specialist (Entry Level)', '3 day', NULL, 40000, 60000, 'salary', 'IT Specialist JR. IT Systems (stand-alone and server environments). Install, Configure, Service, Repair and Maintain:....');
INSERT INTO requires VALUES (10, 21);
INSERT INTO requires VALUES (10, 21);
INSERT INTO position VALUES (11, 'IT Specialist', '12 day', NULL, 40000, 60000, 'salary', 'We have Jr and Mid Positions available as well. Summary: This position’s primary role will be a Field Services Site Lead servicing a large scale Enterprise...');
INSERT INTO requires VALUES (11, 8);
INSERT INTO requires VALUES (11, 11);
INSERT INTO position VALUES (12, 'IT Manager', '11 day', NULL, 30000, 50000, 'salary', 'Maintain IT audit compliance. Plan and budget all aspects of IT environment. Communicate and enforce adherence to all company IT security standards, practices...');
INSERT INTO requires VALUES (12, 8);
INSERT INTO requires VALUES (12, 18);
INSERT INTO position VALUES (13, 'Field IT Technician', '3 day', NULL, 20000, 30000, 'salary', 'Educate users on FMCNA and FMS IT policies and procedures as necessary. Responsible for providing Tier II computer desktop support to field locations in...');
INSERT INTO requires VALUES (13, 16);
INSERT INTO requires VALUES (13, 16);
INSERT INTO position VALUES (14, 'Service Desk Technician- Tier 2', '12 day', '1/2019', 20000, 30000, 'salary', 'The Service Desk Tier 2 technician is a skilled desktop support analyst that is the second layer of technical support and will go desk side as part of the...');
INSERT INTO requires VALUES (14, 19);
INSERT INTO requires VALUES (14, 7);
INSERT INTO position VALUES (15, 'Network Technician LCMC', '5 day', NULL, 20000, 30000, 'salary', 'Extensive experience in repair of Desktop communications. The Network Technician’s role is to support the stable operation of the in-house communications...');
INSERT INTO requires VALUES (15, 2);
INSERT INTO requires VALUES (15, 14);
INSERT INTO position VALUES (16, 'IT Specialist Junior', '7 day', NULL, 40000, 60000, 'salary', 'IT Specialist Junior. The IT Specialist Junior will, under immediate supervision, install, configure, service, repair, and maintain information technology...');
INSERT INTO requires VALUES (16, 15);
INSERT INTO requires VALUES (16, 3);
INSERT INTO position VALUES (17, 'Windows Systems Administrator', '11 day', NULL, 20000, 30000, 'salary', 'Is a Information Technology Solutions Company - providing innovative IT solutions and organizational support within the DOD and the Civil sector....');
INSERT INTO requires VALUES (17, 14);
INSERT INTO requires VALUES (17, 8);
INSERT INTO position VALUES (18, 'IT Epic Analyst', '5 day', NULL, 50000, 70000, 'salary', 'Works with internal IT teams on technical troubleshooting, integration, reporting and training. Help Desk support as needed....');
INSERT INTO requires VALUES (18, 1);
INSERT INTO requires VALUES (18, 10);
INSERT INTO position VALUES (19, 'Information Security Analyst III', '2 day', NULL, 50000, 70000, 'salary', 'Must have at least 7 years of information security, IT audit, or related experience. Must have knowledge of information systems and equipment, including, but...');
INSERT INTO requires VALUES (19, 7);
INSERT INTO requires VALUES (19, 21);
INSERT INTO position VALUES (20, 'PC/Desktop support at Stennis, Space Center, MS', '8 day', NULL, 20000, 30000, 'salary', 'Help Desk mid provide support to users in resolving problems using help desk center tools. The RESPONSIBILITIES of the help desk mid may also include support in...');
INSERT INTO requires VALUES (20, 14);
INSERT INTO requires VALUES (20, 17);
INSERT INTO position VALUES (21, 'Best Buy Apple Computing Master', '11 day', NULL, 20000, 30000, 'salary', 'Surrounded by the latest and greatest technology, a team of amazing coworkers and a work environment where anything is possible, you’ll find it easy to be your...');
INSERT INTO requires VALUES (21, 12);
INSERT INTO requires VALUES (21, 10);
INSERT INTO position VALUES (22, 'IT Ancillary Applications Manager', '5 day', NULL, 30000, 50000, 'salary', 'IT Ancillary Applications Manager. IT communications, scheduling and decision making. The IT Ancillary Applications Manager works under the guidance of the IT...');
INSERT INTO requires VALUES (22, 2);
INSERT INTO requires VALUES (22, 15);
INSERT INTO position VALUES (23, 'Computer Systems Analyst', '3 day', NULL, 50000, 70000, 'salary', 'Under the general direction of the Information Technology Director and the Information Systems Manager, the Computer Systems Analyst provides technical');
INSERT INTO requires VALUES (23, 2);
INSERT INTO requires VALUES (23, 21);
INSERT INTO position VALUES (24, 'IT Project Manager III', '5 day', '1/2018', 30000, 50000, 'salary', 'Healthcare IT project management experience preferred. LCMC Health is a Louisiana-based, not-for-profit healthcare system serving the needs of the people of...');
INSERT INTO requires VALUES (24, 5);
INSERT INTO requires VALUES (24, 8);
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
INSERT INTO position VALUES (51, 'Systems Administrator Mid (New Orleans, LA)', '30+ day', NULL, 20000, 30000, 'salary', 'We provide professional services in the classified IT arena as well as Business Intelligence and Microsoft .Net development services for public and private...');
INSERT INTO requires VALUES (51, 19);
INSERT INTO requires VALUES (51, 6);
INSERT INTO position VALUES (52, 'Help Desk Specialist', '30+ day', NULL, 40000, 60000, 'salary', 'We are currently looking for an Help Desk Specialist to work in New Orleans, LA. Hewlett Packard Enterprise is a leading global technology services provider...');
INSERT INTO requires VALUES (52, 9);
INSERT INTO requires VALUES (52, 9);
INSERT INTO position VALUES (53, 'Programmer - Sr (New Orleans)', '5 hour', '2/2017', 20000, 30000, 'salary', 'We provide professional services in the classified IT arena as well as Business Intelligence and Microsoft .Net development services for public and private...');
INSERT INTO requires VALUES (53, 3);
INSERT INTO requires VALUES (53, 10);
INSERT INTO position VALUES (54, 'IT Consultant/OT Engineer Sr. - Oper Tech', '5 day', '1/2017', 20000, 30000, 'salary', 'Bachelor’s Degree Engineering or Discipline or experience equivalent thereof, PD Desired, Advanced Engineering Degree helpful – desired as relevant, IT or...');
INSERT INTO requires VALUES (54, 8);
INSERT INTO requires VALUES (54, 18);
INSERT INTO position VALUES (55, 'Drug Information Specialist Pharmacist', '18 day', NULL, 40000, 60000, 'salary', 'As a 473-bed acute care hospital, it offers the opportunity to learn and provide patient care at a Magnet facility with three Centers of Excellence, all the...');
INSERT INTO requires VALUES (55, 3);
INSERT INTO requires VALUES (55, 15);
INSERT INTO position VALUES (56, 'System Adminstrator', '6 day', '4/2021', 20000, 30000, 'salary', 'Providing a full range of industry leading services,including digital, systems integration and resource planning, we enable clientsto fine tune Application...');
INSERT INTO requires VALUES (56, 2);
INSERT INTO requires VALUES (56, 4);
INSERT INTO position VALUES (57, 'Technical Support', '30+ day', NULL, 20000, 30000, 'salary', 'We are the nation’s oldest and largest woman-owned IT Company. Providing remote Help Desk Support to our customer’s and field technicians....');
INSERT INTO requires VALUES (57, 21);
INSERT INTO requires VALUES (57, 14);
INSERT INTO position VALUES (58, 'System Administrator', '30+ day', '3/2021', 20000, 30000, 'salary', 'Bay State brings together experienced IT professionals and the latest state-of-the-art technology tools, practices, and products to support projects and task...');
INSERT INTO requires VALUES (58, 12);
INSERT INTO requires VALUES (58, 14);
INSERT INTO position VALUES (59, 'Enterprise IT Service Desk Specialist', '30+ day', '1/2019', 40000, 60000, 'salary', 'PSI Pa x is currently recruiting for a n Enterprise IT Service Desk Specialist to sup port our government customer in New Orleans, LA ....');
INSERT INTO requires VALUES (59, 1);
INSERT INTO requires VALUES (59, 14);
INSERT INTO position VALUES (60, 'Front End Web Developer', '30+ day', NULL, 50000, 70000, 'salary', 'You will bridge the gap between graphical design and technical implementation, taking an active role on both sides and defining how the application looks as...');
INSERT INTO requires VALUES (60, 11);
INSERT INTO requires VALUES (60, 1);
INSERT INTO position VALUES (61, 'Network Tech', '7 day', '2/2020', 20000, 30000, 'salary', 'Extensive experience trouble-shooting various Desktop issues. Network Logic, LLC located in Mandeville, Louisiana is seeking a full-time Network Technician with...');
INSERT INTO requires VALUES (61, 11);
INSERT INTO requires VALUES (61, 2);
INSERT INTO position VALUES (62, 'MSP Systems Engineer', '20 day', NULL, 20000, 30000, 'salary', 'Progressive New Orleans based IT firm needs your skills. The systems engineer should already be a Microsoft Certified IT Professional and should continue to...');
INSERT INTO requires VALUES (62, 8);
INSERT INTO requires VALUES (62, 12);
INSERT INTO position VALUES (63, 'IT Specialist Jr.', '28 day', '2/2021', 40000, 60000, 'salary', 'IT Specialist Jr. All candidates are required to pass a drug screening, criminal history check, and credit check PRIOR TO BEGINNING WORK. $11.57/hr....');
INSERT INTO requires VALUES (63, 13);
INSERT INTO requires VALUES (63, 10);
INSERT INTO position VALUES (64, 'Desktop Support Specialist', '30+ day', '2/2021', 40000, 60000, 'salary', 'We are currently looking for an Desktop Support Specialist to work in New Orleans, LA. Hewlett Packard Enterprise is a leading global technology services...');
INSERT INTO requires VALUES (64, 17);
INSERT INTO requires VALUES (64, 9);
INSERT INTO position VALUES (65, 'Data Analyst', '13 day', NULL, 50000, 70000, 'salary', 'This position works as an integral member of a multidisciplinary team for a federal government contract to perform investigations to identify fraud, waste and');
INSERT INTO requires VALUES (65, 14);
INSERT INTO requires VALUES (65, 7);
INSERT INTO position VALUES (66, 'Junior System Administrator (SRF 2336)', '24 day', '3/2017', 20000, 30000, 'salary', 'CSRA plays a key role in the Department''s IT integration strategy through its Data Center-1 program. Follows developed operating procedures and maintains record...');
INSERT INTO requires VALUES (66, 9);
INSERT INTO requires VALUES (66, 20);
INSERT INTO position VALUES (67, 'SOFTWARE DEVELOPER', '2 day', NULL, 50000, 70000, 'salary', 'The IT Software Developer is a member of an information technology team responsible for delivering new system functionality and supporting existing systems in...');
INSERT INTO requires VALUES (67, 20);
INSERT INTO requires VALUES (67, 16);
INSERT INTO position VALUES (68, 'Mid-Level Enterprise Network Engineer', '18 day', '3/2020', 20000, 30000, 'salary', 'Work closely with various technology support teams as well as with vendor technical support to ensure robust operational performance of Data Center networks,...');
INSERT INTO requires VALUES (68, 10);
INSERT INTO requires VALUES (68, 4);
INSERT INTO position VALUES (69, 'Help Desk Technician', '30+ day', NULL, 15000, 30000, 'salary', 'Help Desk Technician*. In-Telecom Consulting is searching for a full time experienced Programming Technician....');
INSERT INTO requires VALUES (69, 12);
INSERT INTO requires VALUES (69, 21);
INSERT INTO position VALUES (70, 'Service Desk Manager', '24 day', NULL, 30000, 50000, 'salary', '3-5 years’ experience in an IT service desk environment. Experience managing a tiered help desk providing enterprise level IT support....');
INSERT INTO requires VALUES (70, 9);
INSERT INTO requires VALUES (70, 4);
INSERT INTO position VALUES (71, 'Manager Data Systems, EMPLOY', '5 hour', NULL, 30000, 50000, 'salary', 'It is comprised of over 30 different organizations seeking to address youth disconnection. The....');
INSERT INTO requires VALUES (71, 1);
INSERT INTO requires VALUES (71, 1);
INSERT INTO position VALUES (72, 'Front Office Manager', '15 hour', '3/2019', 20, 40, 'hourly', 'Help us keep it funky! Boutique Bed and Breakfast in the Lower Garden District searching for part time/full time (30+hours a week) Front Office Manager....');
INSERT INTO requires VALUES (72, 10);
INSERT INTO requires VALUES (72, 7);
INSERT INTO position VALUES (73, 'Software Developer', '4 day', '2/2020', 50000, 70000, 'salary', 'The platform allows school leaders to capture, organize, analyze, and share classroom observation data in an intuitive interface, making it easy to identify...');
INSERT INTO requires VALUES (73, 5);
INSERT INTO requires VALUES (73, 6);
INSERT INTO position VALUES (74, 'Software Application Developer', '30+ day', NULL, 50000, 70000, 'salary', 'Designing databases and creating tables, indexes, relationships, triggers, and stored procedures required to store all data and communicate it to the front-end...');
INSERT INTO requires VALUES (74, 21);
INSERT INTO requires VALUES (74, 8);
INSERT INTO position VALUES (75, 'Cyber Security Specialist Junior', '29 day', NULL, 40000, 60000, 'salary', 'Hewlett Packard Enterprise is a leading global technology services provider delivering business solutions to its clients. The HPE Enterprise Services delivers');
INSERT INTO requires VALUES (75, 15);
INSERT INTO requires VALUES (75, 12);
INSERT INTO position VALUES (76, 'IT Security Analyst', '30+ day', NULL, 50000, 70000, 'salary', 'Laitram’s Information Technology Services Department has an opening for an IT Security Analyst, reporting to the IT Infrastructure Manager....');
INSERT INTO requires VALUES (76, 3);
INSERT INTO requires VALUES (76, 3);
INSERT INTO position VALUES (77, 'IT Project Coordinator for DHS Datacenter SRF 2428', '16 day', NULL, 20000, 30000, 'salary', 'IT Project Coordinator for DHS Datacenter SRF 2428 Requisition ID:. CSRA plays an integral role in the DHS IT integration strategy....');
INSERT INTO requires VALUES (77, 21);
INSERT INTO requires VALUES (77, 8);
INSERT INTO position VALUES (78, 'Database Administrator', '3 day', NULL, 20000, 30000, 'salary', 'Job Number: R0002125 Booz Allen Hamilton has been at the forefront of strategy and technology for more than 100 years Today, the firm provides management and');
INSERT INTO requires VALUES (78, 16);
INSERT INTO requires VALUES (78, 4);
INSERT INTO position VALUES (79, 'Environmental Impact Manager 1', '3 day', NULL, 30000, 50000, 'salary', 'If you are unable to apply online, you may fax your Civil Service application to 225-219-1041 or you may mail it to Staffing Division, Department of State Civil...');
INSERT INTO requires VALUES (79, 6);
INSERT INTO requires VALUES (79, 5);
INSERT INTO position VALUES (80, 'Medical Data Entry Genius', '3 day', '4/2021', 20000, 30000, 'salary', 'For you, entering the right things into the correct places is child''s play, but you love it. Do you love numbers?...');
INSERT INTO requires VALUES (80, 13);
INSERT INTO requires VALUES (80, 15);
INSERT INTO position VALUES (81, 'Geek Squad Agent - Baton Rouge, LA', '11 day', NULL, 10000, 20000, 'salary', 'Consistently deliver on the promise of “Do it right, do it swiftly, and keep the customer informed.�?. Does the thought of installing an LCD in an SUV, and...');
INSERT INTO requires VALUES (81, 10);
INSERT INTO requires VALUES (81, 21);
INSERT INTO position VALUES (82, 'IT Help Desk / Field Technician', '30+ day', NULL, 15000, 30000, 'salary', 'The IT Help Desk / Field Technician is responsible for supporting various hardware, software and communication systems onboard the vessels and facilities that...');
INSERT INTO requires VALUES (82, 12);
INSERT INTO requires VALUES (82, 21);
INSERT INTO position VALUES (83, 'Systems Librarian', '25 day', NULL, 20000, 30000, 'salary', 'The university is located in beautiful uptown New Orleans where it borders the St. Proficiency with standard computer hardware and desktop applications,...');
INSERT INTO requires VALUES (83, 21);
INSERT INTO requires VALUES (83, 15);
INSERT INTO position VALUES (84, 'IT Director- Revenue Cycle Applications', '5 day', NULL, 80000, 100000, 'salary', 'IT Director – Revenue Cycle Applications. Prepares weekly, monthly, quarterly reports for all IT functions. IT experience in healthcare revenue cycle systems,...');
INSERT INTO requires VALUES (84, 9);
INSERT INTO requires VALUES (84, 9);
INSERT INTO position VALUES (85, 'IT Software Systems Architect', '10 day', NULL, 20000, 30000, 'salary', 'General Dynamics IT has an immediate opening for an IT Systems Architect along the Gulf Coast in New Orleans;...');
INSERT INTO requires VALUES (85, 7);
INSERT INTO requires VALUES (85, 17);
INSERT INTO position VALUES (86, 'Technical Project Manager', '30+ day', '4/2019', 30000, 50000, 'salary', 'It solves a headache. And ultimately, it shines a light on a very unjust and messy process, making it more fair and transparent for all....');
INSERT INTO requires VALUES (86, 18);
INSERT INTO requires VALUES (86, 10);
INSERT INTO position VALUES (87, 'Office Administrator', '22 hour', '4/2018', 20000, 30000, 'salary', 'It means being a mentor, being a friend, and being part of a change that starts with each patient. Here at Grand Family Dentistry, our teams don’t just shape...');
INSERT INTO requires VALUES (87, 17);
INSERT INTO requires VALUES (87, 6);
INSERT INTO position VALUES (88, 'Deputy Program Manager w/Data Center Exp (SRF 2552)', '16 day', '2/2021', 30000, 50000, 'salary', 'CSC plays a key role in the Department''s IT integration strategy. Deputy Program Manager w/Data Center Exp (SRF 2552) Requisition ID:....');
INSERT INTO requires VALUES (88, 9);
INSERT INTO requires VALUES (88, 5);
INSERT INTO position VALUES (89, 'COMPLIANCE INVESTIGATOR 3', '3 day', '2/2018', 20000, 30000, 'salary', 'If you do not have a score prior to applying to this posting, it may result in your application not being considered....');
INSERT INTO requires VALUES (89, 4);
INSERT INTO requires VALUES (89, 2);
INSERT INTO position VALUES (90, 'IT Specialist - Junior (New Orleans)', '30+ day', NULL, 40000, 60000, 'salary', 'IT Specialist – Junior. The selected qualified candidate under general supervision will be responsible for providing IT services in connection with the Next...');
INSERT INTO requires VALUES (90, 3);
INSERT INTO requires VALUES (90, 7);
INSERT INTO position VALUES (91, 'NETWORK ENGINEER', '30+ day', NULL, 20000, 30000, 'salary', 'The Network Engineer is a well-rounded individual with experience working in mid to large size environments. A diverse technical skill set is required along');
INSERT INTO requires VALUES (91, 14);
INSERT INTO requires VALUES (91, 17);
INSERT INTO position VALUES (92, 'Installation Technician', '10 day', NULL, 20000, 30000, 'salary', 'Our employees say it best! Don’t take our word for it. What’s it like to join our team? Innovation starts in the hands of our customers, and our technicians...');
INSERT INTO requires VALUES (92, 6);
INSERT INTO requires VALUES (92, 7);
INSERT INTO position VALUES (93, 'INFORMATION SECURITY ENGINEER', '30+ day', NULL, 20000, 30000, 'salary', 'Minimum 4 years of information security, IT or risk management experience. The primary responsibility of this position is for implementing information security...');
INSERT INTO requires VALUES (93, 15);
INSERT INTO requires VALUES (93, 20);
INSERT INTO position VALUES (94, 'Enterprise Service Desk Specialist', '7 day', NULL, 40000, 60000, 'salary', 'One (1) year experience in IT required including at least one (1) year of customer service experience in IT....');
INSERT INTO requires VALUES (94, 15);
INSERT INTO requires VALUES (94, 11);
INSERT INTO position VALUES (95, 'Training Specialist Jr. (New Orleans)', '5 hour', NULL, 40000, 60000, 'salary', 'We provide professional services in the classified IT arena as well as Business Intelligence and Microsoft .Net development services for public and private...');
INSERT INTO requires VALUES (95, 19);
INSERT INTO requires VALUES (95, 7);
INSERT INTO position VALUES (96, 'Service Technician', '30+ day', NULL, 20000, 30000, 'salary', 'It does notprescribe or restrict the tasks that may be assigned, since all positions aresubject to change....');
INSERT INTO requires VALUES (96, 21);
INSERT INTO requires VALUES (96, 20);
INSERT INTO position VALUES (97, 'Enterprise Service Desk Specialist - Mid (New Orleans, LA)', '23 day', '1/2015', 40000, 60000, 'salary', '1 year customer service experience in IT. Enterprise Service Desk Specialist - Mid. 1 year experience in Information Technology required including at least 1...');
INSERT INTO requires VALUES (97, 15);
INSERT INTO requires VALUES (97, 18);
INSERT INTO position VALUES (98, 'Software Engineer', '4 day', NULL, 20000, 30000, 'salary', 'Bachelor''s Degree in “STEM�? Majors (Science, Technology, Engineering and Math) OR Completion of a code development pair-programming, bootcamp-style, or...');
INSERT INTO requires VALUES (98, 15);
INSERT INTO requires VALUES (98, 8);
INSERT INTO position VALUES (99, 'Information Technology Professionals', '30+ day', NULL, 20000, 30000, 'salary', 'Founded in 1976, CGI is a leading IT and business process services firm committed to helping clients succeed....');
INSERT INTO requires VALUES (99, 1);
INSERT INTO requires VALUES (99, 15);
INSERT INTO position VALUES (100, 'IT Manager / Coordinator', '30 day', '4/2019', 30000, 50000, 'salary', 'The IT Manager is responsible for developing and maintaining a good IT environment. High Degree of ownership in all matters within the IT infrastructure....]');
INSERT INTO requires VALUES (100, 20);
INSERT INTO requires VALUES (100, 3);
INSERT INTO company VALUES (1, 'Bay State', 'New Orleans, LA', '4', '410', 'https://www.indeed.com/rc/clk?jk=e0f433568fabe8e1&fccid=19aa0bbdd75afe67');
INSERT INTO company VALUES (2, 'AT and T', 'New Orleans, LA', '8', '820', 'https://www.indeed.com/rc/clk?jk=af641a3c3dea6dc6&fccid=25b5166547bbf543');
INSERT INTO company VALUES (3, 'ACI Federal', 'New Orleans, LA', '9', '910', 'https://www.indeed.com/company/ACI-Federal/jobs/Information-Technology-Specialist-c5c93b734fc9673c?fccid=58476d2e8b9c7544');
INSERT INTO company VALUES (4, 'Hyatt', 'New Orleans, LA', '2', '210', 'https://www.indeed.com/rc/clk?jk=cb8b9a04e68084af&fccid=b385273868d506a9');
INSERT INTO company VALUES (5, 'The Troubadour', 'New Orleans, LA 70112 (Central Business District area)', '2', '210', 'https://www.indeed.com/rc/clk?jk=5a86c75262b3bdaf&fccid=0de594717975faf2');
INSERT INTO company VALUES (6, 'Sparkhound', 'Hammond, LA', '5', '510', 'https://www.indeed.com/rc/clk?jk=08b558b010eebe13&fccid=81965b70260b0455');
INSERT INTO company VALUES (7, 'Children''s Hospital, New Orleans', 'New Orleans, LA', '1', '110', 'https://www.indeed.com/rc/clk?jk=919461f5732612ea&fccid=ff8ce7baeed40030');
INSERT INTO company VALUES (8, 'Odyssey House Louisiana, Inc.', 'New Orleans, LA 70119 (Bayou Saint John area)', '1', '120', 'https://www.indeed.com/company/Odyssey-House-Louisiana,-Inc./jobs/PC-Technician-4a1f104801ea2e20?fccid=a9b920cf23c58d84');
INSERT INTO company VALUES (9, 'JK2S Solutions', 'New Orleans, LA', '5', '510', 'https://www.indeed.com/company/JK2S/jobs/IT-Specialist-a98d514e0a89d602?fccid=2b0e2ec249ca6690');
INSERT INTO company VALUES (10, 'Destination Hotels  and  Resorts', 'New Orleans, LA', '2', '210', 'https://www.indeed.com/rc/clk?jk=f9c4d675beee03de&fccid=e2dea33ac04eacd7');
INSERT INTO company VALUES (11, 'Fresenius Medical Care', 'Metairie, LA', '1', '110', 'https://www.indeed.com/rc/clk?jk=a67a6895f6024c79&fccid=8de1633f2f8eae1d');
INSERT INTO company VALUES (12, 'CGI', 'Hammond, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=d6a2b63918c2f67a&fccid=d2841a5c0380b93d');
INSERT INTO company VALUES (13, 'Epsilon Inc.', 'New Orleans, LA 70146 (Lake Terrace And Oaks area)', '5', '520', 'https://www.indeed.com/rc/clk?jk=a414d2e6fdba1a4a&fccid=765e0365309ddf72');
INSERT INTO company VALUES (14, 'Network Runners, Inc.', 'New Orleans, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=2932fd8cd8f3e5d0&fccid=957fdc33884615ec');
INSERT INTO company VALUES (15, 'First NBC Bank', 'New Orleans, LA', '9', '910', 'https://www.indeed.com/rc/clk?jk=0667097456bbbb89&fccid=4cd44f8ed180811d');
INSERT INTO company VALUES (16, 'CACI', 'Stennis Space Center, MS 39529', '5', '520', 'https://www.indeed.com/rc/clk?jk=facbfcd6eae2116d&fccid=290a4498a64fc044');
INSERT INTO company VALUES (17, 'Best Buy', 'Covington, LA 70433', '12', '1210', 'https://www.indeed.com/rc/clk?jk=a640d8e4b8d90b37&fccid=027d7cca25a5d14f');
INSERT INTO company VALUES (18, 'Terrebonne General Medical Center', 'Houma, LA', '1', '110', 'https://www.indeed.com/rc/clk?jk=c0f455dfbbec71b7&fccid=b3eb08a7b54e330b');
INSERT INTO company VALUES (19, 'Tulane University', 'New Orleans, LA', '4', '410', 'https://www.indeed.com/rc/clk?jk=b5bac8d5b2fe0ad9&fccid=32f1f726276ba707');
INSERT INTO company VALUES (20, 'General Electric', 'New Orleans, LA 70121', '10', '1020', 'https://www.indeed.com/rc/clk?jk=72335b196af723f7&fccid=c5c99ec01e2125aa');
INSERT INTO company VALUES (21, 'Ultimate Technical Solutions, Inc.', 'New Orleans, LA 70123', '5', '510', 'https://www.indeed.com/company/Ultimate-Technical-Solutions,-Inc./jobs/Help-Desk-Technician-7e6c820a31c1167d?fccid=564040c6a12a690f');
INSERT INTO company VALUES (22, 'Dell', 'New Orleans, LA', '10', '1010', 'https://www.indeed.com/rc/clk?jk=8008ed3ac9a4b99c&fccid=0918a251e6902f97');
INSERT INTO company VALUES (23, 'General Dynamics Information Technology', 'Stennis Space Center, MS', '5', '520', 'https://www.indeed.com/rc/clk?jk=84f39a6d77b6d4c7&fccid=11caadcdc98800d4');
INSERT INTO company VALUES (24, 'Kofax', 'Metairie, LA', '5', '510', 'https://www.indeed.com/rc/clk?jk=b5fe46f16f49f138&fccid=733ea912d58257f6');
INSERT INTO company VALUES (25, 'Gilsbar Holdings', 'Covington, LA', '9', '940', 'https://www.indeed.com/rc/clk?jk=32633cdd1bbc0f8d&fccid=591edce286e3ff98');
INSERT INTO company VALUES (26, 'Gilsbar', 'Covington, LA 70433', '9', '940', 'https://www.indeed.com/rc/clk?jk=079874832df2424d&fccid=79f204bea5e3ca6a');
INSERT INTO company VALUES (27, 'MECO (Mechanical Equipment Company Inc)', 'Mandeville, LA 70471', '10', '1020', 'https://www.indeed.com/company/MECO-(Mechanical-Equipment-Company-Inc)/jobs/PC-Technician-5dbe78cd759f9041?fccid=cefe145147cc4f55');
INSERT INTO company VALUES (28, 'NRLC', 'Covington, LA', '11', '1110', 'https://www.indeed.com/company/NRLC/jobs/IT-Consultant-c8e2c5238e583682?fccid=b1a5eca9eec687bd');
INSERT INTO company VALUES (29, 'comtecinfo', 'New Orleans, LA', '5', '520', 'https://www.indeed.com/rc/clk?jk=12667e1eec8f6880&fccid=e36b62be8424611e');
INSERT INTO company VALUES (30, 'XG Security', 'Metairie, LA', '5', '520', 'https://www.indeed.com/company/XG-Security/jobs/Network-Technician-66d4809724f46180?fccid=e11bfb886fc2ed49');
INSERT INTO company VALUES (31, 'Microsoft', 'New Orleans, LA', '5', '510', 'https://www.indeed.com/rc/clk?jk=1dfac62a08dcbf98&fccid=734cb5a01ee60f80');
INSERT INTO company VALUES (32, 'SpikeIT Global Solutions', 'New Orleans, LA', '5', '510', 'https://www.indeed.com/company/SpikeIT-Global-Solutions/jobs/Cyber-Security-Analyst-0ba17389d1872fd7?fccid=f20f77a920649633');
INSERT INTO company VALUES (33, 'Volunteers of America Greater New Orleans', 'New Orleans, LA', '1', '120', 'https://www.indeed.com/rc/clk?jk=17d7017196a0b413&fccid=9cabce648c17e480');
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
INSERT INTO jobs VALUES (25, 25, NULL, 19, 'full time');
INSERT INTO jobs VALUES (26, 26, 7, 20, 'full time');
INSERT INTO jobs VALUES (27, 27, 3, 21, 'full time');
INSERT INTO jobs VALUES (28, 28, NULL, 22, 'full time');
INSERT INTO jobs VALUES (29, 29, 7, 1, 'full time');
INSERT INTO jobs VALUES (30, 30, NULL, 23, 'full time');
INSERT INTO jobs VALUES (31, 31, NULL, 24, 'full time');
INSERT INTO jobs VALUES (32, 32, 3, 25, 'full time');
INSERT INTO jobs VALUES (33, 33, 3, 18, 'full time');
INSERT INTO jobs VALUES (34, 34, 7, 2, 'full time');
INSERT INTO jobs VALUES (35, 35, 3, 26, 'full time');
INSERT INTO jobs VALUES (36, 36, 7, 1, 'full time');
INSERT INTO jobs VALUES (37, 37, NULL, 27, 'full time');
INSERT INTO jobs VALUES (38, 38, 7, 9, 'full time');
INSERT INTO jobs VALUES (39, 39, NULL, 28, 'full time');
INSERT INTO jobs VALUES (40, 40, 4, 29, 'full time');
INSERT INTO jobs VALUES (41, 41, NULL, 30, 'full time');
INSERT INTO jobs VALUES (42, 42, 4, 31, 'full time');
INSERT INTO jobs VALUES (43, 43, 1, 32, 'full time');
INSERT INTO jobs VALUES (44, 44, 7, 33, 'full time');
INSERT INTO jobs VALUES (45, 45, NULL, 34, 'full time');
INSERT INTO jobs VALUES (46, 46, 2, 17, 'full time');
INSERT INTO jobs VALUES (47, 47, 1, 35, 'full time');
INSERT INTO jobs VALUES (48, 48, 7, 36, 'full time');
INSERT INTO jobs VALUES (49, 49, 7, 37, 'full time');
INSERT INTO jobs VALUES (50, 50, 5, 38, 'full time');
INSERT INTO jobs VALUES (51, 51, NULL, 39, 'full time');
INSERT INTO jobs VALUES (52, 52, 7, 40, 'full time');
INSERT INTO jobs VALUES (53, 53, NULL, 39, 'full time');
INSERT INTO jobs VALUES (54, 54, NULL, 37, 'full time');
INSERT INTO jobs VALUES (55, 55, 7, 41, 'full time');
INSERT INTO jobs VALUES (56, 56, NULL, 42, 'full time');
INSERT INTO jobs VALUES (57, 57, NULL, 43, 'full time');
INSERT INTO jobs VALUES (58, 58, NULL, 1, 'full time');
INSERT INTO jobs VALUES (59, 59, 7, 44, 'full time');
INSERT INTO jobs VALUES (60, 60, 6, 45, 'full time');
INSERT INTO jobs VALUES (61, 61, NULL, 46, 'full time');
INSERT INTO jobs VALUES (62, 62, NULL, 47, 'full time');
INSERT INTO jobs VALUES (63, 63, 7, 48, 'full time');
INSERT INTO jobs VALUES (64, 64, 7, 40, 'full time');
INSERT INTO jobs VALUES (65, 65, 1, 49, 'full time');
INSERT INTO jobs VALUES (66, 66, NULL, 50, 'full time');
INSERT INTO jobs VALUES (67, 67, 6, 51, 'full time');
INSERT INTO jobs VALUES (68, 68, NULL, 52, 'full time');
INSERT INTO jobs VALUES (69, 69, 3, 53, 'full time');
INSERT INTO jobs VALUES (70, 70, 4, 54, 'full time');
INSERT INTO jobs VALUES (71, 71, 4, 19, 'full time');
INSERT INTO jobs VALUES (72, 72, 4, 55, 'part time');
INSERT INTO jobs VALUES (73, 73, 6, 56, 'full time');
INSERT INTO jobs VALUES (74, 74, 6, 57, 'full time');
INSERT INTO jobs VALUES (75, 75, 7, 40, 'full time');
INSERT INTO jobs VALUES (76, 76, 1, 58, 'full time');
INSERT INTO jobs VALUES (77, 77, NULL, 50, 'full time');
INSERT INTO jobs VALUES (78, 78, NULL, 59, 'full time');
INSERT INTO jobs VALUES (79, 79, 4, 34, 'full time');
INSERT INTO jobs VALUES (80, 80, NULL, 60, 'full time');
INSERT INTO jobs VALUES (81, 81, 2, 17, 'full time');
INSERT INTO jobs VALUES (82, 82, 3, 61, 'full time');
INSERT INTO jobs VALUES (83, 83, NULL, 19, 'full time');
INSERT INTO jobs VALUES (84, 84, 8, 7, 'full time');
INSERT INTO jobs VALUES (85, 85, NULL, 23, 'full time');
INSERT INTO jobs VALUES (86, 86, 4, 62, 'full time');
INSERT INTO jobs VALUES (87, 87, NULL, 63, 'full time');
INSERT INTO jobs VALUES (88, 88, 4, 50, 'full time');
INSERT INTO jobs VALUES (89, 89, NULL, 34, 'full time');
INSERT INTO jobs VALUES (90, 90, 7, 39, 'full time');
INSERT INTO jobs VALUES (91, 91, NULL, 64, 'full time');
INSERT INTO jobs VALUES (92, 92, NULL, 2, 'full time');
INSERT INTO jobs VALUES (93, 93, NULL, 51, 'full time');
INSERT INTO jobs VALUES (94, 94, 7, 1, 'full time');
INSERT INTO jobs VALUES (95, 95, 7, 39, 'full time');
INSERT INTO jobs VALUES (96, 96, NULL, 65, 'full time');
INSERT INTO jobs VALUES (97, 97, 7, 39, 'full time');
INSERT INTO jobs VALUES (98, 98, NULL, 20, 'full time');
INSERT INTO jobs VALUES (99, 99, NULL, 12, 'full time');
INSERT INTO jobs VALUES (100, 100, 4, 66, 'full time');
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

------------AZ---------------------------------------------------------------------

DROP TABLE PURCHASE;
DROP TABLE SALES;
DROP TABLE SUPPLIER;
DROP TABLE CUSTOMER;
DROP TABLE EMPLOYEE;
DROP TABLE INVENTORY;
DROP TABLE STORE;
DROP TABLE SKILL_REQUIRED;
DROP TABLE POSITIONX;
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

CREATE TABLE POSITIONX(
    P_PositionID int,
    P_Title varchar(20),
    P_Description varchar(100),
    P_PayRangeLow int,
    P_PayRangeHigh int,
    
    PRIMARY KEY(P_PositionID)
);

INSERT INTO POSITIONX VALUES(1, 'Software Engineer', 'Pellentesque habitant morbi tristique.', 70000, 120000);
INSERT INTO POSITIONX VALUES(2, 'Software Developer', 'Pellentesque habitant morbi tristique.', 60000, 110000);
INSERT INTO POSITIONX VALUES(3, 'Data Scientist', 'Pellentesque habitant morbi tristique.', 90000, 140000);
INSERT INTO POSITIONX VALUES(4, 'UX Designer', 'Pellentesque habitant morbi tristique.', 50000, 90000);

CREATE TABLE SKILL_REQUIRED(
    SR_PositionID int,
    SR_SkillCode int,
    
    FOREIGN KEY (SR_PositionID) REFERENCES POSITIONX(P_PositionID),
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
    FOREIGN KEY(E_PositionID) REFERENCES POSITIONX(P_PositionID)
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

------------GV---------------------------------------------------------------------

DROP TABLE FACTORY;
DROP TABLE CONTRACT;
DROP TABLE PURCHASEX;
DROP TABLE SUPPLIERX;
DROP TABLE PRODUCT;
DROP TABLE MATERIAL;   
DROP TABLE CUSTOMERX;

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

CREATE TABLE SUPPLIERX(
    CompanyID_S varchar(20),
    Website varchar(50),
    ContactEmail_S varchar(20),
    
    PRIMARY KEY(CompanyID_S)
);

CREATE TABLE CUSTOMERX(
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
    FOREIGN KEY(CustomerID) REFERENCES CUSTOMERX(CompanyID_C),
    FOREIGN KEY(ProductCode_C) REFERENCES PRODUCT(ProductCode_P)
);


CREATE TABLE PURCHASEX(
    PurchaseNum int,
    SupplierID varchar(20),
    SupplierOrderNum int,
    BookDate varchar(14),
    PayDate varchar(14),
    Note varchar(300),
    MaterialCode_Pur varchar(5),
    Quantity_Pur int,
    
    PRIMARY KEY(PurchaseNum),
    FOREIGN KEY(SupplierID) REFERENCES SUPPLIERX(CompanyID_S),
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

INSERT INTO SUPPLIERX VALUES('SS00001', 'www.swordmats.com', 'swordmats@gmail.com');
INSERT INTO SUPPLIERX VALUES('SS00002', 'www.shieldmats.com', 'shieldmats@gmail.com'); 
INSERT INTO SUPPLIERX VALUES('SS00003', 'www.helmetmats.com', 'helmetmats@gmail.com'); 

INSERT INTO CUSTOMERX VALUES('0000X', 'Moe Hickory', 'hickory@gmail.com');
INSERT INTO CUSTOMERX VALUES('0000Y', 'Larry Dickory', 'dickory@gmail.com'); 
INSERT INTO CUSTOMERX VALUES('0000Z', 'Curley Dock', 'dock@gmail.com'); 

INSERT INTO CONTRACT VALUES('00001', '0000X', '11/2021', 10250, 'Weekly', '00004', 50);
INSERT INTO CONTRACT VALUES('00002', '0000Y', '12/2018', 12500, 'Weekly', '00005', 30); 
INSERT INTO CONTRACT VALUES('00003', '0000Z', '11/2018', 8525, 'Weekly', '00006', 44); 
INSERT INTO CONTRACT VALUES('00004', '0000Z', '10/2018', 25525, 'Weekly', '00003', 15); 

INSERT INTO PURCHASEX VALUES(10000, 'SS00001', 1, '11/2021', '11/2021', 'They give us sword mats', '0000A', 500);
INSERT INTO PURCHASEX VALUES(20000, 'SS00002', 2, '12/2018', '05/2018', 'They give us shield mats', '0000B', 300); 
INSERT INTO PURCHASEX VALUES(30000, 'SS00003', 3, '11/2018', '11/2018', 'They give us helmet mats', '0000C', 250); 
 

