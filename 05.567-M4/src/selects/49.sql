-- Pàgina 49
SELECT codi_cli
FROM CLIENTS
WHERE codi_cli NOT IN (
		SELECT codi_client
		FROM PROJECTES
	);
SELECT c.codi_cli
FROM CLIENTS c
WHERE NOT EXISTS (
		SELECT *
		FROM PROJECTES p
		WHERE c.codi_cli = p.codi_client
	);