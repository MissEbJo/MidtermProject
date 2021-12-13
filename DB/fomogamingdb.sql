-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fomogaming
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `fomogaming` ;

-- -----------------------------------------------------
-- Schema fomogaming
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fomogaming` DEFAULT CHARACTER SET utf8 ;
USE `fomogaming` ;

-- -----------------------------------------------------
-- Table `developer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `developer` ;

CREATE TABLE IF NOT EXISTS `developer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `founding_year` INT(4) NULL,
  `logo_image_url` VARCHAR(3000) NULL,
  `description` TEXT NULL,
  `website_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `game_series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `game_series` ;

CREATE TABLE IF NOT EXISTS `game_series` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `image_url` VARCHAR(3000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `video_game` ;

CREATE TABLE IF NOT EXISTS `video_game` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `release_year` INT(4) NULL,
  `mode` VARCHAR(45) NULL,
  `cross_platform` TINYINT NULL,
  `developer_id` INT NULL,
  `series_id` INT NULL,
  `image_url` VARCHAR(3000) NULL,
  `trailer_url` VARCHAR(3000) NULL,
  `number_in_series` INT NULL,
  `added_by_user` INT NOT NULL DEFAULT 1,
  `when_added` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_game_developer1_idx` (`developer_id` ASC),
  INDEX `fk_video_game_series1_idx` (`series_id` ASC),
  CONSTRAINT `fk_video_game_developer1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `developer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_game_series1`
    FOREIGN KEY (`series_id`)
    REFERENCES `game_series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book` ;

CREATE TABLE IF NOT EXISTS `book` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL,
  `release_year` INT(4) NULL,
  `author` VARCHAR(100) NULL,
  `game_series_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_game_series1_idx` (`game_series_id` ASC),
  CONSTRAINT `fk_book_game_series1`
    FOREIGN KEY (`game_series_id`)
    REFERENCES `game_series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie` ;

CREATE TABLE IF NOT EXISTS `movie` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `release_year` INT(4) NULL,
  `description` VARCHAR(500) NULL,
  `series_id` INT NOT NULL,
  `imdb_url` VARCHAR(3000) NULL,
  `poster_image_url` VARCHAR(3000) NULL,
  `trailer_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movie_series1_idx` (`series_id` ASC),
  CONSTRAINT `fk_movie_series1`
    FOREIGN KEY (`series_id`)
    REFERENCES `game_series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NULL,
  `profile_picture` VARCHAR(1000) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform` ;

CREATE TABLE IF NOT EXISTS `platform` (
  `id` INT NOT NULL,
  `system_name` VARCHAR(100) NULL,
  `logo_url` VARCHAR(45) NULL,
  `release_year` INT(4) NULL,
  `platform_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tv_show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tv_show` ;

CREATE TABLE IF NOT EXISTS `tv_show` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `number_seasons` INT NULL,
  `release_year` INT(4) NULL,
  `description` VARCHAR(500) NULL,
  `video_game_id` INT NOT NULL,
  `series_id` INT NULL,
  `imdb_url` VARCHAR(3000) NULL,
  `trailer_url` VARCHAR(3000) NULL,
  `poster_image_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tv_shows_video_game1_idx` (`video_game_id` ASC),
  INDEX `fk_tv_shows_series1_idx` (`series_id` ASC),
  CONSTRAINT `fk_tv_shows_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tv_shows_series1`
    FOREIGN KEY (`series_id`)
    REFERENCES `game_series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `board_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `board_game` ;

CREATE TABLE IF NOT EXISTS `board_game` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `release_year` INT(4) NULL,
  `description` VARCHAR(2000) NULL,
  `gameplay` TEXT NULL,
  `video_game_id` INT NOT NULL,
  `developer_id` INT NULL,
  `image_url` VARCHAR(3000) NULL,
  `website_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_game_video_game1_idx` (`video_game_id` ASC),
  INDEX `fk_board_game_developer1_idx` (`developer_id` ASC),
  CONSTRAINT `fk_board_game_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_board_game_developer1`
    FOREIGN KEY (`developer_id`)
    REFERENCES `developer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_games`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_games` ;

CREATE TABLE IF NOT EXISTS `favorite_games` (
  `video_game_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`video_game_id`, `user_id`),
  INDEX `fk_video_game_has_user_user1_idx` (`user_id` ASC),
  INDEX `fk_video_game_has_user_video_game1_idx` (`video_game_id` ASC),
  CONSTRAINT `fk_video_game_has_user_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_game_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `platform_has_video_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_has_video_game` ;

CREATE TABLE IF NOT EXISTS `platform_has_video_game` (
  `video_game_id` INT NOT NULL,
  `platform_id` INT NOT NULL,
  PRIMARY KEY (`video_game_id`, `platform_id`),
  INDEX `fk_platforms_has_video_game_video_game1_idx` (`video_game_id` ASC),
  INDEX `fk_platforms_has_video_game_platforms1_idx` (`platform_id` ASC),
  CONSTRAINT `fk_platforms_has_video_game_platforms1`
    FOREIGN KEY (`platform_id`)
    REFERENCES `platform` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_platforms_has_video_game_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `video_game_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `video_game_has_genre` ;

CREATE TABLE IF NOT EXISTS `video_game_has_genre` (
  `video_game_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`video_game_id`, `genre_id`),
  INDEX `fk_video_game_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_video_game_has_genre_video_game1_idx` (`video_game_id` ASC),
  CONSTRAINT `fk_video_game_has_genre_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_game_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `streaming_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `streaming_service` ;

CREATE TABLE IF NOT EXISTS `streaming_service` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NULL,
  `image_url` VARCHAR(3000) NULL,
  `website_url` VARCHAR(3000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tv_show_has_streaming_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tv_show_has_streaming_service` ;

CREATE TABLE IF NOT EXISTS `tv_show_has_streaming_service` (
  `tv_show_id` INT NOT NULL,
  `streaming_service_id` INT NOT NULL,
  PRIMARY KEY (`tv_show_id`, `streaming_service_id`),
  INDEX `fk_tv_show_has_streaming_service_streaming_service1_idx` (`streaming_service_id` ASC),
  INDEX `fk_tv_show_has_streaming_service_tv_show1_idx` (`tv_show_id` ASC),
  CONSTRAINT `fk_tv_show_has_streaming_service_tv_show1`
    FOREIGN KEY (`tv_show_id`)
    REFERENCES `tv_show` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tv_show_has_streaming_service_streaming_service1`
    FOREIGN KEY (`streaming_service_id`)
    REFERENCES `streaming_service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_has_streaming_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `movie_has_streaming_service` ;

CREATE TABLE IF NOT EXISTS `movie_has_streaming_service` (
  `movie_id` INT NOT NULL,
  `streaming_service_id` INT NOT NULL,
  PRIMARY KEY (`movie_id`, `streaming_service_id`),
  INDEX `fk_movie_has_streaming_service_streaming_service1_idx` (`streaming_service_id` ASC),
  INDEX `fk_movie_has_streaming_service_movie1_idx` (`movie_id` ASC),
  CONSTRAINT `fk_movie_has_streaming_service_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_has_streaming_service_streaming_service1`
    FOREIGN KEY (`streaming_service_id`)
    REFERENCES `streaming_service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS fomouser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'fomouser'@'localhost' IDENTIFIED BY 'fomouser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'fomouser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `developer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (1, 'Capcom', 'Japan', 1979, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (2, 'Guerrilla Games', 'Netherlands', 2000, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (3, 'Nintendo Entertainment', 'Japan', 1889, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (4, 'Supergiant Games', 'United States', 2009, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (5, 'Square Enix', 'Japan', 2003, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (6, 'EA Sports', 'United States', 1991, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (7, 'Respawn Entertainment', 'United States', 2010, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (8, 'Concerned Ape', 'United States', 2012, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (9, 'Ubisoft', 'France', 1986, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (10, 'Atari', 'United States', 1976, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (11, 'Bungie', 'United States', 1991, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (12, 'ND Cube', 'Japan', 2000, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (13, 'PUBG Corp', 'South Korea', 2009, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (14, 'Blizzard Entertainment', 'United States', 1991, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (15, 'EA', 'United States', 1982, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (16, 'Sora Ltd', 'Japan', 2005, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (17, 'CD Projekt Red', 'Poland', 2002, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (18, 'Pathea', 'China', 2010, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (19, 'FromSoftware', 'Japan', 1986, NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `logo_image_url`, `description`, `website_url`) VALUES (20, 'Steamforged Games', 'England', 2014, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `game_series`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (1, 'The Legend of Zelda', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (2, 'Final Fantasy', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (3, 'Mario Party', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (4, 'Super Smash Brothers', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (5, 'Horizon', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (6, 'Destiny', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (7, 'Ghost Recon', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (8, 'The Witcher', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (9, 'Warcraft', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (10, 'Mega Man', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (11, 'Madden', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (12, 'Starcraft', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (13, 'Need For Speed', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (14, 'Dark Souls', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (15, 'NCAA College Football', NULL, NULL);
INSERT INTO `game_series` (`id`, `name`, `image_url`, `description`) VALUES (16, 'Paperboy', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `video_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (1, 'Horizon Zero Dawn', 'Experience Aloy’s legendary quest to unravel the mysteries of a future Earth ruled by Machines. Use devastating tactical attacks against your prey and explore a majestic open world in this award-winning action RPG!', 2017, 'Single player', 0, 2, 5, 'https://upload.wikimedia.org/wikipedia/en/9/93/Horizon_Zero_Dawn.jpg', 'https://www.youtube.com/watch?v=wzx96gYA8ek&ab_channel=PlayStation', 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (2, 'Breath of the Wild', 'Breath of the Wild is an action-adventure game set in an open world where players are tasked with exploring the kingdom of Hyrule while controlling Link. ... Link can procure items from the environment, including weapons, food, and other resources. Unlike previous Zelda games, weapons and shields degrade through use.', 2017, 'Single player', 0, 3, 1, 'https://upload.wikimedia.org/wikipedia/en/c/c6/The_Legend_of_Zelda_Breath_of_the_Wild.jpg', 'https://www.youtube.com/watch?v=zw47_q9wbBE&ab_channel=Nintendo', 19, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (3, 'Hades', 'Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler from the creators of Bastion, Transistor, and Pyre.', 2018, 'Single player', 0, 4, NULL, 'https://cdn1.epicgames.com/min/offer/1200x1600-1200x1600-e92fa6b99bb20c9edee19c361b8853b9.jpg', 'https://www.youtube.com/watch?v=91t0ha9x0AE&ab_channel=IGN', NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (4, 'Apex Legends', 'Apex Legends is the award-winning, free-to-play Hero shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.', 2019, 'Multiplayer', 1, 7, NULL, 'https://upload.wikimedia.org/wikipedia/en/d/db/Apex_legends_cover.jpg', 'https://www.youtube.com/watch?v=innmNewjkuk&ab_channel=ApexLegends', NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (5, 'Destiny 2', 'Destiny 2 is an action MMO with a single evolving world that you and your friends can join anytime, anywhere, absolutely free.', 2017, 'Single player, Multiplayer', 1, 11, 6, 'https://upload.wikimedia.org/wikipedia/en/0/05/Destiny_2_%28artwork%29.jpg', 'https://www.youtube.com/watch?v=hdWkpbPTpmE&ab_channel=Destiny2', 2, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (6, 'Mega Man', 'Mega Man, known as Rockman in Japan, is a Japanese science fiction video game franchise created by Capcom, starring a series of robot characters each known by the moniker \"Mega Man\".', 1987, 'Single player', 0, 1, 10, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Mega_Man_logo.svg/2560px-Mega_Man_logo.svg.png', NULL, 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (7, 'Tom Clancy\'s Ghost Recon', 'Eastern Europe, 2008. War has broken out on the borders of Russia and the fate of the world hangs in the balance. That\'s when the call goes out for the Ghostsan elite handful of specially trained Green Berets, armed with the latest technology and trained to use the deadliest weapons. Their mission: Spearhead the way for a NATO peacekeeping force, and keep the lid on the conflict before it mushrooms... literally.', 2001, 'Single player, Multiplayer', 0, 9, 7, 'https://upload.wikimedia.org/wikipedia/en/8/82/Tom_Clancy%27s_Ghost_Recon.jpg', 'https://www.youtube.com/watch?v=TLLWgsg8ztc&ab_channel=GhostViking', 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (8, 'John Madden Football', 'Madden NFL (known as John Madden Football until 1994) is an American Football video game series developed by EA Tiburon for EA Sports. It is named after Pro Football Hall Of Fame coach and commentator John Madden, and it has sold more than 250 million copies. It is also the only officially licensed (NFL) video game series, and it has influenced many players and coaches of the physical sport.', 1988, 'Single player, Multiplayer', 0, 6, 11, 'https://upload.wikimedia.org/wikipedia/en/3/3c/John_madden_football.jpg', NULL, 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (9, 'Bill Walsh College Football', 'NCAA Football is an American Football video game series series developed by EA Sports in which players control and compete against current Division 1 FBS college football teams. It served as a college football counterpart to the  Madden NFL series. The series began in 1993 with the release of Bill Walsh College Football. EA eventually acquired the licensing rights to the NCAA name and officially rechristened the series with the release of NCAA Football 98', 1993, 'Single player, Multiplayer', 0, 6, 15, 'https://upload.wikimedia.org/wikipedia/en/6/60/Bill_Walsh_College_Football_Coverart.png', NULL, 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (10, 'Paper Boy', 'Paperboy is an arcade action game developed and published by Atari Games and Midway Games, and released in 1985. The player takes the role of a paperboy who delivers a fictional newspaper called The Daily Sun along a suburban street on his bicycle. The arcade version of the game featured bike handlebars as the controller.The game was ported to many home systems beginning in 1986.', 1985, 'Single player', 0, 10, 16, 'https://upload.wikimedia.org/wikipedia/en/7/7e/Paperboy_arcadeflyer.png', NULL, NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (11, 'Final Fantasy IX', 'Zidane and the Tantalus Theater Troupe have kidnapped Princess Garnet, the heir of Alexandria. To their surprise, however, the princess herself yearned to escape the castle.\nThrough a series of unusual circumstances, she and her personal guard, Steiner, fall in with Zidane and set out on an incredible journey. Meeting unforgettable characters like Vivi and Quina along the way, they learn about themselves, the secrets of the Crystal, and a malevolent force that threatens to destroy their world.', 2020, 'Single player', 0, 5, 2, 'https://upload.wikimedia.org/wikipedia/en/5/51/Ffixbox.jpg', 'https://www.youtube.com/watch?v=5XRB3bxC47M&ab_channel=PlayStation', 9, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (12, 'My Time At Portia', 'Start a new life in the enchanting town of Portia! Restore your Pa\'s neglected workshop to its former glory by fulfilling commissions, growing crops, raising animals, and befriending the quirky inhabitants of this charming post-apocalyptic land!', 2019, 'Single player', 0, 18, NULL, 'https://cdn.cloudflare.steamstatic.com/steam/apps/666140/header.jpg?t=1636724347', 'https://www.youtube.com/watch?v=nC_8tZCLA4I&ab_channel=PlayStation', NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (13, 'Stardew Valley', 'You\'ve inherited your grandfather\'s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home?', 2016, 'Single player, Multiplayer', 0, 8, NULL, 'https://upload.wikimedia.org/wikipedia/en/f/fd/Logo_of_Stardew_Valley.png', 'https://www.youtube.com/watch?v=ot7uXNQskhs&ab_channel=ConcernedApe', NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (14, 'Mario Party 10', 'Mario Party 10 continues the tradition of the Mario Party series, in which four players, controlled by either human or CPU, compete against each other on a game board by participating in various minigames.', 2015, 'Single player, Multiplayer', 0, 3, 3, 'https://upload.wikimedia.org/wikipedia/en/1/1a/Mario_Party_10_Small_Official_Boxart.png', 'https://www.youtube.com/watch?v=L69Z39bgdU4&ab_channel=Nintendo', 10, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (15, 'Super Smash Bros Wii U', 'non-traditional fighting games where players use different attacks to weaken their opponents and knock them out of an arena. The games are crossover titles that feature characters, items, music, and stages from various Nintendo franchises, as well as from several third-party franchises.', 2014, 'Single player, Multiplayer', 0, 3, 4, 'https://upload.wikimedia.org/wikipedia/en/a/a2/Super_Smash_Bros_for_Wii_U_Box_Art.png', 'https://www.youtube.com/watch?v=xvudMu-5kIU&ab_channel=SuperSmashBros.', 4, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (16, 'Player Unknown Battle Grounds', 'Pubg // Battlegrounds is a player versus player shooter game in which up to one hundred players fight in a battle royale, a type of large-scale last man standing deathmatch where players fight to remain the last alive. Players can choose to enter the match solo, duo, or with a small team of up to four people. The last person or team alive wins the match', 2017, 'Multiplayer', 1, 13, NULL, 'https://upload.wikimedia.org/wikipedia/en/9/9f/Pubgbattlegrounds.png', 'https://www.youtube.com/watch?v=Zi2hMMVpS64&ab_channel=PlayStationEurope', NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (17, 'Overwatch', 'Overwatch is a team-based multiplayer first-person shooter game developed and published by Blizzard Entertainment. Described as a “hero shooter”, Overwatch assigns players into two teams of six, with each player selecting from a large roster of characters, known as “heroes”, with unique abilities.', 2016, 'Multiplayer', 1, 14, NULL, 'https://upload.wikimedia.org/wikipedia/en/5/51/Overwatch_cover_art.jpg', 'https://www.youtube.com/watch?v=FqnKB22pOC0&ab_channel=PlayOverwatch', NULL, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (18, 'Starcraft', 'Set in a fictitious future timeline during the 25th century AD in a distant part of the Milky Way galaxy known as the Koprulu Sector, the game revolves around three intelligent species fighting for dominance: the Terrans are humans exiled from Earth who are now skilled at adapting to any situation; the Zerg are a race of insectoid aliens in pursuit of genetic perfection and obsessed with assimilating other races; the Protoss are a humanoid species with advanced technology and psionic abilities who are attempting to preserve their civilization and strict philosophy about their way of life from the Zerg./', 1999, 'Single player, Multiplayer', 0, 14, 12, 'https://upload.wikimedia.org/wikipedia/en/9/93/StarCraft_box_art.jpg', 'https://www.youtube.com/watch?v=H4Z6Rmbtk1k&ab_channel=DarkBoneFTW', 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (19, 'Need for Speed Underground', 'Need for Speed: Underground is a 2003 racing video game and the seventh installment in the Need for Speed series. It was developed by EA Black Box and published by Electronic Arts. Three different games were produced, one for consoles and Windows, and the other for the Game Boy Advance along with a version deveolped by Global VR for Arcades that was published by Konami.', 2003, 'Single player', 0, 15, 13, 'https://upload.wikimedia.org/wikipedia/en/a/a0/Nfsu-win-cover.jpg', 'https://www.youtube.com/watch?v=WWiTSTnfwv0&ab_channel=TheHateAccount', 7, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (20, 'World of Warcraft', 'World of Warcraft (WoW) is a massively multiplayer online role-playing game (MMORPG) released in 2004 by Blizzard Entertainment. Similar to other MMORPGs, the game allows players to create a character avatar and explore an open game world in third- or first-person view, exploring the landscape, fighting various monsters, completing quests, and interacting with non-player characters (NPCs) or other players. The game encourages players to work together to complete quests, enter dungeons and engage in player versus player (PvP) combat, however the game can also be played solo without interacting with others.', 2004, 'Single player, Multiplayer', 0, 14, 9, 'https://upload.wikimedia.org/wikipedia/en/9/91/WoW_Box_Art1.jpg', 'https://www.youtube.com/watch?v=vlVSJ0AvZe0&ab_channel=WorldofWarcraft', 7, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (21, 'The Witcher', 'Become The Witcher, Geralt of Rivia, a legendary monster slayer caught in a web of intrigue woven by forces vying for control of the world. Make difficult decisions and live with the consequences in a game that will immerse you in an extraordinary tale like no other.', 2007, 'Single player', 0, 17, 8, 'https://upload.wikimedia.org/wikipedia/en/b/b0/The_Witcher_EU_box.jpg', 'https://www.youtube.com/watch?v=B00E5f7-yz4&ab_channel=omegas21', 1, 1, NULL);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `mode`, `cross_platform`, `developer_id`, `series_id`, `image_url`, `trailer_url`, `number_in_series`, `added_by_user`, `when_added`) VALUES (22, 'Dark Souls', 'Dark Souls takes place in the fictional kingdom of Lordran, where players assume the role of a cursed undead character who begins a pilgrimage to discover the fate of their kind.', 2011, 'Single player, Multiplayer', 0, 19, 14, 'https://upload.wikimedia.org/wikipedia/en/8/8d/Dark_Souls_Cover_Art.jpg', 'https://www.youtube.com/watch?v=9IbPrk-yuts&ab_channel=BandaiNamcoEntertainmentAmerica', 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `book`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `book` (`id`, `title`, `description`, `release_year`, `author`, `game_series_id`) VALUES (1, 'Blood of Elves', 'Blood of Elves is the first novel in the Witcher Saga written by the Polish fantasy writer Andrzej Sapkowski, first published in Poland in 1994. It is a sequel to the Witcher short stories collected in the books The Last Wish and Sword of Destiny and is followed by Time of Contempt.', 1994, 'Andrzej Sapkowski', 8);
INSERT INTO `book` (`id`, `title`, `description`, `release_year`, `author`, `game_series_id`) VALUES (2, 'Ghost Recon', 'The U.S. Army\'s Special Forces are known for their highly specialized training and courage behind enemy lines. But there\'s a group that\'s even more stealthy and deadly. It\'s composed of the most feared operators on the face of the earth-the soldiers of Ghost Recon.', 2008, 'David Michaels', 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `movie`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `movie` (`id`, `title`, `release_year`, `description`, `series_id`, `imdb_url`, `poster_image_url`, `trailer_url`) VALUES (1, 'Warcraft', 2016, 'American action fantasy film based on the video game series of the same name.', 9, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `profile_picture`, `enabled`, `role`) VALUES (1, 'admin', 'admin', NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (1, 'Nintendo', NULL, NULL, NULL);
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (2, 'PC', NULL, NULL, NULL);
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (3, 'Mac', NULL, NULL, NULL);
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (4, 'Xbox', NULL, NULL, NULL);
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (5, 'PlayStation', NULL, NULL, NULL);
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (6, 'Sega', NULL, NULL, NULL);
INSERT INTO `platform` (`id`, `system_name`, `logo_url`, `release_year`, `platform_url`) VALUES (7, 'Arcade', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (1, 'role playing', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (2, 'action', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (3, 'adventure', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (4, 'shooter', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (5, 'sports', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (6, 'fighting', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (7, 'strategy', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (8, 'platform', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (9, 'racing', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (10, 'simulation', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (11, 'puzzle', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (12, 'roguelike', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (13, 'battle royale', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (14, 'party', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (15, 'real time strategy', NULL);
INSERT INTO `genre` (`id`, `name`, `description`) VALUES (16, 'massively multiplayer online', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tv_show`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `tv_show` (`id`, `title`, `number_seasons`, `release_year`, `description`, `video_game_id`, `series_id`, `imdb_url`, `trailer_url`, `poster_image_url`) VALUES (1, 'THE WITCHER', 1, 2019, 'The witcher Geralt, a mutated monster hunter, struggles to find his place in a world in which people often prove more wicked than beasts.', 21, 8, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `board_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `board_game` (`id`, `name`, `release_year`, `description`, `gameplay`, `video_game_id`, `developer_id`, `image_url`, `website_url`) VALUES (1, 'Dark Souls: The Board Game', 2017, 'Players assume the game role of characters based on classes from the Dark Souls video game series and fight monsters and seek treasure.', NULL, 22, 20, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_games`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `favorite_games` (`video_game_id`, `user_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `platform_has_video_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (1, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (1, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (2, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (3, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (3, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (3, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (3, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (3, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (4, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (4, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (4, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (4, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (5, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (5, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (5, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (6, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (6, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (6, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (7, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (7, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (7, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (7, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (7, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (8, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (8, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (9, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (9, 6);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (10, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (10, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (10, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (10, 7);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (10, 6);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (10, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (11, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (11, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (11, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (11, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (11, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (12, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (12, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (12, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (12, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (12, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (13, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (13, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (13, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (13, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (13, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (14, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (15, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (18, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (18, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (18, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (16, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (16, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (16, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (16, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (17, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (17, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (17, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (17, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (19, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (19, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (19, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (19, 5);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (20, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (20, 3);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (21, 1);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (21, 2);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (21, 4);
INSERT INTO `platform_has_video_game` (`video_game_id`, `platform_id`) VALUES (21, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `video_game_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (1, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (1, 3);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (2, 2);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (2, 3);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (3, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (3, 2);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (3, 12);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (4, 4);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (4, 13);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (5, 4);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (6, 2);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (6, 8);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (7, 4);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (8, 5);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (9, 5);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (10, 2);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (11, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (12, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (12, 2);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (12, 10);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (13, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (13, 10);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (14, 14);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (15, 6);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (16, 4);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (16, 13);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (17, 4);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (18, 15);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (19, 9);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (20, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (20, 16);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (21, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (21, 2);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (22, 1);
INSERT INTO `video_game_has_genre` (`video_game_id`, `genre_id`) VALUES (22, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `streaming_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `streaming_service` (`id`, `name`, `image_url`, `website_url`) VALUES (1, 'Netflix', NULL, NULL);
INSERT INTO `streaming_service` (`id`, `name`, `image_url`, `website_url`) VALUES (2, 'Prime Video', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tv_show_has_streaming_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `tv_show_has_streaming_service` (`tv_show_id`, `streaming_service_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `movie_has_streaming_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `movie_has_streaming_service` (`movie_id`, `streaming_service_id`) VALUES (1, 2);

COMMIT;

