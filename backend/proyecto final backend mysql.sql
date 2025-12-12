CREATE DATABASE pokedex;
USE pokedex;
drop database pokedex;
CREATE TABLE users(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
correo VARCHAR(50) UNIQUE,
contraseña VARCHAR(50)
);

INSERT INTO users VALUES(1, 'Giovanny', 'giovanny@gmail.com', 12345);

SELECT * FROM users;