-- Pàgina 44
SELECT e.codi_empl,
	e.nom_empl,
	e.nom_dpt,
	e.ciutat_dpt,
	d.telefon
FROM EMPLEATS e NATURAL
	LEFT OUTER JOIN DEPARTAMENTS d;
SELECT e.codi_empl,
	e.nom_empl,
	e.nom_dpt,
	e.ciutat_dpt,
	d.telefon
FROM EMPLEATS e NATURAL
	RIGHT OUTER JOIN DEPARTAMENTS d;