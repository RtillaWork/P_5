-- Adminer 4.7.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `express_food`;
CREATE DATABASE `express_food` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `express_food`;

DROP TABLE IF EXISTS `AddressType`;
CREATE TABLE `AddressType` (
  `idAddressType` int(11) NOT NULL AUTO_INCREMENT,
  `AddressType` varchar(32) NOT NULL,
  `AddressDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`idAddressType`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `AddressType` (`idAddressType`, `AddressType`, `AddressDescription`) VALUES
(0,	'UnknownAddress',	'Unknown or undetermined address'),
(1,	'MainResidence',	'Main Residence'),
(2,	'OtherResidence',	'Other Residence'),
(4,	'HomeAddress',	'Home address'),
(5,	'WorkAddress',	'Work address'),
(6,	'DeliveryAddress',	'Delivery address');

DROP TABLE IF EXISTS `Adress`;
CREATE TABLE `Adress` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `idAddressType` int(11) NOT NULL DEFAULT 0,
  `idUserFK` int(11) NOT NULL,
  `addressDescription` varchar(80) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `streetName` varchar(255) NOT NULL,
  `streetNumber` varchar(255) NOT NULL,
  `postalCode` varchar(6) DEFAULT NULL,
  `Remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `idAddressType` (`idAddressType`) USING BTREE,
  KEY `idUserFK` (`idUserFK`) USING BTREE,
  CONSTRAINT `Adress_ibfk_1` FOREIGN KEY (`idAddressType`) REFERENCES `AddressType` (`idAddressType`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `Adress` (`idAddress`, `idAddressType`, `idUserFK`, `addressDescription`, `unit`, `streetName`, `streetNumber`, `postalCode`, `Remarks`) VALUES
(1,	6,	7,	'Downtown',	'5',	'324',	'54 ave',	't7e3x2',	''),
(2,	2,	6,	'My business',	'',	'12712',	'34 st',	'66100',	''),
(3,	4,	5,	'Left Turn after 32nd St',	'',	'6545',	'78 Ave',	't8e3s2',	''),
(4,	4,	5,	'',	'33',	'345',	'543 Blvd',	't7y2s3',	''),
(5,	2,	4,	'',	'524',	'Main',	'65 AVE',	't7u9w2',	''),
(6,	6,	3,	'',	'623',	'23',	'21 st',	't2a1d5',	''),
(7,	1,	2,	'',	'721',	'12',	'77 ave',	't5r3z5',	''),
(8,	5,	8,	'',	'81',	'518',	'31 st',	't8w1z6',	'');

DROP TABLE IF EXISTS `BillingProfile`;
CREATE TABLE `BillingProfile` (
  `idBillingProfile` int(11) NOT NULL,
  `dateOfBirth` datetime NOT NULL,
  `preferredPaymentMethod` varchar(255) NOT NULL,
  `idClient` int(11) NOT NULL,
  KEY `idClient` (`idClient`) USING BTREE,
  CONSTRAINT `BillingProfile_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `BillingProfile` (`idBillingProfile`, `dateOfBirth`, `preferredPaymentMethod`, `idClient`) VALUES
(1,	'1978-02-10 00:00:00',	'Paypal',	2),
(2,	'1972-03-08 00:00:00',	'Paypal',	3),
(3,	'1977-04-04 00:00:00',	'MasterCard',	8),
(4,	'1956-12-01 00:00:00',	'ApplePay',	5),
(5,	'1994-12-01 00:00:00',	'Cash',	7),
(6,	'1984-01-11 00:00:00',	'Cash',	4),
(7,	'1999-03-05 00:00:00',	'Cash',	6);

DROP TABLE IF EXISTS `Ingredients`;
CREATE TABLE `Ingredients` (
  `idIngredient` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `calories` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`idIngredient`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `Ingredients` (`idIngredient`, `name`, `calories`, `picture`) VALUES
(1,	'couscous',	'160',	''),
(2,	'tomatoes',	'230',	''),
(3,	'whole grain pasta',	'350',	''),
(4,	'cilantro',	'20',	''),
(5,	'garlic',	'75',	''),
(6,	'rice',	'120',	'');

DROP TABLE IF EXISTS `MenuItem`;
CREATE TABLE `MenuItem` (
  `idMenuItem` int(11) NOT NULL AUTO_INCREMENT,
  `idChef` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `isAvailable` binary(1) DEFAULT NULL,
  `preparationDate` datetime DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idMenuItem`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `MenuItem` (`idMenuItem`, `idChef`, `type`, `name`, `details`, `isAvailable`, `preparationDate`, `price`) VALUES
(1,	0,	'MainDish',	NULL,	'Molecular',	NULL,	NULL,	25),
(2,	0,	'MainDish',	NULL,	'Terroir',	UNHEX('01'),	NULL,	10),
(3,	0,	'MainDish',	NULL,	'Vegetarian',	UNHEX('01'),	NULL,	12),
(4,	0,	'DessertDish',	NULL,	'',	UNHEX('01'),	NULL,	13),
(5,	0,	'DessertDish',	NULL,	'Molecular',	UNHEX('01'),	NULL,	14),
(6,	0,	'RegularDish',	NULL,	'Vegetarian',	UNHEX('01'),	NULL,	7),
(7,	0,	'RegularDish',	NULL,	'Pizza',	UNHEX('01'),	NULL,	7),
(8,	0,	'RegularDish',	NULL,	'Hummus',	UNHEX('01'),	NULL,	14),
(9,	0,	'RegularDish',	NULL,	'Couscous',	UNHEX('01'),	NULL,	12),
(10,	0,	'RegularDish',	NULL,	'Shawarma',	NULL,	NULL,	10),
(11,	0,	'RegularDish',	NULL,	'Noodle Soup',	UNHEX('01'),	NULL,	NULL),
(12,	0,	'RegularDish',	NULL,	'Pasta',	UNHEX('01'),	NULL,	NULL);

DROP TABLE IF EXISTS `MenuItemIngredients`;
CREATE TABLE `MenuItemIngredients` (
  `idMenuItem` int(11) NOT NULL,
  `idIngredients` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `foodCategory` varchar(255) NOT NULL,
  `healthInformation` varchar(255) NOT NULL,
  `safetyRemarks` varchar(255) NOT NULL,
  KEY `idIngredients` (`idIngredients`) USING BTREE,
  KEY `idMenuItem` (`idMenuItem`) USING BTREE,
  CONSTRAINT `MenuItemIngredients_ibfk_1` FOREIGN KEY (`idMenuItem`) REFERENCES `MenuItem` (`idMenuItem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MenuItemIngredients_ibfk_2` FOREIGN KEY (`idIngredients`) REFERENCES `Ingredients` (`idIngredient`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `MenuItemIngredients` (`idMenuItem`, `idIngredients`, `description`, `foodCategory`, `healthInformation`, `safetyRemarks`) VALUES
(1,	3,	'',	'',	'',	''),
(2,	6,	'',	'',	'',	''),
(3,	3,	'',	'',	'',	''),
(5,	6,	'',	'',	'',	''),
(5,	3,	'',	'',	'',	''),
(2,	4,	'',	'',	'',	''),
(10,	5,	'',	'',	'',	'');

DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `idOrder` int(11) NOT NULL AUTO_INCREMENT,
  `orderCreationDate` datetime DEFAULT NULL,
  `idClient` int(11) NOT NULL,
  `idOrderDelivery` int(11) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `idClient` (`idClient`) USING BTREE,
  KEY `idOrderDelivery` (`idOrderDelivery`) USING BTREE,
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`idOrderDelivery`) REFERENCES `OrderDelivery` (`idOrderDelivery`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `Order` (`idOrder`, `orderCreationDate`, `idClient`, `idOrderDelivery`, `total`) VALUES
(1,	'2019-01-27 08:08:52',	2,	1,	67),
(2,	'2019-03-07 08:09:05',	3,	2,	77),
(3,	'2018-03-27 08:09:11',	4,	9,	36),
(4,	'2019-03-27 08:09:16',	5,	8,	48),
(5,	'2019-01-02 08:09:21',	2,	6,	75),
(6,	'2019-03-27 08:09:26',	3,	7,	110),
(7,	'2019-03-27 08:09:31',	5,	4,	98),
(8,	'2019-03-27 08:10:16',	7,	3,	34),
(9,	'2018-12-27 08:10:21',	6,	5,	56);

DROP TABLE IF EXISTS `OrderDelivery`;
CREATE TABLE `OrderDelivery` (
  `idOrderDelivery` int(11) NOT NULL,
  `idDeliveryEmployee` int(11) NOT NULL,
  `idAddress` int(11) NOT NULL,
  `idOrderState` int(11) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`idOrderDelivery`,`idDeliveryEmployee`),
  KEY `idAddress` (`idAddress`) USING BTREE,
  KEY `idDeliveryEmployee` (`idDeliveryEmployee`) USING BTREE,
  KEY `idOrderState` (`idOrderState`) USING BTREE,
  CONSTRAINT `OrderDelivery_ibfk_1` FOREIGN KEY (`idAddress`) REFERENCES `Adress` (`idAddress`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `OrderDelivery_ibfk_2` FOREIGN KEY (`idOrderState`) REFERENCES `OrderState` (`idOrderState`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `OrderDelivery_ibfk_3` FOREIGN KEY (`idDeliveryEmployee`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `OrderDelivery` (`idOrderDelivery`, `idDeliveryEmployee`, `idAddress`, `idOrderState`, `comments`) VALUES
(1,	8,	1,	11,	''),
(2,	15,	2,	11,	'Delivery in progress atm...'),
(3,	9,	2,	12,	''),
(4,	13,	4,	12,	''),
(5,	13,	5,	12,	''),
(6,	9,	7,	8,	''),
(7,	15,	8,	18,	'Need to call client'),
(8,	14,	3,	12,	'Gotham Neighborhood. Please call for directions'),
(9,	8,	6,	8,	'');

DROP TABLE IF EXISTS `OrderMenu`;
CREATE TABLE `OrderMenu` (
  `idMenuItems` int(11) NOT NULL,
  `idOrderMenu` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `totalPrice` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idOrderMenu`),
  CONSTRAINT `OrderMenu_ibfk_1` FOREIGN KEY (`idOrderMenu`) REFERENCES `Order` (`idOrder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `OrderMenu_ibfk_2` FOREIGN KEY (`idOrderMenu`) REFERENCES `MenuItem` (`idMenuItem`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `OrderMenu` (`idMenuItems`, `idOrderMenu`, `quantity`, `totalPrice`) VALUES
(2,	1,	2,	65),
(3,	2,	3,	130),
(11,	3,	1,	60),
(7,	4,	2,	120),
(7,	5,	3,	77),
(7,	6,	1,	55),
(9,	7,	4,	190);

DROP TABLE IF EXISTS `OrderState`;
CREATE TABLE `OrderState` (
  `idOrderState` int(11) NOT NULL AUTO_INCREMENT,
  `orderState` varchar(32) DEFAULT NULL,
  `orderStateDescritption` varchar(255) NOT NULL,
  `stateStartTime` datetime DEFAULT NULL,
  `stateEndTime` datetime DEFAULT NULL,
  `stateAverageComputedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`idOrderState`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO `OrderState` (`idOrderState`, `orderState`, `orderStateDescritption`, `stateStartTime`, `stateEndTime`, `stateAverageComputedTime`) VALUES
(6,	'CancelledOrder',	'',	NULL,	NULL,	NULL),
(7,	'AssigningOrder',	'',	NULL,	NULL,	NULL),
(8,	'PreparingOrder',	'',	NULL,	NULL,	NULL),
(11,	'OrderInDelivery',	'',	NULL,	NULL,	NULL),
(12,	'OrderDeliveryComplete',	'',	NULL,	NULL,	NULL),
(18,	'PaymentFailed',	'',	NULL,	NULL,	NULL),
(19,	'PaymentConfirmed',	'',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `idRole` int(11) NOT NULL,
  `roleName` varchar(32) NOT NULL,
  `roleDescription` varchar(255) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `Role` (`idRole`, `roleName`, `roleDescription`) VALUES
(0,	'Anonymous',	'Guest or anonymous user'),
(1,	'RegisteredCustomer',	'Registered Customer'),
(2,	'DeliveryEmployee',	'Delivery employee'),
(3,	'Chef',	'Chef'),
(4,	'Admin',	' admin Main'),
(5,	'Manager',	'Mgmt');

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(32) NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `profilePicture` varchar(255) NOT NULL,
  `contactPhone` varchar(32) NOT NULL,
  `mainPhone` varchar(32) NOT NULL,
  `mobilePhone` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `createdAt` int(11) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL,
  `lastAccess` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

INSERT INTO `User` (`idUser`, `userName`, `firstName`, `lastName`, `profilePicture`, `contactPhone`, `mainPhone`, `mobilePhone`, `email`, `password`, `createdAt`, `updatedAt`, `lastAccess`) VALUES
(1,	'Guest',	'Unregistered',	'User',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(2,	'Sarah',	'Sarah',	'McLachlin',	'',	'',	'123456789',	'',	'',	'',	NULL,	NULL,	NULL),
(3,	'Naura2',	'Naura',	'Chel',	'',	'',	'587589914',	'',	'',	'',	NULL,	NULL,	NULL),
(4,	'JaneTho',	'Jane',	'Dow',	'',	'',	'',	'658974123',	'',	'',	NULL,	NULL,	NULL),
(5,	'Bobcat',	'Bob',	'DerBauer',	'',	'',	'6541239874',	'',	'',	'',	NULL,	NULL,	NULL),
(6,	'Alice',	'Alicia',	'Karo',	'',	'',	'',	'9517534562',	'',	'',	NULL,	NULL,	NULL),
(7,	'buffy',	'Buffy',	'Sommers',	'',	'',	'',	'6543214567',	'',	'',	NULL,	NULL,	NULL),
(8,	'Ed',	'Eduard',	'McGyver',	'',	'',	'',	'9874561258',	'',	'',	NULL,	NULL,	NULL),
(9,	'John',	'John',	'Wick',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(10,	'Ron',	'Ronaldo',	'Nakamura',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(11,	'Flow',	'Florence',	'Van Bayern',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(12,	'Diallo',	'Diallo',	'Farka Toure',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(13,	'spiderman',	'Spider',	'Man',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(14,	'batman',	'Bat',	'Mann',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(15,	'wonderwoman',	'Wonder',	'Woman',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(16,	'yoko',	'Yoko',	'Kanno',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(17,	'Lore',	'Laurence',	'Platini',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL),
(18,	'rick',	'Ricardo',	'Versace',	'',	'',	'',	'',	'',	'',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole` (
  `userIdFK` int(11) NOT NULL,
  `userRoleFK` int(11) NOT NULL,
  KEY `userId` (`userIdFK`) USING BTREE,
  KEY `userRol` (`userRoleFK`) USING BTREE,
  CONSTRAINT `UserRole_ibfk_1` FOREIGN KEY (`userIdFK`) REFERENCES `User` (`idUser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserRole_ibfk_2` FOREIGN KEY (`userRoleFK`) REFERENCES `Role` (`idRole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `UserRole` (`userIdFK`, `userRoleFK`) VALUES
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	2),
(8,	2),
(9,	2),
(11,	2),
(13,	2),
(14,	2),
(15,	2),
(12,	3),
(16,	3),
(17,	3),
(18,	3),
(10,	4),
(10,	3);

-- 2019-03-27 14:17:16
