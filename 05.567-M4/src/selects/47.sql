-- Pàgina 47
SELECT ciutat
FROM CLIENTS
INTERSECT
SELECT ciutat_dpt
FROM DEPARTAMENTS;