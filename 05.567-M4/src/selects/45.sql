-- Pàgina 45
SELECT e.codi_empl,
	e.nom_empl,
	e.nom_dpt,
	e.ciutat_dpt,
	d.telefon
FROM EMPLEATS e NATURAL
	FULL OUTER JOIN DEPARTAMENTS d;
SELECT *
FROM EMPLEATS,
	PROJECTES,
	CLIENTS
WHERE num_proj = codi_proj
	AND codi_client = codi_cli;
SELECT *
FROM (
		EMPLEATS
		JOIN PROJECTES ON num_proj = codi_proj
	)
	JOIN CLIENTS ON codi_client = codi_cli;