/* creating control tables */

DROP TABLE IF EXISTS country;
CREATE TABLE country (
	country_name varchar(40) NOT NULL,
	PRIMARY KEY(country_name)
);

DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
	genre_type varchar(40) NOT NULL,
	PRIMARY KEY(genre_type)
);

DROP TABLE IF EXISTS city;
CREATE TABLE city (
	city_name varchar(40) NOT NULL,
	city_sp varchar(40) NOT NULL,
	city_country varchar(40) NOT NULL,
	PRIMARY KEY(city_name),
	FOREIGN KEY(city_sp) REFERENCES sp (sp_name),
	FOREIGN KEY (city_country) REFERENCES country (country_name)
);

DROP TABLE IF EXISTS sp;
CREATE TABLE sp (
	sp_name varchar(40) NOT NULL,
	PRIMARY KEY(sp_name)
);

DROP TABLE IF EXISTS venue;
CREATE TABLE venue (
	venue_name varchar(40) NOT NULL,
	venue_city varchar(40) NOT NULL,
	venue_sp varchar(40) NOT NULL,
	venue_country varchar(40) NOT NULL,
	PRIMARY KEY(venue_name),
	FOREIGN KEY(venue_city) REFERENCES city (city_name),
	FOREIGN KEY(venue_sp) REFERENCES sp (sp_name),
	FOREIGN KEY(venue_country) REFERENCES country (country_name)
);

/* populating table country */

INSERT INTO country VALUES ("Italy");
INSERT INTO country VALUES ("Israel");
INSERT INTO country VALUES ("Phillipines");
INSERT INTO country VALUES ("Netherlands");
INSERT INTO country VALUES ("United States");
INSERT INTO country VALUES ("Canada");
INSERT INTO country VALUES ("Brazil");
INSERT INTO country VALUES ("Mexico");
INSERT INTO country VALUES ("Puerto Rico");
INSERT INTO country VALUES ("Germany");
INSERT INTO country VALUES ("United Kingdom");
INSERT INTO country VALUES ("France");
INSERT INTO country VALUES ("Sweden");
INSERT INTO country VALUES ("Spain");
INSERT INTO country VALUES ("Portugal");
INSERT INTO country VALUES ("Argentina");

/* populating table genre */

INSERT INTO genre VALUES ("trance");
INSERT INTO genre VALUES ("house");
INSERT INTO genre VALUES ("electro");
INSERT INTO genre VALUES ("dubstep");
INSERT INTO genre VALUES ("hip hop");

/* populating table city */

INSERT INTO city VALUES("New York City","New York","United States");
INSERT INTO city VALUES("Milan","Milan","Italy");
INSERT INTO city VALUES("Berlin","Berlin","Germany");
INSERT INTO city VALUES("Las Vegas","Nevada","United States");
INSERT INTO city VALUES("Montreal","Quebec","Canada");
INSERT INTO city VALUES("Miami","Florida","United States");
INSERT INTO city VALUES("San Diego","California","United States");
INSERT INTO city VALUES("Chicago","Illinois","United States");
INSERT INTO city VALUES("Acapulco","Guerrero","Mexico");

/* populating table sp */

INSERT INTO sp VALUES("New York");
INSERT INTO sp VALUES("Florida");
INSERT INTO sp VALUES("Berlin");
INSERT INTO sp VALUES("Nevada");
INSERT INTO sp VALUES("Milan");
INSERT INTO sp VALUES("California");
INSERT INTO sp VALUES("Quebec");
INSERT INTO sp VALUES("Illinois");
INSERT INTO sp VALUES("Guerrero");

/* populating table venue */

INSERT INTO venue VALUES("Webster Hall","New York City","New York","United States");
INSERT INTO venue VALUES("Limelight","Milan","Milan","Italy");
INSERT INTO venue VALUES("Felix","Berlin","Berlin","Germany");
INSERT INTO venue VALUES("Muzique","Montreal","Quebec","Canada");
INSERT INTO venue VALUES("Showcase","Miami","Florida","United States");
INSERT INTO venue VALUES("Hard Rock","San Diego","California","United States");
INSERT INTO venue VALUES("The Mid","Chicago","Illinois","United States");
INSERT INTO venue VALUES("Pacha NYC","New York City","New York","United States");
INSERT INTO venue VALUES("Marquee","Las Vegas","Nevada","United States");
INSERT INTO venue VALUES("Palladium","Acapulco","Guerrero","Mexico");