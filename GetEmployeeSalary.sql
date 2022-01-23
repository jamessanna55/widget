SET SERVEROUTPUT ON

PROMPT *** Get Employee Salary***
PROMPT
ACCEPT employee_id CHAR PROMPT 'Enter employee ID:'

DECLARE

l_employee_sal NUMBER;

BEGIN
DBMS_OUTPUT.PUT_LINE('Getting Employee Salary..');


l_employee_sal := 
    widget_tools_pkg.get_employee_salary(
        &employee_id
    );
    
DBMS_OUTPUT.PUT_LINE(l_employee_sal);

COMMIT;

END;
/