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
  
  JOIN
  ---------------------------------------------------------------------------------------
  INNER JOIN  result all the record from both table with matching records
  
  OUTER JOIN
  ----------------------------------------------------------------------------------------------------------------
  RIGHT OUTER JOIN or RIGHT JOIN or (+) result all the record from the second table and all the matching record from both tables
  LEFT OUTER JOIN or LEFT JOIN or (+) result all the record from the first table and all the matching record from both tables
  FULL OUTER JOIN result all the record from both tables
  
  UNION
  ------------------------------
  UNION joining both data unique value with no duplicates (must have the same column)
  UNION ALL join both data from both query with duplicates
    
  Other snytax
  ----------------
  WHERE EXISTS (select * from....)
  DESCRIBE { table-Name | view-Name }           
        Provides a decription of the specified table or view. 
        For a list of tables in the current schema, use the Show Tables command. 
        For a list of views in the current schema, use the Show Views command. 
        For a list of available schemas, use the Show Schemas command.
  CREATE { table-name }
  INSERT INTO { table-name (column-name1, column-namen,.... ) } VALUE { column-value1, column-valuen,.... }
  UPDATE { table-name } SET { column-name (operations) attribute } WHERE {column-name (operations) attribute }
  ALTER TABLE { table-name } (ADD, MODIFY, RENAME {column-name}, REBUILD, ADD CONSTRAINTS) { column-name}
  DELETE FROM {table-name} WHERE {condition}; used to delete the existing records from a table
  DROP (TABLE, INDEX) {table-name, index_name} delect the whole table (data and structure)
  TRUNCATE TABLE {table-name} delete all data in the table but keeps the table
  CREATE [UNIQUE] INDEX index_name ON table_name (column1, column2...) [COMPUTE STATISTICS]  
  CREATE VIEW {view_name} AS {query} | view is a saved query 
  CREATE OR REPLACE {name}
  MINUS
  ROWID
  ROWNUM
  ALL_TABLE
  ALL_TAB_COLUMN
  ALL_OBJECTS
  
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

--selecting emp who has a salary of 300 / 3000
SELECT * FROM emp  
  WHERE sal IN (300, 3000);

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

--Finding out which job title has 2 employees using the HAVING clause
SELECT job
  FROM emp GROUP BY job
HAVING count(*) = 2

--when grouping a select statment all the columns from SELECT clause MUST be in the GROUP BY clause but with out the group_function(*)
--but the GROUP BY clause doesnt all need to be in the SELECT clause
SELECT col_1, col_2, col_n, group_function(aggregate_expression)
  FROM tables
  WHERE conditions
  GROUP BY col_1. col_2, col_n
ORDER BY conditions

--NESTING SUBQUERIES: Nesting query will excute the inner nest then the outter nest; just like math problems.
SELECT * FROM dept
WHERE deptno = ( SELECT deptno FROM dept WHERE deptno = 30)
--above and below queries are equal= meaning the out put is the same.
SELECT * FROM dept
WHERE deptno = 30

--Giving a table an alias by adding the alias name after the table name.
SELECT emp.ename, emp.job, emp.sal    >>    SELECT e.ename, e.job, e.sal
FROM emp, dept                        >>    FROM emp e, dept d
WHERE emp.deptno = dept.deptno        >>    WHERE e.deptno = d.deptno 
AND dept.loc = 'DALLAS'               >>    AND d.loc = 'DALLAS'

--subqueries
SELECT e.ename, e.job, e.sal, e.deptno
FROM (select * from emp) e, (SELECT * FROM dept WHERE loc = 'DALLAS') d
WHERE e.deptno = d.deptno 

--JOIN
--INNER JOIN  result all the record from both table with matching records
--OUTER JOIN
--RIGHT OUTER JOIN or RIGHT JOIN or (+) result all the record from the second table and all the matching record from both tables
--LEFT OUTER JOIN or LEFT JOIN or (+) result all the record from the first table and all the matching record from both tables
--FULL OUTER JOIN result all the record from both tables
--                                  same results
SELECT * FROM emp INNER JOIN dept       >>    SELECT * FROM emp, dept
ON emp.deptno = dept.deptno             >>    WHERE emp.deptno = dept.deptno

--                                  same result (right outer join)
SELECT *                                >>    SELECT *
FROM emp RIGHT JOIN dept                >>    FROM emp, dept
ON emp.deptno = dept.deptno             >>    WHERE emp.deptno(+) = dept.deptno

--                                  same result (left outer join)
SELECT *                                >>    SELECT *
FROM emp RIGHT JOIN dept                >>    FROM emp, dept
ON emp.deptno = dept.deptno             >>    WHERE emp.deptno = dept.deptno(+)

SELECT empno, ename, job, mgr, hiredate, sal, comm, e.deptno as deptno, d.deptno as deptno, dname, loc 
FROM (SELECT * FROM dept) d left OUTER JOIN (select * from emp where job ='SALESMAN') e 
on e.deptno = d.deptno
--same result
SELECT e.*, d.*
FROM (SELECT * FROM dept) d left OUTER JOIN (select * from emp where job ='SALESMAN') e 
on e.deptno = d.deptno

--Creating a table
CREATE TABLE name_of_table (                  >>      CREATE TABLE stores (
  pk_id number NOT null,                      >>      store_ID number NOT null,
  column1 datatype(number),                   >>      city varchar(50)
  .....          );                           >>      );
  
--creating a table by borrowing the structure of another
CREATE TABLE employees AS                                 --creating a table called 'employees' just AS the table name emp
(SELECT empno, ename, job, hiredate, sal, comm            --Using the same column structure and name as the ones in emp table
FROM emp);
  
--creating a table with a primary key that cannot be duplicated/repeated   
CREATE TABLE products
(
  product_id number not null,
  name varchar(50),
  product_cost number(5,2),
  product_retatil number(5,2),
  product_type varchar(10),
  store_id number not null,

  CONSTRAINT product_pk PRIMARY KEY(product_id)
);

--Inserting data into a table
INSERT INTO stores (store_ID, city)  VALUES (1, 'San Francisco');
or
INSERT INTO stores VALUES (1, 'San Francisc');
--for this command you dont have to list all the value storage name if you are listing all the values

--inserting more data all at once but the table must have at least one data record in the table
INSERT ALL
   INTO stores (store_id, city) VALUES (2, 'New York City')
   INTO stores (store_id, city) VALUES (3, 'Houston')
   INTO stores (store_id, city) VALUES (4, 'Philadelphia')
   INTO stores (store_id, city) VALUES (5, 'Boston')
   INTO stores (store_id, city) VALUES (6, 'Seattle')
SELECT * FROM stores order by store_id;

--Alter/Modify
ALTER TABLE name_of_table                       >>      ALTER TABLE products
  MODIFY name_of_column datatype ....;          >>        MODIFY name varchar2(50) not null;

--Modify more than one column
ALTER TABLE products
MODIFY (name varchar2(50) NOT null,
        product_cost number(5,2) NOT null);
        
--Renaming a column name        
ALTER TABLE products
RENAME COLUMN name TO product_name;

--Adding a column
ALTER TABLE employees
ADD store_id number;

--updating a column
UPDATE employees
SET store_id = 3
WHERE ename IN ('KING', 'BLAKE', 'CLARK')

-- Creating an index
CREATE INDEX emp_name_idx
ON employees (ename)

