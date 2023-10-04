"""Скрипт для заполнения данными таблиц в БД Postgres."""

import csv
import psycopg2
import os

file_path_employees_data = os.path.abspath('north_data/employees_data.csv')
file_path_customers_data = os.path.abspath('north_data/customers_data.csv')
file_path_orders_data = os.path.abspath('north_data/orders_data.csv')

data_employees = []
data_customers = []
data_orders = []

with open(file_path_employees_data, encoding='utf-8', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        item = [
            row['employee_id'],
            row['first_name'],
            row['last_name'],
            row['title'],
            row['birth_date'],
            row['notes']
        ]
        data_employees.append(tuple(item))

with open(file_path_customers_data, encoding='utf-8', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        item = [
            row['customer_id'],
            row['company_name'],
            row['contact_name']
        ]
        data_customers.append(tuple(item))

with open(file_path_orders_data, encoding='utf-8', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        item = [
            row['order_id'],
            row['customer_id'],
            row['employee_id'],
            row['order_date'],
            row['ship_city']
        ]
        data_orders.append(tuple(item))

conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="555777999"
)
try:
    with conn:
        with conn.cursor() as cur:
            cur.executemany('INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)', data_employees)
            cur.executemany('INSERT INTO customers VALUES (%s, %s, %s)', data_customers)
            cur.executemany('INSERT INTO orders VALUES (%s, %s, %s, %s, %s)', data_orders)
finally:
    conn.close()
