-- Pàgina 41
SELECT p.codi_proj,
	p.preu,
	c.nif,
	p.codi_client,
	c.codi_cli
FROM CLIENTS c
	JOIN PROJECTES p ON c.codi_cli = p.codi_client
WHERE c.codi_cli = 20;
SELECT e1.codi_empl,
	e1.cognom_empl
FROM EMPLEATS e1
	JOIN EMPLEATS e2 ON e1.sou > e2.sou
WHERE e2.codi_empl = 5;