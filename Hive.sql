-- By executing the SQL code you create a new database with finished tables. Please don't use that file if you already have a database for Hive.

-- Creating the Database
CREATE DATABASE hive;
USE hive;

-- This SQL part creates the user table to save whitelisted players
CREATE TABLE IF NOT EXISTS `hiveuser` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT, -- Unique ID
  `Name` VARCHAR(255) NOT NULL, -- FiveM Account
  `Discord` VARCHAR(255) NOT NULL, -- Discord ID
  `IP` VARCHAR(255) NOT NULL,  -- IP Address (last known)
  `Admin` VARCHAR(8) NOT NULL DEFAULT 'false', -- Admin (true/false)
  PRIMARY KEY (`ID`), -- Primary key of the table
  UNIQUE KEY `Discord` (`Discord`) -- Unique key for the Discord ID

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- This SQl part creates the table for the "Guard" system to save banned players.
CREATE TABLE IF NOT EXISTS `hivebans` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT, -- Unique ID
  `Reason` TEXT(65535) NOT NULL, -- Reason
  `Name` VARCHAR(255) NOT NULL, -- FiveM Account of the banned user
  `Discord` VARCHAR(255) NOT NULL, -- Discord ID of the banned user
  `Steam` VARCHAR(255) NOT NULL, -- Steam HEX of the banned user
  `License` VARCHAR(255) NOT NULL, -- License of the banned user
  `IP` VARCHAR(255) NOT NULL, -- IP Address of the banned user
  `Tokens` VARCHAR(5000) NOT NULL, -- Tokens of the banned user
  `Banned` VARCHAR(8) NOT NULL DEFAULT 'false', -- is player banned (true/false)
  PRIMARY KEY (`ID`) USING BTREE, -- Primary key of the table
  UNIQUE KEY `ID` (`ID`) -- Unique key for the Ban ID

) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;