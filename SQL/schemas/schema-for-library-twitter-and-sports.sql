



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user'
-- 
-- ---

DROP TABLE IF EXISTS `user`;
    
CREATE TABLE `user` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `profile picture url` VARCHAR(30) NULL DEFAULT NULL,
  `email` VARCHAR(30) NULL DEFAULT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `location` VARCHAR NULL DEFAULT NULL,
  `member since` DATETIME NULL DEFAULT NULL,
  `password` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'messages'
-- 
-- ---

DROP TABLE IF EXISTS `messages`;
    
CREATE TABLE `messages` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `createdAt` TIMESTAMP NULL DEFAULT NULL,
  `user_id` VARCHAR NULL DEFAULT NULL,
  `contents` VARCHAR(140) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'follow relationships'
-- 
-- ---

DROP TABLE IF EXISTS `follow relationships`;
    
CREATE TABLE `follow relationships` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `following user_id` MEDIUMTEXT NULL DEFAULT NULL,
  `followed user_id` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'hashtags'
-- 
-- ---

DROP TABLE IF EXISTS `hashtags`;
    
CREATE TABLE `hashtags` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `topic` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'messages_hashtags'
-- 
-- ---

DROP TABLE IF EXISTS `messages_hashtags`;
    
CREATE TABLE `messages_hashtags` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `message_id` MEDIUMTEXT NULL DEFAULT NULL,
  `hashtag_id` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'inventory'
-- 
-- ---

DROP TABLE IF EXISTS `inventory`;
    
CREATE TABLE `inventory` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `type of item` TINYINT NULL DEFAULT NULL,
  `lookup number` VARCHAR NULL DEFAULT NULL,
  `location` TINYINT NULL DEFAULT NULL,
  `title` TINYINT NULL DEFAULT NULL,
  `author` TINYINT NULL DEFAULT NULL,
  `year of publication` TINYINT NULL DEFAULT NULL,
  `checkout history?` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'librarian'
-- 
-- ---

DROP TABLE IF EXISTS `librarian`;
    
CREATE TABLE `librarian` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'other resources'
-- 
-- ---

DROP TABLE IF EXISTS `other resources`;
    
CREATE TABLE `other resources` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `type (computers and stuff)` MEDIUMTEXT NULL DEFAULT NULL,
  `location` MEDIUMTEXT NULL DEFAULT NULL,
  `owner` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'people with library cards'
-- 
-- ---

DROP TABLE IF EXISTS `people with library cards`;
    
CREATE TABLE `people with library cards` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` TINYINT NULL DEFAULT NULL,
  `address` MEDIUMTEXT NULL DEFAULT NULL,
  `age` TINYINT NULL DEFAULT NULL,
  `fines paid` TINYINT NULL DEFAULT NULL,
  `checkout history?` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'items checked out'
-- 
-- ---

DROP TABLE IF EXISTS `items checked out`;
    
CREATE TABLE `items checked out` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `which item` TINYINT NULL DEFAULT NULL,
  `by whom` TINYINT NULL DEFAULT NULL,
  `when checked out` TINYINT NULL DEFAULT NULL,
  `when due` TINYINT NULL DEFAULT NULL,
  `overdue? (a boolean)` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'types of items to check out'
-- 
-- ---

DROP TABLE IF EXISTS `types of items to check out`;
    
CREATE TABLE `types of items to check out` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `type of resource (book, audio cassette, childrens book)` TINYINT NULL DEFAULT NULL,
  `how long can it be checked out for` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'sports (hockey, baseball, football, etc)'
-- 
-- ---

DROP TABLE IF EXISTS `sports (hockey, baseball, football, etc)`;
    
CREATE TABLE `sports (hockey, baseball, football, etc)` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `what sport` TINYINT NULL DEFAULT NULL,
  `what months is it in season` TINYINT NULL DEFAULT NULL,
  `what level (pro, college, HS, olympic...)` TINYINT NULL DEFAULT NULL,
  `team or individual` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'teams'
-- 
-- ---

DROP TABLE IF EXISTS `teams`;
    
CREATE TABLE `teams` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `team name` TINYINT NULL DEFAULT NULL,
  `team city` TINYINT NULL DEFAULT NULL,
  `sport` TINYINT NULL DEFAULT NULL,
  `record` TINYINT NULL DEFAULT NULL,
  `roster` TINYINT NULL DEFAULT NULL,
  `colors and mascot` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'past season performance'
-- 
-- ---

DROP TABLE IF EXISTS `past season performance`;
    
CREATE TABLE `past season performance` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `what year` TINYINT NULL DEFAULT NULL,
  `roster that year` TINYINT NULL DEFAULT NULL,
  `record that year` TINYINT NULL DEFAULT NULL,
  `championship?` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'individual performance'
-- 
-- ---

DROP TABLE IF EXISTS `individual performance`;
    
CREATE TABLE `individual performance` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` TINYINT NULL DEFAULT NULL,
  `playing since` TINYINT NULL DEFAULT NULL,
  `record` TINYINT NULL DEFAULT NULL,
  `what do they play (tennis or whatever)` TINYINT NULL DEFAULT NULL,
  `winnings ($$)` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'team players'
-- 
-- ---

DROP TABLE IF EXISTS `team players`;
    
CREATE TABLE `team players` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` TINYINT NULL DEFAULT NULL,
  `current team` TINYINT NULL DEFAULT NULL,
  `position` TINYINT NULL DEFAULT NULL,
  `draft year` TINYINT NULL DEFAULT NULL,
  `draft position` TINYINT NULL DEFAULT NULL,
  `stats and stuff ("yards")` TINYINT NULL DEFAULT NULL,
  `salary` TINYINT NULL DEFAULT NULL,
  `alma mater` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'games this season'
-- 
-- ---

DROP TABLE IF EXISTS `games this season`;
    
CREATE TABLE `games this season` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `home team` TINYINT NULL DEFAULT NULL,
  `away team` TINYINT NULL DEFAULT NULL,
  `home score` TINYINT NULL DEFAULT NULL,
  `away score` TINYINT NULL DEFAULT NULL,
  `winner` TINYINT NULL DEFAULT NULL,
  `audience attendance` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'new table'
-- 
-- ---

DROP TABLE IF EXISTS `new table`;
    
CREATE TABLE `new table` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Media'
-- 
-- ---

DROP TABLE IF EXISTS `Media`;
    
CREATE TABLE `Media` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `Type` TINYINT NULL DEFAULT NULL,
  `Title` TINYINT NULL DEFAULT NULL,
  `Year` TINYINT NULL DEFAULT NULL,
  `ISBN` TINYINT NULL DEFAULT NULL,
  `Location` TINYINT NULL DEFAULT NULL,
  `Num of Copies` TINYINT NULL DEFAULT NULL,
  `Num Checked Out` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Media_Subject'
-- 
-- ---

DROP TABLE IF EXISTS `Media_Subject`;
    
CREATE TABLE `Media_Subject` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `Media_ID` TINYINT NULL DEFAULT NULL,
  `subject_ID` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Media_Author'
-- 
-- ---

DROP TABLE IF EXISTS `Media_Author`;
    
CREATE TABLE `Media_Author` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `Media_ID` TINYINT NULL DEFAULT NULL,
  `Author_ID` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Subject'
-- 
-- ---

DROP TABLE IF EXISTS `Subject`;
    
CREATE TABLE `Subject` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `name` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Author'
-- 
-- ---

DROP TABLE IF EXISTS `Author`;
    
CREATE TABLE `Author` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `First Name` TINYINT NULL DEFAULT NULL,
  `Last Name` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Publishers'
-- 
-- ---

DROP TABLE IF EXISTS `Publishers`;
    
CREATE TABLE `Publishers` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `Name` TINYINT NULL DEFAULT NULL,
  `Address` TINYINT NULL DEFAULT NULL,
  `Established` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Media_Publisher'
-- 
-- ---

DROP TABLE IF EXISTS `Media_Publisher`;
    
CREATE TABLE `Media_Publisher` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `Media_ID` TINYINT NULL DEFAULT NULL,
  `publisher_ID` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Checked Out'
-- 
-- ---

DROP TABLE IF EXISTS `Checked Out`;
    
CREATE TABLE `Checked Out` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `User_ID` TINYINT NULL DEFAULT NULL,
  `Resource_ID` TINYINT NULL DEFAULT NULL,
  `Date Checked Out` TINYINT NULL DEFAULT NULL,
  `Return Date` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Users'
-- 
-- ---

DROP TABLE IF EXISTS `Users`;
    
CREATE TABLE `Users` (
  `id` TINYINT NULL AUTO_INCREMENT DEFAULT NULL,
  `First` TINYINT NULL DEFAULT NULL,
  `Last` TINYINT NULL DEFAULT NULL,
  `Address` TINYINT NULL DEFAULT NULL,
  `Fines` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `messages` ADD FOREIGN KEY (user_id) REFERENCES `user` (`id`);
ALTER TABLE `follow relationships` ADD FOREIGN KEY (following user_id) REFERENCES `user` (`id`);
ALTER TABLE `follow relationships` ADD FOREIGN KEY (followed user_id) REFERENCES `user` (`id`);
ALTER TABLE `messages_hashtags` ADD FOREIGN KEY (message_id) REFERENCES `messages` (`id`);
ALTER TABLE `messages_hashtags` ADD FOREIGN KEY (hashtag_id) REFERENCES `hashtags` (`id`);
ALTER TABLE `inventory` ADD FOREIGN KEY (type of item) REFERENCES `types of items to check out` (`id`);
ALTER TABLE `other resources` ADD FOREIGN KEY (owner) REFERENCES `librarian` (`id`);
ALTER TABLE `items checked out` ADD FOREIGN KEY (which item) REFERENCES `inventory` (`id`);
ALTER TABLE `items checked out` ADD FOREIGN KEY (by whom) REFERENCES `people with library cards` (`id`);
ALTER TABLE `Media_Subject` ADD FOREIGN KEY (Media_ID) REFERENCES `Media` (`id`);
ALTER TABLE `Media_Subject` ADD FOREIGN KEY (subject_ID) REFERENCES `Subject` (`id`);
ALTER TABLE `Media_Author` ADD FOREIGN KEY (Media_ID) REFERENCES `Media` (`id`);
ALTER TABLE `Media_Author` ADD FOREIGN KEY (Author_ID) REFERENCES `Author` (`id`);
ALTER TABLE `Media_Publisher` ADD FOREIGN KEY (Media_ID) REFERENCES `Media` (`id`);
ALTER TABLE `Media_Publisher` ADD FOREIGN KEY (publisher_ID) REFERENCES `Publishers` (`id`);
ALTER TABLE `Checked Out` ADD FOREIGN KEY (User_ID) REFERENCES `Users` (`id`);
ALTER TABLE `Checked Out` ADD FOREIGN KEY (Resource_ID) REFERENCES `Media` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `follow relationships` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `hashtags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages_hashtags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `inventory` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `librarian` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `other resources` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `people with library cards` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `items checked out` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `types of items to check out` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `sports (hockey, baseball, football, etc)` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `teams` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `past season performance` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `individual performance` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `team players` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `games this season` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `new table` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Media` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Media_Subject` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Media_Author` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Subject` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Author` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Publishers` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Media_Publisher` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Checked Out` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user` (`id`,`profile picture url`,`email`,`birthday`,`location`,`member since`,`password`) VALUES
-- ('','','','','','','');
-- INSERT INTO `messages` (`id`,`createdAt`,`user_id`,`contents`) VALUES
-- ('','','','');
-- INSERT INTO `follow relationships` (`id`,`following user_id`,`followed user_id`) VALUES
-- ('','','');
-- INSERT INTO `hashtags` (`id`,`topic`) VALUES
-- ('','');
-- INSERT INTO `messages_hashtags` (`id`,`message_id`,`hashtag_id`) VALUES
-- ('','','');
-- INSERT INTO `inventory` (`id`,`type of item`,`lookup number`,`location`,`title`,`author`,`year of publication`,`checkout history?`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `librarian` (`id`) VALUES
-- ('');
-- INSERT INTO `other resources` (`id`,`type (computers and stuff)`,`location`,`owner`) VALUES
-- ('','','','');
-- INSERT INTO `people with library cards` (`id`,`name`,`address`,`age`,`fines paid`,`checkout history?`) VALUES
-- ('','','','','','');
-- INSERT INTO `items checked out` (`id`,`which item`,`by whom`,`when checked out`,`when due`,`overdue? (a boolean)`) VALUES
-- ('','','','','','');
-- INSERT INTO `types of items to check out` (`id`,`type of resource (book, audio cassette, childrens book)`,`how long can it be checked out for`) VALUES
-- ('','','');
-- INSERT INTO `sports (hockey, baseball, football, etc)` (`id`,`what sport`,`what months is it in season`,`what level (pro, college, HS, olympic...)`,`team or individual`) VALUES
-- ('','','','','');
-- INSERT INTO `teams` (`id`,`team name`,`team city`,`sport`,`record`,`roster`,`colors and mascot`) VALUES
-- ('','','','','','','');
-- INSERT INTO `past season performance` (`id`,`what year`,`roster that year`,`record that year`,`championship?`) VALUES
-- ('','','','','');
-- INSERT INTO `individual performance` (`id`,`name`,`playing since`,`record`,`what do they play (tennis or whatever)`,`winnings ($$)`) VALUES
-- ('','','','','','');
-- INSERT INTO `team players` (`id`,`name`,`current team`,`position`,`draft year`,`draft position`,`stats and stuff ("yards")`,`salary`,`alma mater`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `games this season` (`id`,`home team`,`away team`,`home score`,`away score`,`winner`,`audience attendance`) VALUES
-- ('','','','','','','');
-- INSERT INTO `new table` (`id`) VALUES
-- ('');
-- INSERT INTO `Media` (`id`,`Type`,`Title`,`Year`,`ISBN`,`Location`,`Num of Copies`,`Num Checked Out`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Media_Subject` (`id`,`Media_ID`,`subject_ID`) VALUES
-- ('','','');
-- INSERT INTO `Media_Author` (`id`,`Media_ID`,`Author_ID`) VALUES
-- ('','','');
-- INSERT INTO `Subject` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `Author` (`id`,`First Name`,`Last Name`) VALUES
-- ('','','');
-- INSERT INTO `Publishers` (`id`,`Name`,`Address`,`Established`) VALUES
-- ('','','','');
-- INSERT INTO `Media_Publisher` (`id`,`Media_ID`,`publisher_ID`) VALUES
-- ('','','');
-- INSERT INTO `Checked Out` (`id`,`User_ID`,`Resource_ID`,`Date Checked Out`,`Return Date`) VALUES
-- ('','','','','');
-- INSERT INTO `Users` (`id`,`First`,`Last`,`Address`,`Fines`) VALUES
-- ('','','','','');

