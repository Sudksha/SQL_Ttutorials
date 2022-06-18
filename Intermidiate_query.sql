--Insert into Tutorials..EmployeeDemoographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly','Flax', NULL, 'Male'),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Insert into Tutorials..Employeesalary VALUES
--(1010, NULL, 47000),
--(NULL, 'Salesman', 43000)


--Create Table Tutorials..WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50)
--)

--Insert into Tutorials..WareHouseEmployeeDemographics  VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

----Inner Joines, Full/left/right/ outer joins
Select * 
from Tutorials..EmployeeDemoographics

Select * 
from Tutorials..Employeesalary


--joines are used to combine different tables to give single output
Select * from Tutorials..EmployeeDemoographics ED
INNER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

Select *
from Tutorials..EmployeeDemoographics ED
FULL OUTER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

Select *
from Tutorials..EmployeeDemoographics ED
LEFT OUTER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

Select *
from Tutorials..EmployeeDemoographics ED
Left OUTER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

Select *
from Tutorials..EmployeeDemoographics ED
Right OUTER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

Select ES.EmployeeID, Firstname, LastName, JobTitle, salary
from Tutorials..EmployeeDemoographics ED
Left OUTER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID


Select *
from Tutorials..EmployeeDemoographics ED
FULL OUTER JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

---Let's check who is heighest paid employee
Select ED.EmployeeID, Firstname, LastName, salary
from Tutorials..EmployeeDemoographics ED
Inner JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID
WHERE Firstname<>'Michael'
ORDER BY Salary DESC

--Avg salary for salesman
Select Jobtitle,AVG(Salary) AS avg_salary_salesman
from Tutorials..EmployeeDemoographics ED
Inner JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID
WHERE Jobtitle='salesman'
Group by JobTitle

--Total amount spent on Accountant
Select Jobtitle, SUM(Salary)
from Tutorials..EmployeeDemoographics ED
Inner JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID
WHERE Jobtitle='accountant'
Group by JobTitle

---Unions , Unions all

---Joins and Unions are almost same. The difference here is in joines 2 tables are joined
--based on one common column and need to mention the table name while getting the columns
--- Where Unioins  combines data into new rows Let's check below

Select *
from  Tutorials..EmployeeDemoographics ED 
FULL OUTER JOIN  Tutorials..WareHouseEmployeeDemographics WHD 
on ED.EmployeeID=WHD.EmployeeID

---Seeing at below if we want combine last 4 rows from right table and display it in 
---under first table it is possible in joins that is where unioins come into picture.
SELECT * FROM Tutorials..EmployeeDemoographics
UNION
SELECT * FROM Tutorials..WareHouseEmployeeDemographics
ORDER BY EmployeeID

--Just using Union we can combine tables but it will eliminate the duplicates
--If we want to combine everything irrespective of duplicates then we need to use Union ALL

SELECT * FROM Tutorials..EmployeeDemoographics
UNION all
SELECT * FROM Tutorials..WareHouseEmployeeDemographics
ORDER BY EmployeeID

--Let's look at it with other table

SELECT EmployeeID,Firstname,Age
FROM Tutorials..EmployeeDemoographics
Union
SELECT EmployeeID,Jobtitle,salary
FROM Tutorials..Employeesalary
ORDER BY EmployeeID

---This is working because both columns data types are same

---Case Statements: These will allows you to add a condition and also what you
--want to return when the condition is met

SELECT Firstname,Lastname,Age
FROM Tutorials..EmployeeDemoographics
WHERE AGE IS NOT NULL
ORDER BY AGE

SELECT Firstname,Lastname,Age,
CASE 
	WHEN AGE>30 THEN 'OLD'
	WHEN AGE BETWEEN 27 AND 30 THEN 'YOUNG'
	ELSE 'Baby'
END
FROM Tutorials..EmployeeDemoographics
WHERE AGE IS NOT NULL
ORDER BY AGE

---if there are multiple condition such that second condition 
---is such that it can be already met in first condition the it will return first condition result
--let's see example below

SELECT Firstname,Lastname,Age,
CASE 
	WHEN AGE>30 THEN 'OLD'
	WHEN AGE =38 Then 'Stanley'
	ELSE 'Baby'
END
FROM Tutorials..EmployeeDemoographics
WHERE AGE IS NOT NULL
ORDER BY AGE

---For above query if age is 38 it should return stanley but it will return old
--as it already satisfies the first condition



SELECT Firstname,Lastname,Age,
CASE 
	
	WHEN AGE =38 Then 'Stanley'
	WHEN AGE>30 THEN 'OLD'
	ELSE 'Baby'
END
FROM Tutorials..EmployeeDemoographics
WHERE AGE IS NOT NULL
ORDER BY AGE

Select Firstname, lastname,jobtitle,salary
from Tutorials..EmployeeDemoographics ED
JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID

--Let's give rise to those who have done good work
Select Firstname, lastname,jobtitle,salary,
CASE
	WHEN JOBTITLE='Salesman' then salary+(salary*0.10)
	when jobtitle='Accountant' then salary+(salary*0.05)
	WHEN JOBTITLE='HR' THEN SALARY+(SALARY*0.00001)
	ELSE SALARY+(SALARY*0.03)
END AS SALARYAFTERRAISE
from Tutorials..EmployeeDemoographics ED
JOIN  Tutorials..Employeesalary ES on ED.EmployeeID=ES.EmployeeID


--Let's look at temp tables
---these temp tables can be used multiple times

--The difference between temp table and normal table is only the symbol "#"

CREATE TABLE #temp_employee(
Employee_id INT,
JOBTITLE VARCHAR(100),
SALARY INT)


Insert into #temp_employee VALUES(
'1001','HR','45000')

Insert into #temp_employee
SELECT *
FROM Tutorials..Employeesalary

SELECT * FROM #temp_employee

---Let's create another temp table
Drop table if exists #Temp_table2
CREATE TABLE #Temp_table2(
Jobtitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

Insert into #Temp_table2
SELECT Jobtitle,count(jobtitle), avg(age),avg(salary) 
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID
Group by jobtitle

Select * from  #Temp_table2 

--Creating temp table will  reduce the processing time

---Let's discuss on Having Clause
SELECT Jobtitle,count(jobtitle)
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID
where count(jobtitle)>2
Group by jobtitle

--Above query will give us error saying the condition should be given in having clasue
SELECT Jobtitle,count(jobtitle)
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID
Group by jobtitle
having count(jobtitle)>1

SELECT Jobtitle,AVG(Salary)
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID
Group by jobtitle
having avg(Salary)>45000
order by avg(Salary)


------Updating and deleting table data
---Inserting will create new row in table where updating will alter the existing row in table

SELECT * FROM Tutorials..EmployeeDemoographics ED

UPDATE Tutorials..EmployeeDemoographics 
SET EmployeeID=1012
WHERE FIRSTNAME='Holly' and lastname='Flax'

UPDATE Tutorials..EmployeeDemoographics 
SET AGE=31 , GENDER='Female'
WHERE FIRSTNAME='Holly' and lastname='Flax'

DELETE FROM Tutorials..EmployeeDemoographics 
WHERE EMPLOYEEID=1001


---Let's look at Partition by clause
Select * from Tutorials..EmployeeDemoographics 
SELECT * FROM Tutorials..Employeesalary

---if we are using group by then we cannot mentain all the remoaining columns
---let's look at it by below example

SELECT Firstname,lastname,jobtitle,gender,count(gender) OVER (Partition by Gender) as total_gender
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID

---So if we use group by we can only get gender and total_gender column 
--we cannot keep remaining 3 columns

SELECT gender,count(gender) as total_gender
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES on ES.EmployeeID=ED.EmployeeID
group by gender

--Let's try another example
SELECT Firstname,lastname,jobtitle,gender,salary,
count(gender) OVER (Partition by Gender) as total_gender,
AVG(SALARY) over (partition by gender) as avgsalary
FROM Tutorials..EmployeeDemoographics ED
JOIN Tutorials..EmployeeSalary ES 
	on ES.EmployeeID=ED.EmployeeID
where salary>'45000'













