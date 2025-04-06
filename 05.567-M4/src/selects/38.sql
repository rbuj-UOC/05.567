-- Pàgina 38
SELECT nom_dpt,
	ciutat_dpt,
	AVG(sou) AS sou_mitja
FROM EMPLEATS
GROUP BY nom_dpt,
	ciutat_dpt;