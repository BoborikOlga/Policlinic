
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`policlinics` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `policlinics`;

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int auto_increment NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `patronomic` varchar(50) NULL, 
  `email` varchar(50) NULL, 
  `age` INT NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`name`,`surname`,`patronomic`,`email`,`age`,`phone`,`address`) 
values ('Иван','Иванов','Иванович', 'ivanovLapochka1972@mail.ru', 45, '+375 29 45 78 452','Советская, 18/2, 11'),
	   ('Аркадий','Пупкин','Аристархович', 'pupkinAlex@mail.ru', 48, '+375 29 25 63 842','Ленинская, 24, 17'),
       ('Ольга','Савельева','Сергеевна', 'saveljol@bk.ru', 25, '+375 29 53 48 96','пр-т Дзержинского, 95, 215'),
       ('Александр','Тимохин','Юрьевич', 'alex.tixon@mail.ru', 32, NULL,'пр-т Рокосовского, 8, 5'),
       ('Пётр','Романов','Петрович','petka.carevich@mail.ru', 15, '+375 29 25 36 974','пр-т Победителей, 36/2, 8'),
       ('Игорь','Прилучный','Александрович',NULL, 28, '+375 29 52 36 941','пр-т Победы, 36, 84'),
       ('Анастасия','Прохорова','Святославовна', NULL, 41, '+375 29 34 21 965','Лидская, 5, 13'),
       ('Мария','Дулько','Вячеславовна','mashaVasha@mail.ru', 50, '+375 29 78 63 125','Калиновского, 22, 42');

UNLOCK TABLES;

/*Table structure for table `doctors` */

DROP TABLE IF EXISTS `doctors`;

CREATE TABLE `doctors` (
  `id` int auto_increment NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `patronomic` varchar(50) NULL, 
  `email` varchar(50) NULL, 
  `phone` varchar(50) DEFAULT NULL,
  `positionID` int NOT NULL,
  `departmentID` int NOT NULL,
  `cabinet` int NOT NULL,  
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`positionID`) REFERENCES `positions` (`id`),
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`departmentID`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `doctors` */

LOCK TABLES `doctors` WRITE;

insert  into `doctors`(`name`,`surname`,`patronomic`,`email`,`phone`,`positionID`,`departmentID`,`cabinet`, `status`) 
values ('Иван','Астахов','Иванович', 'ivanAstachov@mail.ru', '+375 29 42 36 785', 1, 1, 402, NULL),
	   ('Сергей','Толочко','Эдуардович', 'tolochko.serhei@mail.ru', NULL, 2, 1, 201, NULL),
       ('Николай','Хадоркин','Александрович', 'xadorkinNik@mail.ru', '+375 29 42 36 784', 3, 3, 607, NULL),
       ('Пётр','Третьяков','Самуилович', 'petrDoctor1984@yandex.ru', '+375 29 74 12 589', 4, 1, 537, NULL),
       ('Иван','Черемисин','Иванович', 'vanyaCheremucha@mail.ru', NULL, 4, 1, 502, NULL),
       ('Александр','Зуев','Кириллович', 'zyevalex@mail.ru', '+375 29 65 23 874', 1, 3, 547, NULL);

UNLOCK TABLES;

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int auto_increment NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `departments` */

LOCK TABLES `departments` WRITE;

insert  into `departments`(`Name`) 
values ('Терапевтическое'),
		('Хирургическое'),
        ('Неврологическое'),
        ('Гинекологическое'),
        ('Реабилитации'),
        ('Урологическое'),
        ('Кардиологическое'),
        ('Стоматологическое'),
        ('Офтальмологическое');

UNLOCK TABLES;

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `id` int auto_increment NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `positions` */

LOCK TABLES `positions` WRITE;

insert  into `positions`(`Name`) 
values ('Зав. отделением'),
		('Терапевт'),
        ('Невролог'),
        ('Акушер-гинеколог'),
        ('Хирург'),
        ('Травматолог'),
        ('Ортопед'),
        ('Реабилитолог'),
        ('Уролог'),
        ('Проктолог'),
        ('Кардиолог'),
        ('Стоматолог'),
        ('Диагност'),
        ('Офтальмолог');

UNLOCK TABLES;



/*Table structure for table `tickets` */

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `id` int auto_increment NOT NULL,
  `doctorID` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `number` int NOT NULL,
  `orderID`int NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`),
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tickets` */

LOCK TABLES `tickets` WRITE;

insert  into `tickets`(`doctorID`,`date`,`time`,`number`,`orderID`) 
values (1,'2017-02-21','08:12', 1, 1),
	   (2,'2017-02-21','09:15', 1, 2),
       (2,'2017-02-21','09:30', 2, 3),
	   (3,'2017-02-21','14:30', 1, 4),
	   (4,'2017-02-21','10:30', 1, 5);
    
UNLOCK TABLES;

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int auto_increment NOT NULL,
  `userID` int NOT NULL,
  `orderDateTime` datetime NOT NULL,
  `type` enum('aegrobat','ticket') NOT NULL,
  `status` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

LOCK TABLES `orders` WRITE;

insert  into `orders`(`userID`,`orderDateTime`,`type`,`status`) 
values (1,'2017-02-21','ticket','Researved'),
       (2,'2017-02-21','ticket','Researved'),
       (3,'2017-02-21','ticket','Finished'), 
       (5,'2017-02-21','ticket','Researved'),
       (7,'2017-02-21','ticket','Researved'), 
       (2,'2017-02-21','aegrobat','Finished'),
       (3,'2017-02-21','aegrobat','Treated');

UNLOCK TABLES;

/*Table structure for table `aegrobats` */

DROP TABLE IF EXISTS `aegrobats`;

CREATE TABLE `aegrobats` (
  `id` int auto_increment NOT NULL,
  `userID` int NOT NULL,
  `doctorID` int NOT NULL,
  `disease` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `orderID` int NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT `aegrobats_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `aegrobats_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`id`),
  CONSTRAINT `aegrobats_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `aegrobats` */

LOCK TABLES `aegrobats` WRITE;

insert  into `aegrobats`(`userID`,`doctorID`,`disease`,`destination`,`startDate`,`endDate`, `orderID`) 
values (2,2,'ОРВИ','работа','2017-02-13','2017-02-16',5);

UNLOCK TABLES;

DROP TABLE IF EXISTS `medicalRecords`;

CREATE TABLE `medicalRecords` (
  `id` int auto_increment NOT NULL,
  `userID` int NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NULL,
  PRIMARY KEY (id),
  CONSTRAINT `medicalRecords_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `medicalRecords` */

LOCK TABLES `medicalRecords` WRITE;

insert  into `medicalRecords`(`userID`,`startDate`,`endDate`) 
values (1,'2015-02-13',NULL),
	   (2,'2016-02-13',NULL),
       (3,'2015-03-13',NULL),
       (4,'2015-02-13',NULL),
       (5,'2015-10-18',NULL),
       (6,'2015-02-13',NULL),
       (7,'2017-02-13',NULL);

UNLOCK TABLES;


/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int auto_increment NOT NULL,
  `name` varchar(50) NOT NULL,
  `textDescription` varchar(4000) DEFAULT NULL,
  `price` double NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `services` */

LOCK TABLES `services` WRITE;

insert  into `services`(`name`,`textDescription`,`price`) 
values ('Освидетельствование водителей на наличие алкоголя в организме','Быстро. Качественно', 12.0),
		('Лабораторная диагностика','Проводится на новейшем оборудовании. Результат в этот же день', 10.0),
        ('Проведение профессиональной гигиены полости рта','Гигиеническую чистка зубов, ультразвуковая чистка зубов, полировка зубов', 40.0);
        
UNLOCK TABLES;

/*Table structure for table `timetables` */

DROP TABLE IF EXISTS `timetables`;

CREATE TABLE `timetables` (
  `id` int auto_increment NOT NULL,
  `mondayStartTime` time NULL,
  `mondayEndTime` time NULL,
  `tuesdayStartTime` time NULL,
  `tuesdayEndTime` time NULL,
  `wednesdayStartTime` time NULL,
  `wednesdayEndTime` time NULL,
  `thursdayStartTime` time NULL,
  `thursdayEndTime` time NULL,
  `fridayStartTime` time NULL,
  `fridayEndTime` time NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `timetables` */

LOCK TABLES `timetables` WRITE;

insert  into `timetables`(`mondayStartTime`,`mondayEndTime`,`tuesdayStartTime`,`tuesdayEndTime`,`wednesdayStartTime`,
`wednesdayEndTime`,`thursdayStartTime`,`thursdayEndTime`,`fridayStartTime`,`fridayEndTime`) 
values ('10:00','14:00','08:00', '12:00','13:00','17:00','14:00','20:00','09:00','13:00'),
		('13:00','17:00','08:00', '12:00','13:00','17:00','14:00','20:00','12:00','15:00'),
	   ('12:00','15:00','18:00', '20:00',NULL,NULL,'14:00','20:00','09:00', '11:00');
UNLOCK TABLES;

/*Table structure for table `timetableToDoctor` */

DROP TABLE IF EXISTS `timetableToDoctor`;

CREATE TABLE `timetableToDoctor` (
  `id` int auto_increment NOT NULL,
  `doctorID` int NOT NULL,
  `timetableID`int NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `timetableToDoctor_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`id`),
  CONSTRAINT `timetableToDoctor_ibfk_1` FOREIGN KEY (`timetableID`) REFERENCES `timetables` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `timetableToDoctor` */

LOCK TABLES `timetableToDoctor` WRITE;

insert  into `timetableToDoctor`(`doctorID`,`timetableID`) 
values (1, 1), (2, 2), (3, 0), (4, 1), (5,2);
    
UNLOCK TABLES;

/*Table structure for table `textContent` */

DROP TABLE IF EXISTS `textContent`;

CREATE TABLE `textContent` (
  `id` int auto_increment NOT NULL,
  `URL` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `imagesContent` */

DROP TABLE IF EXISTS `imagesContent`;

CREATE TABLE `imagesContent` (
  `id` int auto_increment NOT NULL,
  `URL` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int auto_increment NOT NULL,
  `userID` int NOT NULL,
  `doctorID` int NOT NULL,
  `level` int NOT NULL DEFAULT 1,
  `parentCommentID` int NULL,
  `textID` int NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`textID`) REFERENCES `textContent` (`id`),
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctors` (`id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`parentCommentID`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
