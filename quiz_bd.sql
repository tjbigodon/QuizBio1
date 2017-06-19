DROP DATABASE IF EXISTS quiz_bd;
CREATE DATABASE quiz_bd;
use quiz_bd;

CREATE TABLE usuario(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
email TEXT NOT NULL,
senha TEXT NOT NULL
);

CREATE TABLE pontuacao(
id INT NOT NULL PRIMARY KEY,
id_usuario INT NOT NULL,
pontos INT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE pergunta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
caminho TEXT,
pergunta TEXT NOT NULL  
);

CREATE TABLE resposta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
resposta TEXT NOT NULL,
id_pergunta INT NOT NULL,
FOREIGN KEY (id_pergunta) REFERENCES pergunta(id)
);

ALTER TABLE pergunta ADD resp_certa INT NOT NULL;
ALTER TABLE pergunta ADD CONSTRAINT resposta_pergunta FOREIGN KEY (resp_certa) REFERENCES resposta(id);