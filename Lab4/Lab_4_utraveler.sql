ALTER TABLE TRAVELER ADD country_id integer,
	FOREIGN KEY (country_id)
	REFERENCES COUNTRY (country_id);

/*
UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Great Britain')
WHERE traveler_id = 30000;

UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Austria')
WHERE traveler_id = 30003;

UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Italy')
WHERE traveler_id = 30002;

UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Great Britain')
WHERE traveler_id = 30006;

UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Corrusant')
WHERE traveler_id = 30008;

UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Russia')
WHERE traveler_id = 30009;

UPDATE TRAVELER
SET country_id = (SELECT c.country_id FROM COUNTRY c
					WHERE c.name = 'Czech')
WHERE traveler_id = 30001;

UPDATE TRAVELER
SET age = '10/08/2016'
WHERE traveler_id = 30011;

/*-------------------------------------------*/
ALTER TABLE REVIEW
ADD CONSTRAINT fk_review_casc
	FOREIGN KEY (traveler_id)
	REFERENCES TRAVELER (traveler_id)
	ON DELETE CASCADE

ALTER TABLE COMMENTS
ADD CONSTRAINT fk_commentsr_casc
	FOREIGN KEY (review_id)
	REFERENCES REVIEW (review_id)
	ON DELETE CASCADE
	
ALTER TABLE SUBSCRIBTION_POOL
ADD CONSTRAINT fk_spt_casc
	FOREIGN KEY (traveler_id)
	REFERENCES TRAVELER (traveler_id)
	ON DELETE CASCADE
/*------------------------------------------*/

DELETE FROM TRAVELER 
WHERE (DATEPART(yyyy,age)>DATEPART(yyyy,GETDATE())
	or (DATEPART(yyyy,age)=DATEPART(yyyy,GETDATE())
	and DATEPART(mm,age)>DATEPART(mm,GETDATE()))
	or (DATEPART(yyyy,age)=DATEPART(yyyy,GETDATE())
	and DATEPART(mm,age)=DATEPART(mm,GETDATE())
	and DATEPART(dd,age)>DATEPART(dd,GETDATE())))

SELECT * FROM TRAVELER;
*/

--Добавляем 