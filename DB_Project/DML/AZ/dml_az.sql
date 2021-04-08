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
SELECT ST_StoreID, SUM(E_SALARY)
FROM EMPLOYEE, STORE
WHERE E_StoreID = ST_StoreID
GROUP BY ST_StoreID
ORDER BY SUM(E_SALARY) DESC;

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

--7. List the total number and the total sales ($) of every item in a given period of time (start
--date, end date) in AZ in the descending order of sales.

--8. List the ItemNbr, its title, and the total profit that made the biggest profit for AZ in 2018.

--9. Show the items for which the inventory is below the minimum level in AZ system.





