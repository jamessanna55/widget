SET DEFINE OFF;

INSERT INTO departments (
    department_id,
    department_name,
    location
) VALUES (
    1,
    'Management',
    'London'
);

INSERT INTO departments (
    department_id,
    department_name,
    location
) VALUES (
    2,
    'Engineering',
    'Cardiff'
);

INSERT INTO departments (
    department_id,
    department_name,
    location
) VALUES (
    3,
    'Research & Development', -- Make sure to set define off
    'Edinburgh'
);

INSERT INTO departments (
    department_id,
    department_name,
    location
) VALUES (
    4,
    'Sales',
    'Belfast'
);

COMMIT;