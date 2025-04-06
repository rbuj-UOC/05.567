-- 8.
SELECT c.codi_cli,
	c.nom_cli
FROM PROJECTES p,
	CLIENTS c
WHERE c.codi_cli = p.codi_client
GROUP BY c.codi_cli,
	c.nom_cli
HAVING COUNT(*) > 1;
SELECT c.codi_cli,
	c.nom_cli
FROM PROJECTES p
	JOIN CLIENTS c ON c.codi_cli = p.codi_client
GROUP BY c.codi_cli,
	c.nom_cli
HAVING COUNT(*) > 1;