CREATE TABLE City (
	cityName VARCHAR(40) NOT NULL,
	postalCode VARCHAR(40) NOT NULL,
	numberOfCitizens INT,
    partOf VARCHAR(40),
    FOREIGN KEY(cityName) REFERENCES Restrictions(RestrictionsName),
    FOREIGN KEY(partOf) REFERENCES Region(regionName),
	PRIMARY KEY (cityName)
);

CREATE TABLE CityRestrictions (
    cityName VARCHAR(40),
    restriction VARCHAR(40),
    FOREIGN KEY(cityName) REFERENCES Country(cityName)
    PRIMARY KEY(restriction, cityName)
);

CREATE TABLE Country(
    countryName VARCHAR(40),
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Continent(continentName),
    PRIMARY KEY(countryName)
);

CREATE TABLE CountryAdvice (
    countryName VARCHAR(40),
    advice VARCHAR(40),
    FOREIGN KEY(countryName) REFERENCES Country(countryName)
    PRIMARY KEY(advice, countryName)
);

CREATE TABLE CountryRestrictions (
    countryName VARCHAR(40),
    restriction VARCHAR(40),
    FOREIGN KEY(countryName) REFERENCES Country(countryName)
    PRIMARY KEY(restriction, countryName)
);

CREATE TABLE NeedsVisaFor(
    origin VARCHAR(40),
    destination VARCHAR(40),
    PRIMARY KEY(origin, destination)
);

CREATE TABLE canVisit(
    origin VARCHAR(40),
    destination VARCHAR(40),
    PRIMARY KEY(origin, destination)
);

CREATE TABLE needTest(
    origin VARCHAR(40),
    destination VARCHAR(40),
    PRIMARY KEY(origin, destination)
);

CREATE TABLE Region(
    regionName VARCHAR(40),
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Country(countryName),
    PRIMARY KEY(regionName)
);

CREATE TABLE RegionRestrictions (
    regionName VARCHAR(40),
    restriction VARCHAR(40),
    FOREIGN KEY(regionName) REFERENCES Region(regionName)
    PRIMARY KEY(restriction, regionName)
);

CREATE TABLE Continent (
    continentName VARCHAR(40),
    PRIMARY KEY(continentName)
);

CREATE TABLE ContinentRestrictions (
    continentName VARCHAR(40),
    restriction VARCHAR(40),
    FOREIGN KEY(continentName) REFERENCES Continent(continentName)
    PRIMARY KEY(restriction, continentName)
);

CREATE TABLE DataOrganization (
    homepage VARCHAR(40),
    PRIMARY KEY(homepage)
);

CREATE TABLE TravellingOrganization(
    homepage VARCHAR(40),
    PRIMARY KEY(homepage)
);

CREATE TABLE Connection (
	duration TIME,
	price INT,
    toCity VARCHAR(40),
    fromCity VARCHAR(40),
    providedBy VARCHAR(40),
    connectionType VARCHAR(40),
    FOREIGN KEY (fromCity, toCity) REFERENCES City(cityName, cityName),
    FOREIGN KEY(providedBy) REFERENCES TravellingOrganization(homepage),
    PRIMARY KEY(fromCity, toCity, connectionType)
);

CREATE TABLE TrainConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    FOREIGN KEY(fromCity, toCity) REFERENCES Connection(fromCity, toCity),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE AirplaneConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    FOREIGN KEY(fromCity, toCity) REFERENCES Connection(fromCity, toCity),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE BusConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    FOREIGN KEY(fromCity, toCity) REFERENCES Connection(fromCity, toCity),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE User (
	email VARCHAR(40),
	firstName VARCHAR(40),
	lastName VARCHAR(40),
    livesIn VARCHAR(40),
    FOREIGN KEY(livesIn) REFERENCES Country(countryName),
	PRIMARY KEY (email)
);

CREATE TABLE Subscribers (
    user VARCHAR(40),
    country VARCHAR(40),
    FOREIGN KEY(user) REFERENCES User(email),
    FOREIGN KEY(country) REFERENCES Country(countryName),
    PRIMARY KEY(user, country)
);

CREATE TABLE CoronaReading(
    numberOfNewInfected INT,
    numberOfNewDeaths INT,
    reproductionNumber INT,
    referenceTime TIME,
    city VARCHAR(40),
    providedBy VARCHAR(40),
    FOREIGN KEY (city) REFERENCES City(cityName), 
    FOREIGN KEY(providedBy) REFERENCES DataOrganization(homepage),
    PRIMARY KEY (referenceTime, city)
);

CREATE TABLE SpecificTravellingAdvice(
    advice VARCHAR(40), 
    countryFrom VARCHAR(40),
    countryFor VARCHAR(40),
    FOREIGN KEY(countryFrom, countryFor) REFERENCES Country(countryName, countryName),
    PRIMARY KEY(countryFrom, countryFor, advice)
);

/* 
*   INSTANCES
*/

/* 
*   Continent
*/
INSERT INTO Continent VALUES ("North America");
INSERT INTO Continent VALUES ("South America");
INSERT INTO Continent VALUES ("Europe");
INSERT INTO Continent VALUES ("Asia");
INSERT INTO Continent VALUES ("Oceania");
INSERT INTO Continent VALUES ("Africa");

/*
*   Country
*/


/*
*   Region
*/


/*
*   City
*/