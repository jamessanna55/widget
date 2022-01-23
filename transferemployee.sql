SET SERVEROUTPUT ON
SET VERIFY OFF

PROMPT *** Transfer Employee to Another Department ***
PROMPT
ACCEPT employee_id CHAR PROMPT 'Enter employee ID:'
ACCEPT department_id NUMBER PROMPT 'Enter department ID:'

BEGIN
DBMS_OUTPUT.PUT_LINE('Transferring Employee..');

widget_tools_pkg.transfer_employee(
        &employee_id,
        &department_id
    );
    
DBMS_OUTPUT.PUT_LINE('Employee has been successfully trasnferred');

COMMIT;

END;
/