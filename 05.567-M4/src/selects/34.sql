-- Pàgina 34
SELECT codi_empl,
	nom_empl
FROM EMPLEATS
WHERE nom_empl LIKE 'J%';
SELECT codi_proj
FROM PROJECTES
WHERE TRIM(nom_proj) LIKE 'S____';