CREATE DATABASE museu;

USE museu;

CREATE TABLE usuari (
	nom_usuari VARCHAR(255) PRIMARY KEY,
	contrasenya VARCHAR(255),
    tipus_usuari INT CHECK (tipus_usuari IN (0, 1, 2)) -- Usuari convidat = 0, Usuari tècnic = 1, Usuari administració = 2
);

CREATE TABLE autories (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE classificacio_generica (
    id_classificacio_generica INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE material (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE codi_getty (
    id_codi_getty INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE tecnica (
    id_tecnica INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE codi_getty_tecnica (
    id_codi_getty_tecnica INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE codi_autor (
    id_codi_autor INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
);

CREATE TABLE forma_ingres (
    id_forma_ingres INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
    -- Inserts
);

CREATE TABLE causa_baixa (
    id_causa_baixa INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
    -- Inserts
);

CREATE TABLE estat_conservacio (
    id_estat_conservacio INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
    -- Inserts
);

CREATE TABLE tipus_exposicio (
    id_tipus_exposicio INT AUTO_INCREMENT PRIMARY KEY,
    descripcio TEXT
    -- Inserts
);

CREATE TABLE datacions (
    id_datacions INT AUTO_INCREMENT PRIMARY KEY,
    datacio TEXT,
    any_inicial INT,
    any_final INT
    -- Inserts
);

CREATE TABLE be_patrimonial (
    n_registre_be_patrimonial INT AUTO_INCREMENT PRIMARY KEY, -- ID del be_patrimonial
    nom_museu VARCHAR(255),
    fotografia VARCHAR(255),
    nom_objecte VARCHAR(255),
    col_leccio_procedencia VARCHAR(255),
    mides_max_alcada_cm DECIMAL(5,2),
    mides_max_amplada_cm DECIMAL(5,2),
    mides_max_profunditat_cm DECIMAL(5,2),
    titol VARCHAR(255),
    ubicacio_actual VARCHAR(255),
    data_registre DATE,
    nombre_exemplars INT,
    data_ingres DATE,
    font_ingres VARCHAR(255),
    baixa BOOLEAN,
    data_baixa DATE,
    persona_autoritz_baixa VARCHAR(255),
    lloc_execucio VARCHAR(255),
    lloc_procedencia VARCHAR(255),
    num_tiratge VARCHAR(255),
    altres_nums_identificacio VARCHAR(255),
    valoracio_economica DECIMAL(10,2),
	bibliografia TEXT,
    descripcio TEXT,
    historia_objecte TEXT,
    -- Referencies
    id_autor INT,
    id_classificacio_generica INT,
    id_material INT,
    id_codi_getty INT,
    id_tecnica INT,
    id_codi_getty_tecnica INT,
    id_codi_autor INT,
    id_forma_ingres INT,
    id_causa_baixa INT,
    id_estat_conservacio INT,
    id_tipus_exposicio INT,
    id_datacions INT,
    FOREIGN KEY (id_autor) REFERENCES autories(id_autor),
    FOREIGN KEY (id_classificacio_generica) REFERENCES classificacio_generica(id_classificacio_generica),
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_codi_getty) REFERENCES codi_getty(id_codi_getty),
    FOREIGN KEY (id_tecnica) REFERENCES tecnica(id_tecnica),
    FOREIGN KEY (id_codi_getty_tecnica) REFERENCES codi_getty_tecnica(id_codi_getty_tecnica),
    FOREIGN KEY (id_codi_autor) REFERENCES codi_autor(id_codi_autor),
    FOREIGN KEY (id_forma_ingres) REFERENCES forma_ingres(id_forma_ingres),
    FOREIGN KEY (id_causa_baixa) REFERENCES causa_baixa(id_causa_baixa),
    FOREIGN KEY (id_estat_conservacio) REFERENCES estat_conservacio(id_estat_conservacio),
    FOREIGN KEY (id_tipus_exposicio) REFERENCES tipus_exposicio(id_tipus_exposicio),
    FOREIGN KEY (id_datacions) REFERENCES datacions(id_datacions)
);

CREATE TABLE exposicio (
	id_exposicio INT AUTO_INCREMENT PRIMARY KEY, -- ID de exposició
    exposicio VARCHAR(255), -- text
	data_inici_exposicio DATE, -- DD/MM/AAAA
	data_fi_exposicio DATE, -- DD/MM/AAAA
	tipus_exposicio VARCHAR(255), -- llista
	lloc_exposicio VARCHAR(255) -- text
);

CREATE TABLE be_exposicio (
    id_be_exposicio INT AUTO_INCREMENT PRIMARY KEY, -- ID de la obra
    be_patrimonial_id INT,
    exposicio_id INT,
    FOREIGN KEY (be_patrimonial_id) REFERENCES be_patrimonial(n_registre_be_patrimonial),
    FOREIGN KEY (exposicio_id) REFERENCES exposicio(id_exposicio)
);

CREATE TABLE ubicacio (
    id_ubicacio INT AUTO_INCREMENT PRIMARY KEY, -- ID de la ubicació
	be_patrimonial_id INT,
	data_inici_ubicacio DATE,
	data_fi_ubicacio DATE,
	comentari_ubicacio TEXT,
	FOREIGN KEY (be_patrimonial_id) REFERENCES be_patrimonial(n_registre_be_patrimonial)
);

CREATE TABLE restauracio (
    codi_restauracio VARCHAR(8) PRIMARY KEY, -- Codi unic (RestXXXX)
	be_patrimonial_id INT, -- Referencia a la taula be_patrimonial
	data_inici_restauracio DATE, -- DD/MM/AAAA
	data_fi_restauracio DATE, -- DD/MM/AAAA
	comentari_restauracio TEXT, -- (text molt llarg)
	nom_restaurador VARCHAR(255), -- text
	FOREIGN KEY (be_patrimonial_id) REFERENCES be_patrimonial(n_registre_be_patrimonial)
);

CREATE TABLE conservacio (
    codi_conservacio VARCHAR(8) PRIMARY KEY, -- Codi unic (ConsXXXX)
	be_patrimonial_id INT, -- Referencia a la taula be_patrimonial
	data_inici_conservacio DATE, -- DD/MM/AAAA
	data_fi_conservacio DATE, -- DD/MM/AAAA
	comentari_conservacio TEXT, -- (text molt llarg)
	nom_conservador VARCHAR(255), -- text
	FOREIGN KEY (be_patrimonial_id) REFERENCES be_patrimonial(n_registre_be_patrimonial)
);


-- INSERTS

INSERT INTO forma_ingres (descripcio) VALUES ('cessió');
INSERT INTO forma_ingres (descripcio) VALUES ('comodat');
INSERT INTO forma_ingres (descripcio) VALUES ('compra');
INSERT INTO forma_ingres (descripcio) VALUES ('dació');
INSERT INTO forma_ingres (descripcio) VALUES ('desconeguda');
INSERT INTO forma_ingres (descripcio) VALUES ('dipòsit');
INSERT INTO forma_ingres (descripcio) VALUES ('donació');
INSERT INTO forma_ingres (descripcio) VALUES ('entrega obligatòria');
INSERT INTO forma_ingres (descripcio) VALUES ('excavació');
INSERT INTO forma_ingres (descripcio) VALUES ('expropiació');
INSERT INTO forma_ingres (descripcio) VALUES ('herència');
INSERT INTO forma_ingres (descripcio) VALUES ('intercanvi');
INSERT INTO forma_ingres (descripcio) VALUES ('llegat');
INSERT INTO forma_ingres (descripcio) VALUES ('ocupació');
INSERT INTO forma_ingres (descripcio) VALUES ('ofrena');
INSERT INTO forma_ingres (descripcio) VALUES ('permuta');
INSERT INTO forma_ingres (descripcio) VALUES ('premi');
INSERT INTO forma_ingres (descripcio) VALUES ('propietat directa');
INSERT INTO forma_ingres (descripcio) VALUES ('recol.lecció');
INSERT INTO forma_ingres (descripcio) VALUES ('recuperació');
INSERT INTO forma_ingres (descripcio) VALUES ('successió interadministrativa');


INSERT INTO causa_baixa (descripcio) VALUES ('Confiscació');
INSERT INTO causa_baixa (descripcio) VALUES ('Destrucció');
INSERT INTO causa_baixa (descripcio) VALUES ('Estat de conservació molt deficient');
INSERT INTO causa_baixa (descripcio) VALUES ('Manteniment i restauració onerós');
INSERT INTO causa_baixa (descripcio) VALUES ('Pèrdua');
INSERT INTO causa_baixa (descripcio) VALUES ('Robatori');
INSERT INTO causa_baixa (descripcio) VALUES ('Successió interadministrativa');
INSERT INTO causa_baixa (descripcio) VALUES ('Valor patrimonial insuficient');


INSERT INTO estat_conservacio (descripcio) VALUES ('Bo');
INSERT INTO estat_conservacio (descripcio) VALUES ('Dolent');
INSERT INTO estat_conservacio (descripcio) VALUES ('Excel·lent');
INSERT INTO estat_conservacio (descripcio) VALUES ('Indeterminat');
INSERT INTO estat_conservacio (descripcio) VALUES ('desconeguda');
INSERT INTO estat_conservacio (descripcio) VALUES ('Regular');


INSERT INTO tipus_exposicio (descripcio) VALUES ('Aliena');
INSERT INTO tipus_exposicio (descripcio) VALUES ('Pròpia');


INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle IV ante', -400, -301);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle IV ante', -400, -351);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle IV ante', -400, -376);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle IV ante', -375, -351);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle IV ante', -350, -301);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle IV ante', -350, -326);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle IV ante', -325, -301);
-- Sigle III ante
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle III ante', -300, -201);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle III ante', -300, -251);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle III ante', -300, -276);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle III ante', -275, -251);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle III ante', -250, -201);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle III ante', -250, -226);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle III ante', -225, -201);

-- Sigle II ante
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle II ante', -200, -101);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle II ante', -200, -151);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle II ante', -200, -176);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle II ante', -175, -151);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle II ante', -150, -101);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle II ante', -150, -126);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle II ante', -125, -101);

-- Sigle I ante
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle I ante', -100, -1);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle I ante', -100, -51);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle I ante', -100, -76);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle I ante', -75, -51);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle I ante', -50, -1);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle I ante', -50, -26);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle I ante', -25, -1);

-- Sigle I (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle I', 1, 100);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle I', 1, 50);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle I', 1, 25);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle I', 26, 50);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle I', 51, 100);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle I', 51, 75);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle I', 76, 100);

-- Sigle II (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle II', 101, 200);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle II', 101, 150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle II', 101, 125);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle II', 126, 150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle II', 151, 200);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle II', 151, 175);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle II', 176, 200);

-- Sigle III (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle III', 201, 300);
-- Sigle III (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle III', 201, 250);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle III', 201, 225);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle III', 226, 250);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle III', 251, 300);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle III', 251, 275);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle III', 276, 300);

-- Sigle IV (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle IV', 301, 400);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle IV', 301, 350);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle IV', 301, 325);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle IV', 326, 350);
-- Segle IV (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle IV', 351, 400);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle IV', 351, 375);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle IV', 376, 400);

-- Segle V (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle V', 401, 500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle V', 401, 450);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle V', 401, 425);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle V', 426, 450);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle V', 451, 500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle V', 451, 475);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle V', 476, 500);

-- Segle VI (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle VI', 501, 600);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle VI', 501, 550);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle VI', 501, 525);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle VI', 526, 550);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle VI', 551, 600);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle VI', 551, 575);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle VI', 576, 600);

-- Segle VII (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle VII', 601, 700);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle VII', 601, 650);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle VII', 601, 625);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle VII', 626, 650);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle VII', 651, 700);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle VII', 651, 675);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle VII', 676, 700);

-- Segle VIII (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle VIII', 701, 800);
-- Segle VIII (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle VIII', 701, 750);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle VIII', 701, 725);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle VIII', 726, 750);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle VIII', 751, 800);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle VIII', 751, 775);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle VIII', 776, 800);

-- Segle IX (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle IX', 801, 900);
-- Segle IX (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle IX', 801, 850);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle IX', 801, 825);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle IX', 826, 850);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle IX', 851, 900);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle IX', 851, 875);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle IX', 876, 900);

-- Segle X (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle X', 901, 1000);
-- Segle X (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle X', 901, 950);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle X', 901, 925);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle X', 926, 950);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle X', 951, 1000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle X', 951, 975);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle X', 976, 1000);

-- Segle XI (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle XI', 1001, 1100);
-- Segle XI (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XI', 1001, 1050);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XI', 1001, 1025);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XI', 1026, 1050);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XI', 1051, 1100);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XI', 1051, 1075);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XI', 1076, 1100);

-- Segle XII (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XII', 1101, 1150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XII', 1101, 1125);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XII', 1126, 1150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XII', 1151, 1200);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XII', 1151, 1175);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XII', 1176, 1200);

-- Segle XIII (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XIII', 1201, 1250);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XIII', 1201, 1225);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XIII', 1226, 1250);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XIII', 1251, 1300);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XIII', 1251, 1275);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XIII', 1276, 1300);

-- Segle XIV (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle XIV', 1301, 1400);
-- Segle XIV (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XIV', 1301, 1350);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XIV', 1301, 1325);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XIV', 1326, 1350);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XIV', 1351, 1400);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XIV', 1351, 1375);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XIV', 1376, 1400);

-- Segle XV (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XV', 1401, 1450);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XV', 1401, 1425);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XV', 1426, 1450);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XV', 1451, 1500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XV', 1451, 1475);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XV', 1476, 1500);
-- Segle XVI (després de Crist)
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XVI', 1500, 1550);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XVI', 1500, 1525);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XVI', 1526, 1550);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XVI', 1551, 1600);
-- Segle XVI
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XVI', 1551, 1575);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XVI', 1576, 1600);


-- Segle XVII
INSERT INTO datacions(datacio, any_inicial, any_final) VALUES ('segle XVII', 1601, 1700);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XVII', 1600, 1650);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XVII', 1600, 1625);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XVII', 1626, 1650);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XVII', 1651, 1700);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XVII', 1650, 1675);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XVII', 1676, 1700);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle XVIII', 1701, 1800);

INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XVIII', 1700, 1750);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XVIII', 1700, 1750);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XVIII', 1700, 1725);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XVIII', 1726, 1750);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XVIII', 1751, 1800);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XVIII', 1751, 1775);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XVIII', 1776, 1800);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle XIX', 1800, 1900);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XIX', 1800, 1850);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XIX', 1800, 1825);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1800', 1800, 1810);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1810', 1810, 1820);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1820', 1820, 1830);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XIX', 1826, 1850);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1830', 1831, 1840);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1840', 1841, 1850);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XIX', 1851, 1900);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XIX', 1851, 1875);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1850', 1851, 1860);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1860', 1861, 1870);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1870', 1871, 1880);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XIX', 1876, 1900);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1880', 1881, 1890);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1890', 1891, 1900);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle XX', 1901, 2000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XX', 1901, 1950);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XX', 1901, 1925);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1900', 1901, 1910);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1910', 1911, 1920);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1920 i 1930', 1921, 1930);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1920', 1921, 1940);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XX', 1926, 1950);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1930 i 1940', 1931, 1940);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1930', 1931, 1940);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1940', 1941, 1950);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segona meitat segle XX', 1951, 2000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('tercer quart segle XX', 1951, 1975);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1950', 1951, 1960);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1960', 1961, 1970);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1970', 1971, 1980);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('últim quart segle XX', 1976, 2000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1980', 1981, 1990);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('dècada 1990', 1991, 2000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segle XXI', 2001, 2100);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primera meitat segle XXI', 2001, 2050);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('primer quart segle XXI', 2001, 2025);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('segon quart segle XXI', 2026, 2050);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('abans', NULL ,NULL );
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('circa', NULL ,NULL );
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('posterior', NULL ,NULL );
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('precis', NULL ,NULL );
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític', -3000000, -9000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític inferior', -3000000, -120000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític inferior arcaic', -3000000, -600000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític inferior peces evolucionades', -599999, -120000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític inferior-mig indiferenciat', -119999, -50000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític mig', -89999, -33000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític superior', -22999, -9000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('paleolític-epipaleolític', -10999, -7000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('epipaleolític', -8999, -5000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('neolític', -5499, -2200);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('neolític antic', -5499, -3500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('neolític antic cardial', -5499, -4000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('neolític antic postcardial', -3999, -3500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('neolític mig-recent', -3499, -2500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('neolític final', -2499, -2000);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('calcolític', -2199, -1800);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('bronze', -1799, -650);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('bronze antic', -1799, -1500);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('bronze mig', -1499, -1200);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('bronze final', -1199, -650);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('ferro-ibèric-colonitzacions', -649, 50);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('ferro-ibèric antic', -649, -450);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('ferro-ibèric ple', -449, -200);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('romà', -218, 476);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('romà república', -218, -50);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('ferro-ibèric final', -199, -50);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('romà August', -27, 14);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('romà alt imperi', 14, 192);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('romà segle III', 192, 284);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('romà baix imperi', 284, 476);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval', 400, 1492);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval domini visigòtic', 401, 715);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval ocupació i domini musulmà', 715, 799);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval món islàmic', 800, 1150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval Catalunya vella sota Carolingis', 800, 988);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval món islàmic Emirat', 800, 899);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval món islàmic Califat', 900, 1015);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval comptes de Barcelona', 988, 1150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval món islàmic Taifes', 1016, 1150);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval consolidació Corona d,Arago', 1150, 1230);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('medieval baixa edat mitjana', 1230, 1492);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('modern', 1492, 1789);
INSERT INTO datacions (datacio, any_inicial, any_final) VALUES ('contemporani', 1798, NULL);  -- NULL si no hay año final














