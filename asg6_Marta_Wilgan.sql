/* create tables */

DROP TABLE IF EXISTS albulm;
CREATE TABLE album (
	album_title varchar(40) NOT NULL,
	album_artist varchar(40) NOT NULL,
	album_ID varchar(9) NOT NULL,
	album_numTracks int(2) NOT NULL,
	album_genre varchar(20) NOT NULL,
	album_price decimal(4,2) NOT NULL,
	PRIMARY KEY(album_ID)
	);

DROP TABLE IF EXISTS artist;
CREATE TABLE artist (
	artist_ID varchar(7) NOT NULL,
	artist_name varchar(40) NOT NULL,
	artist_instrument varchar(25) NOT NULL,
	PRIMARY KEY	(artist_ID)
	);
	
DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
	genre_type varchar(20) NOT NULL,
	genre_description varchar(60) NOT NULL,
	PRIMARY KEY(genre_type)
	);

/* load entries for table genre from asg6_Marta_Wilgan_genres.txt */

LOAD DATA LOCAL INFILE "asg6_Marta_Wilgan_genres.txt" INTO TABLE genre; 


/* insert entries into tables album and artist */

INSERT INTO album VALUES ("The Violin Player","Vanessa-Mae","al1990ab1d2","10","classical","12.85");
INSERT INTO album VALUES ("Storm","Vanessa-Mae","al1992ab1d2","14","experimental","13.73");
INSERT INTO album VALUES ("Lovers Rock","Sade","al1992bc112","11","R&B","10.82");
INSERT INTO album VALUES ("Havana Moon","Carlos Santana","al1992c149b","11","rock","11.12");
INSERT INTO album VALUES ("The Swing of Delight","Carlos Santana","al1994c149b","9","rock","13.77");
INSERT INTO album VALUES ("Songs in A Minor","Alicia Keys","al2000ac113","15","R&B","13.99");
INSERT INTO album VALUES ("As I Am","Alicia Keys","al2004ac113","14","R&B","10.61");
INSERT INTO album VALUES ("Gilles Peterson in Brazil","Gilles Peterson","al2001cd221","23","acid jazz","23.98");
INSERT INTO album VALUES ("Brazilika","Gilles Peterson","al2005cd221","23","acid jazz","21.99");
INSERT INTO album VALUES ("Generation Next","Aventura","al1999ac333","11","bachata","13.29");

INSERT INTO artist VALUES ("arab1d2","Vanessa-Mae","violin");
INSERT INTO artist VALUES ("arbc112","Sade","voice");
INSERT INTO artist VALUES ("arc149b","Carlos Santana","guitar");
INSERT INTO artist VALUES ("arac113","Alicia Keys","piano");
INSERT INTO artist VALUES ("arcd221","Gilles Peterson","disc jockey");
INSERT INTO artist VALUES ("arac333","Aventura","voice");


/*
 * 1
 * The cost of all albums has gone up; write a query to raise the cost of the albums by 8%.
 */
 
UPDATE album
SET album_price = album_price*1.08;
 
/* 
 * 2
 * Write a query to find the total and average cost of albums charged for each musician.
 */
 
 SELECT SUM(album_price), AVG(album_price), album_artist
 FROM album
 GROUP BY album_artist;

 
/*
 * 3
 * Write a query to find out how many of the musicians are violinists.
 */
 
 SELECT artist_name
 FROM artist
 WHERE artist_instrument = 'violin';
 
/* 
 * 4
 * Write a query to project the following information for every 
 * album: title, musician's full name, full description of the genre and the cost 
 * in descending order by price.
 */
 
 SELECT album_title, album_artist, genre_description, album_price
 FROM album, genre
 WHERE album_genre = genre_type
 ORDER BY album_price DESC;
 
/*
 * 5 
 * Write a query to list the albums in alphabetical order in the following format: 
 * Title (Musican, primary instrument or vocal range)
 */
 
 SELECT album_title, album_artist, artist_instrument
 FROM album, artist
 WHERE album_artist = artist_name
 ORDER BY album_title;
 
/*
 * 6
 * Write a query to list the album title, musician, and number of tracks 
 * for only Classical and jazz albums.
 */
 
 SELECT album_title, album_artist, album_numTracks
 FROM album
 WHERE album_genre = 'classical' OR album_genre = 'jazz';
 	