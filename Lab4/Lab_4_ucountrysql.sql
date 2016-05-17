ALTER TABLE COUNTRY ADD track_number integer,
	CONSTRAINT CK_COUNTRY_track_number CHECK ((track_number = 10) OR (track_number = 11));

SELECT * FROM COUNTRY;

CREATE TABLE TRACKING (
	country_id integer NOT NULL PRIMARY KEY,
	track_number integer);

INSERT INTO TRACKING VALUES (1, 10);
INSERT INTO TRACKING VALUES (2, 10);
INSERT INTO TRACKING VALUES (3, 11);
INSERT INTO TRACKING VALUES (4, 11);
INSERT INTO TRACKING VALUES (5, 10);
INSERT INTO TRACKING VALUES (6, 12);
INSERT INTO TRACKING VALUES (7, 10);
INSERT INTO TRACKING VALUES (8, 11);

UPDATE c
SET track_number = t.track_number
FROM COUNTRY c
INNER JOIN TRACKING t ON c.country_id = t.country_id;

SELECT * FROM COUNTRY;

DROP TABLE TRACKING;

ALTER TABLE COUNTRY
DROP CONSTRAINT CK_COUNTRY_track_number,
COLUMN track_number;

SELECT * FROM COUNTRY;

--Добавляем столбец truck_number в таблицу COUNTRY, делаем на него ограничение, что его значиение может быть либо 10, либо 11
--Создаём таблицу TRACKING созначениями country_id и track_number, добавляем значения из TRACKING в COUNTRY, ловим 
--ошибку, тк одно из значений равно 12