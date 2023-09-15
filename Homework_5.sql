USE vk;

-- Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]

CREATE OR REPLACE VIEW view_1 AS 
SELECT
	uc.user_id AS 'Пользователь',
	count(*) AS 'Количество групп'
FROM users_communities AS uc
JOIN communities AS c ON c.id = uc.user_id 
GROUP BY user_id 

-- Выведите данные, используя написанное представление [SELECT]

SELECT * FROM view_1
WHERE Пользователь = 2; -- Добавила фильтр

-- Удалите представление [DROP VIEW]

DROP VIEW view_1;

-- * СКОЛЬКО НОВОСТЕЙ (ЗАПИСЕЙ В ТАБЛИЦЕ MEDIA) У КАЖДОГО ПОЛЬЗОВАТЕЛЯ? ВЫВЕСТИ ПОЛЯ: 
-- NEWS_COUNT (КОЛИЧЕСТВО НОВОСТЕЙ), USER_ID (НОМЕР ПОЛЬЗОВАТЕЛЯ), USER_EMAIL (EMAIL ПОЛЬЗОВАТЕЛЯ). 
-- ПОПРОБОВАТЬ РЕШИТЬ С ПОМОЩЬЮ CTE ИЛИ С ПОМОЩЬЮ ОБЫЧНОГО JOIN.

SELECT 
	m.user_id AS 'Пользователь',
	count(m.user_id) AS 'Количество новостей',
	u.email 
FROM media m 
JOIN users u ON u.id = m.user_id 
GROUP BY m.user_id;



WITH cte1 AS (
	SELECT 
		user_id as 'Пользователь',
		count(*) AS 'Количество_новостей'
	FROM media
	GROUP BY user_id
)
SELECT
	Количество_новостей,
	Пользователь,
	u.email
FROM cte1 
JOIN users AS u ON u.id = cte1.Пользователь;