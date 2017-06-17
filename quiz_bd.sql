CREATE DATABASE IF NOT EXISTS quiz_bd;

use quiz_bd;

CREATE TABLE pergunta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pergunta TEXT NOT NULL, 
resp_certa INT NOT NULL,
FOREIGN KEY (resp_certa) REFERENCES resposta(id)  
 );

CREATE TABLE resposta(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
resposta TEXT NOT NULL,
id_pergunta INT NOT NULL,
FOREIGN KEY (id_pergunta) REFERENCES pergunta(id)
);

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