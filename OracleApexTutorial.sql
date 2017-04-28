SELECT * FROM emp;
SELECT * FROM dept;

SELECT * FROM emp WHERE comm IS NULL OR comm = 0
AND sal > 1100 AND sal < 5000 
AND sal != 1500
ORDER BY comm;

SELECT * FROM emp 
WHERE job = 'SALESMAN' 
AND comm = 300 OR comm > 1000;

SELECT ename AS "Employee Name", sal AS "Income", comm AS "Commission" FROM emp;

SELECT 'First Name: '|| ename AS "Employee" FROM emp
WHERE job ='MANAGER' 

SELECT ename || ' makes $' || sal || ' per month' AS "Income" FROM emp
WHERE job ='MANAGER'

SELECT deptno, sal, ename 
FROM emp
ORDER BY deptno, sal;
