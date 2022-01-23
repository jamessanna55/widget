SET SERVEROUTPUT ON
SET VERIFY OFF

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RR';

PROMPT *** Add New Employee ***
PROMPT
ACCEPT employee_name CHAR PROMPT 'Enter employee full name:'
ACCEPT job_title CHAR PROMPT 'Enter employee job title:'
ACCEPT manager_id NUMBER PROMPT 'Enter employee manager ID:'
ACCEPT salary NUMBER PROMPT 'Enter employee salary:'
ACCEPT department_id NUMBER PROMPT 'Enter employee department ID:'

BEGIN
    DBMS_OUTPUT.PUT_LINE('Creating Employee..');
    
    
    widget_tools_pkg.create_employee(
            '&employee_name',
            '&job_title',
            &manager_id,
            SYSDATE,
            &salary,
            &department_id
        );
        
    DBMS_OUTPUT.PUT_LINE('Employee Created');

COMMIT;

END;
/