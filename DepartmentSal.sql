SET SERVEROUTPUT ON
SET VERIFY OFF
SET LINESIZE 250
SET COLSEP ,

PROMPT *** Total Salary of Department Report ***
PROMPT
ACCEPT department_id NUMBER PROMPT 'Enter department ID:'

-- Write the output to file from sqlplus
SPOOL departmentSal.csv

    SELECT 
        department_name,
        SUM(salary) AS total_salary
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
    WHERE d.department_id = &department_id
    GROUP BY department_name;
    
PROMPT File has been created
SPOOL OFF