-- TASK 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' 
DROP PROCEDURE IF EXISTS second_counter;
DELIMITER //
CREATE PROCEDURE convert_to_time(num INT)
BEGIN
	SELECT CONCAT_WS(' ', num DIV 86400, 'days', MOD(num, 86400) DIV 3600, 'hours', MOD(MOD(num, 86400),3600) DIV 60, 'minutes',
                             MOD(MOD(MOD(num, 86400),3600),60), 'seconds') AS Result;
END//
DELIMITER ;

CALL convert_to_time(123456);  

-- TASK 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 
DROP PROCEDURE IF EXISTS get_even;
DELIMITER //
CREATE PROCEDURE get_even(`start` INT, `end` INT)
BEGIN
	DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT NULL;
    WHILE  i <= `end` DO
        IF i % 2 = 0 THEN
			IF res_str IS NULL THEN
				SET res_str = concat(i);
			ELSE
				SET res_str = concat(res_str, ', ', i);
			END IF;
		END IF;
        SET i = i + 1;
    END WHILE;
	SELECT res_str;
END //
DELIMITER ;

CALL get_even(1, 10);