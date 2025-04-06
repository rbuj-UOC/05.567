-- 5.
SELECT DISTINCT d.*
FROM DEPARTAMENTS d,
	EMPLEATS e,
	PROJECTES p
WHERE p.nom_proj = 'GESCOM'
	AND d.nom_dpt = e.nom_dpt
	AND d.ciutat_dpt = e.ciutat_dpt
	AND e.num_proj = p.codi_proj;
SELECT DISTINCT d.nom_dpt,
	d.ciutat_dpt,
	d.telefon
FROM (
		DEPARTAMENTS d
		NATURAL JOIN EMPLEATS e
	)
	JOIN PROJECTES p ON e.num_proj = p.codi_proj
WHERE nom_proj = 'GESCOM';