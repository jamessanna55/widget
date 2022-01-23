CREATE OR REPLACE PACKAGE widget_tools_pkg AS

PROCEDURE create_employee(
    in_emp_name IN VARCHAR2,
    in_job_title IN VARCHAR2,
    in_manager_id IN NUMBER,
    in_date_hired IN DATE,
    in_salary IN NUMBER,
    in_department_id IN NUMBER
);
    
PROCEDURE adjust_salary(
    in_employee_id IN NUMBER,
    in_pct_adjust IN NUMBER,
    in_increase_decrease_flag IN VARCHAR2
);

PROCEDURE transfer_employee(
    in_employee_id IN NUMBER,
    in_department_id IN NUMBER
);

FUNCTION get_employee_salary(
    in_employee_id IN NUMBER
)
RETURN NUMBER;


END widget_tools_pkg;

/