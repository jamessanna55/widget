SET SERVEROUTPUT ON
SET VERIFY OFF
SET LINESIZE 250
SET COLSEP ,

Prompt *** Employees of a Department Report ***
Prompt
ACCEPT department_id NUMBER PROMPT 'Enter department ID:'

SPOOL departmentEmps.csv

    SELECT 
        e.employee_name,
        e.job_title,
        e.date_hired,
        e.salary,
        m.employee_name AS manager_name,
        department_name
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
    JOIN employees m
    ON e.manager_id = m.employee_id
    WHERE d.department_id = &department_id;

Prompt File has been created    
SPOOL OFF

