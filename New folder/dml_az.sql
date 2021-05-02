--1. List the names for all workers in alphabetical order by last name.
SELECT E_FNAME, E_LName
FROM EMPLOYEE
ORDER BY E_LName ASC;

--2. List the staff (salary workers) by salary in descending order.
SELECT E_Salary
FROM EMPLOYEE
ORDER BY E_Salary DESC;

--3. List the average annual pay (the salary or wage rates multiplied by 1920 hours) of each
--store/factory in descending order.
SELECT ST_StoreID, ROUND(AVG(E_SALARY), 2)
FROM EMPLOYEE, STORE
WHERE E_StoreID = ST_StoreID
GROUP BY ST_StoreID
ORDER BY AVG(E_SALARY) DESC;

--4. List the required skills of a given PositionCode in a readable format.
SELECT SK_SkillCode, SK_Title
FROM POSITION, SKILL, SKILL_REQUIRED
WHERE P_PositionID = 1 AND P_PositionID = SR_PositionID AND SK_SkillCode = SR_SkillCode;

--5. Given a person’s identifier, list this person’s skills in a readable format.
SELECT SK_SkillCode, SK_Title
FROM EMPLOYEE, POSITION, SKILL_REQUIRED, SKILL
WHERE E_EmployeeID = 1 AND E_PositionID = P_PositionID AND P_PositionID = SR_PositionID AND SR_SkillCode = SK_SkillCode;

--6. Given a person’s identifier, list a person’s missing skills for a specific PositionCode in a
--readable format.
SELECT SK_SkillCode, SK_Title
FROM POSITION, SKILL_REQUIRED, SKILL
WHERE P_PositionID = 4 AND P_PositionID = SR_PositionID AND SR_SkillCode = SK_SkillCode
AND SR_SkillCode NOT IN (
SELECT SK_SkillCode
FROM EMPLOYEE, POSITION, SKILL_REQUIRED, SKILL
WHERE E_EmployeeID = 1 AND E_PositionID = P_PositionID AND P_PositionID = SR_PositionID AND SR_SkillCode = SK_SkillCode);

--7. List the total number and the total sales ($) of every item in a given period of time (start
--date, end date) in AZ in the descending order of sales.
SELECT I_ItemNum, I_Title, COUNT(*), ROUND(SUM(SA_Price),2)
FROM INVENTORY, SALES
WHERE I_ItemNum = SA_ItemNum AND SA_Date BETWEEN TO_DATE('03/18/2019') AND TO_DATE('03/05/2020')
GROUP BY I_ItemNum, I_Title
ORDER BY ROUND(SUM(SA_Price),2) DESC;

--8. List the ItemNbr, its title, and the total profit that made the biggest profit for AZ in 2018.
SELECT I_ItemNum, I_ItemTitle, ROUND(SUM(SA_Price),2) as TOTAL_PROFIT_IN_2018
FROM ITEM, SALES
WHERE I_ItemNum = SA_ItemNum AND SA_Date BETWEEN TO_DATE('01/01/2018') AND TO_DATE('12/31/2018')
GROUP BY I_ItemNum, I_ItemTitle
HAVING  ROUND(SUM(SA_Price),2) = (
    SELECT MAX(ROUND(SUM(SA_Price),2))
    FROM SALES
    WHERE SA_Date BETWEEN TO_DATE('01/01/2018') AND TO_DATE('12/31/2018')
    GROUP BY SA_ItemNum
);

--9. Show the items for which the inventory is below the minimum level in AZ system.
SELECT I_ItemNum, I_Title
FROM INVENTORY
WHERE I_ItemQuantity < I_MinLevel;

--18. Find out the job distribution among industries by showing the number of employees in each
--industry.
SELECT DISTINCT COMPANY.gid, COUNT(DISTINCT PERSON.Personid)
FROM PERSON, WORKS, POSITION, JOBS, COMPANY
WHERE 
    PERSON.Personid = WORKS.perid AND 
    WORKS.werkid = POSITION.pid AND 
    POSITION.pid = JOBS.posid AND
    JOBS.companyid = COMPANY.cid 
GROUP BY COMPANY.gid
ORDER BY COMPANY.gid ASC;





