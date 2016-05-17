SELECT CONCAT(t.first_name, ' ', t.second_name, ' <', t.nickname, '>') AS person--, t.age,
--CONCAT(sc.first_name, ' ', sc.second_name, ' <', sc.nickname, '>') AS person2, sc.age, sp.subscribtion_id
FROM TRAVELER t, SUBSCRIBTION_POOL sp, TRAVELER sc
WHERE sp.traveler_id = t.traveler_id
AND sp.subscr_id = sc.traveler_id
AND (DATEPART(yyyy,sc.age)>DATEPART(yyyy,t.age)
	or (DATEPART(yyyy,sc.age)=DATEPART(yyyy,t.age)
	and DATEPART(mm,sc.age)>DATEPART(mm,t.age))
	or (DATEPART(yyyy,sc.age)=DATEPART(yyyy,t.age)
	and DATEPART(mm,sc.age)=DATEPART(mm,t.age)
	and DATEPART(dd,sc.age)>DATEPART(dd,t.age)))
GROUP BY CONCAT(t.first_name, ' ', t.second_name, ' <', t.nickname, '>');

--Вывести путешественников, которые подписаны на более молодых людей
