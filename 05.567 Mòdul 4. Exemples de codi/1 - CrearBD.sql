/* Se suposa que la BD ja està creada, en cas contrari ho podeu fer amb:
	CREATE DATABASE DBUOC; */

CREATE TABLE CLIENTS 
(
	codi_cli INTEGER,
	nom_cli CHAR(30) NOT NULL,
	nif CHAR(12),
	adreça CHAR(30),
	ciutat CHAR(20),
	telefon CHAR(12) DEFAULT NULL,
	PRIMARY KEY(codi_cli),
	UNIQUE(nif)
);


CREATE TABLE DEPARTAMENTS
(
	nom_dpt CHAR(20),
	ciutat_dpt CHAR(20),
	telefon CHAR(12) DEFAULT NULL,
	PRIMARY KEY (nom_dpt, ciutat_dpt)
);


CREATE TABLE PROJECTES
(
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

CREATE TABLE EMPLEATS
(
	codi_empl INTEGER,
	nom_empl CHAR(20),
	cognom_empl CHAR(20),
	sou REAL CHECK(sou > 7000.0),
	nom_dpt CHAR(20),
	ciutat_dpt CHAR(20),
	num_proj INTEGER,
	PRIMARY KEY (codi_empl),
	FOREIGN KEY (nom_dpt, ciutat_dpt)
	REFERENCES DEPARTAMENTS(nom_dpt, ciutat_dpt),
	FOREIGN KEY (num_proj) REFERENCES PROJECTES(codi_proj)
);
