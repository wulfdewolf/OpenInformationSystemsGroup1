/****************************************************************
*                           TABLES
*****************************************************************/

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
    homepage VARCHAR(160),
    PRIMARY KEY(homepage)
);

CREATE TABLE TravellingOrganization(
    homepage VARCHAR(160),
    PRIMARY KEY(homepage)
);

CREATE TABLE Continent (
    continentName VARCHAR(40),
    PRIMARY KEY(continentName)
);

CREATE TABLE ContinentRestrictions (
    forContinent VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(forContinent) REFERENCES Continent(continentName),
    PRIMARY KEY(restriction, forContinent)
);

CREATE TABLE Country(
    countryName VARCHAR(40),
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Continent(continentName),
    PRIMARY KEY(countryName)
);

CREATE TABLE CountryAdvice (
    forCountry VARCHAR(40),
    advice VARCHAR(100),
    FOREIGN KEY(forCountry) REFERENCES Country(countryName),
    PRIMARY KEY(advice, forCountry)
);

CREATE TABLE CountryRestrictions (
    forCountry VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(forCountry) REFERENCES Country(countryName),
    PRIMARY KEY(restriction, forCountry)
);

CREATE TABLE Region (
    regionName VARCHAR(40),
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Country(countryName),
    PRIMARY KEY(regionName)
);

CREATE TABLE RegionRestrictions (
    forRegion VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(forRegion) REFERENCES Region(regionName),
    PRIMARY KEY(restriction, forRegion)
);

CREATE TABLE City (
	cityName VARCHAR(40) NOT NULL,
	postalCode VARCHAR(40) NOT NULL,
	populationTotal INT,
    partOf VARCHAR(40),
    FOREIGN KEY(partOf) REFERENCES Region(regionName),
	PRIMARY KEY (cityName)
);

CREATE TABLE CityRestrictions (
    forCity VARCHAR(40),
    restriction VARCHAR(100),
    FOREIGN KEY(forCity) REFERENCES City(cityName),
    PRIMARY KEY(restriction, forCity)
);

CREATE TABLE User (
	email VARCHAR(40),
	firstName VARCHAR(40),
	lastName VARCHAR(40),
    livesIn VARCHAR(40),
    FOREIGN KEY(livesIn) REFERENCES Country(countryName),
	PRIMARY KEY (email)
);

CREATE TABLE Subscriber (
    email VARCHAR(40),
    countryName VARCHAR(40),
    FOREIGN KEY(email) REFERENCES User(email),
    FOREIGN KEY(countryName) REFERENCES Country(countryName),
    PRIMARY KEY(email, countryName)
);

CREATE TABLE PandemicReading(
    newInfected INT,
    newDeaths INT,
    newCured INT,
    reproductionNumber DOUBLE,
    generatedAt DATE,
    forCity VARCHAR(40),
    providedBy VARCHAR(160),
    FOREIGN KEY (forCity) REFERENCES City(cityName), 
    FOREIGN KEY(providedBy) REFERENCES DataOrganization(homepage),
    PRIMARY KEY (generatedAt, forCity)
);

CREATE TABLE SpecificTravellingAdvice(
    advice VARCHAR(100), 
    countryFrom VARCHAR(40),
    countryFor VARCHAR(40),
    FOREIGN KEY(countryFrom) REFERENCES Country(countryName),
    FOREIGN KEY(countryFor) REFERENCES Country(countryName),
    PRIMARY KEY(countryFrom, countryFor, advice)
);

CREATE TABLE TrainConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    duration TIME,
	price INT,
    organizedBy VARCHAR(40),
    FOREIGN KEY(organizedBy) REFERENCES TravellingOrganization(homepage),
    FOREIGN KEY(fromCity) REFERENCES City(cityName),
    FOREIGN KEY(toCity) REFERENCES City(cityName),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE AirplaneConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    duration TIME,
	price INT,
    organizedBy VARCHAR(40),
    FOREIGN KEY(organizedBy) REFERENCES TravellingOrganization(homepage),
    FOREIGN KEY(fromCity) REFERENCES City(cityName),
    FOREIGN KEY(toCity) REFERENCES City(cityName),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE BusConnection(
    fromCity VARCHAR(40),
    toCity VARCHAR(40),
    duration TIME,
	price INT,
    organizedBy VARCHAR(40),
    FOREIGN KEY(organizedBy) REFERENCES TravellingOrganization(homepage),
    FOREIGN KEY(fromCity) REFERENCES City(cityName),
    FOREIGN KEY(toCity) REFERENCES City(cityName),
    PRIMARY KEY(fromCity, toCity)
);

/****************************************************************
*                           INSTANCES
*****************************************************************/

/* 
*   Continent
*/
INSERT INTO Continent VALUES ('North America');
INSERT INTO Continent VALUES ('South America');
INSERT INTO Continent VALUES ('Europe');
INSERT INTO Continent VALUES ('Asia');
INSERT INTO Continent VALUES ('Oceania');
INSERT INTO Continent VALUES ('Africa');

INSERT INTO ContinentRestrictions VALUES ('North America', 'Bars close at 01:00.');
INSERT INTO ContinentRestrictions VALUES ('North America', 'Restaurant should close at 00:00.');
INSERT INTO ContinentRestrictions VALUES ('Europe', 'No events with more than 1000 people.');


/*
*   Country
*/
INSERT INTO Country VALUES ('Belgium', 'Europe');
INSERT INTO Country VALUES ('The Netherlands', 'Europe');
INSERT INTO Country VALUES ('France', 'Europe');
INSERT INTO Country VALUES ('Germany', 'Europe');
INSERT INTO Country VALUES ('Denmark', 'Europe');
INSERT INTO Country VALUES ('Poland', 'Europe');
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

INSERT INTO CanVisitFreely VALUES('Belgium', 'Japan');
INSERT INTO CanVisitFreely VALUES('Belgium', 'Morocco');
INSERT INTO CanVisitFreely VALUES('Belgium', 'New Zealand');
INSERT INTO CanVisitFreely VALUES('The Netherlands', 'France');
INSERT INTO CanVisitFreely VALUES('The Netherlands', 'Belgium');
INSERT INTO CanVisitFreely VALUES('The Netherlands', 'New Zealand');

INSERT INTO NeedTest VALUES('Belgium', 'Australia');
INSERT INTO NeedTest VALUES('The Netherlands', 'USA');
INSERT INTO NeedTest VALUES('France', 'Australia');
INSERT INTO NeedTest VALUES('France', 'USA');

/*
*   Region
*/
INSERT INTO Region VALUES ('Flanders', 'Belgium');
INSERT INTO Region VALUES ('Brussels Capital Region', 'Belgium');
INSERT INTO Region VALUES ('Noord-Holland', 'The Netherlands');
INSERT INTO Region VALUES ('Wallonia', 'Belgium');
INSERT INTO Region VALUES ('Provence-Alpes-Côte d Azur', 'France');


INSERT INTO RegionRestrictions VALUES ('Brussels Capital Region', 'People can not go outside between 22 and 6.');
INSERT INTO RegionRestrictions VALUES ('Flanders', 'People can not go outside between 24 and 5.');
INSERT INTO RegionRestrictions VALUES ('Wallonia', 'People can not go outside between 24 and 5.');

/*
*   City
*/
INSERT INTO City VALUES ('Brussels', '1000', 1208542, 'Brussels Capital Region');
INSERT INTO City VALUES ('Amsterdam', '1000', 821752, 'Noord-Holland');
INSERT INTO City VALUES ('Namur', '5000', 110939, 'Wallonia');
INSERT INTO City VALUES ('Marseille', '13000', 861635, 'Provence-Alpes-Côte d Azur');
INSERT INTO City VALUES ('Nice', '6000', 344064, 'Provence-Alpes-Côte d Azur');

INSERT INTO CityRestrictions VALUES ('Brussels', 'Bars and restaurants are closed.');
INSERT INTO CityRestrictions VALUES ('Amsterdam', 'Bars, coffee shops and restaurants are closed.');
INSERT INTO CityRestrictions VALUES ('Nice', 'Bars and restaurants are closed.');


/*
*   Organizations
*/
INSERT INTO DataOrganization VALUES('data.gov.be');
INSERT INTO DataOrganization VALUES('www.databronnencovid19.nl');
INSERT INTO DataOrganization VALUES('data.europa.eu/euodp/en/data/dataset/covid-19-coronavirus-data');
INSERT INTO DataOrganization VALUES('www.worldometers.info');
INSERT INTO DataOrganization VALUES('www.fast-trackcities.org');
INSERT INTO DataOrganization VALUES('www.coronavirus.jhu.edu');


INSERT INTO TravellingOrganization VALUES('www.neckermann.be');
INSERT INTO TravellingOrganization VALUES('www.brusselsairlines.com');
INSERT INTO TravellingOrganization VALUES('www.ryanair.com');

/*
*   Users
*/ 
INSERT INTO User VALUES ('alexis.francois.verdoodt@vub.be', 'Alexis', 'Verdoodt', 'France');
INSERT INTO User VALUES ('stijn.desloovere@vub.be', 'Stijn', 'Desloovere', 'Belgium');
INSERT INTO User VALUES ('bram.dewit@vub.be', 'Bram', 'Dewit', 'Belgium');
INSERT INTO User VALUES ('wolf.de.wulf@vub.be', 'Wolf', 'De Wulf', 'Belgium');

INSERT INTO Subscriber VALUES ('alexis.francois.verdoodt@vub.be', 'France');
INSERT INTO Subscriber VALUES ('stijn.desloovere@vub.be', 'Belgium');
INSERT INTO Subscriber VALUES ('bram.dewit@vub.be', 'Belgium');
INSERT INTO Subscriber VALUES ('wolf.de.wulf@vub.be', 'Belgium');

/*
*   Connections
*/ 
INSERT INTO AirplaneConnection VALUES ('Brussels', 'Nice', '06:20:33', 84, 'www.neckermann.be');
INSERT INTO AirplaneConnection VALUES ('Marseille', 'Brussels', '04:23:16', 55, 'www.neckermann.be');
INSERT INTO AirplaneConnection VALUES ('Marseille', 'Nice', '01:15:10', 10, 'www.neckermann.be');

INSERT INTO BusConnection VALUES ('Brussels', 'Nice', '06:20:33', 84, 'www.neckermann.be');
INSERT INTO BusConnection VALUES ('Marseille', 'Brussels', '04:23:16', 55, 'www.neckermann.be');
INSERT INTO BusConnection VALUES ('Marseille', 'Nice', '01:15:10', 10, 'www.neckermann.be');

INSERT INTO TrainConnection VALUES ('Brussels', 'Nice', '06:20:33', 84, 'www.neckermann.be');
INSERT INTO TrainConnection VALUES ('Marseille', 'Brussels', '04:23:16', 55, 'www.neckermann.be');
INSERT INTO TrainConnection VALUES ('Marseille', 'Nice', '01:15:10', 10, 'www.neckermann.be');

/*
*   PandemicReadings
*/

INSERT INTO PandemicReading VALUES (269, 5, 60, 0.8, '2020-12-01', 'Brussels', 'www.worldometers.info');
INSERT INTO PandemicReading VALUES (198, 8, 30, 0.8, '2020-12-02', 'Brussels', 'www.worldometers.info');
INSERT INTO PandemicReading VALUES (171, 10, 42, 0.8, '2020-12-03', 'Brussels', 'www.worldometers.info');
INSERT INTO PandemicReading VALUES (167, 2, 20, 0.8, '2020-12-04', 'Brussels', 'www.worldometers.info');
INSERT INTO PandemicReading VALUES (103, 4, 33, 0.8, '2020-12-05', 'Brussels', 'www.worldometers.info');

INSERT INTO PandemicReading VALUES (247, 0, 40, 0.8, '2020-12-01', 'Amsterdam', 'www.fast-trackcities.org');
INSERT INTO PandemicReading VALUES (300, 2, 15, 0.8, '2020-12-02', 'Amsterdam', 'www.fast-trackcities.org');
INSERT INTO PandemicReading VALUES (333, 2, 56, 0.8, '2020-12-03', 'Amsterdam', 'www.fast-trackcities.org');
INSERT INTO PandemicReading VALUES (225, 3, 34, 0.8, '2020-12-04', 'Amsterdam', 'www.fast-trackcities.org');
INSERT INTO PandemicReading VALUES (694, 3, 120, 0.8, '2020-12-06', 'Amsterdam', 'www.fast-trackcities.org');

INSERT INTO PandemicReading VALUES (230, 2, 40, 0.8, '2020-12-01', 'Nice', 'www.coronavirus.jhu.edu');
INSERT INTO PandemicReading VALUES (146, 0,49, 0.8, '2020-12-02', 'Nice', 'www.coronavirus.jhu.edu');
INSERT INTO PandemicReading VALUES (130, 1,35, 0.8, '2020-12-03', 'Nice', 'www.coronavirus.jhu.edu');
INSERT INTO PandemicReading VALUES (90, 5, 14, 0.8, '2020-12-04', 'Nice', 'www.coronavirus.jhu.edu');
INSERT INTO PandemicReading VALUES (85, 2, 20, 0.8, '2020-12-05', 'Nice', 'www.coronavirus.jhu.edu');



/*
*   SpecificTravellingAdvice
*/
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are not welcome.', 'Belgium', 'France');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are not welcome.', 'Belgium', 'USA');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers need to provide a test to enter the country.', 'Belgium', 'Australia');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are not welcome.', 'Belgium', 'The Netherlands');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are advised not to come.', 'The Netherlands', 'France');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers need to provide a test to enter the country.', 'The Netherlands', 'USA');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are advised not to come.', 'The Netherlands', 'Belgium');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are not welcome.', 'The Netherlands', 'Australia');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers need to provide a test to enter the country.', 'France', 'Australia');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are advised not to come.', 'France', 'Belgium');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers need to provide a test to enter the country.', 'France', 'USA');
INSERT INTO SpecificTravellingAdvice VALUES ('Travellers are advised not to come.', 'France', 'Brazil');