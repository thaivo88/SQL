/*Operators  Description
  =          Equal
  <>         Not Equal
  !=         Not Equal
  >          Greater than
  <          Less than
  >=         Greater than or equal
  <=         Less than or equal
  BETWEEN    Between an inclusive range
  LIKE       Search for a pattern. (A "%" sign can be used to define wildcards)
  
  Function        Description
  AVG(column)     return the average value of a column
  COUNT(column)   return the number of rows of a column without a NULL value
  MAX(column )    return the highest value of a column
  MIN(column)     return the lowest value of a column
  SUM(column)     return the total sum of a column
  
  Single Line Function (SLF)
  UPPER(column)   return string value all in upper case
  LOWER(column)   return string value all in lower case */

/* Two main tables used in our tutorial using Oracle Apex SQL*/
SELECT * FROM emp;
SELECT * FROM dept;

/* Selecting employees with no commission with salary greater than 1100 and less than 5000 but excluding salary with 1500 */
SELECT * FROM emp 
  WHERE comm IS NULL OR comm = 0
  AND sal > 1100 AND sal < 5000 
  AND sal != 1500
ORDER BY comm;

/* Selecting employees with the job title SALESMAN with commission of 300 or greater than 1000 */
SELECT * FROM emp 
  WHERE job = 'SALESMAN' 
AND comm = 300 OR comm > 1000;

/* AS statement is use for alias, in other words change the header name of the column */
SELECT ename AS "Employee Name", sal AS "Income", comm AS "Commission" FROM emp;

/* || is the pipe statement that concatenate or you can use concat(a,b) like the two statement below */
  SELECT 'First Name: '|| ename AS "Employee" FROM emp
WHERE job ='MANAGER' 
/* Comparing the two concatenate statement: above using || and below concat(a,b) */
  SELECT concat('First Name: ' , ename) AS "Employee" FROM emp
WHERE job ='MANAGER' 
  SELECT ename || ' makes $' || sal || ' per month' AS "Income" FROM emp
WHERE job ='MANAGER'

/* concatenating employee and their job title into a sentence per row */
SELECT concat( 
  concat(upper(ename), lower(' IS THE NAME ')), 
  concat(lower('and their job is '), job)) 
AS position FROM emp;
