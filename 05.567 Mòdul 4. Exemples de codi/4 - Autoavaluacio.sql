-- 1.
SELECT cognom_empl, nom_empl, codi_empl
FROM EMPLEATS
ORDER BY cognom_empl DESC, nom_empl DESC;

-- 2.
SELECT p.codi_proj, p.nom_proj
FROM PROJECTES p, CLIENTS c
WHERE c.ciutat = 'Barcelona'
AND c.codi_cli = p.codi_client;

SELECT p.codi_proj, p.nom_proj
FROM PROJECTES p JOIN CLIENTS c
ON c.codi_cli = p.codi_client
WHERE c.ciutat = 'Barcelona';

-- 3.
SELECT DISTINCT e.nom_dpt, e.ciutat_dpt
FROM EMPLEATS e
WHERE e.num_proj IN (3,4);

-- 4.
SELECT e.codi_empl, p.nom_proj
FROM EMPLEATS e, PROJECTES p
WHERE e.sou BETWEEN 50000.0 AND 80000.0
AND e.num_proj = p.codi_proj;

SELECT e.codi_empl, p.nom_proj
FROM EMPLEATS e JOIN PROJECTES p
ON e.num_proj = p.codi_proj
WHERE e.sou BETWEEN 50000.0 AND 80000.0;

-- 5.
SELECT DISTINCT d.*
FROM DEPARTAMENTS d, EMPLEATS e, PROJECTES p
WHERE p.nom_proj = 'GESCOM'
AND d.nom_dpt = e.nom_dpt
AND d.ciutat_dpt = e.ciutat_dpt
AND e.num_proj = p.codi_proj;

SELECT DISTINCT d.nom_dpt, d.ciutat_dpt, d.telefon
FROM (DEPARTAMENTS d NATURAL JOIN EMPLEATS e)
JOIN PROJECTES p
ON e.num_proj = p.codi_proj
WHERE nom_proj = 'GESCOM';

-- 6.
SELECT e.codi_empl, e.nom_empl, e.cognom_empl
FROM PROJECTES p, EMPLEATS e
WHERE e.num_proj = p.codi_proj
AND p.preu = (SELECT MAX(p1.preu) FROM PROJECTES p1);

SELECT e.codi_empl, e.nom_empl, e.cognom_empl
FROM EMPLEATS e JOIN PROJECTES p
ON e.num_proj = p.codi_proj
WHERE p.preu = (SELECT MAX(p1.preu) FROM PROJECTES p1);

-- 7.
SELECT nom_dpt, ciutat_dpt, MAX(sou) AS sou_maxim
FROM EMPLEATS
GROUP BY nom_dpt, ciutat_dpt;

-- 8.
SELECT c.codi_cli, c.nom_cli
FROM PROJECTES p, CLIENTS c
WHERE c.codi_cli = p.codi_client
GROUP BY c.codi_cli, c.nom_cli
HAVING COUNT(*) > 1;

SELECT c.codi_cli, c.nom_cli
FROM PROJECTES p JOIN CLIENTS c
ON c.codi_cli = p.codi_client
GROUP BY c.codi_cli, c.nom_cli
HAVING COUNT(*) > 1;

-- 9.
SELECT p.codi_proj, p.nom_proj
FROM PROJECTES p, EMPLEATS e
WHERE e.num_proj = p.codi_proj
GROUP BY p.codi_proj, p.nom_proj
HAVING MIN(e.sou) > 30000.0;

SELECT p.codi_proj, p.nom_proj
FROM EMPLEATS e JOIN PROJECTES p
ON e.num_proj = p.codi_proj
GROUP BY p.codi_proj, p.nom_proj
HAVING MIN(e.sou) > 30000.0;

-- 10.
SELECT d.nom_dpt, d.ciutat_dpt
FROM DEPARTAMENTS d
WHERE NOT EXISTS
(
	SELECT *
	FROM EMPLEATS e
	WHERE e.nom_dpt = d.nom_dpt
	AND e.ciutat_dpt = d.ciutat_dpt
);

SELECT nom_dpt, ciutat_dpt
FROM DEPARTAMENTS
EXCEPT
SELECT nom_dpt, ciutat_dpt
FROM EMPLEATS;
