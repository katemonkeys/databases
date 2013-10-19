



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
-- Foreign Keys 
-- ---

ALTER TABLE `messages` ADD FOREIGN KEY (user_id) REFERENCES `user` (`id`);
ALTER TABLE `follow relationships` ADD FOREIGN KEY (following user_id) REFERENCES `user` (`id`);
ALTER TABLE `follow relationships` ADD FOREIGN KEY (followed user_id) REFERENCES `user` (`id`);
ALTER TABLE `messages_hashtags` ADD FOREIGN KEY (message_id) REFERENCES `messages` (`id`);
ALTER TABLE `messages_hashtags` ADD FOREIGN KEY (hashtag_id) REFERENCES `hashtags` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `follow relationships` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `hashtags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages_hashtags` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

