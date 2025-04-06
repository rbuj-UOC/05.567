-- Pàgina 43
SELECT e.codi_empl,
	e.nom_empl,
	e.nom_dpt,
	e.ciutat_dpt,
	d.telefon
FROM EMPLEATS e
	NATURAL JOIN DEPARTAMENTS d;