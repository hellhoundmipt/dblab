CREATE LOGIN testlog WITH PASSWORD = 'testlog'
CREATE USER testuser FOR LOGIN testlog

GRANT SELECT, INSERT, UPDATE ON REVIEW TO testuser
GRANT SELECT (hotel_name, stars, resept_start_time, resept_end_time, email, phone_number, web_site),
	UPDATE (resept_start_time, resept_end_time, email, phone_number, web_site) ON HOTELS TO testuser
GRANT SELECT ON TRAVELER TO testuser


DENY SELECT ON SUITE TO testuser
GRANT SELECT ON SUITE TO testuser

DENY UPDATE, INSERT ON SUITE TO testuser

GRANT SELECT ON test_view TO testuser

CREATE ROLE testrole
GRANT UPDATE(review) ON test_view TO testrole

EXECUTE sp_addrolemember testrole, testuser

EXECUTE AS LOGIN = 'testlog'

SELECT * FROM HOTELS

SELECT * FROM test_view

UPDATE test_view
SET review = 'Oink-oink-oink!'
WHERE traveler  = 'Waddles Pines'

SELECT * FROM TRAVELER

INSERT INTO REVIEW VALUES (50015, 30010, 1018, 4, 'Modest hotel with all necessary appliences.', '2015-12-05')

SELECT * FROM REVIEW

SELECT * FROM SUITE

/*DROP USER testuser
DROP LOGIN testlog

DROP ROLE testrole*/
REVERT