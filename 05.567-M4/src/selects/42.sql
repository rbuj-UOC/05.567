-- Pàgina 42
SELECT codi_empl,
	nom_empl
FROM EMPLEATS
	NATURAL JOIN DEPARTAMENTS
WHERE telefon = '977.333.852';
-- no retorna res
SELECT codi_empl,
	nom_empl
FROM EMPLEATS
	JOIN DEPARTAMENTS USING (nom_dpt, ciutat_dpt)
WHERE telefon = '977.33.38.52';