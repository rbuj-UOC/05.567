-- 2.
SELECT p.codi_proj,
	p.nom_proj
FROM PROJECTES p,
	CLIENTS c
WHERE c.ciutat = 'Barcelona'
	AND c.codi_cli = p.codi_client;
SELECT p.codi_proj,
	p.nom_proj
FROM PROJECTES p
	JOIN CLIENTS c ON c.codi_cli = p.codi_client
WHERE c.ciutat = 'Barcelona';