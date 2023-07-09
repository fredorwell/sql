use gb_hw_6;

-- Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '



DELIMITER $$
CREATE PROCEDURE sec_to_days(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE seconds >= 84600 DO
    SET days = seconds / 84600;
    SET seconds = seconds % 84600;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL sec_to_days(5446);
DROP PROCEDURE sec_to_days;


-- Выведите только четные числа от 1 до 10 включительно.

DELIMITER $$
CREATE PROCEDURE even_nums()
BEGIN
    DECLARE i INT;
    DECLARE res VARCHAR(50);
    SET i = 4;
    SET res = '2';    
    WHILE i <= 10 DO
        SET res = CONCAT(res, ', ', i);        
        SET i = i + 2;    
    END WHILE;
    SELECT res;
END $$
DELIMITER ;

CALL even_nums();
DROP PROCEDURE even_nums;