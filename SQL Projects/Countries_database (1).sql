


CREATE DATABASE country;


CREATE TABLE IF NOT EXISTS `cities` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `population` mediumint(11) unsigned DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `city_state` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_code` varchar(3) DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO `cities` (`id`, `name`, `population`, `surface`, `city_state`) 
VALUES (1, 'New York', 463333,  15.31667, '01'),
(2, 'Albany', 391234,  16.99663, '01'),
(3, 'Buffalo', 402356,  10.12345, '01'),
(4, 'San Bruno', 153233,  9.22147, '02'),
(5, 'SAN-Francisco', 205689,  11.99632, '02'),
(6, 'SAN-Diego', 269988,  19.89451, '02'),
(7, 'Houston', 197009,  18.00001, '03'),
(8, 'Chicago', 239878,  22.01250, '04');


INSERT INTO `states` (`id`, `state_code`, `state_name`) 
VALUES (1, '01', 'New York'),
(2, '02', 'California'),
(3, '03', 'Texas'),
(4, '04', 'Illinois'),
(5, '978', 'Florida'),
(6, '971', 'Indiana');
