SET SERVEROUTPUT ON

PROMPT *** Adjust Employee Salary ***
PROMPT
ACCEPT employee_id CHAR PROMPT 'Enter employee ID:'
ACCEPT pct_adjust NUMBER PROMPT 'Enter percentage adjustment:'
ACCEPT inc_dec_flag CHAR PROMPT 'Enter D for an decrease, or I for an increase:'

BEGIN
DBMS_OUTPUT.PUT_LINE('Adjusting Salary..');

widget_tools_pkg.adjust_salary(
        &employee_id,
        &pct_adjust,
        '&inc_dec_flag'
    );
    
DBMS_OUTPUT.PUT_LINE('Employee Salary has been successfully adjusted');

COMMIT;

END;
/