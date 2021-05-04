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