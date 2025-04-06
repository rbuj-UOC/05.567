-- 9.
SELECT p.codi_proj,
	p.nom_proj
FROM PROJECTES p,
	EMPLEATS e
WHERE e.num_proj = p.codi_proj
GROUP BY p.codi_proj,
	p.nom_proj
HAVING MIN(e.sou) > 30000.0;
SELECT p.codi_proj,
	p.nom_proj
FROM EMPLEATS e
	JOIN PROJECTES p ON e.num_proj = p.codi_proj
GROUP BY p.codi_proj,
	p.nom_proj
HAVING MIN(e.sou) > 30000.0;