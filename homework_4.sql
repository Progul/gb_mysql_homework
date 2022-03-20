-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.

UPDATE users
	SET created_at = NOW() AND updated_at = NOW()
;

-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы
--    типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
--    Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

ALTER TABLE users ADD created_at_dt DATETIME, updated_at_dt DATETIME;
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
    updated_at_dt = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');
ALTER TABLE users 
    DROP created_at, DROP updated_at, 
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться
-- самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value.
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.
   
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO 
  storehouses_products(storehouse_id, product_id, value)
VALUES
  (1, 543, 0),
  (1, 789, 2500),
  (1, 3432, 0),
  (1, 826, 30),
  (1, 719, 500),
  (1, 638, 1);

SELECT * FROM storehouses_products
ORDER BY
  value = 0,
  value;
  
-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
-- Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT * FROM users WHERE birthday_at RLIKE '^[0-9]{4}-(05|08)-[0-9]{2}';



-- Практическое задание теме “Агрегация данных”

-- 1. Подсчитайте средний возраст пользователей в таблице users

SELECT  
    weekday(date_format(birthday, '2022-%m-%d')) AS 'day_number',
    count(*) AS 'birthdays_qnty'
FROM profiles
GROUP BY weekday(date_format(birthday, '2022-%m-%d'))
GROUP BY day_number;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS week_day_of_birthday_in_this_Year,
    COUNT(*) AS amount_of_birthday
FROM
    users
GROUP BY 
    week_day_of_birthday_in_this_Year
ORDER BY
	amount_of_birthday DESC;























