-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema coupang_play
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coupang_play
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coupang_play` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `coupang_play` ;

-- -----------------------------------------------------
-- Table `coupang_play`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`actor` (
  `actor_id` VARCHAR(20) NOT NULL,
  `kr_name` VARCHAR(45) NULL DEFAULT NULL,
  `eng_name` VARCHAR(45) NULL DEFAULT NULL,
  `nationality` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`work`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`work` (
  `work_id` VARCHAR(45) NOT NULL,
  `work_name` VARCHAR(45) NULL DEFAULT NULL,
  `work_name_eng` VARCHAR(45) NULL DEFAULT NULL,
  `director` VARCHAR(45) NULL DEFAULT NULL,
  `production_year` DATE NULL DEFAULT NULL,
  `registration_date` DATE NULL DEFAULT NULL,
  `everage_score` FLOAT NULL DEFAULT NULL,
  `plot` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`appear`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`appear` (
  `appear_id` VARCHAR(30) NOT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  `actor_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`appear_id`),
  INDEX `fk_actor_id_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_appear_work_id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_appear_actor_id`
    FOREIGN KEY (`actor_id`)
    REFERENCES `coupang_play`.`actor` (`actor_id`),
  CONSTRAINT `fk_appear_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`category` (
  `category_id` VARCHAR(45) NOT NULL,
  `category_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`genre` (
  `genre_id` VARCHAR(45) NOT NULL,
  `genre_name` VARCHAR(45) NULL DEFAULT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_genre_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`user` (
  `user_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `id` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `nick_name` VARCHAR(45) NULL DEFAULT NULL,
  `membership` TINYINT NULL DEFAULT NULL,
  `age` INT NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`like_contents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`like_contents` (
  `like_contents_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NULL DEFAULT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`like_contents_id`),
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_like_contents_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `coupang_play`.`user` (`user_id`),
  CONSTRAINT `fk_like_contents_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`media` (
  `media_id` VARCHAR(45) NOT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  `episode` INT NULL DEFAULT NULL,
  `plot` VARCHAR(45) NULL DEFAULT NULL,
  `media_data` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`media_id`),
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_media_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`reveiw`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`reveiw` (
  `reveiw_id` VARCHAR(45) NOT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  `user_id` VARCHAR(45) NULL DEFAULT NULL,
  `reveiw_content` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`reveiw_id`),
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `coupang_play`.`user` (`user_id`),
  CONSTRAINT `fk_review_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`score` (
  `score_id` VARCHAR(45) NOT NULL,
  `score` INT NULL DEFAULT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  `user_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`),
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_score_work_id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_score_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `coupang_play`.`user` (`user_id`),
  CONSTRAINT `fk_score_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`watching_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`watching_content` (
  `watching_content_id` VARCHAR(45) NOT NULL,
  `user_id` VARCHAR(45) NULL DEFAULT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  `media_id` VARCHAR(45) NULL DEFAULT NULL,
  `last_watching_time` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`watching_content_id`),
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  INDEX `kf_media_id_idx` (`media_id` ASC) VISIBLE,
  CONSTRAINT `fk_watching_content_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `coupang_play`.`user` (`user_id`),
  CONSTRAINT `fk_watching_content_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`),
  CONSTRAINT `kf_watching_content_media_id`
    FOREIGN KEY (`media_id`)
    REFERENCES `coupang_play`.`media` (`media_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`watching_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`watching_history` (
  `watching_history_id` VARCHAR(45) NOT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  `category_id` VARCHAR(45) NULL DEFAULT NULL,
  `genre_id` VARCHAR(45) NULL DEFAULT NULL,
  `watching_time_sum` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`watching_history_id`),
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  INDEX `fk_category_id_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_genre_id_idx` (`genre_id` ASC) VISIBLE,
  CONSTRAINT `fk_watching_history_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `coupang_play`.`category` (`category_id`),
  CONSTRAINT `fk_watching_history_genre_id`
    FOREIGN KEY (`genre_id`)
    REFERENCES `coupang_play`.`genre` (`genre_id`),
  CONSTRAINT `fk_watching_history_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `coupang_play`.`work_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coupang_play`.`work_category` (
  `work_category` VARCHAR(45) NOT NULL,
  `category_id` VARCHAR(45) NULL DEFAULT NULL,
  `work_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`work_category`),
  INDEX `fk_category_id_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_work_id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `fk_work_category_category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `coupang_play`.`category` (`category_id`),
  CONSTRAINT `fk_work_category_work_id`
    FOREIGN KEY (`work_id`)
    REFERENCES `coupang_play`.`work` (`work_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
