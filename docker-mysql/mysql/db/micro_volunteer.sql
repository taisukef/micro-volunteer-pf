-- MySQL Script generated by MySQL Workbench
-- Tue Nov 30 20:49:37 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema volunteerdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema volunteerdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `volunteerdb` DEFAULT CHARACTER SET utf8 ;
USE `volunteerdb` ;

-- -----------------------------------------------------
-- Table `volunteerdb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`Users` (
  `user_id` VARCHAR(64) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` VARCHAR(64) NOT NULL,
  `email` VARCHAR(256) NOT NULL,
  `password` VARCHAR(512) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`VolunteerHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`VolunteerHistory` (
  `history_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` GEOMETRY NULL,
  `volunteer_id` VARCHAR(64) NOT NULL,
  `handicapped_id` VARCHAR(64) NOT NULL,
  `handicap_type` INT NULL,
  `handicap_level` INT NULL,
  `satisfaction` INT NULL,
  `thanks_comment` VARCHAR(256) NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`history_id`),
  INDEX `handicapped_id_idx` (`handicapped_id` ASC) VISIBLE,
  CONSTRAINT `volunteer_id`
    FOREIGN KEY (`volunteer_id`)
    REFERENCES `volunteerdb`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `handicapped_id`
    FOREIGN KEY (`handicapped_id`)
    REFERENCES `volunteerdb`.`Users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`VolunteerSummary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`VolunteerSummary` (
  `summary_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `volunteer_id` VARCHAR(64) NULL,
  `handicap_type` INT NULL,
  `thanks_num` INT NULL,
  `reliability_th` INT NULL,
  PRIMARY KEY (`summary_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`SnsId`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`SnsId` (
  `user_id` VARCHAR(64) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sns_id` VARCHAR(64) NOT NULL,
  `sns_type` INT NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`HandicapMaster`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`HandicapMaster` (
  `handicap_type` INT NOT NULL,
  `handicap_level` INT NOT NULL,
  `comment` VARCHAR(512) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`HandicapInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`HandicapInfo` (
  `handicapinfo_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `handicapped_id` VARCHAR(64) NOT NULL,
  `handicap_type` INT NOT NULL,
  `handicap_level` INT NOT NULL,
  `reliability_th` INT NULL,
  `severity` INT NULL,
  `comment` VARCHAR(128) NULL,
  INDEX `handicapped_id_idx` (`handicapped_id` ASC) VISIBLE,
  INDEX `handicap_type_idx` (`handicap_type` ASC) VISIBLE,
  INDEX `handicap_level_idx` (`handicap_level` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`Session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`Session` (
  `session_id` VARCHAR(128) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` VARCHAR(64) NULL,
  PRIMARY KEY (`session_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`Help`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`Help` (
  `help_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `handicapped_id` VARCHAR(64) NULL,
  `volunteer_id` VARCHAR(64) NULL,
  `location` GEOMETRY NOT NULL,
  `handicap_type` INT NULL,
  `handicap_level` INT NULL,
  `reliability_th` INT NULL,
  `severity` INT NULL,
  `comment` VARCHAR(128),
  `status` INT NULL COMMENT '助けを呼ぶ',
  INDEX `handicapped_id_idx` (`handicapped_id` ASC) VISIBLE,
  INDEX `volunteer_id_idx` (`volunteer_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`CheckIn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`CheckIn` (
  `checkin_id` INT NOT NULL ,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `area_id` INT NULL,
  `user_id` VARCHAR(64) NULL,
  `sojourn_time` INT NULL,
  PRIMARY KEY (`checkin_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `volunteerdb`.`MyGeometry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `volunteerdb`.`MyGeometry` (
  `user_id` VARCHAR(64) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` GEOMETRY NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
