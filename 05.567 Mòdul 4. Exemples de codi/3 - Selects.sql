-- Pàgina 29
SELECT *
FROM CLIENTS;

SELECT codi_cli, nom_cli, adreça, ciutat
FROM CLIENTS;

-- Pàgina 30
SELECT codi_empl
FROM EMPLEATS
WHERE num_proj = 4;

-- Pàgina 31
SELECT DISTINCT sou 
FROM EMPLEATS;

-- Pàgina 32
SELECT COUNT(*) AS nombre_dpt
FROM DEPARTAMENTS
WHERE ciutat_dpt = 'Lleida';

SELECT codi_proj, nom_proj
FROM PROJECTES
WHERE preu = (SELECT MAX(preu) FROM PROJECTES);

-- Pàgina 33
SELECT codi_empl
FROM EMPLEATS
WHERE sou BETWEEN 20000.0 AND 50000.0;

SELECT nom_dpt, ciutat_dpt
FROM DEPARTAMENTS
WHERE ciutat_dpt IN ('Lleida', 'Tarragona');

-- Pàgina 34
SELECT codi_empl, nom_empl
FROM EMPLEATS
WHERE nom_empl LIKE 'J%';

SELECT codi_proj
FROM PROJECTES
WHERE TRIM(nom_proj) LIKE 'S____';


-- Pàgina 35
SELECT codi_empl, nom_empl
FROM EMPLEATS
WHERE num_proj IS NULL;


SELECT codi_proj, nom_proj
FROM PROJECTES
WHERE preu > ALL
(
	SELECT sou
	FROM EMPLEATS
	WHERE codi_proj = num_proj
);

-- Pàgina 36
SELECT codi_proj, nom_proj
FROM PROJECTES
WHERE preu < ANY
(
	SELECT sou
	FROM EMPLEATS
	WHERE codi_proj = num_proj
);
-- No en retorna cap

SELECT codi_empl, nom_empl
FROM EMPLEATS
WHERE EXISTS
(
	SELECT *
	FROM PROJECTES
	WHERE codi_proj = num_proj
);

-- Pàgina 37
SELECT codi_empl, nom_empl, cognom_empl, sou
FROM EMPLEATS
ORDER BY sou, nom_empl;

-- Pàgina 38
SELECT nom_dpt, ciutat_dpt, AVG(sou) AS sou_mitja
FROM EMPLEATS
GROUP BY nom_dpt, ciutat_dpt;

--  Pàgina 39
SELECT num_proj
FROM EMPLEATS
GROUP BY num_proj
HAVING SUM(sou) > 180000.0;

-- Pàgina 40
SELECT PROJECTES.codi_proj, PROJECTES.preu, CLIENTS.nif
FROM CLIENTS, PROJECTES
WHERE CLIENTS.codi_cli = PROJECTES.codi_client
AND CLIENTS.codi_cli = 20;


SELECT p.codi_proj, p.preu, c.nif, p.codi_client, c.codi_cli
FROM CLIENTS c, PROJECTES p
WHERE c.codi_cli = p.codi_client
AND c.codi_cli = 20;

-- Pàgina 41
SELECT p.codi_proj, p.preu, c.nif, p.codi_client, c.codi_cli
FROM CLIENTS c JOIN PROJECTES p
ON c.codi_cli = p.codi_client
WHERE c.codi_cli = 20;

SELECT e1.codi_empl, e1.cognom_empl
FROM EMPLEATS e1 JOIN EMPLEATS e2
ON e1.sou > e2.sou
WHERE e2.codi_empl = 5;

-- Pàgina 42
SELECT codi_empl, nom_empl
FROM EMPLEATS NATURAL JOIN DEPARTAMENTS
WHERE telefon = '977.333.852'; 
-- no retorna res

SELECT codi_empl, nom_empl
FROM EMPLEATS JOIN DEPARTAMENTS
USING (nom_dpt,ciutat_dpt)
WHERE telefon = '977.33.38.52';

-- Pàgina 43
SELECT e.codi_empl, e.nom_empl, e.nom_dpt, e.ciutat_dpt, d.telefon
FROM EMPLEATS e NATURAL JOIN DEPARTAMENTS d;

-- Pàgina 44
SELECT e.codi_empl, e.nom_empl, e.nom_dpt, e.ciutat_dpt, d.telefon
FROM EMPLEATS e NATURAL LEFT OUTER JOIN DEPARTAMENTS d;

SELECT e.codi_empl, e.nom_empl, e.nom_dpt, e.ciutat_dpt, d.telefon
FROM EMPLEATS e NATURAL RIGHT OUTER JOIN DEPARTAMENTS d;

-- Pàgina 45
SELECT e.codi_empl, e.nom_empl, e.nom_dpt, e.ciutat_dpt, d.telefon
FROM EMPLEATS e NATURAL FULL OUTER JOIN DEPARTAMENTS d;

SELECT *
FROM EMPLEATS, PROJECTES, CLIENTS
WHERE num_proj = codi_proj
AND codi_client = codi_cli;

SELECT *
FROM (EMPLEATS JOIN PROJECTES
ON num_proj = codi_proj)
JOIN CLIENTS
ON codi_client = codi_cli;

-- Pàgina 46
SELECT ciutat
FROM CLIENTS
UNION 
SELECT ciutat_dpt
FROM DEPARTAMENTS;

-- Pàgina 47
SELECT ciutat
FROM CLIENTS
INTERSECT
SELECT ciutat_dpt
FROM DEPARTAMENTS;

-- Pàgina 48
SELECT ciutat
FROM CLIENTS
WHERE ciutat IN
(
	SELECT d.ciutat_dpt
	FROM DEPARTAMENTS d
);

SELECT c.ciutat
FROM CLIENTS c
WHERE EXISTS
(
	SELECT *
	FROM DEPARTAMENTS d
	WHERE c.ciutat = d.ciutat_dpt
);



SELECT codi_cli
FROM CLIENTS
EXCEPT
SELECT codi_client
FROM PROJECTES;

-- Pàgina 49
SELECT codi_cli
FROM CLIENTS
WHERE codi_cli NOT IN
(
	SELECT codi_client
	FROM PROJECTES
);

SELECT c.codi_cli
FROM CLIENTS c
WHERE NOT EXISTS
(
	SELECT *
	FROM PROJECTES p
	WHERE c.codi_cli = p.codi_client
);
