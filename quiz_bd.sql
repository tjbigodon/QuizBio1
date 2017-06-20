DROP DATABASE IF EXISTS quiz_bd;
CREATE DATABASE quiz_bd;
use quiz_bd;

CREATE TABLE usuario(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(30) NOT NULL,
nome VARCHAR(80) NOT NULL,
email TEXT NOT NULL,
senha TEXT NOT NULL,
tipo BIT DEFAULT 0
);

CREATE TABLE pontuacao(
id INT NOT NULL PRIMARY KEY,
id_usuario INT NOT NULL,
pontos INT,
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE questao(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
caminho TEXT DEFAULT NULL,
pergunta TEXT NOT NULL  
);

CREATE TABLE resposta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
resposta TEXT NOT NULL,
certa BIT NOT NULL DEFAULT 0,
id_pergunta INT NOT NULL,
FOREIGN KEY (id_pergunta) REFERENCES questao(id)
);

ALTER TABLE questao ADD resp_quest INT NOT NULL;
ALTER TABLE questao ADD CONSTRAINT resposta_pergunta FOREIGN KEY (resp_quest) REFERENCES resposta(id);
