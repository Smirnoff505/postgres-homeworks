-- SQL-команды для создания таблиц

CREATE TABLE employees
(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	title VARCHAR,
	birth_day DATE,
	notes TEXT
);


CREATE TABLE customers
(
	customer_id VARCHAR PRIMARY KEY,
	company_name VARCHAR(100),
	contact_name VARCHAR(100)
);

CREATE TABLE orders
(
	order_id INT PRIMARY KEY,
	customer_id VARCHAR,
	employee_id INT,
	order_date DATE,
	ship_city VARCHAR(50),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
)
