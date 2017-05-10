/*
  Operators  Description
  --------------------------------------------------------------------------------
  =          Equal
  <>         Not Equal
  !=         Not Equal
  >          Greater than
  <          Less than
  >=         Greater than or equal
  <=         Less than or equal
  BETWEEN    Between an inclusive range
  LIKE       Search for a pattern. (A "%" sign can be used to define wildcards)
  NULL       Empty cell (does not mean zero)
  
  Numeric Function                  Description
  ------------------------------------------------------------------------------------------------
  AVG(column)                       return the average value of a column
  COUNT(column)                     return the number of rows of a column without a NULL value
  MAX(column )                      return the highest value of a column
  MIN(column)                       return the lowest value of a column
  SUM(column)                       add the total sum of a column
  ROUND(134.24553, 2)               round the value with 2 decimal place 
  TRUNC(107.9234, 2)                remove the rest of the value after the second decimal place
  TO_CHAR(123,'$999.99')            format the value into dollar
  
  Format Element    Description                 Format usage      Example
  -------------------------------------------------------------------------------
  9                 represents a number         9999.99           number  27.6     output   27.60
  0                 forces a zero in display    0000.00           number  278.6    output   0278.60
  $                 puts a dollar sign          $999.99           number  12.7     output   $12.70
  .                 decimal point               $99.9             number  48.99    output   $48.99
  D                 decimal point               $99G999D00        number  3689.82  output   $3,689.82
  ,                 comma for 1000 separator    $99,999.99        number 12400.8   output   $12,400.80
  G                 comma for 1000 separator    $99G999D00        number  3689.82  output   $3,689.82
  
  Single Line Function (SLF)        Description
  ------------------------------------------------------------------------------------------------------------------------
  UPPER('string')                   return string value all in upper case
  LOWER('string')                   return string value all in lower case
  INITCAP('string')                 return inital letter of the string as captial letter
  LENGTH('string')                  return the number of character including white spaces
  SUBSTR('string', x, xx)           return part of a string where x is the starting postion and xx is the ending postion
  LPAD('string', x, 'character')    the string will be padded on the left with the character to make the string x lenght
  RPAD('string', x, 'character')    the string will be padded on the right with the character to make the string x lenght
  LTRIM('string', 'character')      trim the first character from the left
  RTRIM('string', 'character')      trim the first character from the right
  NVL('column', value)              Replace null cell with a value
  COALESCE('column', value)         Replace null cell with a value
  NULLIF(arg1, arg2)                if arg1 and arg2 equal the result will become null
  
  Data Line Function                    Description
  -------------------------------------------------------------------------------------
  sysdate                               return the current date of the system
  systimestamp                          return the date and time and time zone
  ADD_MONTHS('date', x)                 add x amount of month to the date
  MONTHS_BETWEEN('dateA', 'dateB')      counting the months in between the date A to B
  TO_CHAR(sysdate, 'MM-DD-YY')          format sysdate into month day, year= 04-28-17
  TO_DATE('string','format')            format a string into a date format: TO_DATE('2012-08-27','YYYY-MM-DD')
  
  Format Element       How it works               Value Returned 
  ------------------------------------------------------------------
  YEAR                 Year spelled out           two thousand nine
  MM                   two digit value of month   04
  MONTH                full name of month         March
  MON                  three letter abbr          MAR
  DY                   three letter abbr of day   Tue
  DAY                  full name of the day       Tuesday
  DD                   numeric day of month       25
  DDTH                 date of month              25th
  YYYY                 4 digit year               2007
  
  Facts:
  ------------------------------------------------------------------------
  -No GROUP functions in WHERE clause (only single row functions allowed in WHERE clause)
  Subqueries can NOT contain both GROUP BY and ORDER BY clauses.
  instead you can use the HAVING clause right after the GROUP BY clause.
   */

-- Two main tables used in our tutorial using Oracle Apex SQL
SELECT * FROM emp;
SELECT * FROM dept;
-- dual table is used to test statement because there is only one record
SELECT * FROM dual;

-- Selecting employees with no commission with salary greater than 1100 and less than 5000 but excluding salary with 1500 
SELECT * FROM emp 
  WHERE comm IS NULL OR comm = 0
  AND sal > 1100 AND sal < 5000 
  AND sal != 1500
ORDER BY comm;

-- Selecting employees with the job title SALESMAN with commission of 300 or greater than 1000 
SELECT * FROM emp 
  WHERE job = 'SALESMAN' 
AND comm = 300 OR comm > 1000;

-- AS statement is use for alias, in other words change the header name of the column 
SELECT ename AS "Employee Name", sal AS "Income", comm AS "Commission" FROM emp;

-- || is the pipe statement that concatenate or you can use concat(a,b) like the two statement below 
  SELECT 'First Name: '|| ename AS "Employee" FROM emp
WHERE job ='MANAGER' 
-- Comparing the two concatenate statement: above using || and below concat(a,b) 
  SELECT concat('First Name: ' , ename) AS "Employee" FROM emp
WHERE job ='MANAGER' 
  SELECT ename || ' makes $' || sal || ' per month' AS "Income" FROM emp
WHERE job ='MANAGER'

-- concatenating employee and their job title into a sentence per row 
SELECT concat( 
  concat(upper(ename), lower(' IS THE NAME ')), 
  concat(lower('and their job is '), job)) 
AS position FROM emp;

-- comm column is numeric so we need to change it to char to add the "no data found" string
to_char(comm)= changes comm column into a string allowing all the null cell to be replaced with "no data found"*/
SELECT ename, job, sal, NVL(TO_CHAR(comm), 'NO DATA FOUND') AS income FROM emp
ORDER BY income;
-- selecting all name with 5 characters to printout length equal 5 
SELECT ename, LENGTH(ename), NVL( TO_CHAR( NULLIF( LENGTH( ename ), 5 )), 'Length equal to 5') as "Character Length" from emp

-- Selecting all the job titles and outputting its average salary per job title
SELECT job, TO_CHAR(ROUND(AVG(sal),2), '$99G999D00') AS "Income"
FROM emp GROUP BY job;


SELECT count(*), job
  FROM emp GROUP BY job
HAVING count(*) = 2
