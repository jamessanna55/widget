CREATE OR REPLACE PACKAGE BODY widget_tools_pkg AS

PROCEDURE create_employee(
    in_emp_name IN VARCHAR2,
    in_job_title IN VARCHAR2,
    in_manager_id IN NUMBER,
    in_date_hired IN DATE,
    in_salary IN NUMBER,
    in_department_id IN NUMBER
)
IS

l_mgr_check employees.employee_id%TYPE;
l_dept_check departments.department_id%TYPE;
no_mgr_found EXCEPTION;
no_dept_found EXCEPTION;

BEGIN
    -- Check the manager exists
    SELECT COUNT(*)
    INTO l_mgr_check
    FROM employees
    WHERE employee_id = in_manager_id;

    -- Check the department exists
    SELECT COUNT(*)
    INTO l_dept_check
    FROM departments
    WHERE department_id = in_department_id;
    
    IF l_mgr_check = 0 THEN
        RAISE no_mgr_found;
    ELSIF l_dept_check = 0 THEN
        RAISE no_dept_found;
    END IF;
    
    INSERT INTO employees(
        -- ID auto generated
        employee_name,
        job_title,
        manager_id,
        date_hired,
        salary,
        department_id
    ) VALUES (
        in_emp_name,
        in_job_title,
        in_manager_id,
        in_date_hired,
        in_salary,
        in_department_id
    );
    
    EXCEPTION
        WHEN no_mgr_found THEN
            RAISE_APPLICATION_ERROR(-20001, 'No Manager found for ID: ' || in_manager_id);
        WHEN no_dept_found THEN
            RAISE_APPLICATION_ERROR(-20001, 'No Department found for ID: ' || in_department_id);
        WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20404, 'An unknown error has occured');
        
END create_employee;

  
PROCEDURE adjust_salary(
    in_employee_id IN NUMBER,
    in_pct_adjust IN NUMBER,
    in_increase_decrease_flag  VARCHAR2
)
IS

l_emp_check employees.employee_id%TYPE;
no_emp_found EXCEPTION;
invalid_inc_dec_flag EXCEPTION;
decrease_error EXCEPTION;

BEGIN
    
    -- Check the employee exists
    SELECT COUNT(*)
    INTO l_emp_check
    FROM employees
    WHERE employee_id = in_employee_id;
    
    IF l_emp_check = 0 THEN
        RAISE no_emp_found;
    -- Increase Decrease flag must be a valid input
    ELSIF UPPER(in_increase_decrease_flag) NOT IN ('I', 'D') THEN
        RAISE invalid_inc_dec_flag;
    -- Cannot decrease a salary into negative figues
    ELSIF (UPPER(in_increase_decrease_flag) = 'D' AND in_pct_adjust > 100) THEN
        RAISE decrease_error;
    END IF;
    
    UPDATE employees
    SET salary = CASE 
                    WHEN UPPER(in_increase_decrease_flag) = 'I' THEN salary + (salary/100 * in_pct_adjust)
                    WHEN UPPER(in_increase_decrease_flag) = 'D' THEN salary - (in_pct_adjust/100 * salary)
                END
    WHERE employee_id = in_employee_id;                
    
EXCEPTION
    WHEN no_emp_found THEN
        RAISE_APPLICATION_ERROR(-20001, 'No Employee found for ID: ' || in_employee_id);
    WHEN invalid_inc_dec_flag THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid value for Increase/Decrease Flag - Only use I (incease) or D (decrease)');
    WHEN decrease_error THEN
        RAISE_APPLICATION_ERROR(-20002, 'Employee salary cannot be decreased by more than 100%');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20404, 'An unknown error has occured');
        
END adjust_salary;   


PROCEDURE transfer_employee(
    in_employee_id IN NUMBER,
    in_department_id IN NUMBER
)
IS 

l_emp_check employees.employee_id%TYPE;
l_dept_check departments.department_id%TYPE;
no_emp_found EXCEPTION;
no_dept_found EXCEPTION;

BEGIN

    -- Check the employee exists
    SELECT COUNT(*)
    INTO l_emp_check
    FROM employees
    WHERE employee_id = in_employee_id;

    -- Check the department exists
    SELECT COUNT(*)
    INTO l_dept_check
    FROM departments
    WHERE department_id = in_department_id;
    
    IF l_emp_check = 0 THEN
        RAISE no_emp_found;
    ELSIF l_dept_check = 0 THEN
        RAISE no_dept_found;
    END IF;
    
    UPDATE employees
    SET department_id = in_department_id
    WHERE employee_id = in_employee_id;
    
    COMMIT;
    
    EXCEPTION
        WHEN no_emp_found THEN
            RAISE_APPLICATION_ERROR(-20001, 'No Employee found for ID: ' || in_employee_id);
        WHEN no_dept_found THEN
            RAISE_APPLICATION_ERROR(-20001, 'No Department found for ID: ' || in_department_id);
        WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20404, 'An unknown error has occured');
        
END transfer_employee;


FUNCTION get_employee_salary(
    in_employee_id IN NUMBER
)
RETURN NUMBER
IS

l_emp_check employees.employee_id%TYPE;
l_emp_sal NUMBER;
no_emp_found EXCEPTION;

BEGIN

    -- Check the employee exists
    SELECT COUNT(*)
    INTO l_emp_check
    FROM employees
    WHERE employee_id = in_employee_id;
    
    IF l_emp_check = 0 THEN
        RAISE no_emp_found;
    END IF;
    
    SELECT salary
    INTO l_emp_sal
    FROM employees
    WHERE employee_id = in_employee_id;

    RETURN l_emp_sal;
    
    EXCEPTION
        WHEN no_emp_found THEN
            RAISE_APPLICATION_ERROR(-20001, 'No Employee found for ID: ' || in_employee_id);

END get_employee_salary;


END widget_tools_pkg;
/