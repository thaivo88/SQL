
CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);

select name, number_grade, round(fraction_completed*100) as percent_completed from student_grades;

SELECT name, number_grade,
case 
when number_grade<89 then "A"
WHEN number_grade>79 THEN "B"
WHEN number_grade>69 THEN "C"
ELSE "F"
END as "letter_grade"
FROM student_grades;

select count(*),
case 
when number_grade<89 then "A"
WHEN number_grade>79 THEN "B"
WHEN number_grade>69 THEN "C"
ELSE "F"
END as "letter_grade"
FROM student_grades group by letter_grade;
