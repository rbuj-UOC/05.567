-- Pàgina 48
SELECT ciutat
FROM CLIENTS
WHERE ciutat IN (
		SELECT d.ciutat_dpt
		FROM DEPARTAMENTS d
	);
SELECT c.ciutat
FROM CLIENTS c
WHERE EXISTS (
		SELECT *
		FROM DEPARTAMENTS d
		WHERE c.ciutat = d.ciutat_dpt
	);
SELECT codi_cli
FROM CLIENTS
EXCEPT
SELECT codi_client
FROM PROJECTES;