-- 7.
SELECT nom_dpt,
	ciutat_dpt,
	MAX(sou) AS sou_maxim
FROM EMPLEATS
GROUP BY nom_dpt,
	ciutat_dpt;