-- MySQL Script generated by MySQL Workbench
-- Sun Apr  1 16:29:13 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema University Database
-- -----------------------------------------------------
-- The University Database For Project 4
-- 

-- -----------------------------------------------------
-- Schema University Database
--
-- The University Database For Project 4
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University Database` DEFAULT CHARACTER SET utf8 ;
USE `University Database` ;

-- -----------------------------------------------------
-- Table `University Database`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University Database`.`Department` (
  `DEPTNAME` VARCHAR(45) NOT NULL,
  `DEPTCODE` INT UNSIGNED NOT NULL,
  `DEPTOFFICE` VARCHAR(45) NOT NULL,
  `DEPTPHONE` INT UNSIGNED NOT NULL,
  `DEPTCOLLEGE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DEPTCODE`),
  UNIQUE INDEX `DEPTCODE_UNIQUE` (`DEPTCODE` ASC),
  UNIQUE INDEX `DEPTNAME_UNIQUE` (`DEPTNAME` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University Database`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University Database`.`Student` (
  `SNAME` VARCHAR(45) NOT NULL,
  `SNUM` INT UNSIGNED NOT NULL,
  `SSN` INT UNSIGNED NOT NULL,
  `SCADDR` VARCHAR(45) NOT NULL,
  `SCPHONE` INT UNSIGNED NOT NULL,
  `SPADDR` VARCHAR(45) NOT NULL,
  `SPPHONE` INT UNSIGNED NOT NULL,
  `BDATE` DATE NOT NULL,
  `SEX` VARCHAR(1) NOT NULL,
  `CLASS` VARCHAR(45) NOT NULL,
  `MAJORDEPTCODE` INT UNSIGNED NOT NULL,
  `MINORDEPTCODE` INT UNSIGNED NOT NULL,
  `PROG` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE INDEX `SSN_UNIQUE` (`SSN` ASC),
  UNIQUE INDEX `SNUM_UNIQUE` (`SNUM` ASC),
  INDEX `fk_Student_Department1_idx` (`MAJORDEPTCODE` ASC),
  INDEX `fk_Student_Department2_idx` (`MINORDEPTCODE` ASC),
  CONSTRAINT `fk_Student_Department1`
    FOREIGN KEY (`MAJORDEPTCODE`)
    REFERENCES `University Database`.`Department` (`DEPTCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_Department2`
    FOREIGN KEY (`MINORDEPTCODE`)
    REFERENCES `University Database`.`Department` (`DEPTCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University Database`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University Database`.`Course` (
  `CNAME` VARCHAR(45) NOT NULL,
  `CDESC` VARCHAR(500) NOT NULL,
  `CNUM` INT UNSIGNED NOT NULL,
  `CREDIT` INT UNSIGNED NOT NULL,
  `LEVEL` VARCHAR(45) NOT NULL,
  `CDEPT` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`CNUM`),
  UNIQUE INDEX `CNUM_UNIQUE` (`CNUM` ASC),
  INDEX `fk_Course_Department1_idx` (`CDEPT` ASC),
  CONSTRAINT `fk_Course_Department1`
    FOREIGN KEY (`CDEPT`)
    REFERENCES `University Database`.`Department` (`DEPTCODE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University Database`.`Section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University Database`.`Section` (
  `INSTRUCTORNAME` VARCHAR(45) NOT NULL,
  `SEMESTER` VARCHAR(45) NOT NULL,
  `YEAR` DATE NOT NULL,
  `SECCOURSE` INT UNSIGNED NOT NULL,
  `SECNUM` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`SEMESTER`, `YEAR`, `SECCOURSE`, `SECNUM`),
  INDEX `fk_Section_Course1_idx` (`SECCOURSE` ASC),
  CONSTRAINT `fk_Section_Course1`
    FOREIGN KEY (`SECCOURSE`)
    REFERENCES `University Database`.`Course` (`CNUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University Database`.`Grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `University Database`.`Grade` (
  `SSN` INT UNSIGNED NOT NULL,
  `SEMESTER` VARCHAR(45) NOT NULL,
  `YEAR` DATE NOT NULL,
  `CNUM` INT UNSIGNED NOT NULL,
  `SECNUM` INT UNSIGNED NOT NULL,
  `GRADE` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`SSN`, `SECNUM`, `CNUM`, `YEAR`, `SEMESTER`),
  UNIQUE INDEX `CNUM_UNIQUE` (`CNUM` ASC),
  UNIQUE INDEX `SSN_UNIQUE` (`SSN` ASC),
  INDEX `fk_Grade_Student2_idx` (`SEMESTER` ASC, `YEAR` ASC, `CNUM` ASC, `SECNUM` ASC),
  CONSTRAINT `fk_Grade_Student1`
    FOREIGN KEY (`SSN`)
    REFERENCES `University Database`.`Student` (`SSN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grade_Student2`
    FOREIGN KEY (`SEMESTER` , `YEAR` , `CNUM` , `SECNUM`)
    REFERENCES `University Database`.`Section` (`SEMESTER` , `YEAR` , `SECCOURSE` , `SECNUM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
