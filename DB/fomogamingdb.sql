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
-- Table `video_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `video_game` ;

CREATE TABLE IF NOT EXISTS `video_game` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `release_year` YEAR NULL,
  `multi_platform` TINYINT NULL,
  `mode` VARCHAR(45) NULL,
  `cross_platform` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book` ;

CREATE TABLE IF NOT EXISTS `book` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL,
  `release_year` YEAR NULL,
  `author` VARCHAR(100) NULL,
  `video_game_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_video_game1_idx` (`video_game_id` ASC),
  CONSTRAINT `fk_book_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
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
  `release_year` YEAR NULL,
  `description` VARCHAR(500) NULL,
  `video_game_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movie_video_game_idx` (`video_game_id` ASC),
  CONSTRAINT `fk_movie_video_game`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `series`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `series` ;

CREATE TABLE IF NOT EXISTS `series` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `number_games` INT NULL,
  `video_game_id` INT NOT NULL,
  `movie_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_series_video_game1_idx` (`video_game_id` ASC),
  INDEX `fk_series_movie1_idx` (`movie_id` ASC),
  CONSTRAINT `fk_series_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_series_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tv_shows`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tv_shows` ;

CREATE TABLE IF NOT EXISTS `tv_shows` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `number_seasons` INT NULL,
  `stream_service` VARCHAR(45) NULL,
  `release_year` YEAR NULL,
  `description` VARCHAR(500) NULL,
  `video_game_id` INT NOT NULL,
  `series_id` INT NULL,
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
    REFERENCES `series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `director` ;

CREATE TABLE IF NOT EXISTS `director` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `tv_shows_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_director_tv_shows1_idx` (`tv_shows_id` ASC),
  INDEX `fk_director_movie1_idx` (`movie_id` ASC),
  CONSTRAINT `fk_director_tv_shows1`
    FOREIGN KEY (`tv_shows_id`)
    REFERENCES `tv_shows` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_director_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie` (`id`)
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
-- Table `platforms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platforms` ;

CREATE TABLE IF NOT EXISTS `platforms` (
  `id` INT NOT NULL,
  `system_name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL,
  `genre_type` VARCHAR(45) NULL,
  `video_game_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_genre_video_game1_idx` (`video_game_id` ASC),
  CONSTRAINT `fk_genre_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
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
  `release_year` YEAR NULL,
  `description` VARCHAR(100) NULL,
  `gameplay` TEXT NULL,
  `video_game_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_board_game_video_game1_idx` (`video_game_id` ASC),
  CONSTRAINT `fk_board_game_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `developer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `developer` ;

CREATE TABLE IF NOT EXISTS `developer` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `founding_year` YEAR NULL,
  `video_game_id` INT NULL,
  `board_game_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_developer_video_game1_idx` (`video_game_id` ASC),
  INDEX `fk_developer_board_game1_idx` (`board_game_id` ASC),
  CONSTRAINT `fk_developer_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_developer_board_game1`
    FOREIGN KEY (`board_game_id`)
    REFERENCES `board_game` (`id`)
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
-- Table `platforms_has_video_game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platforms_has_video_game` ;

CREATE TABLE IF NOT EXISTS `platforms_has_video_game` (
  `platforms_id` INT NOT NULL,
  `video_game_id` INT NOT NULL,
  PRIMARY KEY (`platforms_id`, `video_game_id`),
  INDEX `fk_platforms_has_video_game_video_game1_idx` (`video_game_id` ASC),
  INDEX `fk_platforms_has_video_game_platforms1_idx` (`platforms_id` ASC),
  CONSTRAINT `fk_platforms_has_video_game_platforms1`
    FOREIGN KEY (`platforms_id`)
    REFERENCES `platforms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_platforms_has_video_game_video_game1`
    FOREIGN KEY (`video_game_id`)
    REFERENCES `video_game` (`id`)
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
-- Data for table `video_game`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (1, 'Horizon Zero Dawn', 'Experience Aloy’s legendary quest to unravel the mysteries of a future Earth ruled by Machines. Use devastating tactical attacks against your prey and explore a majestic open world in this award-winning action RPG!', 2017, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (2, 'Breath of the Wild', 'Breath of the Wild is an action-adventure game set in an open world where players are tasked with exploring the kingdom of Hyrule while controlling Link. ... Link can procure items from the environment, including weapons, food, and other resources. Unlike previous Zelda games, weapons and shields degrade through use.', 2017, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (3, 'Hades', 'Defy the god of the dead as you hack and slash out of the Underworld in this rogue-like dungeon crawler from the creators of Bastion, Transistor, and Pyre.', 2018, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (4, 'Apex Legends', 'Apex Legends is the award-winning, free-to-play Hero shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.', 2019, 1, 'Multiplayer', 1);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (5, 'Destiny 2', 'Destiny 2 is an action MMO with a single evolving world that you and your friends can join anytime, anywhere, absolutely free.', 2017, 1, 'Single player, Multiplayer', 1);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (6, 'Mega Man', 'Mega Man, known as Rockman in Japan, is a Japanese science fiction video game franchise created by Capcom, starring a series of robot characters each known by the moniker \"Mega Man\".', 1987, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (7, 'Ghost Recon', 'Eastern Europe, 2008. War has broken out on the borders of Russia and the fate of the world hangs in the balance. That\'s when the call goes out for the Ghostsan elite handful of specially trained Green Berets, armed with the latest technology and trained to use the deadliest weapons. Their mission: Spearhead the way for a NATO peacekeeping force, and keep the lid on the conflict before it mushrooms... literally.', 2001, 1, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (8, 'Madden NFL Football', 'Madden NFL (known as John Madden Football until 1994) is an American Football video game series developed by EA Tiburon for EA Sports. It is named after Pro Football Hall Of Fame coach and commentator John Madden, and it has sold more than 250 million copies. It is also the only officially licensed (NFL) video game series, and it has influenced many players and coaches of the physical sport.', 1988, 1, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (9, 'NCAA College Football', 'NCAA Football is an American Football video game series series developed by EA Sports in which players control and compete against current Division 1 FBS college football teams. It served as a college football counterpart to the  Madden NFL series. The series began in 1993 with the release of Bill Walsh College Football. EA eventually acquired the licensing rights to the NCAA name and officially rechristened the series with the release of NCAA Football 98', 1993, 1, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (10, 'Paper Boy', 'Paperboy is an arcade action game developed and published by Atari Games and Midway Games, and released in 1985. The player takes the role of a paperboy who delivers a fictional newspaper called The Daily Sun along a suburban street on his bicycle. The arcade version of the game featured bike handlebars as the controller.The game was ported to many home systems beginning in 1986.', 1985, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (11, 'Final Fantasy IX', 'Zidane and the Tantalus Theater Troupe have kidnapped Princess Garnet, the heir of Alexandria. To their surprise, however, the princess herself yearned to escape the castle.\nThrough a series of unusual circumstances, she and her personal guard, Steiner, fall in with Zidane and set out on an incredible journey. Meeting unforgettable characters like Vivi and Quina along the way, they learn about themselves, the secrets of the Crystal, and a malevolent force that threatens to destroy their world.', 2020, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (12, 'My Time In Portia', 'Start a new life in the enchanting town of Portia! Restore your Pa\'s neglected workshop to its former glory by fulfilling commissions, growing crops, raising animals, and befriending the quirky inhabitants of this charming post-apocalyptic land!', 2019, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (13, 'Stardew Valley', 'You\'ve inherited your grandfather\'s old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home?', 2016, 1, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (14, 'Mario Party 10', 'Mario Party 10 continues the tradition of the Mario Party series, in which four players, controlled by either human or CPU, compete against each other on a game board by participating in various minigames.', 2015, 0, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (15, 'Super Smash Bros Wii U', 'non-traditional fighting games where players use different attacks to weaken their opponents and knock them out of an arena. The games are crossover titles that feature characters, items, music, and stages from various Nintendo franchises, as well as from several third-party franchises.', 2014, 0, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (16, 'Player Unknown Battle Grounds', 'Pubg // Battlegrounds is a player versus player shooter game in which up to one hundred players fight in a battle royale, a type of large-scale last man standing deathmatch where players fight to remain the last alive. Players can choose to enter the match solo, duo, or with a small team of up to four people. The last person or team alive wins the match', 2017, 1, 'Multiplayer', 1);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (17, 'Overwatch', 'Overwatch is a team-based multiplayer first-person shooter game developed and published by Blizzard Entertainment. Described as a “hero shooter”, Overwatch assigns players into two teams of six, with each player selecting from a large roster of characters, known as “heroes”, with unique abilities.', 2016, 1, 'Multiplayer', 1);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (18, 'Starcraft', 'Set in a fictitious future timeline during the 25th century AD in a distant part of the Milky Way galaxy known as the Koprulu Sector, the game revolves around three intelligent species fighting for dominance: the Terrans are humans exiled from Earth who are now skilled at adapting to any situation; the Zerg are a race of insectoid aliens in pursuit of genetic perfection and obsessed with assimilating other races; the Protoss are a humanoid species with advanced technology and psionic abilities who are attempting to preserve their civilization and strict philosophy about their way of life from the Zerg./', 1999, 0, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (19, 'Need for Speed Underground', 'Need for Speed: Underground is a 2003 racing video game and the seventh installment in the Need for Speed series. It was developed by EA Black Box and published by Electronic Arts. Three different games were produced, one for consoles and Windows, and the other for the Game Boy Advance along with a version deveolped by Global VR for Arcades that was published by Konami.', 2003, 1, 'Single player', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (20, 'World of Warcraft', 'World of Warcraft (WoW) is a massively multiplayer online role-playing game (MMORPG) released in 2004 by Blizzard Entertainment. Similar to other MMORPGs, the game allows players to create a character avatar and explore an open game world in third- or first-person view, exploring the landscape, fighting various monsters, completing quests, and interacting with non-player characters (NPCs) or other players. The game encourages players to work together to complete quests, enter dungeons and engage in player versus player (PvP) combat, however the game can also be played solo without interacting with others.', 2004, 0, 'Single player, Multiplayer', 0);
INSERT INTO `video_game` (`id`, `name`, `description`, `release_year`, `multi_platform`, `mode`, `cross_platform`) VALUES (21, 'The Witcher', 'Become The Witcher, Geralt of Rivia, a legendary monster slayer caught in a web of intrigue woven by forces vying for control of the world. Make difficult decisions and live with the consequences in a game that will immerse you in an extraordinary tale like no other.', 2007, 1, 'Single player', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `book`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `book` (`id`, `title`, `description`, `release_year`, `author`, `video_game_id`) VALUES (1, 'Blood of Elves', 'Blood of Elves is the first novel in the Witcher Saga written by the Polish fantasy writer Andrzej Sapkowski, first published in Poland in 1994. It is a sequel to the Witcher short stories collected in the books The Last Wish and Sword of Destiny and is followed by Time of Contempt.', 1994, 'Andrzej Sapkowski', 21);
INSERT INTO `book` (`id`, `title`, `description`, `release_year`, `author`, `video_game_id`) VALUES (2, 'Ghost Recon', 'The U.S. Army\'s Special Forces are known for their highly specialized training and courage behind enemy lines. But there\'s a group that\'s even more stealthy and deadly. It\'s composed of the most feared operators on the face of the earth-the soldiers of Ghost Recon.', 2008, 'David Michaels', 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `movie`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `movie` (`id`, `title`, `release_year`, `description`, `video_game_id`) VALUES (1, 'Warcraft', 2016, 'American action fantasy film based on the video game series of the same name.', 20);

COMMIT;


-- -----------------------------------------------------
-- Data for table `series`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `series` (`id`, `name`, `number_games`, `video_game_id`, `movie_id`) VALUES (1, 'The Legend of Zelda', 27, 2, NULL);
INSERT INTO `series` (`id`, `name`, `number_games`, `video_game_id`, `movie_id`) VALUES (2, 'Final Fantasy', 15, 11, NULL);
INSERT INTO `series` (`id`, `name`, `number_games`, `video_game_id`, `movie_id`) VALUES (3, 'Mario Party', 17, 14, NULL);
INSERT INTO `series` (`id`, `name`, `number_games`, `video_game_id`, `movie_id`) VALUES (4, 'Super Smash Brothers', 6, 15, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tv_shows`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `tv_shows` (`id`, `title`, `number_seasons`, `stream_service`, `release_year`, `description`, `video_game_id`, `series_id`) VALUES (1, 'THE WITCHER', 1, 'Netflix', 2019, 'The witcher Geralt, a mutated monster hunter, struggles to find his place in a world in which people often prove more wicked than beasts.', 21, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `profile_picture`, `enabled`, `role`) VALUES (1, 'admin', 'admin', NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `platforms`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `platforms` (`id`, `system_name`) VALUES (1, 'Nintendo');
INSERT INTO `platforms` (`id`, `system_name`) VALUES (2, 'PC');
INSERT INTO `platforms` (`id`, `system_name`) VALUES (3, 'Mac');
INSERT INTO `platforms` (`id`, `system_name`) VALUES (4, 'Xbox');
INSERT INTO `platforms` (`id`, `system_name`) VALUES (5, 'PlayStation');
INSERT INTO `platforms` (`id`, `system_name`) VALUES (6, 'Sega');
INSERT INTO `platforms` (`id`, `system_name`) VALUES (7, 'Arcade');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (1, 'role playing', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (2, 'action', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (3, 'adventure', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (4, 'shooter', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (5, 'sports', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (6, 'fighting', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (7, 'strategy', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (8, 'platform', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (9, 'racing', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (10, 'simulation', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (11, 'puzzle', NULL);
INSERT INTO `genre` (`id`, `genre_type`, `video_game_id`) VALUES (12, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `developer`
-- -----------------------------------------------------
START TRANSACTION;
USE `fomogaming`;
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (1, 'Capcom', 'Japan', 1979, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (2, 'Guerrilla Games', 'Netherlands', 2000, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (3, 'Nintendo Entertainment', 'Japan', NULL, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (4, 'Supergiant Games', 'United States', 2009, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (5, 'Square Enix', 'Japan', 2003, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (6, 'EA Sports', 'United States', 1991, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (7, 'Respawn Entertainment', 'United States', 2010, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (8, 'Concerned Ape', 'United States', 2012, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (9, 'Ubisoft', 'France', 1986, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (10, 'Atari', 'United States', 1976, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (11, 'Bungie', 'United States', 1991, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (12, 'ND Cube', 'Japan', 2000, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (13, 'PUBG Corp', 'South Korea', 2009, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (14, 'Blizzard Entertainment', 'United States', 1991, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (15, 'EA', 'United States', 1982, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (16, 'Sora Ltd', 'Japan', 2005, NULL, NULL);
INSERT INTO `developer` (`id`, `name`, `country`, `founding_year`, `video_game_id`, `board_game_id`) VALUES (17, 'CD Projekt Red', 'Poland', 2002, NULL, NULL);

COMMIT;

