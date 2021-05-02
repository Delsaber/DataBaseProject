SELECT E_FNAME, E_LName FROM EMPLOYEE ORDER BY E_LName ASC;

SELECT E_Salary FROM EMPLOYEE ORDER BY E_Salary DESC;

SELECT ST_StoreID, ROUND(AVG(E_SALARY), 2)
FROM EMPLOYEE, STORE
WHERE E_StoreID = ST_StoreID
GROUP BY ST_StoreID
ORDER BY AVG(E_SALARY) DESC;


SELECT SK_SkillCode, SK_Title
FROM POSITIONX, SKILL, SKILL_REQUIRED
WHERE P_PositionID = 1 AND P_PositionID = SR_PositionID AND SK_SkillCode = SR_SkillCode;


SELECT SK_SkillCode, SK_Title
FROM EMPLOYEE, POSITIONX, SKILL_REQUIRED, SKILL
WHERE E_EmployeeID = 1 AND E_PositionID = P_PositionID AND P_PositionID = SR_PositionID AND SR_SkillCode = SK_SkillCode;


SELECT SK_SkillCode, SK_Title
FROM POSITIONX, SKILL_REQUIRED, SKILL
WHERE P_PositionID = 4 AND P_PositionID = SR_PositionID AND SR_SkillCode = SK_SkillCode
AND SR_SkillCode NOT IN (
SELECT SK_SkillCode
FROM EMPLOYEE, POSITIONX, SKILL_REQUIRED, SKILL
WHERE E_EmployeeID = 1 AND E_PositionID = P_PositionID AND P_PositionID = SR_PositionID AND SR_SkillCode = SK_SkillCode);


SELECT I_ItemNum, I_Title, COUNT(*), ROUND(SUM(SA_Price),2)
FROM INVENTORY, SALES
WHERE I_ItemNum = SA_ItemNum AND SA_Date BETWEEN TO_DATE('03/18/2019') AND TO_DATE('03/05/2020')
GROUP BY I_ItemNum, I_Title
ORDER BY ROUND(SUM(SA_Price),2) DESC;


SELECT I_ItemNum, I_Title, ROUND(SUM(SA_Price),2) as TOTAL_PROFIT_IN_2018
FROM INVENTORY, SALES
WHERE I_ItemNum = SA_ItemNum AND SA_Date BETWEEN TO_DATE('01/01/2018') AND TO_DATE('12/31/2018')
GROUP BY I_ItemNum, I_Title
HAVING  ROUND(SUM(SA_Price),2) = (
    SELECT MAX(ROUND(SUM(SA_Price),2))
    FROM SALES
    WHERE SA_Date BETWEEN TO_DATE('01/01/2018') AND TO_DATE('12/31/2018')
    GROUP BY SA_ItemNum
);


SELECT I_ItemNum, I_Title
FROM INVENTORY
WHERE I_ItemQuantity < I_MinLevel;


SELECT ContactPerson, SUM(SaleAmount)
FROM CONTRACT, CUSTOMERX
WHERE (CAST(SUBSTR(Date_C, -4) AS INT) = 2018 AND CompanyID_C = CustomerID)                                                      
GROUP BY ContactPerson
ORDER BY SUM(SaleAmount) DESC
;



SELECT MaterialCode_M, MaterialName
FROM MATERIAL
WHERE MaterialCode_M = (SELECT MaterialCode_Pur
                        FROM PURCHASEX
                        WHERE Quantity_Pur = (SELECT MAX(Quantity_Pur)
                                                FROM PURCHASEX
                                                WHERE (CAST(SUBSTR(PayDate, -4) AS INT) = 2018) AND 
                                                        (CAST(SUBSTR(PayDate, 1, 2) AS INT) >= 9)))        
;


SELECT FactoryName
FROM FACTORY
WHERE ProductCode_F = (SELECT ProductCode_C
                        FROM CONTRACT
                        WHERE Quantity_C = (SELECT MAX(Quantity_C)
                                            FROM CONTRACT
                                            WHERE (CAST(SUBSTR(Date_C, -4) AS INT) = 2018)));



select personid, name, pname from (position inner join works on pid = werkid)inner join person on perid = personid
where personid = 23;



select person.personid, name, pname, sdates, edates from (works inner join person on person.personid = works.perid)inner join position on works.werkid = position.pid
where edates is not NULL
order by personid;


select DISTINCT personid, name from person join works on personid = perid
    where personid in (select personid from person inner join works on personid = perid
where works.werkid is null) and works.werkid is not NULL ;


select gid, round(avg(paylow+payhigh/2),2) 
from (jobs inner join company on cid 
= jobs.companyid) 
inner join position on pid = posid
where jobs.employeetype = 'full time'
group by gid
order by gid;


select cname from company 
where cid in
(select companyid from((works join person on personid = perid)join jobs on jid = werkid) inner join position on pid = jobs.posid
group by companyid
having count(posid) = 
((select max(jerbs) 
from(select companyid, count(posid) as jerbs from (select * from works inner join jobs on werkid = jobs.jid 
where werkid is not null)
GROUP by companyid
))));


select gname from gics
where gicsid =
(select gid from company 
where cid in
(select companyid from((works join person on personid = perid)join jobs on jid = werkid) inner join position on pid = jobs.posid
group by companyid
having count(posid) = 
((select max(jerbs) 
from(select companyid, count(posid) as jerbs from (select * from works inner join jobs on werkid = jobs.jid 
where werkid is not null)
GROUP by companyid
)))));

select gname from gics
where gicsid =
(select igid from company 
where cid in
(select companyid from((works join person on personid = perid)join jobs on jid = werkid) inner join position on pid = jobs.posid
group by companyid
having count(posid) = 
((select max(jerbs) 
from(select companyid, count(posid) as jerbs from (select * from works inner join jobs on werkid = jobs.jid 
where werkid is not null)
GROUP by companyid
)))));


SELECT DISTINCT COMPANY.gid, COUNT(DISTINCT PERSON.Personid)
FROM PERSON, WORKS, POSITION, JOBS, COMPANY
WHERE 
    PERSON.Personid = WORKS.perid AND 
    WORKS.werkid = POSITION.pid AND 
    POSITION.pid = JOBS.posid AND
    JOBS.companyid = COMPANY.cid 
GROUP BY COMPANY.gid
ORDER BY COMPANY.gid ASC;

SELECT coursenumber, coursename
FROM course, teaches
WHERE coursenumb = coursenumber AND (skillzid IN (SELECT skillcode
                                                FROM skills, requires, position
                                                WHERE rsid = 3 AND rsid = pid AND skillcode = sid
                                                GROUP BY pname, skillcode, sname
                                                HAVING skillcode NOT IN (SELECT skills.sid
                                                                        FROM person, skills, hasskill
                                                                        WHERE personid = 3 AND personid = persid AND hasskill.sid = skills.sid)))
GROUP BY coursenumber, coursename
HAVING COUNT(DISTINCT(skillzid)) = (SELECT MAX(COUNT(DISTINCT((skillzid))))
                                    FROM course, teaches
                                    WHERE coursenumb = coursenumber AND (skillzid IN (SELECT skillcode
                                                                                    FROM skills, requires, position
                                                                                    WHERE rsid = 3 AND rsid = pid AND skillcode = sid
                                                                                    GROUP BY pname, skillcode, sname
                                                                                    HAVING skillcode NOT IN (SELECT skills.sid
                                                                                                            FROM person, skills, hasskill
                                                                                                            WHERE personid = 3 AND personid = persid AND hasskill.sid = skills.sid)))
                                    GROUP BY coursenumb)
;


select pname from position 
where payhigh in (select max(payhigh) from 
    (hasskill inner join jobs on hasskill.sid = jobs.skillid) 
        join position on jobs.posid = position.pid
            where position.pid = posid and persid = 4);


select name, person.email from ((hasskill inner join jobs on hasskill.sid = jobs.skillid) 
join position on jobs.posid = position.pid)inner join person on hasskill.persid = person.personid
where position.pid = 3;



drop table k_table;
create table k_table(
    Persoid number(10),
    posid number(3)
);
insert into k_table
select personid,pid from(select personid,pid,abs(count(sid)-2)as skillz from (person join hasskill on hasskill.persid = person.personid)join
(select pid,skillcode from requires join position on requires.rsid = position.pid)on sid = skillcode
group by personid,pid
order by personid)
where skillz !=0 and pid = 4
;

select * from k_table
order by persoid
;


SELECT DISTINCT personid, Name, COUNT(DISTINCT(sid)) AS LEAST_NUMBER_OF_SKILLS_MISSING
FROM PERSON, HASSKILL
WHERE persid = personid AND sid IN (SELECT skillcode
                                        FROM REQUIRES
                                        WHERE rsid = 3)
GROUP BY personid, name
HAVING COUNT(DISTINCT(sid)) = (SELECT MIN(COUNT(DISTINCT(sid))) AS LEAST_NUMBER_OF_SKILLS_MISSING
                                FROM PERSON, HASSKILL
                                WHERE persid = personid AND sid IN (SELECT skillcode
                                                                    FROM REQUIRES
                                                                    WHERE rsid = 3)
                                GROUP BY sid)
ORDER BY personid asc
;


SELECT hasskill.sid AS MISSING_SKILL_NUM, Sname as Skill_Name, COUNT(hasskill.sid) AS Num_People_Missing_Skill
FROM PERSON, HASSKILL, K_TABLE, SKILLS
WHERE persid = personid AND hasskill.sid IN (SELECT skillcode
                                    FROM REQUIRES
                                    WHERE rsid = 4)
AND personid = persoid AND hasskill.sid = SKILLS.sid
GROUP BY hasskill.sid, Sname
;


DROP TABLE SALARY_DELTA;
CREATE TABLE SALARY_DELTA(
    New_personal_num number(10),
    Salary_Name varchar(30),
    New_Salary int,
    Old_Salary int
);

DROP TABLE Old_Salary;
CREATE TABLE Old_Salary(
    Old_personal_num number(10),
    Old_old_Salary int
);

   

Insert into Old_Salary SELECT personid, payhigh
FROM position, works, person
WHERE perid = personid
AND pid = werkid
AND (personid, edates) IN (SELECT personid, MAX(edates)
                            FROM position, works, person
                            WHERE perid = personid
                            AND perid IN (SELECT personid
                                            FROM company, jobs, position, PERSON, works
                                            WHERE igid = 1 AND cid = companyid AND pid = jid AND jid = werkid AND personid = perid
                                            ) 
                            AND pid = werkid
                            AND edates IS NOT NULL
                            GROUP BY personid, Name)
AND (personid, name) IN (
                        SELECT personid, Name
                        FROM position, works, person
                        WHERE perid = personid
                        AND perid IN (SELECT personid
                                        FROM company, jobs, position, PERSON, works
                                        WHERE igid = 1 AND cid = companyid AND pid = jid AND jid = werkid AND personid = perid
                                    ) 
                        AND pid = werkid
                        AND edates IS NULL
                        AND personid IN (
                                        SELECT personid
                                        FROM position, works, person
                                        WHERE perid = personid
                                        AND pid = werkid
                                        AND (personid, edates) IN (SELECT personid, MAX(edates)
                                                                     FROM position, works, person
                                                                     WHERE perid = personid
                                                                     AND perid IN (SELECT personid
                                                                                     FROM company, jobs, position, PERSON, works
                                                                                     WHERE igid = 1 AND cid = companyid AND pid = jid AND jid = werkid AND personid = perid
                                                                                     ) 
                                                                     AND pid = werkid
                                                                     AND edates IS NOT NULL
                                                                     GROUP BY personid
                                                                     )
                                     )
                    GROUP BY personid, Name 
                    )                            
ORDER BY PERSONID ASC;   

Insert into Salary_Delta SELECT personid, Name, SUM(payhigh), Old_old_salary
FROM position, works, person, Old_Salary
WHERE perid = personid
AND personid = Old_personal_num
AND perid IN (SELECT personid
                FROM company, jobs, position, PERSON, works
                WHERE igid = 1 AND cid = companyid AND pid = jid AND jid = werkid AND personid = perid
                ) 
AND pid = werkid
AND edates IS NULL
AND personid IN (
                    SELECT personid
                    FROM position, works, person
                    WHERE perid = personid
                    AND pid = werkid
                    AND (personid, edates) IN (SELECT personid, MAX(edates)
                                                FROM position, works, person
                                                WHERE perid = personid
                                                AND perid IN (SELECT personid
                                                                FROM company, jobs, position, PERSON, works
                                                                WHERE igid = 1 AND cid = companyid AND pid = jid AND jid = werkid AND personid = perid
                                                                ) 
                                                AND pid = werkid
                                                AND edates IS NOT NULL
                                                GROUP BY personid
                                                )
                )
GROUP BY personid, Name, Old_old_salary
ORDER BY PERSONID ASC;

Select New_personal_num as PersonID, Salary_Name as Name, New_Salary, Old_Salary, New_Salary - Old_Salary AS SalaryDelta
From Salary_Delta
WHERE New_Salary > Old_Salary;