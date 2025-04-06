-- Pàgina 40
SELECT PROJECTES.codi_proj,
	PROJECTES.preu,
	CLIENTS.nif
FROM CLIENTS,
	PROJECTES
WHERE CLIENTS.codi_cli = PROJECTES.codi_client
	AND CLIENTS.codi_cli = 20;
SELECT p.codi_proj,
	p.preu,
	c.nif,
	p.codi_client,
	c.codi_cli
FROM CLIENTS c,
	PROJECTES p
WHERE c.codi_cli = p.codi_client
	AND c.codi_cli = 20;