------------------QUERY 18---------------------------------

--18. Find out the job distribution among industries by showing the number of employees in each
--industry.
DELETE FROM HASSKILL WHERE persid < 25;
DELETE FROM WORKS WHERE perid < 25;
DELETE FROM PERSON WHERE Personid < 25;

SELECT DISTINCT COMPANY.gid, COUNT(DISTINCT PERSON.Personid)
FROM PERSON, WORKS, POSITION, JOBS, COMPANY
WHERE 
    PERSON.Personid = WORKS.perid AND 
    WORKS.werkid    = POSITION.pid AND 
    POSITION.pid    = JOBS.posid AND
    JOBS.companyid  = COMPANY.cid 
GROUP BY COMPANY.gid
ORDER BY COMPANY.gid ASC;

------------------TASK 6---------------------------------
SELECT * FROM EMPLOYEE;
SELECT * FROM CUSTOMER;
SELECT * FROM POSITION;
SELECT * FROM SKILL_REQUIRED WHERE SR_PositionID = 4;


------------------TASK 7d---------------------------------
SELECT * FROM EXECUTIVES;
DELETE FROM EXECUTIVES;

INSERT INTO EXECUTIVES VALUES (1, 'Ricardo Garay', 'CIO');
INSERT INTO EXECUTIVES VALUES (1, 'Luis Cenci', 'CIO');
INSERT INTO EXECUTIVES VALUES (2, 'Tommy Barry', 'CEO');
INSERT INTO EXECUTIVES VALUES (2, 'James Falkon', 'CEO');

