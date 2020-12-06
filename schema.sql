CREATE TABLE NeedsVisaFor (
    origin VARCHAR(40),
    destination VARCHAR(40),
    PRIMARY KEY(origin, destination)
);

CREATE TABLE CanVisitFreely (
    origin VARCHAR(40),
    destination VARCHAR(40),
    PRIMARY KEY(origin, destination)
);

CREATE TABLE NeedTest (
    origin VARCHAR(40),
    destination VARCHAR(40),
    PRIMARY KEY(origin, destination)
);

CREATE TABLE DataOrganization (
    homepage VARCHAR(40),
    PRIMARY KEY(homepage)
);

CREATE TABLE TravellingOrganization(
    homepage VARCHAR(40),
    PRIMARY KEY(homepage)
);

CREATE TABLE TrainConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    duration TIME,
	price INT,
    providedBy VARCHAR(40),
    FOREIGN KEY(providedBy) REFERENCES TravellingOrganization(homepage),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE AirplaneConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    duration TIME,
	price INT,
    providedBy VARCHAR(40),
    FOREIGN KEY(providedBy) REFERENCES TravellingOrganization(homepage),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE BusConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    duration TIME,
	price INT,
    providedBy VARCHAR(40),
    FOREIGN KEY(providedBy) REFERENCES TravellingOrganization(homepage),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE Continent (
    continentName VARCHAR(40),
    PRIMARY KEY(continentName)
);

CREATE TABLE ContinentRestrictions (
    continentName VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(continentName) REFERENCES Continent(continentName)
    PRIMARY KEY(restriction, continentName)
);

CREATE TABLE Country(
    countryName VARCHAR(40),
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Continent(continentName),
    PRIMARY KEY(countryName)
);

CREATE TABLE CountryAdvice (
    countryName VARCHAR(40),
    advice VARCHAR(100),
    FOREIGN KEY(countryName) REFERENCES Country(countryName),
    PRIMARY KEY(advice, countryName)
);

CREATE TABLE CountryRestrictions (
    countryName VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(countryName) REFERENCES Country(countryName),
    PRIMARY KEY(restriction, countryName)
);

CREATE TABLE Region (
    regionName VARCHAR(40),
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Country(countryName),
    PRIMARY KEY(regionName)
);

CREATE TABLE RegionRestrictions (
    regionName VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(regionName) REFERENCES Region(regionName),
    PRIMARY KEY(restriction, regionName)
);

CREATE TABLE City (
	cityName VARCHAR(40) NOT NULL,
	postalCode VARCHAR(40) NOT NULL,
	numberOfCitizens INT,
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Region(regionName),
	PRIMARY KEY (cityName)
);

CREATE TABLE CityRestrictions (
    cityName VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(cityName) REFERENCES Country(countryName),
    PRIMARY KEY(restriction, cityName)
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
    advice VARCHAR(100), 
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
INSERT INTO Continent VALUES ('North America');
INSERT INTO Continent VALUES ('South America');
INSERT INTO Continent VALUES ('Europe');
INSERT INTO Continent VALUES ('Asia');
INSERT INTO Continent VALUES ('Oceania');
INSERT INTO Continent VALUES ('Africa');

INSERT INTO ContinentRestrictions VALUES ('North America', 'No more weed!');
INSERT INTO ContinentRestrictions VALUES ('North America', 'No more beer!');
INSERT INTO ContinentRestrictions VALUES ('Europe', 'No more smoking!');



/*
*   Country
*/
INSERT INTO Country VALUES ('Belgium', 'Europe');
INSERT INTO Country VALUES ('Netherlands', 'Europe');
INSERT INTO Country VALUES ('France', 'Europe');
INSERT INTO Country VALUES ('Germany', 'Europe');
INSERT INTO Country VALUES ('Denmark', 'Europe');
INSERT INTO Country VALUES ('Polska', 'Europe');
INSERT INTO Country VALUES ('Greece', 'Europe');
INSERT INTO Country VALUES ('Canada', 'North America');
INSERT INTO Country VALUES ('USA', 'North America');
INSERT INTO Country VALUES ('Brazil', 'South America');
INSERT INTO Country VALUES ('Argentina', 'South America');
INSERT INTO Country VALUES ('Colombia', 'South America');
INSERT INTO Country VALUES ('Peru', 'South America');
INSERT INTO Country VALUES ('China', 'Asia');
INSERT INTO Country VALUES ('India', 'Asia');
INSERT INTO Country VALUES ('Japan', 'Asia');
INSERT INTO Country VALUES ('Vietnam', 'Asia');
INSERT INTO Country VALUES ('Thailand', 'Asia');
INSERT INTO Country VALUES ('Morocco', 'Africa');
INSERT INTO Country VALUES ('Egypt', 'Africa');
INSERT INTO Country VALUES ('Congo', 'Africa');
INSERT INTO Country VALUES ('Ghana', 'Africa');
INSERT INTO Country VALUES ('Kenya', 'Africa');
INSERT INTO Country VALUES ('New Zealand', 'Oceania');
INSERT INTO Country VALUES ('Australia', 'Oceania');
INSERT INTO Country VALUES ('Vanuatu', 'Oceania');

INSERT INTO CountryRestrictions VALUES ('Belgium', 'Restaurants closed.');
INSERT INTO CountryRestrictions VALUES ('Belgium', 'Hairdressers closed.');
INSERT INTO CountryRestrictions VALUES ('Belgium', 'Only one person can go to the toilet in your house.');
INSERT INTO CountryRestrictions VALUES ('France', 'No more wine.');
INSERT INTO CountryRestrictions VALUES ('France', 'No more sausage.');

INSERT INTO CountryAdvice VALUES ('Belgium', 'The public is advised to not leave the country.');
INSERT INTO CountryAdvice VALUES ('Belgium', 'Foreigners are advised not to travel to the country.');
INSERT INTO CountryAdvice VALUES ('France', 'The public is advised to not leave the country.');
INSERT INTO CountryAdvice VALUES ('France', 'Foreigners are advised not to travel to the country.');

INSERT INTO NeedsVisaFor VALUES('Belgium', 'China');
INSERT INTO NeedsVisaFor VALUES('Belgium', 'USA');
INSERT INTO NeedsVisaFor VALUES('Belgium', 'Thailand');
INSERT INTO NeedsVisaFor VALUES('Belgium', 'Peru');
INSERT INTO NeedsVisaFor VALUES('France', 'China');
INSERT INTO NeedsVisaFor VALUES('France', 'USA');

INSERT INTO CanVisit VALUES('Belgium', 'France');
INSERT INTO CanVisit VALUES('Belgium', 'Australia');
INSERT INTO CanVisit VALUES('Belgium', 'Netherlands');

INSERT INTO NeedTest VALUES('Belgium', 'Australia');
INSERT INTO NeedTest VALUES('France', 'Belgium');
INSERT INTO NeedTest VALUES('Netherlands', 'Belgium');

/*
*   Region
*/
INSERT INTO Region VALUES ('Flanders', 'Belgium');
INSERT INTO Region VALUES ('Brussels Capital Region', 'Belgium');
INSERT INTO Region VALUES ('Wallonia', 'Belgium');
INSERT INTO Region VALUES ('Provence-Alpes-Côte d Azur', 'France');


INSERT INTO RegionRestrictions VALUES ('Brussels Capital Region', 'People can not go outside between 22 and 6.');
INSERT INTO RegionRestrictions VALUES ('Flanders', 'People can not go outside between 24 and 5.');
INSERT INTO RegionRestrictions VALUES ('Wallonie', 'People can not go outside between 24 and 5.');

/*
*   City
*/
INSERT INTO City VALUES ('Brussels', '1000', 1208542, 'Brussels Capital Region');
INSERT INTO City VALUES ('Namur', '5000', 110939, 'Wallonia');
INSERT INTO City VALUES ('Marseille', '13000', 861635, 'Provence-Alpes-Côte d Azur');
INSERT INTO City VALUES ('Nice', '6000', 344064, 'Provence-Alpes-Côte d Azur');

INSERT INTO CityRestrictions VALUES ('Brussels', 'Bars and restaurants are closed.');
INSERT INTO CityRestrictions VALUES ('Nice', 'Bars and restaurants are closed.');


/*
*   Organizations
*/
INSERT INTO DataOrganization VALUES('https://data.gov.be');
INSERT INTO DataOrganization VALUES('https://www.databronnencovid19.nl/');
INSERT INTO DataOrganization VALUES('https://data.europa.eu/euodp/en/data/dataset/covid-19-coronavirus-data');

INSERT INTO TravellingOrganization VALUES('https://www.neckermann.be/');
INSERT INTO TravellingOrganization VALUES('https://www.brusselsairlines.com/');
INSERT INTO TravellingOrganization VALUES('https://www.ryanair.com/be/nl');

/*
*   Users
*/ 
INSERT INTO User VALUES ('alexis.francois.verdoodt@vub.be', 'Alexis', 'Verdoodt', 'France');
INSERT INTO User VALUES ('stijn.desloovere@vub.be', 'Stijn', 'Desloovere', 'Belgium');
INSERT INTO User VALUES ('bram.dewit@vub.be', 'Bram', 'Dewit', 'Belgium');
INSERT INTO User VALUES ('wolf.de.wulf@vub.be', 'Wolf', 'De Wulf', 'Belgium');

INSERT INTO Subscribers VALUES ('alexis.francois.verdoodt@vub.be', 'France');
INSERT INTO Subscribers VALUES ('stijn.desloovere@vub.be', 'Belgium');
INSERT INTO Subscribers VALUES ('bram.dewit@vub.be', 'Belgium');
INSERT INTO Subscribers VALUES ('wolf.de.wulf@vub.be', 'Belgium');

/*
*   Connections
*/ 
INSERT INTO TrainConnection VALUES ('Brussels', 'Nice', '06:20:33', 84, 'https://www.neckermann.be/');
INSERT INTO TrainConnection VALUES ('Marseille', 'Brussels', '04:23:16', 55, 'https://www.neckermann.be/');
INSERT INTO TrainConnection VALUES ('Marseille', 'Nice', '01:15:10', 10, 'https://www.neckermann.be/');

/*
*   CoronaReadings
*/

/*
*   SpecificTravellingAdvice
*/