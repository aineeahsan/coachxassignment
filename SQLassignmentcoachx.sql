
create database sqlassignment
use sqlassignment
create table EmployeeDetails(
Empid int,
Fullname nvarchar(100),
Manager_id int,
DateofJoining datetime,
City nvarchar(100))

insert into EmployeeDetails(Empid,Fullname,Manager_id,DateofJoining,City) values(121,'John snow',321,'01/31/2019','Toronto');
insert into EmployeeDetails(Empid,Fullname,Manager_id,DateofJoining,City) values(321,'Walter white',986,'01/30/2020','California');
insert into EmployeeDetails(Empid,Fullname,Manager_id,DateofJoining,City) values(421,'Kuldeep Rana',876,'07/11/2021','Toronto');


create table EmployeeSalary(
Empid int,
Project nvarchar(100),
Salary int,
variable int)

insert into EmployeeSalary(Empid,Project,Salary,variable) values(121,'P1',8000,500)
insert into EmployeeSalary(Empid,Project,Salary,variable) values(321,'P2',10000,1000)
insert into EmployeeSalary(Empid,Project,Salary,variable) values(421,'P1',12000,0)


---------------------------------------------------------------------------------------------------------------------------------------------

--SQL Query to fetch records that are present in one table but not in another table.
select * from EmployeeDetails;
select * from EmployeeSalary;

select * from EmployeeDetails a
where NOT EXISTS(select * from EmployeeSalary s where a.Empid=s.Empid)

select * from EmployeeDetails a
left join EmployeeSalary b
on a.Empid=b.Empid
where b.Empid is null;

--SQL query to fetch all the employees who are not working on any project.
select * from EmployeeDetails a
left join EmployeeSalary b
on a.Empid=b.Empid
where b.Salary is null;
--SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

select * from EmployeeDetails where DateofJoining like '%2020%';

--Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
select * from EmployeeDetails a
inner join EmployeeSalary b
on a.Empid=b.Empid;

--Write an SQL query to fetch a project-wise count of employees.
select project,count(Empid) as employeecount from EmployeeSalary
group by project;

--Fetch employee names and salaries even if the salary value is not present for the employee.
SELECT a.Fullname, ISNULL(b.Salary, 0) as Salary
FROM EmployeeDetails a
LEFT JOIN EmployeeSalary b
ON a.Empid = b.Empid;

--Write an SQL query to fetch all the Employees who are also managers.
SELECT e1.Fullname as EmployeeName, e2.Fullname as ManagerName
FROM EmployeeDetails e1
INNER JOIN EmployeeDetails e2
ON e1.Manager_id = e2.Empid;

--Write an SQL query to fetch duplicate records from EmployeeDetails.
SELECT Empid, Fullname, Manager_id, DateofJoining, City, COUNT(*) as Count
FROM EmployeeDetails
GROUP BY Empid, Fullname, Manager_id, DateofJoining, City
HAVING COUNT(*) > 1;


--Write an SQL query to fetch only odd rows from the table.
SELECT * 
FROM EmployeeDetails
WHERE (Empid % 2) <> 0;

--Write a query to find the 3rd highest salary from a table without top or limit keyword.
SELECT salary
FROM (
  SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) as row_num
  FROM EmployeeSalary
) AS emp
WHERE row_num = 3;






----Assignment 2

--Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
select * from EmployeeDetails;
select * from EmployeeSalary;
select Empid,Fullname from EmployeeDetails where Manager_id =986;
--Write an SQL query to fetch the different projects available from the EmployeeSalary table.
select Project from EmployeeSalary;
--Write an SQL query to fetch the count of employees working in project ‘P1’.
select empid,count(empid) as projectcount from EmployeeSalary
where project ='P1' 
group by empid;
--. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select max(salary) as maximumsalary,min(salary) as minimumsalary,avg(salary)as averagesalary from EmployeeSalary;
--Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000
select empid from EmployeeSalary where Salary between 9000 and 15000;
--Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.

--select * from EmployeeDetails a
--join EmployeeSalary b 
--on a.Empid=b.Empid
--where a.city='Toronto' and a.Manager_id=321
select * from EmployeeDetails 
where city='Toronto' and Manager_id=321
--Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select * from EmployeeDetails 
where city='California' or Manager_id=321
--Write an SQL query to fetch all those employees who work on Projects other than P1
select empid,count(empid) as projectcount from EmployeeSalary
where project ='P2' 
group by empid;
--Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
select * from EmployeeSalary
select empid,(salary + variable)as totalsal from EmployeeSalary
group by empid,(salary+ variable) 

--Write an SQL query to fetch the employees whose name begins with any two characters, 
--followed by a text “hn” and ends with any sequence of characters.
select * from EmployeeDetails
select * from EmployeeDetails where Fullname like '%__hn%'

--Assignment 3

--Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
select a.empid from EmployeeDetails a 
full outer join EmployeeSalary b
on a.Empid=b.Empid;
--Write an SQL query to fetch common records between two tables.
select * from EmployeeDetails a
inner join EmployeeSalary b
on a.Empid=b.Empid
--Write an SQL query to fetch records that are present in one table but not in another table.
select * from EmployeeDetails a
left join EmployeeSalary b
on a.Empid=b.Empid
where a.Empid is null;
--Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
select * from EmployeeDetails a
inner join EmployeeSalary b
on a.Empid=b.Empid
--Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
select a.Empid from EmployeeDetails a
left join EmployeeSalary b
on a.Empid=b.Empid
where b.Empid is null;
--Write an SQL query to fetch the employee’s full names and replace the space
SELECT REPLACE(fullname, ' ', ' ') AS full_name_replaced FROM EmployeeDetails;

--Write an SQL query to fetch the position of a given character(s) in a field.

select * from EmployeeDetails
select City,INSTR('city','o') as position from EmployeeDetails
SELECT COUNT(*) AS position
FROM Employeedetails
WHERE city = 'Toronto'


--. Write an SQL query to display both the EmpId and ManagerId together
select Empid,Manager_id from EmployeeDetails
--Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
SELECT SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) - 1) AS FirstName
FROM EmployeeDetails


--Write an SQL query to uppercase the name of the employee and lowercase the city values.
select upper(Fullname) as fullname, lower(city) as city from EmployeeDetails




--Assignment 4 
--Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
SELECT SUM(LEN(FullName) - LEN(REPLACE(LOWER(FullName), 'n', ''))) AS Total_n_count
FROM EmployeeDetails;
--Write an SQL query to update the employee names by removing leading and trailing spaces.
--Fetch all the employees who are not working on any project.
--Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
select a.fullname from EmployeeDetails a
join EmployeeSalary b
on a.Empid=b.Empid
where b.Salary >= 5000 and b.Salary < 10000;
--Write an SQL query to find the current date-time.
select getdate();
--Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
select * from EmployeeDetails where DateofJoining like '%2020%'
--Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
select * from EmployeeDetails a
inner join EmployeeSalary b
on a.Empid=b.Empid;
--Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
SELECT Project, COUNT(*) AS employee_count
FROM EmployeeSalary
GROUP BY Project
ORDER BY employee_count DESC;

--Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
SELECT a.Fullname, ISNULL(b.Salary, 0) as Salary
FROM EmployeeDetails a
LEFT JOIN EmployeeSalary b
ON a.Empid = b.Empid;
--Write an SQL query to join 3 tables.
select * from EmployeeSalary b 
join EmployeeDetails a
on b.Empid=a.Empid



------------ADVANCE ASSIGNMENT------------------------------------------------------------------------------------------------------------------
create table EmployeeInfo (
Empid int,
EmpFname nvarchar(50),
EmpLname nvarchar(50),
Department nvarchar(100),
Project varchar(10),
Address nvarchar(50),
DOB  datetime,
Gender varchar(10))

insert into EmployeeInfo(Empid,EmpFname,EmpLname,Department,Project,Address,DOB,Gender) values(1,'Sanjay','Mehra','HR','P1','Hyderabad(HYD)','01/12/1976','M');
insert into EmployeeInfo(Empid,EmpFname,EmpLname,Department,Project,Address,DOB,Gender) values(2,'Ananya','Mehra','Admin','P2','Delhi(DEL)','02/05/1968','F');
insert into EmployeeInfo(Empid,EmpFname,EmpLname,Department,Project,Address,DOB,Gender) values(3,'Rohan','Diwan','Accounts','P3','Mumbai(BOM)','01/01/1980','M');
insert into EmployeeInfo(Empid,EmpFname,EmpLname,Department,Project,Address,DOB,Gender) values(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','01/12/1976','M');
insert into EmployeeInfo(Empid,EmpFname,EmpLname,Department,Project,Address,DOB,Gender) values(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','02/05/1992','F');

 UPDATE EmployeeInfo
 set Gender='M'
 where Empid=5
 create table Employeeposition(
 Empid int,
 EmpPosition nvarchar(50),
 DateofJoining date,
 salary int
 )

 insert into Employeeposition(Empid,EmpPosition,DateofJoining,salary)values(1,'Manager','01/05/2022',500000)
  insert into Employeeposition(Empid,EmpPosition,DateofJoining,salary)values(2,'Executive','02/05/2022',75000)
   insert into Employeeposition(Empid,EmpPosition,DateofJoining,salary)values(3,'Manager','01/05/2022',90000)
    insert into Employeeposition(Empid,EmpPosition,DateofJoining,salary)values(4,'Lead','02/05/2022',85000)
	 insert into Employeeposition(Empid,EmpPosition,DateofJoining,salary)values(5,'Executive','01/05/2022',300000)


--Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
select upper(EmpFname)  as EmpName from EmployeeInfo
--Write a query to fetch the number of employees working in the department ‘HR’.
select count(*) as emp_count
from EmployeeInfo
where Department='HR'
--Write a query to get the current date.
select getdate()
--Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT LEFT(EmpLname, 4) AS FirstFour
FROM EmployeeInfo;
--Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT SUBSTRING(Address, 1, CHARINDEX('(', Address) - 1) AS Place
FROM EmployeeInfo;
--Write a query to create a new table that consists of data and structure copied from the other table.
SELECT *
INTO EmpInfo
FROM EmployeeInfo;
--Write a query to find all the employees whose salary is between 50000 to 100000.

select * from Employeeposition where salary between 50000 and 100000;
--Write a query to find the names of employees that begin with ‘S’
select EmpFname from EmployeeInfo where EmpFname like '%S%';
--Write a query to fetch top N records.

--Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
select concat(EmpFname,' ',EmpLname) as Fullname from EmployeeInfo
--Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
SELECT gender, COUNT(*) AS num_employees
FROM EmployeeInfo
WHERE DOB BETWEEN '1970-05-02' AND '1975-12-31'
GROUP BY gender;
--Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
select * from EmployeeInfo
order by EmpLname desc, Department asc;
--Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select * from EmployeeInfo where EmpLname like '____A';
--Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
select * from EmployeeInfo where EmpFname not like '%Sanjay%' and EmpFname not like '%Sonia%';
--Write a query to fetch details of employees with the address as “DELHI(DEL)”.
select * from EmployeeInfo where Address like '%DELHI(DEL)%';
--Write a query to fetch all employees who also hold the managerial position.
select * from Employeeposition a
join EmployeeInfo b 
on a.Empid=b.Empid
where a.EmpPosition='Manager'
--Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
select department,count(*) as count_emp
from EmployeeInfo
group by department
order by count_emp asc
--Write a query to calculate the even and odd records from a table.
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY Empid) AS row_number
  FROM EmployeeInfo
) AS numbered_table
WHERE MOD(row_number, 2) = 0; -- for even records

SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY Empid) AS row_number
  FROM EmployeeInfo
) AS numbered_table
WHERE MOD(row_number, 2) = 1; -- for odd records


--Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
SELECT ei.*
FROM EmployeeInfo ei
JOIN EmployeePosition ep ON ei.Empid = ep.Empid
WHERE ei.DOB IS NOT NULL;
--Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
select min(salary) as minimum_sal,max(salary) as maximum_sal from Employeeposition;
--Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
SELECT MAX(salary) AS Nth_highest_salary
FROM Employeeposition
WHERE salary < (
  SELECT MAX(salary)
  FROM Employeeposition
  WHERE salary < (
    SELECT MAX(salary)
    FROM Employeeposition
  )
);

--Write a query to retrieve duplicate records from a table.
SELECT Empid , COUNT(*) AS count
FROM EmployeeInfo
GROUP BY Empid
HAVING COUNT(*) > 1;
--Write a query to retrieve the list of employees working in the same department.
SELECT e1.Empid, e1.EmpFname, e1.department
FROM EmployeeInfo e1
JOIN EmployeeInfo e2 ON e1.department = e2.department AND e1.Empid <> e2.Empid
ORDER BY e1.department, e1.Empid;
--Write a query to retrieve the last 3 records from the EmployeeInfo table.
SELECT TOP 3 *
FROM EmployeeInfo
ORDER BY Empid DESC
--Write a query to find the third-highest salary from the EmpPosition table.
SELECT salary
FROM Employeeposition
ORDER BY salary DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROW ONLY;
--Write a query to display the first and the last record from the EmployeeInfo table.
(SELECT  TOP 1*
FROM EmployeeInfo
)
UNION ALL
(SELECT  LAST 1 *
FROM EmployeeInfo
ORDER BY Empid DESC);

--Write a query to add email validation to your database
--Write a query to retrieve Departments who have less than 2 employees working in it.
SELECT department, COUNT(*) as num_employees
FROM EmployeeInfo
GROUP BY department
HAVING COUNT(*) < 2;
--Write a query to retrieve EmpPostion along with total salaries paid for each of them
SELECT EmpPosition, SUM(salary) as TotalSalaries
FROM Employeeposition
GROUP BY EmpPosition;
--Write a query to fetch 50% records from the EmployeeInfo table
SELECT TOP 50 PERCENT *
FROM EmployeeInfo;





