DROP DATABASE IF EXISTS quiz_bd;
CREATE DATABASE quiz_bd;
use quiz_bd;

CREATE TABLE usuario(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(30) NOT NULL,
nome VARCHAR(80) NOT NULL,
email TEXT NOT NULL,
senha TEXT NOT NULL,
tipo INT(2) DEFAULT 0
);

INSERT INTO usuario(username, nome, senha, tipo) VALUES('admin', 'Administrador', MD5('admin'), 1);
INSERT INTO usuario(username, nome, senha, tipo) VALUES('Jehymes', 'Jehymison Gil_Alves Oliveira', MD5('123'), 0);
INSERT INTO usuario(username, nome, senha, tipo) VALUES('Maria', 'Maria_de Lima', MD5('12345'), 0);
INSERT INTO usuario(username, nome, senha, tipo) VALUES('Xanaina', 'Janaina_Pereira', MD5('12345'), 0);
INSERT INTO usuario(username, nome, senha, tipo) VALUES('Kabron', 'Rafael_Moura', MD5('12345'), 0);
INSERT INTO usuario(username, nome, senha, tipo) VALUES('Korean', 'Jockin_Jhon Hum', MD5('12345'), 0);

CREATE TABLE pontuacao(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_usuario INT NOT NULL,
pontos INT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE questao(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
caminho TEXT DEFAULT NULL,
titulo TEXT NOT NULL,
pergunta TEXT NOT NULL  
);

CREATE TABLE resposta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
resposta TEXT NOT NULL,
certa BOOLEAN NOT NULL DEFAULT 0,
id_pergunta INT NOT NULL,
FOREIGN KEY (id_pergunta) REFERENCES questao(id)
);