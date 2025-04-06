--  Pàgina 39
SELECT num_proj
FROM EMPLEATS
GROUP BY num_proj
HAVING SUM(sou) > 180000.0;