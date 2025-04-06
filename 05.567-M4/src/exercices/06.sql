-- 6.
SELECT e.codi_empl,
	e.nom_empl,
	e.cognom_empl
FROM PROJECTES p,
	EMPLEATS e
WHERE e.num_proj = p.codi_proj
	AND p.preu = (
		SELECT MAX(p1.preu)
		FROM PROJECTES p1
	);
SELECT e.codi_empl,
	e.nom_empl,
	e.cognom_empl
FROM EMPLEATS e
	JOIN PROJECTES p ON e.num_proj = p.codi_proj
WHERE p.preu = (
		SELECT MAX(p1.preu)
		FROM PROJECTES p1
	);