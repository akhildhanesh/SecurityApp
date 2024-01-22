CREATE DATABASE IF NOT EXISTS authenticationDB;

USE `authenticationDB`;

DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `User_Auth` (
  `user_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `User_Auth`
VALUES
(1, 'user1@example.com','{noop}user1password',1),
(2, 'user2@example.com','{noop}user2password',1),
(3, 'user3@example.com','{noop}user3password',1);


CREATE TABLE `User_Details` (
  `user_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`email`,`role`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`email`) REFERENCES `User_Auth` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `User_Details`
VALUES
(1, 'user1@example.com','ROLE_USER'),
(2, 'user2@example.com','ROLE_USER'),
(3, 'user3@example.com','ROLE_USER');


