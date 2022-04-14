# Домашние работы по курсу MySQL

<iframe src="https://giphy.com/embed/vISmwpBJUNYzukTnVx" width="480" height="251" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/vISmwpBJUNYzukTnVx">via GIPHY</a></p>

## Видеоурок 2. Практическое задание по теме “Управление БД”

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework-2.sql "Решение 2 задания")

1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.
3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
4. (по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.


## Урок 3. Вебинар. Введение в проектирование БД

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_3.sql "Решение 3 задания")

1. Написать cкрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

## Урок 4. Вебинар. CRUD-операции

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_4-5.sql "Решение 4 задания")

1. Заполнить все таблицы БД vk данными (не больше 10-20 записей в каждой таблице)
2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
5. Написать название темы курсового проекта (в комментарии)

## Урок 5. Видеоурок. Операторы, фильтрация, сортировка и ограничение. Агрегация данных

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_4-5.sql "Решение 5 задания")

1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

#### Практическое задание теме “Агрегация данных”

1. Подсчитайте средний возраст пользователей в таблице users
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

## Урок 6. Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_6.sql "Решение 6 задания")

1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
3. Определить кто больше поставил лайков (всего): мужчины или женщины.

## Урок 7. Видеоурок. Сложные запросы

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_7.sql "Решение 7 задания")


1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
2. Выведите список товаров products и разделов catalogs, который соответствует товару.


## Урок 8. Вебинар. Сложные запросы

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_8.sql "Решение 8 задания")

1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
3. Определить кто больше поставил лайков (всего): мужчины или женщины.

## Урок 9. Видеоурок. Транзакции, переменные, представления. Администрирование. Хранимые процедуры и функции, триггер

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_9.sql "Решение 9 задания")

1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

## Урок 11. Видеоурок. Оптимизация запросов. NoSQL

[Вот тут решение](https://github.com/Progul/gb_mysql_homework/blob/master/homework_11.sql "Решение 11 задания")

1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.
