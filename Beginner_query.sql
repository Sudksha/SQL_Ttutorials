----CREATE Table EmployeeDemoographics
----(EmployeeID Int,
----FirstName varchar(50),
----LastName varchar(50),
----Age int,
----Gender varchar(50)
----)
--CREATE TABLE Employeesalary
--(EmployeeID INT,
--JobTitle varchar(50),
--Salary int
--)

--INSERT INTO EmployeeDemoographics VALUES
--(1001, 'Jim','Halpert',30,'Male'),
-- (1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

----Table 2 Insert:
--Insert Into EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--Basic queries

--Print top 5 rows from table
SELECT TOP 5 * FROM Tutorials..EmployeeDemoographics

-- Select distinct values
SELECT DISTINCT(EmployeeID)
from Tutorials..EmployeeDemoographics

--DISTINCT GENDER
SELECT DISTINCT(Gender)
from Tutorials..EmployeeDemoographics

--Count of last names
SELECT COUNT(LastName) as LastNamecount
from Tutorials..EmployeeDemoographics

--Salary table
SELECT * FROM Tutorials..Employeesalary

---Maximum salary
SELECT max(Salary)  as max_salary from  Tutorials..Employeesalary

--min salary

SELECT max(Salary) as min_salary from  Tutorials..Employeesalary

--Average Salary
SELECT AVG(Salary) as avg_salary from  Tutorials..Employeesalary


---WHERE Statement
---Covers =,<>,AND,OR,LIKE,NULL,NOT NULL,IN
SELECT *
from Tutorials..EmployeeDemoographics
WHERE FirstName!='Jim'

--People who are more than age 30 years
SELECT *
from Tutorials..EmployeeDemoographics
WHERE AGE>30

SELECT *
from Tutorials..EmployeeDemoographics
WHERE AGE>=30 AND Gender='Male'

SELECT *
from Tutorials..EmployeeDemoographics
WHERE AGE>=30 OR Gender='Male'

---Get those data whose name last name starts with S
SELECT *
from Tutorials..EmployeeDemoographics
where LastName like 'S%'

------Get those data whose name last name containes  S anywhere in their last name
SELECT *
from Tutorials..EmployeeDemoographics
where LastName like '%S%'

-----Get those data whose name last name ends with E
SELECT *
from Tutorials..EmployeeDemoographics
where LastName like '%e'

-----Get those data whose name last name starts with' S' and has 'o' anywhere in their last name
SELECT *
from Tutorials..EmployeeDemoographics
where LastName like 'S%o%'

SELECT *
from Tutorials..EmployeeDemoographics
where LastName is NULL

SELECT *
from Tutorials..EmployeeDemoographics
where LastName is NOT NULL

--'In' is kind of condence way to say equal for multiple things
SELECT *
from Tutorials..EmployeeDemoographics
where LastName IN ('Beasley','Martin','scott')

---Group BY and Order By

---Group by and Distinct are kind of same but difference here is distinct will return
--unique value where group by will return the all the records of unique data

Select Distinct(Gender)
from Tutorials..EmployeeDemoographics

Select Gender, count(Gender)
from Tutorials..EmployeeDemoographics
group by Gender

Select Gender,Age,count(Gender)
from Tutorials..EmployeeDemoographics
group by Gender,Age

----Whatever columns we mention in group by should be the actual columns in table.
--In above example count(gender) can not be added in group by clasue as it is deriverd from gender column

Select Gender,count(Gender)
from Tutorials..EmployeeDemoographics

group by Gender,age

Select Gender,count(Gender)
from Tutorials..EmployeeDemoographics
where age>30
group by Gender
Order by count(Gender)

Select *
from Tutorials..EmployeeDemoographics
order by Age, Gender 

Select *
from Tutorials..EmployeeDemoographics
order by 4, 5 

Select *
from Tutorials..EmployeeDemoographics
Order by FirstName, LastName

