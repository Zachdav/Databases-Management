#Schema For Official Unofficial Kilominx Results


#Drop tables
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS ResultRanksSingle;
DROP TABLE IF EXISTS ResultRanksAverage;
DROP TABLE IF EXISTS RanksSingle;
DROP TABLE IF EXISTS RanksAverage;
DROP TABLE IF EXISTS Results;
DROP TABLE IF EXISTS Rounds;
DROP TABLE IF EXISTS Competition;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Continent;
DROP TABLE IF EXISTS RoundType;


#Round Type
CREATE TABLE RoundType (
        id CHAR PRIMARY KEY,
        rank INT,
        name VARCHAR(255),
        final BIT
) ENGINE = InnoDB;


#Continent
CREATE TABLE Continent (
        id VARCHAR(255) PRIMARY KEY,
        name VARCHAR(255),
        recordName VARCHAR(255)
) ENGINE = InnoDB;


#Country
CREATE TABLE Country (
	id VARCHAR(255) PRIMARY KEY,
	name VARCHAR(255),
	continentId VARCHAR(255),
	Iso2 VARCHAR(255),

	FOREIGN KEY (continentId) REFERENCES Continent(id) ON DELETE CASCADE
) ENGINE = InnoDB;


#Person
CREATE TABLE Person (
	id VARCHAR(255) PRIMARY KEY,
	name VARCHAR(255),
	countryId VARCHAR(255),

	FOREIGN KEY (countryId) REFERENCES Country(id) ON DELETE CASCADE
) ENGINE = InnoDB;


#Competition
CREATE TABLE Competition (
        id VARCHAR(255) PRIMARY KEY,
        name VARCHAR(255),
        cityName VARCHAR(255),
        countryId VARCHAR(255),
        year INT,
        month INT,
        day INT,
        endYear INT,
        endMonth INT,
        endDay INT,
        start_Date DATE,
        end_Date DATE,
        latitude FLOAT,
        longitude FLOAT,

        FOREIGN KEY (countryId) REFERENCES Country(id) ON DELETE CASCADE
) ENGINE = InnoDB;


#Rounds
CREATE TABLE Rounds (
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        competitionId VARCHAR(255),
        RoundTypeId CHAR,


        FOREIGN KEY (competitionId) REFERENCES Competition(id) ON DELETE CASCADE
) ENGINE = InnoDB;


#Results
CREATE TABLE Results (
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        pos INT,
        personId VARCHAR(255),
        countryId VARCHAR(255),
        competitionId VARCHAR(255),
        roundTypeId CHAR,
        value1 INT,
        value2 INT,
        value3 INT,
        value4 INT,
        value5 INT,
        best INT,
        average INT,
        regionalSingleRecord ENUM('NR', 'WR', 'OcR', 'NAR', 'SAR', 'EuR', 'AfR', 'AsR') DEFAULT NULL,
        regionalAverageRecord ENUM('NR', 'WR', 'OcR', 'NAR', 'SAR', 'EuR', 'AfR', 'AsR') DEFAULT NULL,

        FOREIGN KEY (personId) REFERENCES Person(id) ON DELETE CASCADE,
        FOREIGN KEY (countryId) REFERENCES Country(id) ON DELETE CASCADE,
        FOREIGN KEY (competitionId) REFERENCES Competition(id) ON DELETE CASCADE,
        FOREIGN KEY (roundTypeId) REFERENCES RoundType(id) ON DELETE CASCADE
) ENGINE = InnoDB;


#RanksAverage
CREATE TABLE RanksAverage (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        personId VARCHAR(255),
        competitionId VARCHAR(255), 
        average INT,
        value1 INT,
        value2 INT,
        value3 INT,
        value4 INT,
        value5 INT,
        worldRank INT,
        continentRank INT,
        countryRank INT,

	FOREIGN KEY (personId) REFERENCES Person(id) ON DELETE CASCADE,
	FOREIGN KEY (competitionId) REFERENCES Competition(id) ON DELETE CASCADE        
) ENGINE = InnoDB;


#RanksSingle
CREATE TABLE RanksSingle (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        personId VARCHAR(255),
	competitionId VARCHAR(255), 
        best INT,
        worldRank INT,
        continentRank INT,
        countryRank INT,

	FOREIGN KEY (personId) REFERENCES Person(id) ON DELETE CASCADE,
	FOREIGN KEY (competitionId) REFERENCES Competition(id) ON DELETE CASCADE        
) ENGINE = InnoDB;


#ResultRanksAverage
CREATE TABLE ResultRanksAverage (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        personId VARCHAR(255),
        competitionId VARCHAR(255), 
        average INT,
        value1 INT,
        value2 INT,
        value3 INT,
        value4 INT,
        value5 INT,
        worldRank INT,
        continentRank INT,
        countryRank INT,

	FOREIGN KEY (personId) REFERENCES Person(id) ON DELETE CASCADE,
	FOREIGN KEY (competitionId) REFERENCES Competition(id) ON DELETE CASCADE        
) ENGINE = InnoDB;


#ResultRanksSingle
CREATE TABLE ResultRanksSingle (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        personId VARCHAR(255),
	competitionId VARCHAR(255), 
        best INT,
        worldRank INT,
        continentRank INT,
        countryRank INT,

	FOREIGN KEY (personId) REFERENCES Person(id) ON DELETE CASCADE,
	FOREIGN KEY (competitionId) REFERENCES Competition(id) ON DELETE CASCADE        
) ENGINE = InnoDB;


#Posts
CREATE TABLE Posts (
        id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(255),
        body VARCHAR(255),
        authorId VARCHAR(255),
        postDate DATE,

        FOREIGN KEY (authorId) REFERENCES Person(id) ON DELETE CASCADE
) ENGINE = InnoDB;