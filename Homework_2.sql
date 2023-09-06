USE vk;

DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
	id SERIAL,
	name VARCHAR(50),
	albums_users_id BIGINT UNSIGNED NOT NULL UNIQUE,
	description VARCHAR(150),
    created_at DATETIME DEFAULT NOW(),
    
    INDEX albums_name_idx(name), -- индексу можно давать свое имя (albums_name_idx)
    FOREIGN KEY (albums_users_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
	id SERIAL,
	name VARCHAR(50),
	albums_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	description VARCHAR(150),
    created_at DATETIME DEFAULT NOW(),

    INDEX photo_name(name),
    PRIMARY KEY (user_id, albums_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (albums_id) REFERENCES albums(id)
);

ALTER TABLE likes ADD COLUMN photo_id BIGINT UNSIGNED NOT NULL;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `password_hash`, `email`, `phone`) 
VALUES 
('1', 'Alexa', 'Petrova', 'serial: 2511 number: 123456', 'alexapet@example.net', '9192291407'),
('2', 'Leonid', 'Petrov', 'serial: 2512 number: 123457', 'leopetrov@example.net', '9192291457'),
('3', 'Larisa', 'Malkova', 'serial: 2501 number: 123856', 'Larisamal@example.net', '9192991407'),
('4', 'Grisha', 'Petrov', 'serial: 2611 number: 129456', 'petrovgr@example.net', '9192291497'),
('5', 'Alisa', 'Korovina', 'serial: 2571 number: 103456', 'alkor@example.net', '9199291407'),
('6', 'Mariya', 'Korovina', 'serial: 2711 number: 113456', 'markorov@example.net', '9192298407'),
('7', 'Sasha', 'Malsova', 'serial: 3511 number: 125456', 'malsovasasha@example.net', '9197291407'),
('8', 'Elena', 'Kuprianova', 'serial: 2811 number: 323456', 'kupri@example.net', '9192691407'),
('9', 'Tamara', 'Nikolaeva', 'serial: 9511 number: 523456', 'nikolaeva@example.net', '9195291407'),
('10', 'Lera', 'Zotova', 'serial: 1511 number: 156456', 'zotlera@example.net', '9192491407');

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`) 
VALUES 
('1', 'G', '1997-04-07'),
('2', 'M', '1996-05-02'),
('3', 'G', '1975-11-21'),
('4', 'M', '2010-03-17'),
('5', 'G', '1985-10-25'),
('6', 'G', '1999-05-03'),
('7', 'G', '2011-10-01'),
('8', 'G', '1974-12-12'),
('9', 'G', '2014-10-09'),
('10', 'G', '1998-02-05');

ALTER TABLE profiles ADD COLUMN is_active
BOOLEAN NOT NULL DEFAULT false;

Select is_active
from profiles;

UPDATE profiles
SET	is_active = true
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >= 18;

UPDATE profiles
SET	is_active = true
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >= 18;

DELETE FROM messages 
WHERE created_at > NOW();










