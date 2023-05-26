CREATE TABLE IF NOT EXISTS `User` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `login` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS `Product` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `price` INT NOT NULL
);
CREATE TABLE IF NOT EXISTS `Cart` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    CONSTRAINT `fk_product_id`
    FOREIGN KEY (product_id)
    REFERENCES Product (id)
    ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `fk_user_id`
    FOREIGN KEY (user_id)
    REFERENCES Product (id) 
    ON DELETE CASCADE ON UPDATE RESTRICT
);
INSERT INTO User (login, password, first_name, last_name, email)
VALUES('Vivian', 'V1V2', 'Vivian', 'Brew', 'v1vb@gmail.com');
INSERT INTO User (login, password, first_name, last_name, email)
VALUES('John', 'John123', 'John', 'Cook', 'johncook@gmail.com');
INSERT INTO User (login, password, first_name, last_name, email)
VALUES('Bob', 'fryfreqwfyh', 'Bob', 'Taylor', 'bobtylr@gmail.com');


INSERT INTO Product (name, category, price) VALUES('Macbook Air M1 2021 13', 'Apple laptops', 2000);
INSERT INTO Product (name, category, price) VALUES('Lenovo IdeaPad 3', 'Lenovo laptops', 1200);
INSERT INTO Product (name, category, price) VALUES ('Iphone 14', 'Iphones', 1000);
INSERT INTO Cart (user_id, product_id, quantity) VALUES(1, 2, 10);
INSERT INTO Cart (user_id, product_id, quantity) VALUES(2, 3, 5);
INSERT INTO Cart (user_id, product_id, quantity) VALUES(3, 1, 2);
SELECT * FROM User;
SELECT * FROM Product;
SELECT * FROM Cart;
