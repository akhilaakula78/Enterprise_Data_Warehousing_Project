-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema upwork_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema upwork_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `upwork_db` DEFAULT CHARACTER SET utf8 ;
USE `upwork_db` ;

-- -----------------------------------------------------
-- Table `upwork_db`.`Client_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_db`.`Client_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_db`.`Client_AkhilaA` (
  `ClientID` INT NOT NULL AUTO_INCREMENT,
  `ClientFirstName` VARCHAR(45) NOT NULL,
  `ClientLastName` VARCHAR(45) NOT NULL,
  `ClientEmailAddress` VARCHAR(255) NOT NULL,
  `ClientCountry` VARCHAR(225) NULL,
  `AcceptedTerms` TINYINT NOT NULL,
  `ReceiveEmailUpdates` TINYINT NULL,
  `AccountCreatedDate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE INDEX `ClientEmailAddress_UNIQUE` (`ClientEmailAddress` ASC) VISIBLE,
  PRIMARY KEY (`ClientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_db`.`Freelancer_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_db`.`Freelancer_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_db`.`Freelancer_AkhilaA` (
  `FreelancerID` INT NOT NULL AUTO_INCREMENT,
  `FreelancerFirstName` VARCHAR(45) NOT NULL,
  `FreelancerLastName` VARCHAR(45) NOT NULL,
  `FreelancerEmailAddress` VARCHAR(225) NOT NULL,
  `FreelancerCountry` VARCHAR(45) NULL,
  `ReceiveEmailUpdates` TINYINT NULL,
  `AcceptedTerms` TINYINT NOT NULL,
  `Skills` TEXT NOT NULL,
  `ExperienceLevel` VARCHAR(45) NOT NULL,
  `HourlyRate` DECIMAL(10,2) NOT NULL,
  `AccountCreatedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TotalEarnings` DECIMAL(10,2) NOT NULL,
  `JobsCompleted` INT NOT NULL,
  PRIMARY KEY (`FreelancerID`),
  UNIQUE INDEX `FreelancerEmailAddress_UNIQUE` (`FreelancerEmailAddress` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_db`.`Project_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_db`.`Project_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_db`.`Project_AkhilaA` (
  `ProjectID` INT NOT NULL AUTO_INCREMENT,
  `ProjectTitle` VARCHAR(225) NOT NULL,
  `Description` TEXT NOT NULL,
  `Budget` DECIMAL(10,2) NOT NULL,
  `ExperienceLevelRequired` VARCHAR(45) NULL,
  `LocationRequired` VARCHAR(100) NOT NULL,
  `SkillRequired` VARCHAR(45) NOT NULL,
  `ProjectStatus` VARCHAR(45) NOT NULL,
  `PostedDate` TIMESTAMP NOT NULL,
  `Client_AkhilaA_ClientID` INT NOT NULL,
  PRIMARY KEY (`ProjectID`),
  INDEX `fk_Project_AkhilaA_Client_AkhilaA_idx` (`Client_AkhilaA_ClientID` ASC) VISIBLE,
  CONSTRAINT `fk_Project_AkhilaA_Client_AkhilaA`
    FOREIGN KEY (`Client_AkhilaA_ClientID`)
    REFERENCES `upwork_db`.`Client_AkhilaA` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_db`.`Bid_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_db`.`Bid_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_db`.`Bid_AkhilaA` (
  `BidID` INT NOT NULL AUTO_INCREMENT,
  `BidAmount` DECIMAL(10,2) NOT NULL,
  `ProposedStartDate` DATE NOT NULL,
  `ProposedEndDate` DATE NOT NULL,
  `Freelancer_AkhilaA_FreelancerID` INT NOT NULL,
  `Project_AkhilaA_ProjectID` INT NOT NULL,
  PRIMARY KEY (`BidID`),
  INDEX `fk_Bid_AkhilaA_Freelancer_AkhilaA1_idx` (`Freelancer_AkhilaA_FreelancerID` ASC) VISIBLE,
  INDEX `fk_Bid_AkhilaA_Project_AkhilaA1_idx` (`Project_AkhilaA_ProjectID` ASC) VISIBLE,
  CONSTRAINT `fk_Bid_AkhilaA_Freelancer_AkhilaA1`
    FOREIGN KEY (`Freelancer_AkhilaA_FreelancerID`)
    REFERENCES `upwork_db`.`Freelancer_AkhilaA` (`FreelancerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bid_AkhilaA_Project_AkhilaA1`
    FOREIGN KEY (`Project_AkhilaA_ProjectID`)
    REFERENCES `upwork_db`.`Project_AkhilaA` (`ProjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_db`.`Review_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_db`.`Review_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_db`.`Review_AkhilaA` (
  `ReviewID` INT NOT NULL AUTO_INCREMENT,
  `Rating` DECIMAL(2,1) NOT NULL,
  `Feedback` TEXT NULL,
  `ClientID` INT NOT NULL,
  `FreelancerID` INT NOT NULL,
  `ProjectID` INT NOT NULL,
  `ReviewDate` TIMESTAMP NOT NULL,
  `Client_AkhilaA_ClientID` INT NOT NULL,
  `Freelancer_AkhilaA_FreelancerID` INT NOT NULL,
  `Project_AkhilaA_ProjectID` INT NOT NULL,
  PRIMARY KEY (`ReviewID`),
  INDEX `fk_Review_AkhilaA_Client_AkhilaA1_idx` (`Client_AkhilaA_ClientID` ASC) VISIBLE,
  INDEX `fk_Review_AkhilaA_Freelancer_AkhilaA1_idx` (`Freelancer_AkhilaA_FreelancerID` ASC) VISIBLE,
  INDEX `fk_Review_AkhilaA_Project_AkhilaA1_idx` (`Project_AkhilaA_ProjectID` ASC) VISIBLE,
  CONSTRAINT `fk_Review_AkhilaA_Client_AkhilaA1`
    FOREIGN KEY (`Client_AkhilaA_ClientID`)
    REFERENCES `upwork_db`.`Client_AkhilaA` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_AkhilaA_Freelancer_AkhilaA1`
    FOREIGN KEY (`Freelancer_AkhilaA_FreelancerID`)
    REFERENCES `upwork_db`.`Freelancer_AkhilaA` (`FreelancerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_AkhilaA_Project_AkhilaA1`
    FOREIGN KEY (`Project_AkhilaA_ProjectID`)
    REFERENCES `upwork_db`.`Project_AkhilaA` (`ProjectID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Insert Data into `upwork_db`.`Client_AkhilaA`
-- -----------------------------------------------------
INSERT INTO upwork_db.Client_AkhilaA (ClientFirstName, ClientLastName, ClientEmailAddress, ClientCountry, AcceptedTerms, ReceiveEmailUpdates, AccountCreatedDate) VALUES 
('John', 'Ariel', 'john.ariel@example.com', 'USA', 1, 1, '2024-01-01 10:00:00'),
('Taylor', 'Smith', 'taylor.smith@example.com', 'UK', 1, 0, '2024-02-01 11:00:00'),
('Michael', 'Jackson', 'michael.jackson@example.com', 'Canada', 1, 1, '2024-03-01 12:00:00'),
('Emily', 'Jones', 'emily.jones@example.com', 'Australia', 1, 0, '2024-04-01 13:00:00'),
('Karen', 'Garcia', 'karen.garcia@example.com', 'India', 1, 1, '2024-05-01 14:00:00');

-- -----------------------------------------------------
-- Insert Data into `upwork_db`.`Freelancer_AkhilaA`
-- -----------------------------------------------------
INSERT INTO upwork_db.Freelancer_AkhilaA (FreelancerFirstName, FreelancerLastName, FreelancerEmailAddress, FreelancerCountry, ReceiveEmailUpdates, AcceptedTerms, Skills, ExperienceLevel, HourlyRate, AccountCreatedDate, TotalEarnings, JobsCompleted) VALUES 
('Ron', 'Zane', 'ron.zane@example.com', 'USA', 1, 1, 'WordPress, Fullstack', 'Expert', 75.00, '2024-01-15 09:00:00', 10000.00, 50),
('Sophia', 'Walter', 'sophia.walter@example.com', 'UK', 0, 1, 'JavaScript, React', 'Intermediate', 40.00, '2024-02-20 10:30:00', 5000.00, 25),
('Chris', 'Hemsworth', 'chris.hemsworth@example.com', 'Canada', 1, 1, 'Python, Django', 'Advanced', 60.00, '2024-03-10 11:45:00', 7500.00, 30),
('Sofia', 'Turner', 'sofia.turner@example.com', 'Australia', 0, 1, 'UI/UX Design, Figma', 'Expert', 80.00, '2024-04-05 12:15:00', 12000.00, 60),
('Lucas', 'Romero', 'lucas.romero@example.com', 'India', 1, 1, 'Data Science, Machine Learning', 'Expert', 90.00, '2024-05-20 13:00:00', 15000.00, 75);

-- -----------------------------------------------------
-- Insert Data into `upwork_db`.`Project_AkhilaA`
-- -----------------------------------------------------
INSERT INTO upwork_db.Project_AkhilaA (ProjectTitle, Description, Budget, ExperienceLevelRequired, LocationRequired, SkillRequired, ProjectStatus, PostedDate, Client_AkhilaA_ClientID) VALUES 
('Website Development', 'Build a WordPress website', 2000.00, 'Expert', 'Remote', 'WordPress', 'Open', '2024-01-20 09:00:00', 1),
('React App', 'Create a React-based web application', 3000.00, 'Intermediate', 'Remote', 'React', 'Open', '2024-02-25 10:00:00', 2),
('Machine Learning Model', 'Develop a predictive ML model', 5000.00, 'Expert', 'Remote', 'Python', 'Open', '2024-03-10 11:00:00', 3),
('E-commerce Design', 'Design UI for an e-commerce site', 1500.00, 'Advanced', 'Remote', 'UI/UX', 'Open', '2024-04-05 12:00:00', 4),
('Data Analysis', 'Analyze large datasets', 2500.00, 'Expert', 'Remote', 'Data Science', 'Open', '2024-05-15 13:00:00', 5);

-- -----------------------------------------------------
-- Insert Data into `upwork_db`.`Bid_AkhilaA`
-- -----------------------------------------------------
INSERT INTO upwork_db.Bid_AkhilaA (BidAmount, ProposedStartDate, ProposedEndDate, Freelancer_AkhilaA_FreelancerID, Project_AkhilaA_ProjectID) VALUES 
(1800.00, '2024-01-25', '2024-02-10', 1, 1),
(2800.00, '2024-02-28', '2024-03-20', 2, 2),
(4700.00, '2024-03-15', '2024-04-10', 3, 3),
(1300.00, '2024-04-10', '2024-04-30', 4, 4),
(2300.00, '2024-05-18', '2024-06-10', 5, 5);

-- -----------------------------------------------------
-- Insert Data into `upwork_db`.`Review_AkhilaA`
-- -----------------------------------------------------
INSERT INTO upwork_db.Review_AkhilaA (Rating, Feedback, ClientID, FreelancerID, ProjectID, ReviewDate, Client_AkhilaA_ClientID, Freelancer_AkhilaA_FreelancerID, Project_AkhilaA_ProjectID) VALUES 
(5.0, 'Excellent work on website', 1, 1, 1, '2024-02-15', 1, 1, 1),
(4.0, 'Great job on the React app', 2, 2, 2, '2024-03-25', 2, 2, 2),
(4.5, 'Impressive ML model', 3, 3, 3, '2024-04-20', 3, 3, 3),
(5.0, 'Fantastic design work', 4, 4, 4, '2024-05-10', 4, 4, 4),
(4.8, 'Thorough data analysis', 5, 5, 5, '2024-06-10', 5, 5, 5);
