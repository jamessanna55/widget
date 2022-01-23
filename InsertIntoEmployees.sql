SET DEFINE OFF;

ALTER SESSION SET nls_date_format = 'DD/MM/RR';

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'John Smith',
    'CEO',
    NULL,
    '01/01/95',
    100000,
    1
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Jimmy Willis',
    'Manager',
    90001,
    '23/09/03',
    52500,
    4
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Roxy Jones',
    'Salesperson',
    90002,
    '11/02/17',
    35000,
    4
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Selwyn Field',
    'Salesperson',
    90003,
    '20/05/15',
    32000,
    4
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'David Hallett',
    'Engineer',
    90006,
    '17/04/18',
    40000,
    2
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Sarah Phelps',
    'Manager',
    90001,
    '21/03/15',
    45000,
    2
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Louise Harper',
    'Engineer',
    90006,
    '01/01/13',
    47000,
    2
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Tina Hart',
    'Engineer',
    90009,
    '28/07/14',
    45000,
    3
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Gus Jones',
    'Manager',
    90001,
    '15/05/18',
    50000,
    3
);

INSERT INTO employees (
    employee_name,
    job_title,
    manager_id,
    date_hired,
    salary,
    department_id
) VALUES (
    'Mildred Hall',
    'Secretary',
    90001,
    '12/10/96',
    35000,
    1
);

COMMIT;