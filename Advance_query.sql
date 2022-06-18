---In this let's start with CTE
----COMMON TABLE EXPRESSIONS
---CTE IS ONLY CREATED IN MEMORY RATHER THAN TEMP TABLE AND IT VERY MUCH ACTS LIKE SUBQUERY

WITH CTE_Employee as (
SELECT Firstname,lastname,jobtitle,gender,salary,
count(gender) OVER (Partition by Gender) as total_gender,
AVG(SALARY) over (partition by gender) as avgsalary
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES 
	on ES.EmployeeID=ED.EmployeeID
where salary>'45000'
)

SELECT * FROM CTE_Employee



----SO this CTE will not be saved anywhere hence each time we run below select statement we should run along with CTE.

---String functions
---topics are--TRIM,LTRIM,RTRIM,Replace,Substring,Upper,Lower

--Create table Tutorials..EmployeeErrors(
--EmployeeID varchar(50),
--FirstName varchar(50),
--LastName varchar(50)
--)

Insert into Tutorials..EmployeeErrors VALUES
('1001 ','Jimbo','Halbert')
,(' 1002','Panela','Beasely')
,('1005','TOby', 'Flenderson-Fired')

SELECT * FROM Tutorials..EmployeeErrors

---Using LTRIM,RTRIM,TRIM
--Trim removes the spaces either from left side or right side

SELECT EmployeeID,TRIM(EmployeeID) AS IDTRIM
FROM Tutorials..EmployeeErrors

SELECT EmployeeID,RTRIM(EmployeeID) AS IDTRIM
FROM Tutorials..EmployeeErrors

SELECT EmployeeID,LTRIM(EmployeeID) AS IDTRIM
FROM Tutorials..EmployeeErrors

---Using Replace
---for thsi let's check last name4

SELECT LastName,REPLACE(lastName,'-fired','') as LastName
FROM Tutorials..EmployeeErrors

---Using Substring
SELECT SUBSTRING(FirstName,3,3) 
FROM Tutorials..EmployeeErrors

---UPPER AND LOWER
SELECT	FIRSTNAME, LOWER(FIRSTNAME)
FROM Tutorials..EmployeeErrors

SELECT	FIRSTNAME, UPPER(FIRSTNAME)
FROM Tutorials..EmployeeErrors

--STORED PROCEDURE
--It is a group of sql statements created and stored in the database

CREATE PROCEDURE TEST
AS 
SELECT * FROM Tutorials..EmployeeDemoographics

EXEC TEST



CREATE PROCEDURE TEMP_EMPLOYEE2
AS
CREATE TABLE #Temp_table(
Jobtitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

Insert into #Temp_table
SELECT Jobtitle,count(jobtitle), avg(age),avg(salary) 
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID
Group by jobtitle

Select * from  #Temp_table

EXEC TEMP_EMPLOYEE2

--SUBQUERY


SELECT * FROM Tutorials..EmployeeSalary

--Subquery in select
SELECT EMPLOYEEID,Salary,
(SELECT AVG(Salary)  
FROM Tutorials..EmployeeSalary ) as allavgsalary FROM Tutorials..EmployeeSalary 


---how to do with partition by
SELECT EMPLOYEEID,Salary,AVG(Salary) over() as allavgsalary
FROM Tutorials..EmployeeSalary


----why group by will not work
SELECT EMPLOYEEID,Salary,AVG(Salary)  as avg_salary
FROM Tutorials..EmployeeSalary
group by EMPLOYEEID,salary
order by 1,2

--subquery in From
select a.employeeid,allavgsalary
from (SELECT EMPLOYEEID,Salary,AVG(Salary) over() 
as allavgsalary FROM Tutorials..EmployeeSalary) a

--Subquery in WHERE
SELECT EmployeeID,Jobtitle, Salary
from Tutorials..EmployeeSalary
where employeeid in(
		select employeeid
		from Tutorials..EmployeeDemoographics
		)
               
