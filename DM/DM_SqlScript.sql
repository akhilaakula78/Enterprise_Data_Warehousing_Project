-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema upwork_dm_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `upwork_dm_db` ;

-- -----------------------------------------------------
-- Schema upwork_dm_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `upwork_dm_db` DEFAULT CHARACTER SET utf8 ;
USE `upwork_dm_db` ;

-- -----------------------------------------------------
-- Table `upwork_dm_db`.`BidDate_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`BidDate_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`BidDate_AkhilaA` (
  `DateKey` INT NOT NULL,
  `Date` DATE NOT NULL,
  `CalendarYear` INT NOT NULL,
  `CalendarQuarter` TINYINT NOT NULL,
  `CalendarMonth` TINYINT NOT NULL,
  `Holiday` TINYINT(1) NOT NULL,
  `WeekDay` TINYINT NOT NULL,
  `DayOfMonth` TINYINT NOT NULL,
  `DayOfYear` SMALLINT NOT NULL,
  `WeekOfMonth` TINYINT NOT NULL,
  `WeekOfYear` TINYINT NOT NULL,
  PRIMARY KEY (`DateKey`),
  UNIQUE INDEX `DateId_UNIQUE` (`DateKey` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`ProposedEndDate_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`ProposedEndDate_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`ProposedEndDate_AkhilaA` (
  `DateKey` INT NOT NULL,
  `Date` DATE NOT NULL,
  `CalendarYear` INT NOT NULL,
  `CalendarQuarter` TINYINT NOT NULL,
  `CalendarMonth` TINYINT NOT NULL,
  `Holiday` TINYINT(1) NOT NULL,
  `WeekDay` TINYINT NOT NULL,
  `DayOfMonth` TINYINT NOT NULL,
  `DayOfYear` SMALLINT NOT NULL,
  `WeekOfMonth` TINYINT NOT NULL,
  `WeekOfYear` TINYINT NOT NULL,
  PRIMARY KEY (`DateKey`),
  UNIQUE INDEX `DateId_UNIQUE` (`DateKey` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`ProposedStartDate_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`ProposedStartDate_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`ProposedStartDate_AkhilaA` (
  `DateKey` INT NOT NULL,
  `Date` DATE NOT NULL,
  `CalendarYear` INT NOT NULL,
  `CalendarQuarter` TINYINT NOT NULL,
  `CalendarMonth` TINYINT NOT NULL,
  `Holiday` TINYINT(1) NOT NULL,
  `WeekDay` TINYINT NOT NULL,
  `DayOfMonth` TINYINT NOT NULL,
  `DayOfYear` SMALLINT NOT NULL,
  `WeekOfMonth` TINYINT NOT NULL,
  `WeekOfYear` TINYINT NOT NULL,
  PRIMARY KEY (`DateKey`),
  UNIQUE INDEX `DateId_UNIQUE` (`DateKey` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`DimensionProject_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`DimensionProject_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`DimensionProject_AkhilaA` (
  `ProjectKey` INT NOT NULL,
  `ProjectTitle` VARCHAR(255) NOT NULL,
  `Description` TEXT NOT NULL,
  `Budget` DECIMAL(10,2) NOT NULL,
  `ExperienceLevelRequired` INT NOT NULL,
  `LocationRequired` VARCHAR(100) NOT NULL,
  `SkillsRequired` TEXT NOT NULL,
  `ProjectStatus` VARCHAR(45) NOT NULL,
  `PostedDate` DATETIME NOT NULL,
  PRIMARY KEY (`ProjectKey`),
  UNIQUE INDEX `ProjectId_UNIQUE` (`ProjectKey` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`DimensionFreelancer_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`DimensionFreelancer_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`DimensionFreelancer_AkhilaA` (
  `FreelancerKey` INT NOT NULL,
  `FreelancerFirstName` VARCHAR(45) NOT NULL,
  `FreelancerLastName` VARCHAR(45) NOT NULL,
  `FreelancerEmailAddress` VARCHAR(255) NOT NULL,
  `FreelancerCountry` VARCHAR(45) NOT NULL,
  `ReceiveEmailUpdates` TINYINT NOT NULL,
  `AcceptedTerms` TINYINT NOT NULL,
  `Skills` TEXT NOT NULL,
  `ExperienceLevel` VARCHAR(45) NOT NULL,
  `HourlyRate` DECIMAL(10,2) NOT NULL,
  `AccountCreatedDate` TIMESTAMP NOT NULL,
  `TotalEarnings` DECIMAL(10,2) NOT NULL,
  `JobsCompleted` INT NOT NULL,
  `JobsCompletionPercentage` DECIMAL(5,2) NOT NULL,
  `TxnEffectiveDate` DATE NOT NULL,
  `TxnEndDate` DATE NULL,
  `ChangeReasonCode` VARCHAR(45) NULL,
  PRIMARY KEY (`FreelancerKey`),
  UNIQUE INDEX `FreelancerId_UNIQUE` (`FreelancerKey` ASC) VISIBLE,
  UNIQUE INDEX `FreelancerEmailAddress_UNIQUE` (`FreelancerEmailAddress` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`FactTransactions_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`FactTransactions_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`FactTransactions_AkhilaA` (
  `TransactionAmount` DECIMAL(10,2) NOT NULL,
  `DimensionBidDate_AkhilaA_DateKey` INT NOT NULL,
  `DimensionProposedEndDate_AkhilaA_DateKey` INT NOT NULL,
  `DimensionProposedStartDate_AkhilaA_DateKey` INT NOT NULL,
  `DimensionProject_AkhilaA_ProjectKey` INT NOT NULL,
  `DimensionFreelancer_AkhilaA_FreelancerKey` INT NOT NULL,
  PRIMARY KEY (`DimensionBidDate_AkhilaA_DateKey`, `DimensionProposedEndDate_AkhilaA_DateKey`, `DimensionProposedStartDate_AkhilaA_DateKey`, `DimensionProject_AkhilaA_ProjectKey`, `DimensionFreelancer_AkhilaA_FreelancerKey`),
  INDEX `fk_FactTransactions_AkhilaA_DimensionProposedEndDate_Akhila_idx` (`DimensionProposedEndDate_AkhilaA_DateKey` ASC) VISIBLE,
  INDEX `fk_FactTransactions_AkhilaA_DimensionProposedStartDate_Akhi_idx` (`DimensionProposedStartDate_AkhilaA_DateKey` ASC) VISIBLE,
  INDEX `fk_FactTransactions_AkhilaA_DimensionProject_AkhilaA1_idx` (`DimensionProject_AkhilaA_ProjectKey` ASC) VISIBLE,
  INDEX `fk_FactTransactions_AkhilaA_DimensionFreelancer_AkhilaA1_idx` (`DimensionFreelancer_AkhilaA_FreelancerKey` ASC) VISIBLE,
  CONSTRAINT `fk_FactTransactions_AkhilaA_DimensionBidDate_AkhilaA`
    FOREIGN KEY (`DimensionBidDate_AkhilaA_DateKey`)
    REFERENCES `upwork_dm_db`.`BidDate_AkhilaA` (`DateKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactTransactions_AkhilaA_DimensionProposedEndDate_AkhilaA1`
    FOREIGN KEY (`DimensionProposedEndDate_AkhilaA_DateKey`)
    REFERENCES `upwork_dm_db`.`ProposedEndDate_AkhilaA` (`DateKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactTransactions_AkhilaA_DimensionProposedStartDate_AkhilaA1`
    FOREIGN KEY (`DimensionProposedStartDate_AkhilaA_DateKey`)
    REFERENCES `upwork_dm_db`.`ProposedStartDate_AkhilaA` (`DateKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactTransactions_AkhilaA_DimensionProject_AkhilaA1`
    FOREIGN KEY (`DimensionProject_AkhilaA_ProjectKey`)
    REFERENCES `upwork_dm_db`.`DimensionProject_AkhilaA` (`ProjectKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactTransactions_AkhilaA_DimensionFreelancer_AkhilaA1`
    FOREIGN KEY (`DimensionFreelancer_AkhilaA_FreelancerKey`)
    REFERENCES `upwork_dm_db`.`DimensionFreelancer_AkhilaA` (`FreelancerKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`DimensionClient_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`DimensionClient_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`DimensionClient_AkhilaA` (
  `ClientKey` INT NOT NULL,
  `ClientFirstName` VARCHAR(45) NOT NULL,
  `ClientLastName` VARCHAR(45) NOT NULL,
  `ClientEmailAddress` VARCHAR(255) NOT NULL,
  `ClientCountry` VARCHAR(255) NOT NULL,
  `AcceptedTerms` TINYINT NOT NULL,
  `ReceiveEmailUpdates` TINYINT NOT NULL,
  `AccountCreatedDate` TIMESTAMP NOT NULL,
  `TxnEffectiveDate` DATE NOT NULL,
  `TxnEndDate` DATE NULL,
  `ChangeReasonCode` VARCHAR(45) NULL,
  PRIMARY KEY (`ClientKey`),
  UNIQUE INDEX `ClientId_UNIQUE` (`ClientKey` ASC) VISIBLE,
  UNIQUE INDEX `ClientEmailAddress_UNIQUE` (`ClientEmailAddress` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`DimensionTime_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`DimensionTime_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`DimensionTime_AkhilaA` (
  `DateKey` INT NOT NULL,
  `Date` DATE NOT NULL,
  `CalendarYear` INT NOT NULL,
  `CalendarQuarter` TINYINT NOT NULL,
  `CalendarMonth` TINYINT NOT NULL,
  `Holiday` TINYINT(1) NOT NULL,
  `WeekDay` TINYINT NOT NULL,
  `DayOfMonth` TINYINT NOT NULL,
  `DayOfYear` SMALLINT NOT NULL,
  `WeekOfMonth` TINYINT NOT NULL,
  `WeekOfYear` TINYINT NOT NULL,
  PRIMARY KEY (`DateKey`),
  UNIQUE INDEX `DateId_UNIQUE` (`DateKey` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `upwork_dm_db`.`FactReviews_AkhilaA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `upwork_dm_db`.`FactReviews_AkhilaA` ;

CREATE TABLE IF NOT EXISTS `upwork_dm_db`.`FactReviews_AkhilaA` (
  `ReviewRating` DECIMAL(10,2) NOT NULL,
  `ReviewComment` TEXT NOT NULL,
  `DimensionClient_AkhilaA_ClientKey` INT NOT NULL,
  `DimensionProject_AkhilaA_ProjectKey` INT NOT NULL,
  `DimensionFreelancer_AkhilaA_FreelancerKey` INT NOT NULL,
  `DimensionTime_AkhilaA_DateKey` INT NOT NULL,
  PRIMARY KEY (`DimensionClient_AkhilaA_ClientKey`, `DimensionProject_AkhilaA_ProjectKey`, `DimensionFreelancer_AkhilaA_FreelancerKey`, `DimensionTime_AkhilaA_DateKey`),
  INDEX `fk_FactReviews_AkhilaA_DimensionClient_AkhilaA1_idx` (`DimensionClient_AkhilaA_ClientKey` ASC) VISIBLE,
  INDEX `fk_FactReviews_AkhilaA_DimensionProject_AkhilaA1_idx` (`DimensionProject_AkhilaA_ProjectKey` ASC) VISIBLE,
  INDEX `fk_FactReviews_AkhilaA_DimensionFreelancer_AkhilaA1_idx` (`DimensionFreelancer_AkhilaA_FreelancerKey` ASC) VISIBLE,
  INDEX `fk_FactReviews_AkhilaA_DimensionTime_AkhilaA1_idx` (`DimensionTime_AkhilaA_DateKey` ASC) VISIBLE,
  CONSTRAINT `fk_FactReviews_AkhilaA_DimensionClient_AkhilaA1`
    FOREIGN KEY (`DimensionClient_AkhilaA_ClientKey`)
    REFERENCES `upwork_dm_db`.`DimensionClient_AkhilaA` (`ClientKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactReviews_AkhilaA_DimensionProject_AkhilaA1`
    FOREIGN KEY (`DimensionProject_AkhilaA_ProjectKey`)
    REFERENCES `upwork_dm_db`.`DimensionProject_AkhilaA` (`ProjectKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactReviews_AkhilaA_DimensionFreelancer_AkhilaA1`
    FOREIGN KEY (`DimensionFreelancer_AkhilaA_FreelancerKey`)
    REFERENCES `upwork_dm_db`.`DimensionFreelancer_AkhilaA` (`FreelancerKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FactReviews_AkhilaA_DimensionTime_AkhilaA1`
    FOREIGN KEY (`DimensionTime_AkhilaA_DateKey`)
    REFERENCES `upwork_dm_db`.`DimensionTime_AkhilaA` (`DateKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- Insert records for DimensionClient_AkhilaA
INSERT INTO `upwork_dm_db`.`DimensionClient_AkhilaA` 
(`ClientKey`, `ClientFirstName`, `ClientLastName`, `ClientEmailAddress`, `ClientCountry`, `AcceptedTerms`, `ReceiveEmailUpdates`, `AccountCreatedDate`, `TxnEffectiveDate`, `TxnEndDate`, `ChangeReasonCode`)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@gmail.com', 'USA', 1, 1, '2024-01-01 00:00:00', '2024-01-01', NULL, NULL),
(2, 'Bob', 'Williams', 'bob.williams@gmail.com', 'Canada', 1, 1, '2024-01-02 00:00:00', '2024-01-02', NULL, NULL),
(3, 'Charlie', 'Jones', 'charlie.jones@gmail.com', 'UK', 1, 1, '2024-01-03 00:00:00', '2024-01-03', NULL, NULL),
(4, 'Diana', 'Brown', 'diana.brown@gmail.com', 'Australia', 1, 1, '2024-01-04 00:00:00', '2024-01-04', NULL, NULL),
(5, 'Edward', 'Davis', 'edward.davis@gmail.com', 'India', 1, 1, '2024-01-05 00:00:00', '2024-01-05', NULL, NULL),
(6, 'Fiona', 'Lee', 'fiona.lee@gmail.com', 'Germany', 1, 1, '2024-01-06 00:00:00', '2024-01-06', NULL, NULL),
(7, 'George', 'Clark', 'george.clark@gmail.com', 'Brazil', 1, 1, '2024-01-07 00:00:00', '2024-01-07', NULL, NULL),
(8, 'Hannah', 'Lewis', 'hannah.lewis@gmail.com', 'South Africa', 1, 1, '2024-01-08 00:00:00', '2024-01-08', NULL, NULL),
(9, 'Ian', 'Walker', 'ian.walker@gmail.com', 'Japan', 1, 1, '2024-01-09 00:00:00', '2024-01-09', NULL, NULL),
(10, 'Julia', 'Martinez', 'julia.martinez@gmail.com', 'Russia', 1, 1, '2024-01-10 00:00:00', '2024-01-10', NULL, NULL);

-- Insert records for DimensionFreelancer_AkhilaA
INSERT INTO `upwork_dm_db`.`DimensionFreelancer_AkhilaA` 
(`FreelancerKey`, `FreelancerFirstName`, `FreelancerLastName`, `FreelancerEmailAddress`, `FreelancerCountry`, `ReceiveEmailUpdates`, `AcceptedTerms`, `Skills`, `ExperienceLevel`, `HourlyRate`, `AccountCreatedDate`, `TotalEarnings`, `JobsCompleted`, `JobsCompletionPercentage`, `TxnEffectiveDate`, `TxnEndDate`, `ChangeReasonCode`)
VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', 'USA', 1, 1, 'HTML, CSS, JS', 'Intermediate', 50.00, '2024-01-01 00:00:00', 10000.00, 20, 95.00, '2024-01-01', NULL, NULL),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', 'Canada', 1, 1, 'Python, SQL', 'Expert', 70.00, '2024-01-02 00:00:00', 15000.00, 15, 93.33, '2024-01-02', NULL, NULL),
(3, 'Tom', 'Brown', 'tom.brown@gmail.com', 'UK', 1, 1, 'Java, Spring', 'Advanced', 60.00, '2024-01-03 00:00:00', 12000.00, 18, 94.44, '2024-01-03', NULL, NULL),
(4, 'Emily', 'Davis', 'emily.davis@gmail.com', 'Australia', 1, 1, 'React, Node.js', 'Intermediate', 55.00, '2024-01-04 00:00:00', 14000.00, 22, 96.67, '2024-01-04', NULL, NULL),
(5, 'Michael', 'Lee', 'michael.lee@gmail.com', 'India', 1, 1, 'AWS, Docker', 'Expert', 80.00, '2024-01-05 00:00:00', 16000.00, 20, 95.00, '2024-01-05', NULL, NULL),
(6, 'Sarah', 'Taylor', 'sarah.taylor@gmail.com', 'Germany', 1, 1, 'Python, ML', 'Advanced', 75.00, '2024-01-06 00:00:00', 17000.00, 25, 98.00, '2024-01-06', NULL, NULL),
(7, 'David', 'Miller', 'david.miller@gmail.com', 'Brazil', 1, 1, 'JavaScript, Angular', 'Intermediate', 45.00, '2024-01-07 00:00:00', 9000.00, 15, 93.33, '2024-01-07', NULL, NULL),
(8, 'Laura', 'Wilson', 'laura.wilson@gmail.com', 'South Africa', 1, 1, 'HTML, CSS', 'Beginner', 40.00, '2024-01-08 00:00:00', 8000.00, 10, 90.00, '2024-01-08', NULL, NULL),
(9, 'Chris', 'Anderson', 'chris.anderson@gmail.com', 'Japan', 1, 1, 'Kotlin, Android', 'Expert', 85.00, '2024-01-09 00:00:00', 18000.00, 30, 100.00, '2024-01-09', NULL, NULL),
(10, 'Sophia', 'White', 'sophia.white@gmail.com', 'Russia', 1, 1, 'PHP, Laravel', 'Intermediate', 50.00, '2024-01-10 00:00:00', 10000.00, 20, 95.00, '2024-01-10', NULL, NULL);

-- Insert records for DimensionProject_AkhilaA
INSERT INTO `upwork_dm_db`.`DimensionProject_AkhilaA` 
(`ProjectKey`, `ProjectTitle`, `Description`, `Budget`, `ExperienceLevelRequired`, `LocationRequired`, `SkillsRequired`, `ProjectStatus`, `PostedDate`)
VALUES
(1, 'Web Development', 'Build a website', 5000.00, 2, 'USA', 'HTML, CSS, JS', 'Open', '2024-01-01 00:00:00'),
(2, 'Data Analysis', 'Analyze customer data', 2000.00, 3, 'Canada', 'Python, SQL', 'In Progress', '2024-01-02 00:00:00'),
(3, 'Mobile App', 'Develop a mobile app', 8000.00, 1, 'UK', 'Flutter, Dart', 'Completed', '2024-01-03 00:00:00'),
(4, 'SEO Optimization', 'SEO for website', 1500.00, 2, 'USA', 'SEO, Marketing', 'Cancelled', '2024-01-04 00:00:00'),
(5, 'Cloud Migration', 'Migrate data to cloud', 10000.00, 4, 'India', 'AWS, Azure', 'Open', '2024-01-05 00:00:00'),
(6, 'UI Design', 'Design website UI', 3000.00, 2, 'Australia', 'Figma, Adobe XD', 'Open', '2024-01-06 00:00:00'),
(7, 'Backend Development', 'Build API', 7000.00, 3, 'USA', 'Node.js, Express', 'Completed', '2024-01-07 00:00:00'),
(8, 'Digital Marketing', 'Social media strategy', 4000.00, 1, 'Germany', 'Marketing, SMM', 'Open', '2024-01-08 00:00:00'),
(9, 'Cybersecurity Audit', 'Audit company security', 6000.00, 4, 'UK', 'Cybersecurity, Compliance', 'Open', '2024-01-09 00:00:00'),
(10, 'Blockchain Development', 'Develop blockchain system', 12000.00, 5, 'Russia', 'Blockchain, Solidity', 'In Progress', '2024-01-10 00:00:00');

-- Insert records for DimensionTime_AkhilaA
INSERT INTO `upwork_dm_db`.`DimensionTime_AkhilaA` 
(`DateKey`, `Date`, `CalendarYear`, `CalendarQuarter`, `CalendarMonth`, `Holiday`, `WeekDay`, `DayOfMonth`, `DayOfYear`, `WeekOfMonth`, `WeekOfYear`)
VALUES
(1, '2024-01-01', 2024, 1, 1, 0, 1, 1, 1, 1, 1),
(2, '2024-01-02', 2024, 1, 1, 0, 2, 2, 2, 1, 1),
(3, '2024-01-03', 2024, 1, 1, 0, 3, 3, 3, 1, 1),
(4, '2024-01-04', 2024, 1, 1, 0, 4, 4, 4, 1, 1),
(5, '2024-01-05', 2024, 1, 1, 0, 5, 5, 5, 1, 1),
(6, '2024-01-06', 2024, 1, 1, 0, 6, 6, 6, 1, 1),
(7, '2024-01-07', 2024, 1, 1, 0, 7, 7, 7, 1, 1),
(8, '2024-01-08', 2024, 1, 1, 0, 1, 8, 8, 2, 2),
(9, '2024-01-09', 2024, 1, 1, 0, 2, 9, 9, 2, 2),
(10, '2024-01-10', 2024, 1, 1, 0, 3, 10, 10, 2, 2);

-- Insert records for BidDate_AkhilaA
INSERT INTO `upwork_dm_db`.`BidDate_AkhilaA` 
(`DateKey`, `Date`, `CalendarYear`, `CalendarQuarter`, `CalendarMonth`, `Holiday`, `WeekDay`, `DayOfMonth`, `DayOfYear`, `WeekOfMonth`, `WeekOfYear`)
VALUES
(1, '2024-01-01', 2024, 1, 1, 0, 1, 1, 1, 1, 1),
(2, '2024-01-02', 2024, 1, 1, 0, 2, 2, 2, 1, 1),
(3, '2024-01-03', 2024, 1, 1, 0, 3, 3, 3, 1, 1),
(4, '2024-01-04', 2024, 1, 1, 0, 4, 4, 4, 1, 1),
(5, '2024-01-05', 2024, 1, 1, 0, 5, 5, 5, 1, 1),
(6, '2024-01-06', 2024, 1, 1, 0, 6, 6, 6, 1, 1),
(7, '2024-01-07', 2024, 1, 1, 0, 7, 7, 7, 1, 1),
(8, '2024-01-08', 2024, 1, 1, 0, 1, 8, 8, 2, 2),
(9, '2024-01-09', 2024, 1, 1, 0, 2, 9, 9, 2, 2),
(10, '2024-01-10', 2024, 1, 1, 0, 3, 10, 10, 2, 2);

-- Insert records for ProposedEndDate_AkhilaA
INSERT INTO `upwork_dm_db`.`ProposedEndDate_AkhilaA` 
(`DateKey`, `Date`, `CalendarYear`, `CalendarQuarter`, `CalendarMonth`, `Holiday`, `WeekDay`, `DayOfMonth`, `DayOfYear`, `WeekOfMonth`, `WeekOfYear`)
VALUES
(1, '2024-01-01', 2024, 1, 1, 0, 1, 1, 1, 1, 1),
(2, '2024-01-02', 2024, 1, 1, 0, 2, 2, 2, 1, 1),
(3, '2024-01-03', 2024, 1, 1, 0, 3, 3, 3, 1, 1),
(4, '2024-01-04', 2024, 1, 1, 0, 4, 4, 4, 1, 1),
(5, '2024-01-05', 2024, 1, 1, 0, 5, 5, 5, 1, 1),
(6, '2024-01-06', 2024, 1, 1, 0, 6, 6, 6, 1, 1),
(7, '2024-01-07', 2024, 1, 1, 0, 7, 7, 7, 1, 1),
(8, '2024-01-08', 2024, 1, 1, 0, 1, 8, 8, 2, 2),
(9, '2024-01-09', 2024, 1, 1, 0, 2, 9, 9, 2, 2),
(10, '2024-01-10', 2024, 1, 1, 0, 3, 10, 10, 2, 2);

-- Insert records for ProposedStartDate_AkhilaA
INSERT INTO `upwork_dm_db`.`ProposedStartDate_AkhilaA` 
(`DateKey`, `Date`, `CalendarYear`, `CalendarQuarter`, `CalendarMonth`, `Holiday`, `WeekDay`, `DayOfMonth`, `DayOfYear`, `WeekOfMonth`, `WeekOfYear`)
VALUES
(1, '2024-01-01', 2024, 1, 1, 0, 1, 1, 1, 1, 1),
(2, '2024-01-02', 2024, 1, 1, 0, 2, 2, 2, 1, 1),
(3, '2024-01-03', 2024, 1, 1, 0, 3, 3, 3, 1, 1),
(4, '2024-01-04', 2024, 1, 1, 0, 4, 4, 4, 1, 1),
(5, '2024-01-05', 2024, 1, 1, 0, 5, 5, 5, 1, 1),
(6, '2024-01-06', 2024, 1, 1, 0, 6, 6, 6, 1, 1),
(7, '2024-01-07', 2024, 1, 1, 0, 7, 7, 7, 1, 1),
(8, '2024-01-08', 2024, 1, 1, 0, 1, 8, 8, 2, 2),
(9, '2024-01-09', 2024, 1, 1, 0, 2, 9, 9, 2, 2),
(10, '2024-01-10', 2024, 1, 1, 0, 3, 10, 10, 2, 2);

-- Insert records for FactTransactions_AkhilaA
INSERT INTO `upwork_dm_db`.`FactTransactions_AkhilaA` 
(`TransactionAmount`, `DimensionBidDate_AkhilaA_DateKey`, `DimensionProposedEndDate_AkhilaA_DateKey`, `DimensionProposedStartDate_AkhilaA_DateKey`, `DimensionProject_AkhilaA_ProjectKey`, `DimensionFreelancer_AkhilaA_FreelancerKey`)
VALUES
(5000.00, 1, 1, 1, 1, 1),
(2000.00, 2, 2, 2, 2, 2),
(8000.00, 3, 3, 3, 3, 3),
(1500.00, 4, 4, 4, 4, 4),
(10000.00, 5, 5, 5, 5, 5),
(3000.00, 6, 6, 6, 6, 6),
(7000.00, 7, 7, 7, 7, 7),
(4000.00, 8, 8, 8, 8, 8),
(6000.00, 9, 9, 9, 9, 9),
(12000.00, 10, 10, 10, 10, 10);

-- Insert records for FactReviews_AkhilaA
INSERT INTO `upwork_dm_db`.`FactReviews_AkhilaA` 
(`ReviewRating`, `ReviewComment`, `DimensionClient_AkhilaA_ClientKey`, `DimensionProject_AkhilaA_ProjectKey`, `DimensionFreelancer_AkhilaA_FreelancerKey`, `DimensionTime_AkhilaA_DateKey`)
VALUES
(4.5, 'Great work', 1, 1, 1, 1),
(4.0, 'Good job', 2, 2, 2, 2),
(5.0, 'Excellent', 3, 3, 3, 3),
(3.5, 'Satisfactory', 4, 4, 4, 4),
(4.8, 'Very good', 5, 5, 5, 5),
(4.2, 'Solid performance', 6, 6, 6, 6),
(4.7, 'Outstanding', 7, 7, 7, 7),
(4.0, 'Delivered on time', 8, 8, 8, 8),
(4.9, 'Superb', 9, 9, 9, 9),
(5.0, 'Perfect execution', 10, 10, 10, 10);