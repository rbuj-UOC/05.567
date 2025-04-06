-- Pàgina 32
SELECT COUNT(*) AS nombre_dpt
FROM DEPARTAMENTS
WHERE ciutat_dpt = 'Lleida';
SELECT codi_proj,
	nom_proj
FROM PROJECTES
WHERE preu = (
		SELECT MAX(preu)
		FROM PROJECTES
	);