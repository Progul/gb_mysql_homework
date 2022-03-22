1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT firstname, lastname from users WHERE id = (
SELECT from_user_id
	FROM messages
	WHERE to_user_id = 1
	GROUP BY from_user_id
	ORDER BY COUNT(from_user_id) DESC
	LIMIT 1
);

2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

SELECT COUNT(*) as 'likes count'
FROM likes
WHERE user_id IN (
	SELECT user_id
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10)
;
