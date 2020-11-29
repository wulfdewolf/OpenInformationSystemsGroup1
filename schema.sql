CREATE TABLE City (
	cityName TEXT NOT NULL,
	postalCode TEXT NOT NULL,
	numberOfCitizens INT,
	restrictions TEXT,
    partOf TEXT,
    FOREIGN KEY(partOf) REFERENCES Region(regionName),
	PRIMARY KEY (cityName)
);

CREATE TABLE Country(
    flag TEXT,
    advice TEXT,
    countryName TEXT,
    partOf TEXT,
    FOREIGN KEY (countryName) REFERENCES DerivablePlace(countryName),
    FOREIGN KEY(partOf) REFERENCES Continent(continentName),
    PRIMARY KEY(countryName)
);

CREATE TABLE NeedsVisaFor(
    origin TEXT,
    destination TEXT,
    PRIMARY KEY(origin, destination)
);

CREATE TABLE canVisit(
    origin TEXT,
    destination TEXT,
    PRIMARY KEY(origin, destination)
);

CREATE TABLE needTest(
    origin TEXT,
    destination TEXT,
    PRIMARY KEY(origin, destination)
);

CREATE TABLE Region(
    regionName TEXT,
    partOf TEXT,
    FOREIGN KEY(regionName) REFERENCES DerivablePlace(placeName),
    FOREIGN KEY(partOf) REFERENCES Country(countryName),
    PRIMARY KEY(regionName)
);

CREATE TABLE Continent(
    continentName TEXT,
    FOREIGN KEY(continentName) REFERENCES DerivablePlace(placeName),
    PRIMARY KEY(continentName)
);

CREATE TABLE Organization (
	homepage TEXT,
	organizationName TEXT,
	PRIMARY KEY (homepage)
);

CREATE TABLE DataOrganization (
    homepage TEXT,
    FOREIGN KEY(homepage) REFERENCES Organization(homepage),
    PRIMARY KEY(homepage)
);

CREATE TABLE TravellingOrganization(
    homepage TEXT,
    FOREIGN KEY(homepage) REFERENCES Organization(homepage),
    PRIMARY KEY(homepage)
);

CREATE TABLE Connection (
	duration TIME,
	price INT,
    toCity TEXT,
    fromCity TEXT,
    providedBy TEXT,
    connectionType TEXT,
    FOREIGN KEY (fromCity, toCity) REFERENCES City(cityName, cityName),
    FOREIGN KEY(providedBy) REFERENCES TravellingOrganization(homepage),
    PRIMARY KEY(fromCity, toCity, connectionType)
);

CREATE TABLE TrainConnection(
    fromCity TEXT,
    toCity TEXT,
    FOREIGN KEY(fromCity, toCity) REFERENCES Connection(fromCity, toCity),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE AirplaneConnection(
    fromCity TEXT,
    toCity TEXT,
    FOREIGN KEY(fromCity, toCity) REFERENCES Connection(fromCity, toCity),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE BusConnection(
    fromCity TEXT,
    toCity TEXT,
    FOREIGN KEY(fromCity, toCity) REFERENCES Connection(fromCity, toCity),
    PRIMARY KEY(fromCity, toCity)
);

CREATE TABLE User (
	email TEXT,
	firstName TEXT,
	lastName TEXT,
    livesIn TEXT,
    FOREIGN KEY(livesIn) REFERENCES Country(countryName),
	PRIMARY KEY (email)
);

CREATE TABLE Subscribers(
    user TEXT,
    country TEXT,
    FOREIGN KEY(user) REFERENCES User(email),
    FOREIGN KEY(country) REFERENCES Country(countryName),
    PRIMARY KEY(user, country)
);

CREATE TABLE DerivablePlace (
    placeName TEXT,
    restrictions TEXT,
    PRIMARY KEY(placeName)
);

CREATE TABLE CoronaReading(
    numberOfNewInfected INT,
    numberOfNewDeaths INT,
    reproductionNumber INT,
    referenceTime TIME,
    city TEXT,
    providedBy TEXT,
    FOREIGN KEY (city) REFERENCES City(cityName), 
    FOREIGN KEY(providedBy) REFERENCES DataOrganization(homepage),
    PRIMARY KEY (referenceTime, city)
);

CREATE TABLE SpecificTravellingAdvice(
    advice TEXT, 
    countryFrom TEXT,
    countryFor TEXT,
    FOREIGN KEY(countryFrom, countryFor) REFERENCES Country(countryName, countryName),
    PRIMARY KEY(countryFrom, countryFor)
);