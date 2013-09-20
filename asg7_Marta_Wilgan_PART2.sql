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