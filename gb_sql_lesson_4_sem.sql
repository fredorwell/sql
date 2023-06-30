use gb_lessons;

-- Выведите участников, которые также являются членами комитета,
-- используйте INNER JOIN (пересечение 2 таблиц по имени);


CREATE TABLE members
(
member_id INT AUTO_INCREMENT,
name VARCHAR (100) ,
PRIMARY KEY (member_id)
);

CREATE TABLE committees
(
committee_id INT AUTO_INCREMENT,
name VARCHAR (100),
PRIMARY KEY (committee_id)
);

INSERT INTO members (name)
VALUES("John"), ("Jane"), ("wary"), ("David"), ("2melia");
INSERT INTO committees (name)
VALUES ("John"), ("Mary"), ("Amelial"), ("Joe");

SELECT * FROM members;
SELECT * FROM commits;

SELECT * FROM members m
INNER JOIN committees c
ON m.name = c.name;
-- Выведите участников, которые являются членами комитета (Используя LEFT JOIN, выполните соединение двух таблиц  по полю “Имя”)

SELECT * FROM members m
LEFT JOIN committees c
ON m.name = c.name;

SELECT * FROM members m
LEFT JOIN committees c
USING(name);

-- Выведите участников, которые не являются членами комитета

SELECT * FROM members m
LEFT JOIN committees c
USING(name)
where c.committee_id is NULL;


-- 1. 	Найти членов комитета, которых нет в members с помощью RIGHT JOIN

SELECT * FROM members m
right JOIN committees c
USING(name)
where m.member_id is NULL;

-- 2.	Выполнить RIGHT JOIN между 2 таблицами по полю “Имя”
SELECT * FROM members m
right JOIN committees c
USING(name);

-- 1.	Выведите перекрестное произведение таблиц members - committees

SELECT * FROM members m
cross JOIN committees c;

create table users
(
    id  int auto_increment primary key,
    login varchar(255) null,
    pass  varchar(255) null,
    male  tinyint      null
);

create table clients
(
    id    int auto_increment primary key,
    login varchar(255) null,
    pass  varchar(255) null,
    male  tinyint      null
);

INSERT INTO users (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO users (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO users (login, pass, male) VALUES ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO users (login, pass, male) VALUES ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO users (login, pass, male) VALUES ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO users (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

INSERT INTO clients (login, pass, male) VALUES ('alexander', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Olia', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Dmitry', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Margaret', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Leonid', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Mikle', '$ws$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Olga', '$2y$10$88zbBCKLJklStIgTqBKIluijJUnbeZ5WqJI4RJgkksnFZon5kH14y', 2);
INSERT INTO clients (login, pass, male) VALUES ('Tom', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH20y', 1);
INSERT INTO clients (login, pass, male) VALUES ('Masha', '$2y$20$6SzbBCNRNklStIgTqBKIluijJUnbeZ4wqIu4RJgkksnFZon5kH20y', 2);
INSERT INTO clients (login, pass, male) VALUES ('alex', '$2y$10$6SzbBCMENklStIgTqBKIluijJUnbeZ5WqIu4RJgkksnFZon5kH14y', 1);

-- 1.	Получить список пользователей и клиентов, удалив одинаковых клиентов и пользователей


Select * from users UNION Select * from clients ORDER BY ID;

-- 2.	Получить список пользователей и клиентов. Дубликаты удалять не нужно

Select * from users UNION ALL Select * from clients ORDER BY ID;


-- Проверьте, присутствует ли буква “А” в последовательности 'A', 'B', 'C', 'D' .
select 'A' in ('A', 'B', 'C', 'D');
-- Проверьте, присутствует ли буква “Z” в последовательности 'A', 'B', 'C', 'D' 
select 'Z' in ('A', 'B', 'C', 'D');
-- Получить столбцы из таблицы “clients” , в которых первое имя является набором значений.
select * FROM clients where login in ('Tom','Mikle');
-- Выберите все логины из таблицы “users”, кроме “Mikle”.
select * FROM clients where login not in ('Mikle');


-- Задание на EXISTS
CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, `Name`, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');
CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
      Title VARCHAR(200) NOT NULL,
     ClientId INT,
 EmployeeId INT,
     StartDate DATETIME,
     EndDate DATETIME
);
INSERT INTO Projects ( Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, NOW(), DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, NOW(), DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY));


select * from Projects;
select * from Employee;

-- 1.	Получите из таблицы "Сотрудники" только тех сотрудников, которые в данный момент работают над любым из активных проектов.

select * from Employee e where exists (select * from Projects p where e.id = p.EmployeeId);

-- 2.	Проверьте, существует ли сотрудник с идентификатором 1004 в таблице сотрудников или нет.

select exists(select * from Employee where id = 1004) as res;