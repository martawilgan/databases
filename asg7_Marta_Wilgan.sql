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

/* creating data entry tables */

DROP TABLE IF EXISTS dj;
CREATE TABLE dj (
	dj_name varchar(40) NOT NULL,
	dj_country varchar(40) NOT NULL,
	dj_birth date NOT NULL,
	dj_genre varchar(40) NOT NULL,
	dj_website varchar(70) NOT NULL,
	dj_ccd varchar(40) NOT NULL,
	dj_plat_cds int(2) NOT NULL,
	PRIMARY KEY(dj_name),
	FOREIGN KEY(dj_country) REFERENCES country (country_name),
	FOREIGN KEY(dj_genre) REFERENCES genre (genre_type),
	FOREIGN KEY(dj_ccd) REFERENCES cd (cd_name)
);

DROP TABLE IF EXISTS cd;
CREATE TABLE cd (
	cd_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	cd_pic varchar(70) NOT NULL,
	cd_name varchar(40) NOT NULL,
	cd_dj varchar(40) NOT NULL,
	cd_genre varchar(40) NOT NULL,
	cd_release date NOT NULL,
	cd_plat boolean NOT NULL,
	cd_price decimal(4,2) NOT NULL,
	cd_num_tracks int(2) NOT NULL,
	PRIMARY KEY (cd_id),
	FOREIGN KEY (cd_dj) REFERENCES dj (dj_name),
	FOREIGN KEY (cd_genre) REFERENCES genre (genre_type)
);

DROP TABLE IF EXISTS perf;
CREATE TABLE perf (
	perf_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	perf_date date NOT NULL,
	perf_venue varchar(40) NOT NULL,
	perf_city varchar(40) NOT NULL,
	perf_sp varchar(40) NOT NULL,
	perf_country varchar(40) NOT NULL,
	perf_dj varchar(40) NOT NULL,
	perf_available boolean NOT NULL,
	perf_low_price decimal(5,2) NOT NULL,
	perf_high_price decimal(5,2) NOT NULL,
	perf_genre varchar(40) NOT NULL,
	PRIMARY KEY (perf_id),
	FOREIGN KEY (perf_venue)  REFERENCES venue (venue_name),
	FOREIGN KEY (perf_city) REFERENCES city (city_name),
	FOREIGN KEY (perf_sp)  REFERENCES sp (sp_name),
	FOREIGN KEY (perf_country)  REFERENCES country (country_name),
	FOREIGN KEY (perf_dj)  REFERENCES dj (dj_name),
	FOREIGN KEY (perf_genre) REFERENCES genre (genre_type)
);


/* populating table dj */

INSERT INTO dj VALUES ("Armin van Burren","Netherlands","1976-12-25","trance","arminvanburren.com","Mirage","5");
INSERT INTO dj VALUES ("Benny Benassi","Italy","1967-07-13","electro","bennybenassi.com","Rock'n'Rave","3");
INSERT INTO dj VALUES ("Deadmau5","Canada","1981-01-05","trance","deadmau5.com","For Lack of a Better Name","0");
INSERT INTO dj VALUES ("Offer Nissim","Israel","1964-06-02","trance","offernissim.com","Happy People","1");
INSERT INTO dj VALUES ("Paul van Dyk","Germany","1971-12-16","trance","paulvandyk.com","Vonyc Sessions","1");
INSERT INTO dj VALUES ("Tiesto","Netherlands","1969-01-17","trance","tiesto.com","Magikal Journey","4");
INSERT INTO dj VALUES ("Laidback Luke","Phillipines","1976-10-22","electro","laidbackluke.com","Stealth Live!","1");
INSERT INTO dj VALUES ("Ferry Corsten","Netherlands","1973-04-12","trance","ferrycorsten.com","Twice in a Blue Moon","1");
INSERT INTO dj VALUES ("Afrojack","Netherlands","1987-09-09","house","afrojack.com","Lost & Found","1");
INSERT INTO dj VALUES ("Diplo","United States","1978-11-10","dubstep","diplo.com","Decent Work for Decent Pay","2");
INSERT INTO dj VALUES ("John Dahlback","Sweden","1985-03-02","trance","johndahlback.com","Mutants","0");
INSERT INTO dj VALUES ("Avicii","Sweden","1989-09-08","house","avicii.com","Strictly Miami","1");

/* populating table cd */

INSERT INTO cd VALUES ("","stealth_live.jpg","Stealth Live!","Laidback Luke","electro","2008-02-12","0","17.51","15");
INSERT INTO cd VALUES ("","twice_in_a_blue_moon.jpg","Twice in a Blue Moon","Ferry Corsten","electro","2009-01-27","1","14.68","13");
INSERT INTO cd VALUES ("","lost_&_found.jpg","Lost & Found","","Afrojack","house","2010-12-22","1","11.25","9");
INSERT INTO cd VALUES ("","decent_work_for_decent_pay.jpg","Decent Work for Decent Pay","Diplo","dubstep","2009-02-03","0","14.07","15");
INSERT INTO cd VALUES ("","strictly_miami.jpg","Strictly Miami","Avicii","house","2011-04-19","0","22.82","23");
INSERT INTO cd VALUES ("","mutants.jpg","Mutants","John Dahlback","trance","2010-04-11","0","19.99","16");
INSERT INTO cd VALUES ("","for_lack_of_a_better_name.jpg","For Lack of a Better Name","Deadmau5","trance","2009-09-22","0","11.34","12");
INSERT INTO cd VALUES ("","happy_people.jpg","Happy People","Offer Nissim","trance","2008-04-11","0","13.95","11");
INSERT INTO cd VALUES ("","magikal_journey.jpg","Magikal Journey","Tiesto","trance","2010-06-08","1","15.15","23");
INSERT INTO cd VALUES ("","mirage.jpg","Mirage","Armin Van Buuren","trance","2010-09-14","1","12.63","21");
INSERT INTO cd VALUES ("","rock'n'rave.jpg","Rock'n'Rave","Benny Benassi","electro","2008-06-08","1","17.29","15");
INSERT INTO cd VALUES ("","vonyc_sessions.jpg","Vonyc Sessions","Paul van Dyk","trance","2009-12-20","0","19.18","13");

/* populating table perf */

INSERT INTO perf VALUES ("","2011-05-21","Pacha NYC","New York City","New York","United States","Benny Benassi","1","30.00","50.00","electro");
INSERT INTO perf VALUES ("","2011-05-23","Pacha NYC","New York City","New York","United States","Tiesto","1","30.00","50.00","trance");
INSERT INTO perf VALUES ("","2011-05-26","Limelight","Milan","Milan","Italy","Benny Benassi","0","25.00","75.00","electro");
INSERT INTO perf VALUES ("","2011-06-01","Webster Hall","New York City","New York","United States","Avicii","1","25.00","65.00","house");
INSERT INTO perf VALUES ("","2011-06-02","Felix","Berlin","Berlin","Germany","Laidback Luke","1","35.00","70.00","electro");
INSERT INTO perf VALUES ("","2011-06-03","Marquee","Las Vegas","Nevada","United States","Diplo","1","45.00","85.00","dubstep");
INSERT INTO perf VALUES ("","2011-06-04","Pacha NYC","New York City","New York","United States","Avicii","1","25.00","50.00","house");
INSERT INTO perf VALUES ("","2011-06-11","Webster Hall","New York City","New York","United States","Afrojack","1","20.00","55.00","house");
INSERT INTO perf VALUES ("","2011-06-13","Hard Rock","San Diego","California","United States","Afrojack","1","55.00","125.00","house");
INSERT INTO perf VALUES ("","2011-06-14","The Mid","Chicago","Illinois","United States","Benny Benassi","1","45.00","150.00","electro");
INSERT INTO perf VALUES ("","2011-06-15","Muzique","Montreal","Quebec","Canada","Deadmau5","0","35.00","55.00","trance");
INSERT INTO perf VALUES ("","2011-06-16","Palladium","Acapulco","Guerrero","Mexico","Diplo","0","23.00","50.00","dubstep");
