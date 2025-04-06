CREATE TABLE CLIENTS (
	codi_cli INTEGER,
	nom_cli CHAR(30) NOT NULL,
	nif CHAR(12),
	adreça CHAR(30),
	ciutat CHAR(20),
	telefon CHAR(12) DEFAULT NULL,
	PRIMARY KEY(codi_cli),
	UNIQUE(nif)
);
CREATE TABLE DEPARTAMENTS (
	nom_dpt CHAR(20),
	ciutat_dpt CHAR(20),
	telefon CHAR(12) DEFAULT NULL,
	PRIMARY KEY (nom_dpt, ciutat_dpt)
);
CREATE TABLE PROJECTES (
	codi_proj INTEGER,
	nom_proj CHAR(20),
	preu REAL,
	data_inici DATE,
	data_prev_fi DATE,
	data_fi DATE DEFAULT NULL,
	codi_client INTEGER,
	PRIMARY KEY (codi_proj),
	FOREIGN KEY (codi_client) REFERENCES CLIENTS(codi_cli),
	CHECK (data_inici < data_prev_fi),
	CHECK (data_inici < data_fi)
);
CREATE TABLE EMPLEATS (
	codi_empl INTEGER,
	nom_empl CHAR(20),
	cognom_empl CHAR(20),
	sou REAL CHECK(sou > 7000.0),
	nom_dpt CHAR(20),
	ciutat_dpt CHAR(20),
	num_proj INTEGER,
	PRIMARY KEY (codi_empl),
	FOREIGN KEY (nom_dpt, ciutat_dpt) REFERENCES DEPARTAMENTS(nom_dpt, ciutat_dpt),
	FOREIGN KEY (num_proj) REFERENCES PROJECTES(codi_proj)
);
-- Exemples d'inserció
INSERT INTO CLIENTS
VALUES (
		10,
		'ECIGSA',
		'37.248.573-C',
		'ARAGO 242',
		'Barcelona',
		DEFAULT
	);
-- Inserció especificant les columnes
INSERT INTO CLIENTS(codi_cli, nom_cli, nif, adreça, ciutat, telefon)
VALUES (
		'20',
		'CME',
		'38.123.898-E',
		'Valencia 22',
		'Girona',
		'972.23.57.21'
	);
INSERT INTO CLIENTS(codi_cli, nom_cli, nif, adreça, ciutat, telefon)
VALUES (
		'30',
		'ACME',
		'36.432.127-A',
		'Mallorca 33',
		'Lleida',
		'973.23.45.67'
	);
INSERT INTO CLIENTS(codi_cli, nom_cli, nif, adreça, ciutat, telefon)
VALUES (
		'40',
		'JGM',
		'38.782.345-B',
		'Rossello 44',
		'Tarragona',
		'977.33.71.43'
	);
-- Inserció sense especificar les columnes 
INSERT INTO DEPARTAMENTS
VALUES ('DIR', 'Barcelona', '93.422.60.70');
INSERT INTO DEPARTAMENTS
VALUES ('DIR', 'Girona', '972.23.89.70');
INSERT INTO DEPARTAMENTS
VALUES ('DISS', 'Lleida', '973.23.50.40');
INSERT INTO DEPARTAMENTS
VALUES ('DISS', 'Barcelona', '93.224.85.23');
INSERT INTO DEPARTAMENTS
VALUES ('PROG', 'Tarragona', '977.33.38.52');
INSERT INTO DEPARTAMENTS
VALUES ('PROG', 'Girona', '972.23.50.91');
-- Posem dades a PROJECTES abans que a EMPLEATS per mantenir la integritat referencial, malgrat que al mòdul ho posa després.
SET datestyle = DMY;
-- Depenent de la instal·lació, fa falta especificar aquest format de data per no tenir errors d'inserció.
INSERT INTO PROJECTES
VALUES (
		'1',
		'GESCOM',
		'1000000.0',
		'1-1-98',
		'1-1-99',
		NULL,
		'10'
	);
INSERT INTO PROJECTES
VALUES (
		'2',
		'PESCI',
		'2000000.0',
		'1-10-96',
		'31-3-98',
		'1-5-98',
		'10'
	);
INSERT INTO PROJECTES
VALUES (
		'3',
		'SALSA',
		'1000000.0',
		'10-2-98',
		'1-2-99',
		NULL,
		'20'
	);
INSERT INTO PROJECTES
VALUES (
		'4',
		'TINELL',
		'4000000.0',
		'1-1-97',
		'1-12-99',
		NULL,
		'30'
	);
-- Comprovació: SELECT * FROM PROJECTES;
INSERT INTO EMPLEATS
VALUES ('1', 'Maria', 'Puig', '100000.0', 'DIR', 'Girona', '1');
INSERT INTO EMPLEATS
VALUES ('2', 'Pere', 'Mas', '90000.0', 'DIR', 'Barcelona', '4');
INSERT INTO EMPLEATS
VALUES ('3', 'Anna', 'Ros', '70000.0', 'DISS', 'Lleida', '3');
INSERT INTO EMPLEATS
VALUES (
		'4',
		'Jordi',
		'Roca',
		'70000.0',
		'DISS',
		'Barcelona',
		'4'
	);
INSERT INTO EMPLEATS
VALUES (
		'5',
		'Clara',
		'Blanc',
		'40000.0',
		'PROG',
		'Tarragona',
		'1'
	);
INSERT INTO EMPLEATS
VALUES (
		'6',
		'Laura',
		'Tort',
		'30000.0',
		'PROG',
		'Tarragona',
		'3'
	);
-- Comprovació: SELECT * FROM EMPLEATS;
-- És important adonar-se que la FOREIGN KEY accepta valors NULL
INSERT INTO EMPLEATS
VALUES ('7', 'Roger', 'Salt', '40000.0', NULL, NULL, '4');
INSERT INTO EMPLEATS
VALUES (
		'8',
		'Sergi',
		'Grau',
		'30000.0',
		'PROG',
		'Tarragona',
		NULL
	);
-- Comprovació: SELECT * FROM EMPLEATS;