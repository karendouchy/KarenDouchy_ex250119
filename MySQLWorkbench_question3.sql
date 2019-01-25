-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PATIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PATIENT` (
  `idPATIENT` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `diagnosis_age` VARCHAR(45) NULL,
  PRIMARY KEY (`idPATIENT`),
  UNIQUE INDEX `idPATIENT_UNIQUE` (`idPATIENT` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GENE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GENE` (
  `idGENE` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` VARCHAR(45) NULL,
  `discription` VARCHAR(45) NULL,
  `idPATIENT` INT NOT NULL,
  PRIMARY KEY (`idGENE`),
  UNIQUE INDEX `idGENE_UNIQUE` (`idGENE` ASC) VISIBLE,
  UNIQUE INDEX `idPATIENT_UNIQUE` (`idPATIENT` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SYNDROME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SYNDROME` (
  `idSYNDROME` INT NOT NULL,
  `discription` VARCHAR(45) NULL,
  PRIMARY KEY (`idSYNDROME`),
  UNIQUE INDEX `idSYNDROME_UNIQUE` (`idSYNDROME` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GENE_SYNDROME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GENE_SYNDROME` (
  `idGENE_SYNDROME` INT NOT NULL,
  `idGENE` INT NOT NULL,
  `idSYNDROME` INT NOT NULL,
  PRIMARY KEY (`idGENE_SYNDROME`),
  UNIQUE INDEX `idGENE_SYNDROME_UNIQUE` (`idGENE_SYNDROME` ASC) VISIBLE,
  UNIQUE INDEX `idGENE_UNIQUE` (`idGENE` ASC) VISIBLE,
  UNIQUE INDEX `idSYNDROME_UNIQUE` (`idSYNDROME` ASC) VISIBLE,
  CONSTRAINT `fk_GENE_SYNDROME_1`
    FOREIGN KEY (`idGENE`)
    REFERENCES `mydb`.`GENE` (`idGENE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GENE_SYNDROME_2`
    FOREIGN KEY (`idSYNDROME`)
    REFERENCES `mydb`.`SYNDROME` (`idSYNDROME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PATIENT_SYNDROME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PATIENT_SYNDROME` (
  `idPATIENT_SYNDROME` INT NOT NULL,
  `idPATIENT` INT NOT NULL,
  `idSYNDROME` INT NOT NULL,
  PRIMARY KEY (`idPATIENT_SYNDROME`),
  UNIQUE INDEX `idPATIENT_SYNDROME_UNIQUE` (`idPATIENT_SYNDROME` ASC) VISIBLE,
  UNIQUE INDEX `idPATIENT_UNIQUE` (`idPATIENT` ASC) VISIBLE,
  UNIQUE INDEX `idSYNDROME_UNIQUE` (`idSYNDROME` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT_SYNDROME_2`
    FOREIGN KEY (`idSYNDROME`)
    REFERENCES `mydb`.`SYNDROME` (`idSYNDROME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PATIENT_SYNDROME_1`
    FOREIGN KEY (`idPATIENT`)
    REFERENCES `mydb`.`PATIENT` (`idPATIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PATIENT_GENE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PATIENT_GENE` (
  `idPATIENT_GENE` INT NOT NULL,
  `idPATIENT` INT NOT NULL,
  `idGENE` INT NOT NULL,
  PRIMARY KEY (`idPATIENT_GENE`),
  UNIQUE INDEX `idPATIENT_GENE_UNIQUE` (`idPATIENT_GENE` ASC) VISIBLE,
  UNIQUE INDEX `idPATIENT_UNIQUE` (`idPATIENT` ASC) VISIBLE,
  UNIQUE INDEX `PATIENT_GENEcol_UNIQUE` (`idGENE` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT_GENE_1`
    FOREIGN KEY (`idGENE`)
    REFERENCES `mydb`.`GENE` (`idGENE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PATIENT_GENE_2`
    FOREIGN KEY (`idPATIENT`)
    REFERENCES `mydb`.`PATIENT` (`idPATIENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
