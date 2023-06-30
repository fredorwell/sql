use gb_hw_3;

CREATE TABLE hw_3_sales_people (
  `snum` INT NOT NULL,
  `sname` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `comm` FLOAT NOT NULL,
  PRIMARY KEY (`snum`));


CREATE TABLE hw_3_customers (
  `cnum` INT NOT NULL,
  `cname` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `rating` INT NOT NULL,
  `snum` INT NOT NULL,
  PRIMARY KEY (`cnum`));
  
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('2001', 'Hoffman', 'London', '100', '1001');
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('2002', 'Giovanni', 'Rome', '200', '1003');
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('20003', 'Liu', 'San Jose', '200', '1002');
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('2004', 'Grass', 'Berlin', '300', '1002');
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('2006', 'Clemens', 'London', '100', '1001');
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('2008', 'Cisneros', 'San Jose', '300', '1007');
INSERT INTO `gb_hw_3`.`hw_3_customers` (`cnum`, `cname`, `city`, `rating`, `snum`) VALUES ('2007', 'Pereira', 'Rome', '100', '1004');

CREATE TABLE hw_3_order (
  `onum` INT NOT NULL,
  `amt` FLOAT NOT NULL,
  `odate` date NOT NULL,
  `cnum` INT NOT NULL,
  `snum` INT NOT NULL,
  PRIMARY KEY (`cnum`));

INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3001', '18.69', '1990-03-10', '2008', '1007');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3003', '767.19', '1990-03-10', '2001', '1001');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3002', '1900.10', '1990-03-10', '2007', '1004');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3005', '5160.45', '1990-03-10', '2003', '1002');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3006', '1098.16', '1990-03-10', '2008', '1007');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3009', '1713.23', '1990-04-10', '2002', '1003');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3007', '75.75', '1990-04-10', '2004', '1002');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3008', '4723.00', '1990-05-10', '2006', '1001');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3010', '1309.95', '1990-06-10', '2004', '1002');
INSERT INTO `gb_hw_3`.`hw_3_order` (`onum`, `amt`, `odate`, `cnum`, `snum`) VALUES ('3011', '9891.88', '1990-06-10', '2006', '1001');

SELECT * FROM hw_3_sales_people;
SELECT * FROM hw_3_customers;
SELECT * FROM hw_3_order;


-- Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm FROM hw_3_sales_people;

-- Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating,cname FROM hw_3_customers WHERE city = 'San Jose';

-- Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum FROM hw_3_order;

-- Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
SELECT * FROM hw_3_customers WHERE cname LIKE 'G%';

-- Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT * FROM hw_3_order WHERE amt > 1000;

-- Напишите запрос который выбрал бы наименьшую сумму заказа. (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT MIN(amt) FROM hw_3_order;

-- Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.

SELECT * FROM hw_3_customers WHERE rating > 100 AND NOT city = 'Rome';


create table staff (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert staff( name, surname, speciality, seniority, salary, age)
values
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

SELECT * FROM staff;


-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT * FROM staff ORDER BY salary;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT * FROM staff ORDER BY salary desc LIMIT 5;

-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT speciality, sum(salary) as sum_salary FROM staff GROUP BY speciality having sum_salary>100000;
