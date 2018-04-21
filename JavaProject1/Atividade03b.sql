/*v03*/
CREATE TABLE Conhecidas (
Nome_1 VARCHAR(30)NOT NULL,
razao_bloq VARCHAR(30),
bloq BOOLEAN,
PRIMARY KEY(Nome_1)
);

CREATE TABLE Pessoa (
Nome_Completo VARCHAR(30)NOT NULL,
Login VARCHAR(30),
Cidade_Natal VARCHAR(30),
PRIMARY KEY (Login)
);

CREATE TABLE Turma (
Nome VARCHAR(30),
PRIMARY KEY (Nome)
);

CREATE TABLE Pertence (
ID_PERTENCE INTEGER NOT NULL,
ID_C INTEGER,
ID_F INTEGER,
PRIMARY KEY (ID_PERTENCE),
FOREIGN KEY(ID_C) REFERENCES Categoria (ID_C)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(ID_F) REFERENCES Filme (ID_F)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE Produtor (
Telefone INTEGER,
Endereco VARCHAR(30),
ID_P INTEGER,
PRIMARY KEY(ID_P)
);

CREATE TABLE Produz (
ID_Produz INTEGER,
Funcao VARCHAR(30),
ID_P INTEGER,
ID_F INTEGER,
PRIMARY KEY(ID_Produz),
FOREIGN KEY(ID_P) REFERENCES Produtor (ID_P)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(ID_F) REFERENCES Filme (ID_F)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE Musico (
ID_M INTEGER NOT NULL,
Nome VARCHAR(30),
Estilo VARCHAR(30),
Nascimento VARCHAR(30),
PRIMARY KEY(ID_M)
);

CREATE TABLE Categoria (
ID_C INTEGER, 
NomeCategoria VARCHAR(30),
subcategoria VARCHAR(30),
PRIMARY KEY(ID_C)
);

CREATE TABLE Filme (
ID_F INTEGER,
Lancamento VARCHAR(30),
Nome VARCHAR(30),
PRIMARY KEY(ID_F)
);

CREATE TABLE Gosta1 (
ID_G1 INTEGER NOT NULL,
Avaliacao INTEGER,
Login VARCHAR(30),
ID_F INTEGER,
PRIMARY KEY(ID_G1),
FOREIGN KEY(ID_F) REFERENCES Filme (ID_F)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(login) REFERENCES Pessoa (login)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE Gosta2 (
ID_G2 INTEGER NOT NULL,
Avaliacao INTEGER,
Login VARCHAR(30),
ID_A INTEGER,
PRIMARY KEY(ID_G2),
FOREIGN KEY(ID_A) REFERENCES artistas_musicais (id_a)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(login) REFERENCES Pessoa (login)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE Conhece (
ID_CONHECE INTEGER NOT NULL,
Nome_1 VARCHAR(30),
Login VARCHAR(30),
PRIMARY KEY(ID_CONHECE),
FOREIGN KEY(Nome_1) REFERENCES Conhecidas (Nome_1)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(Login) REFERENCES Pessoa (Login)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE Artistas_Musicais (
ID_A INTEGER,
Nome_Art VARCHAR(30),
Genero VARCHAR(30),
Pais VARCHAR(30),
PRIMARY KEY(ID_A)
);

CREATE TABLE Possui1 (
ID_Possui1 INTEGER NOT NULL,
Nome VARCHAR(30),
Login VARCHAR(30),
PRIMARY KEY(ID_Possui1),
FOREIGN KEY(Nome) REFERENCES Turma (Nome)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(login) REFERENCES Pessoa (login)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

CREATE TABLE Possui2 (
ID_Possui2 INTEGER NOT NULL,
ID_M INTEGER,
ID_A INTEGER,
PRIMARY KEY(ID_Possui2),
FOREIGN KEY(ID_M) REFERENCES Musico (ID_M)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
FOREIGN KEY(ID_A) REFERENCES Artistas_Musicais (ID_A)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

ALTER TABLE Gosta2 ADD FOREIGN KEY(ID_A) REFERENCES Artistas_Musicais (ID_A);
ALTER TABLE Gosta2 ADD FOREIGN KEY(Login) REFERENCES Pessoa (Login);
ALTER TABLE Pertence ADD FOREIGN KEY(ID_C) REFERENCES Categoria (ID_C);
ALTER TABLE Pertence ADD FOREIGN KEY(ID_F) REFERENCES Filme (ID_F);
ALTER TABLE Produz ADD FOREIGN KEY(ID_F) REFERENCES Filme (ID_F);

INSERT INTO Artistas_Musicais VALUES ('0', 'Guns N Rose', 'Rock', 'EUA');
INSERT INTO Artistas_Musicais VALUES ('1', 'Legiao Urbana', 'Rock', 'Brasil');
INSERT INTO Artistas_Musicais VALUES ('2', 'Annita', 'MuitoRuim', 'Brasil');
INSERT INTO Artistas_Musicais VALUES ('3', 'Restart', 'Death Metal', 'Brasil')
INSERT INTO Artistas_Musicais VALUES ('4', 'Vitas', 'MPBosta', 'Russia (Claro)')
INSERT INTO Artistas_Musicais VALUES ('5', 'Cleiton Rasta','Reggae','Brasil')

INSERT INTO Categoria VALUES('0', 'Terror', 'Ficção Científica');
INSERT INTO Categoria VALUES('1', 'Romance','Suspense');
INSERT INTO Categoria VALUES('2', 'Acao','Porno');
INSERT INTO Categoria VALUES('3', 'Ficção Científica', 'Boa');
INSERT INTO Categoria VALUES('4', 'Ficção Científica', 'Fantasia');
INSERT INTO Categoria VALUES('5', 'Ação','Suspense');

INSERT INTO Pessoa VALUES('Gabriel Peres','gabperes','Curitiba');
INSERT INTO Pessoa VALUES('Wilian Cavassin','cavassin', 'Roma');
INSERT INTO Pessoa VALUES('Ze Neto','zedao','Minas Gerais');
INSERT INTO Pessoa VALUES('Derpina','derp','Cuiába');
INSERT INTO Pessoa VALUES('Mia Kalifa','miakalifa','Florianopólis');
INSERT INTO pessoa VALUES('Sasha Graves','sashinha','Belém');

INSERT INTO Conhecidas VALUES('Derpina','NUDES','TRUE');
INSERT INTO Conhecidas VALUES('Mia Kalifa','MAIS NUDES','TRUE');
INSERT INTO Conhecidas VALUES('Sasha Graves','POSTAR CORRENTE DE NUDES','TRUE');
INSERT INTO Conhecidas VALUES('Wilian Cavassin','POSTS POLÍTICOS','TRUE')
INSERT INTO Conhecidas VALUES('Ze Neto','-*-','FALSE')
INSERT INTO Conhecidas VALUES('Gabriel Peres','-*-','FALSE')

INSERT INTO filme VALUES('0', 'Star Wars','1977-01-01');
INSERT INTO filme VALUES('1', 'Full Metal','1987-01-01');
INSERT INTO filme VALUES('2', 'Fiction','1994-01-01');
INSERT INTO filme VALUES('3', 'Brasil','1998-01-01');
INSERT INTO filme VALUES('4', 'Game Of Thrones','2002-01-01');
INSERT INTO filme VALUES('5', 'ole','2002-01-01');

INSERT INTO gosta1 VALUES('0','5', 'gabperes', '0');
INSERT INTO gosta1 VALUES('1','4', 'gabperes', '1');
INSERT INTO gosta1 VALUES('2','3', 'gabperes', '2');
INSERT INTO gosta1 VALUES('3','3', 'gabperes', '3');
INSERT INTO gosta1 VALUES('4','4', 'gabperes', '4');
INSERT INTO gosta1 VALUES('5','0', 'zedao', '3');
INSERT INTO gosta1 VALUES('6','1', 'zedao', '2');

INSERT INTO gosta2 VALUES('0','4', 'gabperes', '1');
INSERT INTO gosta2 VALUES('1','5', 'gabperes', '2');
INSERT INTO gosta2 VALUES('2','0', 'gabperes', '3');
INSERT INTO gosta2 VALUES('3','0', 'gabperes', '4');
INSERT INTO gosta2 VALUES('4','0', 'zedao', '4');
INSERT INTO gosta2 VALUES('5','0', 'zedao', '5');

INSERT INTO musico VALUES('0', 'Annota', 'Rock', '1789-01-01');
INSERT INTO musico VALUES('1', 'Renato Russo', 'Rock', '1789-01-01');
INSERT INTO musico VALUES('2', 'Marcelo Bonfá', 'Rock', '1789-01-01');
INSERT INTO musico VALUES('3', 'Renato Rocha', 'Rock', '1789-01-01');
INSERT INTO musico VALUES('4', 'Antônio Carlos Jobim', 'Bossa-Nova', '1789-01-01');
INSERT INTO musico VALUES('5', 'Paulo Ricardo', 'Rock', '1789-01-01');

INSERT INTO possui1 VALUES('0', 'Gabriel Peres', 'gabperes');
INSERT INTO possui1 VALUES('1', 'José Neto', 'zedao');
INSERT INTO possui1 VALUES('2', 'Derpina', 'derp');

INSERT INTO possui2 VALUES('0','2','0');
INSERT INTO possui2 VALUES('1','2','1');
INSERT INTO possui2 VALUES('2','2','2');

INSERT INTO produtor VALUES('69696969','Rua Do Amanhecer 69','0');
INSERT INTO produtor VALUES('67676767','Rua Das Oliveiras 67','1');
INSERT INTO produtor VALUES('12121212','Rua Das Laranjeiras 12','2');
INSERT INTO produtor VALUES('40404040','Rua Botelho Pinto 2','3');
INSERT INTO produtor VALUES('10101010','Rua José da Costa 13','4');
INSERT INTO produtor VALUES('13131313','Rua da Policia Federal 77','5');

INSERT INTO produz VALUES('0','Ator','0','0');
INSERT INTO produz VALUES('1','Diretor','1','1');
INSERT INTO produz VALUES('2','Ator e Diretor','2','3');
INSERT INTO produz VALUES('3','Diretor','3','2');
INSERT INTO produz VALUES('4','Ator','4','5');
INSERT INTO produz VALUES('5','Ator','5','4');

INSERT INTO turma VALUES('José Neto');
INSERT INTO turma VALUES('Wilian Cavassin');
INSERT INTO turma VALUES('Fernando Levy');
INSERT INTO turma VALUES('Gabriel Peres');
INSERT INTO turma VALUES('Augusta Silva');
INSERT INTO turma VALUES('Alana Souza');

INSERT INTO Conhece VALUES(0, 'Mia Kalifa', 'miakalifa');
INSERT INTO Conhece VALUES(1, 'Sasha Graves', 'sashinha');
INSERT INTO Conhece VALUES(2, 'Derpina', 'derp');

INSERT INTO Pertence VALUES('0', '4', '0');
INSERT INTO Pertence VALUES('1', '2', '4');
INSERT INTO Pertence VALUES('2', '2', '3');
INSERT INTO Pertence VALUES('3', '0', '2');
