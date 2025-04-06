-- Pàgina 33
SELECT codi_empl
FROM EMPLEATS
WHERE sou BETWEEN 20000.0 AND 50000.0;
SELECT nom_dpt,
	ciutat_dpt
FROM DEPARTAMENTS
WHERE ciutat_dpt IN ('Lleida', 'Tarragona');