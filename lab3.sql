--ALTER TABLE HOTELS ADD email varchar(30), phone_number varchar(20), web_site varchar(30);
--INSERT INTO HOTELS SELECT email, phone_number, web_site FROM CONTACTS;
------ALTER TABLE HOTELS DROP COLUMN email, phone_number, web_site;

--ALTER TABLE TRAVELER WITH CHECK ADD CONSTRAINT check_age CHECK (age < '01/01/2016' and age > '01/01/1910');
--ALTER TABLE TRAVELER ADD CHECK (age < '01/01/2016' and age > '01/01/1910'); 

--ALTER TABLE HOTELS ALTER COLUMN email varchar(320);