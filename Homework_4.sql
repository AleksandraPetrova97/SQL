USE vk;

-- Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.

SELECT
	uc.user_id AS 'Пользователь',
	count(*) AS 'Количество групп'
FROM users_communities AS uc
JOIN communities AS c ON c.id = uc.user_id 
GROUP BY user_id 

-- проверяем

SELECT 
	uc.user_id,
	uc.community_id 
FROM users_communities AS uc
JOIN communities AS c ON c.id = uc.user_id 

-- Подсчитать количество пользователей в каждом сообществе.

SELECT
	c.id AS 'Сообщество',
	count(*) AS 'Количество пользователей'
FROM communities AS c
JOIN users_communities AS uc ON uc.user_id=c.id 
GROUP BY id  

-- проверяем
SELECT
	c.id AS 'Сообщество',
	uc.user_id
FROM communities AS c
JOIN users_communities AS uc ON uc.user_id=c.id 

-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT
	m.from_user_id,
	count(*) AS 'количество',
	m.to_user_id
FROM messages AS m 
WHERE m.to_user_id = 1
GROUP BY m.from_user_id 
ORDER BY количество DESC 
LIMIT 1

-- проверяем
SELECT * 
FROM messages 
WHERE from_user_id = 8
	AND to_user_id  = 1


* Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..

SELECT 
	count(l.media_id) AS 'Количество лайков'
FROM likes AS l
JOIN profiles AS p ON p.user_id = l.user_id 
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) < 18;

* Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT 
	p.gender,
	count(p.gender)
FROM likes AS l
JOIN profiles AS p ON p.user_id = l.user_id 
WHERE p.gender = 'm' OR p.gender = 'f'
GROUP BY p.gender 