use gb_les5;


-- Задание 1
CREATE TABLE `gb_les5`.`cars` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Cost` INT NOT NULL,
  PRIMARY KEY (`Id`));

INSERT INTO cars (`Name`, `Cost`) VALUES 
('Audi', '52642'),
('Mercedes', '57127'),
('Skoda', '9000'),
('Volvo', '29000'),
('Bentley', '350000'),
('Citroen', '21000'),
('Hummer', '41400'),
('Volkswagen', '21600');

select * from Cars;


-- Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW cars_1 AS (SELECT * FROM Cars WHERE cost < 25000);
select * from cars_1;
-- Изменить в существующем представлении порог для стоимости: 
-- пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cars_1 AS (SELECT * FROM Cars WHERE cost < 30000);
select * from cars_1;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW cars_3 AS (SELECT * FROM Cars WHERE name = "Audi" OR name = "Skoda");
select * from cars_3;

-- Задание 2


CREATE TABLE Analysis (
	an_id INT NOT NULL AUTO_INCREMENT,
    an_name VARCHAR(45) NOT NULL,
    an_cost INT NOT NULL,
    an_price INT NOT NULL,
    an_group INT NOT NULL,
  PRIMARY KEY (`an_id`));


INSERT INTO Analysis (an_name, an_cost, an_price, an_group) VALUES
('analysis_1', 100, 200, 2),
('analysis_2', 200, 400, 2),
('analysis_3', 300, 600, 3),
('analysis_4', 400, 800, 2),
('analysis_5', 500, 1000, 1),
('analysis_6', 600, 650, 3),
('analysis_7', 700, 1400, 1),
('analysis_8', 800, 1600, 3),
('analysis_9', 900, 1800, 1),
('analysis_10', 1000, 2000, 3),
('analysis_11', 1100, 2200, 1),
('analysis_12', 1200, 2400, 1);

CREATE TABLE groupss
(
    gr_id INT NOT NULL AUTO_INCREMENT,
    gr_name VARCHAR(50) NOT NULL,    
    gr_temp INT NOT NULL,
	PRIMARY KEY (`gr_id`)
);

INSERT INTO groupss (gr_name, gr_temp) VALUES
('Низкая температура', -15),
('Средняя температура', 0),
('Высокая температура', +15);

CREATE TABLE Orders
(
    ord_id INT NOT NULL AUTO_INCREMENT,
    ord_datetime DATETIME NOT NULL,    
    ord_an INT NOT NULL,
	PRIMARY KEY (`ord_id`)
);

INSERT INTO Orders (ord_datetime, ord_an) VALUES
  ("2020-10-04 00:00:00",7),
  ("2020-10-04 00:00:00",8),
  ("2022-10-04 00:00:00",11),
  ("2020-02-06 00:00:00",10),
  ("2021-10-04 00:00:00",2),
  ("2022-10-04 00:00:00",10),
  ("2020-02-11 00:00:00",3),
  ("2021-10-04 00:00:00",4),
  ("2020-02-12 00:00:00",3),
  ("2020-02-10 00:00:00",8);

SELECT * FROM Analysis;
SELECT * FROM groupss;
SELECT * FROM Orders;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

SELECT an_name AS `name_analys`,an_cost AS `cost` , an_price AS `price` FROM Analysis an
JOIN Orders o ON an.an_id = o.ord_an WHERE 
(
    DAYOFYEAR(o.ord_datetime) 
    BETWEEN DAYOFYEAR('2023-02-05') AND (DAYOFYEAR('2023-02-05') + 7)
);


-- Задание 3

CREATE TABLE train_schedule
(
    train_id INT NOT NULL,
    stantion VARCHAR(20) NOT NULL,    
    stantion_time TIME NOT NULL
);

INSERT INTO train_schedule (train_id, stantion, stantion_time) VALUES
(110, 'San Francisco', '10:00:00'),
(110, 'Redwood City', '10:54:00'),
(110, 'Palo Alto', '11:02:00'),
(110, 'San Jose', '12:35:00'),
(120, 'San Francisco', '11:00:00'),
(120, 'Palo Alto', '12:49:00'),
(120, 'San Jose', '13:30:00');

select * from train_schedule;

/*
Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, 
мы вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD.
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат.
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/


WITH ts AS
(SELECT *, LEAD(stantion_time) OVER(PARTITION BY train_id) AS next_stantion_time FROM train_schedule)
SELECT
    train_id , stantion ,  stantion_time,    
    TIMEDIFF(next_stantion_time, stantion_time) AS `time_to_next_station`
FROM ts;
