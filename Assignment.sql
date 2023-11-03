-- *********************Database Name: HR1********************* 
CREATE DATABASE ASSIGNMENT;

USE ASSIGNMENT;

-- 1. Display all information in the tables EMP and DEPT. 

SELECT * FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX ;

-- 2. Display only the hire date and employee name for each employee. 

SELECT EMP_HIREDATE, EMP_FIRSTNAME FROM EMPLOYEE;

/* 3. Display the ename concatenated with the job ID, separated by a 
comma and space and name the column Employee and Title */

SELECT EMP_FIRSTNAME ,EMP_JOB_TITLE, CONCAT_WS(", ",EMP_FIRSTNAME,
EMP_JOB_TITLE) AS EMPLOYEE_Deatail FROM EMPLOYEE; 

-- 4. Display the hire date, name and department number for all clerks.

SELECT EMP_HIREDATE ,EMP_FIRSTNAME, DEPT_NO, EMP_JOB_TITLE 
FROM EMPLOYEE 
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX WHERE  EMP_JOB_TITLE  = "CLERK" ;

/* 5. Create a query to display all the data from the EMP table. Separate 
each column by a comma. Name the column THE OUTPUT */

SELECT *, CONCAT_WS(",",EMP_ID, EMP_FIRSTNAME, EMP_LASTNAME, EMP_EMAIL, 
EMP_CONTACTNUMBER, EMP_BLOODGROUP, EMP_JOB_TITLE, EMP_JOB_ID, DEPARTMENT, 
EMP_AGE, EMP_GENDER, EMP_HIREDATE, EMP_DOJ, EMP_ADDRESS, EMP_CITY, 
EMP_POSTALCODE, EMP_COUNTRY, EMP_YEARSOFEXP, EMP_SALARY, 
EMP_COMMISSION_EARNED) AS THE_OUTPUT FROM EMPLOYEE;

/* 6. Display the names and salaries of all employees with 
a salary greater than 2000. */

SELECT EMP_FIRSTNAME, EMP_SALARY FROM EMPLOYEE WHERE EMP_SALARY > 2000 
ORDER BY EMP_SALARY ASC;

/* 7. Display the names and dates of employees with the column headers 
"Name" and "Start Date" */

SELECT EMP_FIRSTNAME AS F_NAME , EMP_DOJ AS START_DATE FROM EMPLOYEE;

/* 8. Display the names and hire dates of all employees 
in the order they were hired. */

SELECT EMP_FIRSTNAME, EMP_HIREDATE FROM EMPLOYEE ORDER BY EMP_HIREDATE ASC;

/* 9. Display the names and salaries of all employees in 
reverse salary order. */

SELECT EMP_FIRSTNAME, EMP_SALARY FROM EMPLOYEE ORDER BY EMP_SALARY DESC;

/* 10. Display 'ename" and "deptno" who are all earned commission and 
display salary in reverse order. */

SELECT EMPLOYEE.EMP_FIRSTNAME,DEPARTMENT.DEPT_NO,
EMPLOYEE.EMP_COMMISSION_EARNED,EMPLOYEE.EMP_SALARY FROM EMPLOYEE
INNER JOIN DEPARTMENT
ON EMPLOYEE.EMP_ID = EMP_ID_DEPT_INDEX 
GROUP BY EMP_COMMISSION_EARNED
HAVING COUNT(EMPLOYEE.EMP_COMMISSION_EARNED) > 0
ORDER BY EMPLOYEE.EMP_SALARY DESC;

/* 11. Display the last name and job title of 
all employees who do not have a manager */

SELECT EMP_LASTNAME, EMP_JOB_TITLE FROM EMPLOYEE WHERE NOT 
EMP_JOB_TITLE ='Manager';

/*12. Display the last name, job, and salary for all employees whose job 
is sales representative or stock clerk and whose salary is not equal to
$2,500, $3,500, or $5,000*/

SELECT EMP_LASTNAME, EMP_JOB_TITLE, EMP_SALARY FROM EMPLOYEE 
WHERE EMP_SALARY NOT IN(2500,3500,5000) AND 
(EMP_JOB_TITLE = 'sales representative' OR 'Stock clerk') ;
