-- Pàgina 35
SELECT codi_empl,
	nom_empl
FROM EMPLEATS
WHERE num_proj IS NULL;
SELECT codi_proj,
	nom_proj
FROM PROJECTES
WHERE preu > ALL (
		SELECT sou
		FROM EMPLEATS
		WHERE codi_proj = num_proj
	);