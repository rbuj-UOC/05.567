-- 4.
SELECT e.codi_empl,
	p.nom_proj
FROM EMPLEATS e,
	PROJECTES p
WHERE e.sou BETWEEN 50000.0 AND 80000.0
	AND e.num_proj = p.codi_proj;
SELECT e.codi_empl,
	p.nom_proj
FROM EMPLEATS e
	JOIN PROJECTES p ON e.num_proj = p.codi_proj
WHERE e.sou BETWEEN 50000.0 AND 80000.0;