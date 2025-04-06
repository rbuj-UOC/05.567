-- 10.
SELECT d.nom_dpt,
	d.ciutat_dpt
FROM DEPARTAMENTS d
WHERE NOT EXISTS (
		SELECT *
		FROM EMPLEATS e
		WHERE e.nom_dpt = d.nom_dpt
			AND e.ciutat_dpt = d.ciutat_dpt
	);
SELECT nom_dpt,
	ciutat_dpt
FROM DEPARTAMENTS
EXCEPT
SELECT nom_dpt,
	ciutat_dpt
FROM EMPLEATS;