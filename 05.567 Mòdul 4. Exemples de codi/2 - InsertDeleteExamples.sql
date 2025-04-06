/* Se suposa que les taules ja estan creades, en cas contrari ho podeu fer amb:
	ubd_crearBD;	*/

-- Exemples d'inserció
INSERT INTO CLIENTS
VALUES (10, 'ECIGSA', '37.248.573-C', 'ARAGO 242', 'Barcelona', DEFAULT);
-- Comprovació: SELECT * FROM CLIENTS; 

-- Si s'ha executat la instrucció anterior aquesta donarà un error de clau duplicada
INSERT INTO CLIENTS(nif, nom_cli, codi_cli, telefon, adreça, ciutat) 
VALUES('37.248.573-C', 'ECIGSA', 10, DEFAULT, 'ARAGO 242', 'Barcelona');
-- Resultat: ERROR: duplicate key value violates unique constraint "CLIENTS_pkey"

-- Si esborreu la taula recordeu tornar-la a crear
DELETE FROM PROJECTES;
-- Comprovació:  SELECT * FROM PROJECTES;
-- Recordeu que a PROJECTES encara no hi heu entrat dades, feu primer l'INSERT
DELETE FROM PROJECTES
WHERE codi_client = 2;
-- Comprovació:  NO TORNA RES

-- Recordeu que a EMPLEATS encara no hi heu entrat dades, feu primer l'INSERT
UPDATE EMPLEATS
SET sou = sou + 1000.0
WHERE num_proj = 2;
-- Comprovació:  NO TORNA RES

-- Completem les insercions amb les dades d'exemple
-- Inserció sense especificar les columnes 
INSERT INTO DEPARTAMENTS VALUES ('DIR','Barcelona','93.422.60.70');
INSERT INTO DEPARTAMENTS VALUES ('DIR','Girona','972.23.89.70');
INSERT INTO DEPARTAMENTS VALUES ('DISS','Lleida','973.23.50.40');
INSERT INTO DEPARTAMENTS VALUES ('DISS','Barcelona','93.224.85.23');
INSERT INTO DEPARTAMENTS VALUES ('PROG','Tarragona','977.33.38.52');
INSERT INTO DEPARTAMENTS VALUES ('PROG','Girona','972.23.50.91');
-- Comprovació:  SELECT * FROM DEPARTAMENTS; 

-- Inserció especificant les columnes
INSERT INTO CLIENTS(codi_cli, nom_cli, nif, adreça, ciutat, telefon)
VALUES ('20','CME','38.123.898-E','Valencia 22','Girona','972.23.57.21');

INSERT INTO CLIENTS(codi_cli, nom_cli, nif, adreça, ciutat, telefon)
VALUES ('30','ACME','36.432.127-A','Mallorca 33','Lleida','973.23.45.67');

INSERT INTO CLIENTS(codi_cli, nom_cli, nif, adreça, ciutat, telefon)
VALUES ('40','JGM','38.782.345-B','Rossello 44','Tarragona','977.33.71.43');
-- Comprovació: SELECT * FROM CLIENTS; 

-- Posem dades a PROJECTES abans que a EMPLEATS per mantenir la integritat referencial, malgrat que al mòdul ho posa després.
SET datestyle = DMY; -- Depenent de la instal·lació, fa falta especificar aquest format de data per no tenir errors d'inserció.
INSERT INTO PROJECTES
VALUES ('1','GESCOM','1000000.0','1-1-98','1-1-99',NULL,'10');

INSERT INTO PROJECTES
VALUES ('2','PESCI','2000000.0','1-10-96','31-3-98','1-5-98','10');

INSERT INTO PROJECTES
VALUES ('3','SALSA','1000000.0','10-2-98','1-2-99',NULL,'20');

INSERT INTO PROJECTES
VALUES ('4','TINELL','4000000.0','1-1-97','1-12-99',NULL,'30');
-- Comprovació: SELECT * FROM PROJECTES;

INSERT INTO EMPLEATS
VALUES ('1','Maria','Puig','100000.0','DIR','Girona','1');

INSERT INTO EMPLEATS
VALUES ('2','Pere','Mas','90000.0','DIR','Barcelona','4');

INSERT INTO EMPLEATS
VALUES ('3','Anna','Ros','70000.0','DISS','Lleida','3');

INSERT INTO EMPLEATS
VALUES ('4','Jordi','Roca','70000.0','DISS','Barcelona','4');

INSERT INTO EMPLEATS
VALUES ('5','Clara','Blanc','40000.0','PROG','Tarragona','1');

INSERT INTO EMPLEATS
VALUES ('6','Laura','Tort','30000.0','PROG','Tarragona','3');
-- Comprovació: SELECT * FROM EMPLEATS;

-- És important adonar-se que la FOREIGN KEY accepta valors NULL
INSERT INTO EMPLEATS
VALUES ('7','Roger','Salt','40000.0',NULL,NULL,'4');

INSERT INTO EMPLEATS
VALUES ('8','Sergi','Grau','30000.0','PROG','Tarragona',NULL);
-- Comprovació: SELECT * FROM EMPLEATS;







