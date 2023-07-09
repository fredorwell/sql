CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

 -- AUTO
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- 4.1
SELECT mark, color, COUNT(*)
FROM AUTO
GROUP BY mark, color
HAVING mark IN ('BMW', 'LADA');

-- 4.2
SELECT mark, COUNT(*) as kol_mark, ((SELECT COUNT(*) FROM AUTO) - COUNT(*)) as kol_no_mark
FROM AUTO
GROUP BY mark;


-- 5.4
# WHERE time_an >= '2020-02-05' AND time_an <= DATE_ADD('2020-02-05', INTERVAL 1 WEEK);

-- 5.5
SELECT *,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY station_time), station_time) AS next_time
FROM train;


/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие,
в зависимости от текущего времени суток.
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

DELIMITER $$
CREATE PROCEDURE hello()
BEGIN
	CASE
		WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN 
			SELECT "Доброе утро";
		WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN 
			SELECT "Доброе день";
		WHEN CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN 
			SELECT "Доброе вечер";
		ELSE
			SELECT "Доброе ночи";
	END CASE;
END $$
DELIMITER ;

CALL hello();







# 0 1 1 2 3 5 8 13 21 
DELIMITER //
CREATE FUNCTION fib(num INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE n1 INT DEFAULT 0;
    DECLARE n2 INT DEFAULT 1;
    DECLARE n3 INT DEFAULT 0;
    DECLARE res VARCHAR(50) DEFAULT '0 1';
    
    IF num = 1 THEN
		RETURN n1;
	ELSEIF num = 2 THEN
		RETURN res;
	ELSE
		WHILE num > 2 DO
			SET n3 = n1 + n2;
            SET n1 = n2;
            SET n2 = n3;
            SET num = num - 1;
            SET res = CONCAT(res, ' ', n3);
		END WHILE;
        RETURN res;
	END IF;
END //
DELIMITER ;

SELECT fib(5);






CREATE TABLE bankaccounts(
	accountno varchar(20) PRIMARY KEY NOT NULL,
	funds decimal(8,2));

INSERT INTO bankaccounts VALUES("ACC1", 1000);
INSERT INTO bankaccounts VALUES("ACC2", 1000);

-- Изменим баланс на аккаунтах
START TRANSACTION; 
UPDATE bankaccounts SET funds=funds-100 WHERE accountno='ACC1'; 
UPDATE bankaccounts SET funds=funds+100 WHERE accountno='ACC2'; 
COMMIT; -- ROLLBACK;




/*
Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
N = 5=>5,4,3,2,1,
*/
DELIMITER $$
CREATE PROCEDURE loop_n()
BEGIN
	DECLARE n INT DEFAULT 5;
    DECLARE res VARCHAR(30) DEFAULT CONCAT('', n);
    SET n = n - 1;
    
    REPEAT
		SET res = CONCAT(res, ', ', n);
		SET n = n - 1;
        UNTIL n <= 0
	END REPEAT;
    SELECT res;
END $$
DELIMITER ;

CALL loop_n;


