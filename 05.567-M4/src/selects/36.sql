-- Pàgina 36
SELECT codi_proj,
	nom_proj
FROM PROJECTES
WHERE preu < ANY (
		SELECT sou
		FROM EMPLEATS
		WHERE codi_proj = num_proj
	);
-- No en retorna cap
SELECT codi_empl,
	nom_empl
FROM EMPLEATS
WHERE EXISTS (
		SELECT *
		FROM PROJECTES
		WHERE codi_proj = num_proj
	);