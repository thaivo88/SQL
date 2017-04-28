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
  
  Numeric Function                  Description
  AVG(column)                       return the average value of a column
  COUNT(column)                     return the number of rows of a column without a NULL value
  MAX(column )                      return the highest value of a column
  MIN(column)                       return the lowest value of a column
  SUM(column)                       add the total sum of a column
  ROUND(134.24553, 2)               round the value with 2 decimal place 
  TRUNC(107.9234, 2)                remove the rest of the value after the second decimal place
  TO_CHAR(123,'$999.99')            format the value into dollar
  
  Single Line Function (SLF)        Description
  UPPER('string')                   return string value all in upper case
  LOWER('string')                   return string value all in lower case
  INITCAP('string')                 return inital letter of the string as captial letter
  LENGHT('string')                  return the number of character including white spaces
  SUBSTR('string', x, xx)           return part of a string where x is the starting postion and xx is the ending postion
  LPAD('string', x, 'character')    the string will be padded on the left with the character to make the string x lenght
  RPAD('string', x, 'character')    the string will be padded on the right with the character to make the string x lenght
  LTRIM('string', 'character')      trim the first character from the left
  RTRIM('string', 'character')      trim the first character from the right
  
  Data Line Function                    Description
  sysdate                               return the current date of the system
  systimestamp                          return the date and time and time zone
  ADD_MONTHS('date', x)                 add x amount of month to the date
  MONTHS_BETWEEN('dateA', 'dateB')      counting the months in between the date A to B
  TO_CHAR(sysdate, 'Month DD,YYYY')     format sysdate into month day, year= April 28, 2017
  */

/* Two main tables used in our tutorial using Oracle Apex SQL*/
SELECT * FROM emp;
SELECT * FROM dept;
/* dual table is used to test statement because there is only one record*/
SELECT * FROM dual;

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


