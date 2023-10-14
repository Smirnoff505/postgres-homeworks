-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar

CREATE TABLE students
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
)

-- 2. Добавить в таблицу student колонку middle_name varchar

ALTER TABLE students
ADD COLUMN middle_name varchar

-- 3. Удалить колонку middle_name

ALTER TABLE students
DROP COLUMN middle_name

-- 4. Переименовать колонку birthday в birth_date

ALTER TABLE students
RENAME birthday TO birth_date

-- 5. Изменить тип данных колонки phone на varchar(32)

ALTER TABLE students
ALTER COLUMN phone
SET DATA TYPE varchar(32)

-- 6. Вставить три любых записи с автогенерацией идентификатора

INSERT INTO students(first_name, birth_date, phone)
VALUES ('Иван', '1988-10-10', '555-674-563'), ('Alex', '1988-11-01', '555-884-337'), ('Piter', '1990-01-05', '555-976-123')

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние

TRUNCATE TABLE students RESTART IDENTITY