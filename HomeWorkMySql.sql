CREATE DATABASE mans_friends;

USE mans_friends;

CREATE TABLE dogs
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_s VARCHAR(20) NOT NULL UNIQUE,
    commands VARCHAR(20),
	date_s DATE NOT NULL
);

CREATE TABLE cats
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_s VARCHAR(20) NOT NULL UNIQUE,
    commands VARCHAR(20),
	date_s DATE NOT NULL
);

CREATE TABLE hamsters
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_s VARCHAR(20) NOT NULL UNIQUE,
    commands VARCHAR(20),
	date_s DATE NOT NULL
);

CREATE TABLE horses
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_s VARCHAR(20) NOT NULL UNIQUE,
    commands VARCHAR(20),
	date_s DATE NOT NULL
);

CREATE TABLE camels
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_s VARCHAR(20) NOT NULL UNIQUE,
    commands VARCHAR(20),
	date_s DATE NOT NULL
);

CREATE TABLE donkeys
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name_s VARCHAR(20) NOT NULL UNIQUE,
    commands VARCHAR(20),
	date_s DATE NOT NULL
);

INSERT INTO dogs (name_s, commands, date_s)
VALUES ('Рэкс', 'Лежать', '2022-12-01'), ('Мухтар', 'Сидеть', '2022-03-22'), ('Бетховен', 'Фас', '2021-11-11');

SELECT * FROM dogs;

INSERT INTO cats (name_s, commands, date_s)
VALUES ('Ричард', 'Ко мне', '2023-02-22'), ('Муся', 'Мяу', '2021-05-09'), ('Кузя', 'Кыс-кыс', '2020-07-17');

SELECT * FROM cats;

INSERT INTO hamsters (name_s, commands, date_s)
VALUES ('Хома1', 'Пить', '2022-12-30'), ('Хома2', null, '2021-12-29'), ('Хома3', 'Спать', '2021-08-08');

SELECT * FROM hamsters;

INSERT INTO horses (name_s, commands, date_s)
VALUES ('Алена', 'Идти', '20220101'), ('Жанна', 'Галоп', '20210402'), ('Валет', 'Рысью', '20230101');

SELECT * FROM horses;

INSERT INTO camels (name_s, commands, date_s)
VALUES ('Дин', 'Сидеть', '20200315'), ('Горбик', 'Бежать', '20200226'), ('Двугорбик', 'Плевать', '20211111');

SELECT * FROM camels;

INSERT INTO donkeys (name_s, commands, date_s)
VALUES ('Боря', 'Стоять', '20190609'), ('Моисей', 'Идти', '20200416'), ('Иа', 'Голос', '20211211');

SELECT * FROM donkeys;

DROP TABLE camels;

CREATE TABLE packAnimalNew (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT name_s, date_s FROM horses UNION 
SELECT  name_s, date_s FROM donkeys;

SELECT * FROM packAnimalNew;

CREATE TABLE pets (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT name_s, date_s FROM dogs UNION
SELECT name_s, date_s FROM cats UNION
SELECT name_s, date_s FROM hamsters;

SELECT * FROM pets;

CREATE TABLE humanFriend (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT name_s, date_s FROM pets UNION
SELECT name_s, date_s FROM packAnimalNew;

SELECT * FROM humanFriend;

CREATE TABLE youngAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT name_s, date_s, (YEAR(CURRENT_DATE)-YEAR(date_s))-(RIGHT(CURRENT_DATE,5)<RIGHT(date_s,5)) as age
FROM humanFriend
WHERE (YEAR(CURRENT_DATE)-YEAR(date_s))-(RIGHT(CURRENT_DATE,5)<RIGHT(date_s,5)) < 3
AND (YEAR(CURRENT_DATE)-YEAR(date_s))-(RIGHT(CURRENT_DATE,5)<RIGHT(date_s,5)) > 1;

SELECT * FROM youngAnimals;

CREATE TABLE newHumanFriends (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  name_s, commands, date_s, 'cats' as oldTable FROM cats UNION
SELECT  name_s, commands, date_s, 'dogs' as oldTable FROM dogs UNION
SELECT  name_s, commands, date_s, 'hamsters' as oldTable FROM hamsters UNION
SELECT  name_s, commands, date_s, 'horses' as oldTable FROM horses UNION
SELECT  name_s, commands, date_s, 'donkeys' as oldTable FROM donkeys;

SELECT * FROM newHumanFriends;