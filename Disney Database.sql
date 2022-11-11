CREATE DATABASE Disney;

USE Disney;

/*Characters Table*/

SELECT * FROM Disney.characters;

SELECT DISTINCT chara.movie_title, chara.release_date, dire.director
FROM characters chara
JOIN director dire
	USING(id)
ORDER BY chara.movie_title;

SELECT ch.movie_title, ch.hero, ch.villian, tg.genre, tg.MPAA_rating, tg.gross
FROM characters ch
JOIN total_gross tg
	USING(movie_title);


SELECT *
FROM characters
WHERE release_date BETWEEN '1937-01-01' AND '1956-12-31';

SELECT *
FROM characters
WHERE release_date BETWEEN '1957-01-01' AND '1976-12-31';

SELECT *
FROM characters
WHERE release_date BETWEEN '1977-01-01' AND '1996-12-31';

SELECT *
FROM characters
WHERE release_date BETWEEN '1997-01-01' AND '2016-12-31';

SELECT hero, villian, song,
CASE
	WHEN hero = '' THEN NULL
    WHEN villian = '' THEN NULL
    WHEN song = '' THEN NULL
    ELSE hero
END AS Updated_Columns
FROM characters;

UPDATE characters
SET hero = NULL
WHERE hero = '';

UPDATE characters
SET villian = NULL
WHERE villian = '';

UPDATE characters
SET song = NULL
WHERE song = '';

SELECT *
FROM characters
WHERE hero IS NOT NULL AND 
	  villian IS NOT NULL

/*Director Table*/

SELECT * FROM Disney.director;

SELECT *
FROM director
ORDER BY director;

-- Counting how many directors directed multiple films

SELECT director, COUNT(director) AS Movies_Directed
FROM director
GROUP BY director
ORDER BY Movies_Directed DESC;

/*Total Gross*/

SELECT * FROM Disney.total_gross;

SELECT *
FROM total_gross
ORDER BY movie_title;

-- Getting movie released in 20 years increments

SELECT *
FROM total_gross
WHERE release_date BETWEEN '1937-01-01' AND '1956-12-31';

SELECT *
FROM total_gross
WHERE release_date BETWEEN '1957-01-01' AND '1976-12-31';

SELECT *
FROM total_gross
WHERE release_date BETWEEN '1977-01-01' AND '1996-12-31';

SELECT *
FROM total_gross
WHERE release_date BETWEEN '1997-01-01' AND '2016-12-31';

SELECT *
FROM total_gross
WHERE MPAA_rating = 'Not Rated';

-- Get movie gross by ratings

SELECT MPAA_rating, COUNT(MPAA_rating) AS 'Number of Ratings', SUM(gross) AS 'Total Rating Gross'
FROM total_gross
GROUP BY MPAA_rating
ORDER BY 3 DESC;

SELECT movie_title
FROM total_gross
ORDER BY movie_title;

-- Update empty row for the total gross table
-- https://www.the-numbers.com/movie/Many-Adventures-of-Winnie-the-Pooh-The#tab=summary

UPDATE total_gross
SET gross = '5168700'
WHERE movie_title = 'The Many Adventures of Winnie the Pooh';

-- Getting the total eact movie made by Genre

SELECT genre, SUM(gross) AS Genre_Totals
FROM total_gross
GROUP BY genre;

-- Getting the total eact movie made by Ratings

SELECT MPAA_rating, SUM(gross) AS Rating_Totals
FROM total_gross
GROUP BY MPAA_rating;

-- Updating movies with no rating
-- https://www.imdb.com/title/tt0046672/ 

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 5;

-- https://www.imdb.com/title/tt0053285/?ref_=fn_al_tt_2

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 7;

-- https://www.google.com/search?q=the+absent+minded+professor&rlz=1C5CHFA_enUS967US967&oq=The+Absent+Minded+Professor&aqs=chrome.0.0i512l5j46i512j0i512l4.831j0j15&sourceid=chrome&ie=UTF-8 

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 9;

-- https://www.imdb.com/title/tt0057546/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 12;

-- https://www.imdb.com/title/tt0061852/?ref_=nv_sr_srsg_3

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 13;

-- https://www.rottentomatoes.com/m/blackbeards_ghost

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 14;

-- https://www.imdb.com/title/tt0065482/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 16;

-- https://www.imdb.com/title/tt0066817/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 17;

-- https://www.imdb.com/title/tt0072653/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 18;

-- https://www.imdb.com/title/tt0076054/?ref_=nv_sr_srsg_3

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 19;


-- https://www.imdb.com/title/tt0076363/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 20;

-- https://www.imdb.com/title/tt0076618/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 21;

-- https://www.imdb.com/title/tt0076137/?ref_=fn_al_tt_1

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 22;

-- https://www.imdb.com/title/tt0078869/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 23;

-- https://www.imdb.com/title/tt0081159/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 24;

-- https://www.imdb.com/title/tt0081031/?ref_=nv_sr_srsg_1

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 25;

-- https://www.imdb.com/title/tt0082263/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 26;

-- https://www.imdb.com/title/tt0082017/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 27;

-- https://www.imdb.com/title/tt0082406/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 28;

-- https://www.imdb.com/title/tt0082199/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 29;

-- https://www.imdb.com/title/tt0082810/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 30;

-- https://www.imdb.com/title/tt0084827/?ref_=nv_sr_srsg_3

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 31;

-- https://www.imdb.com/title/tt0084783/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 32;

-- https://www.imdb.com/title/tt0086476/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 33;

-- https://www.imdb.com/title/tt0086336/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 34;

-- https://www.imdb.com/title/tt0086005/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 35;

-- https://www.imdb.com/title/tt0086220/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 36;

-- https://www.imdb.com/title/tt0086220/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 38;

-- https://www.imdb.com/title/tt0088760/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 39;

-- https://www.imdb.com/title/tt0089908/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 40;

-- https://www.imdb.com/title/tt0088814/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 41;

-- https://www.imdb.com/title/tt0089652/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 42;

-- https://www.imdb.com/title/tt0089385/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 43;

-- https://www.imdb.com/title/tt0089731/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 44;

-- https://www.imdb.com/title/tt0091668/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 46;

-- https://www.imdb.com/title/tt0091149/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 48;

-- https://www.imdb.com/title/tt0091059/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 49;

-- https://www.imdb.com/title/tt0092105/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 50;

-- https://www.imdb.com/title/tt0094155/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 53;

-- https://www.imdb.com/title/tt0092974/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 54;

-- https://www.imdb.com/title/tt0092638/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 55;

-- https://www.imdb.com/title/tt0092513/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG-13'
WHERE id = 56;

-- https://www.imdb.com/title/tt0092718/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG-13'
WHERE id = 58;

-- https://www.imdb.com/title/tt0093175/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 59;

-- https://www.imdb.com/title/tt0096098/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 62;

-- https://www.imdb.com/title/tt0094933/?ref_=nv_sr_srsg_4

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 63;

-- https://www.imdb.com/title/tt0095981/?ref_=nv_sr_srsg_3

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 68;

-- https://www.imdb.com/title/tt0095288/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG-13'
WHERE id = 69;

-- https://www.imdb.com/title/tt0095238/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 70;

-- https://www.imdb.com/title/tt0097211/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 76;

-- https://www.imdb.com/title/tt0097053/?ref_=nv_sr_srsg_1

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 80;

-- https://www.imdb.com/title/tt0100924/?ref_=nv_sr_srsg_3

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 86;

-- https://www.imdb.com/title/tt0102849/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'R'
WHERE id = 101;

-- https://www.imdb.com/title/tt0103262/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'G'
WHERE id = 107;

-- https://www.imdb.com/title/tt0110044/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG-13'
WHERE id = 173;

-- https://www.imdb.com/title/tt0110169/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG-13'
WHERE id = 185;

-- https://www.imdb.com/title/tt0281865/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG-13'
WHERE id = 355;

-- https://www.imdb.com/title/tt0381006/?ref_=nv_sr_srsg_0

UPDATE total_gross
SET MPAA_rating = 'PG'
WHERE id = 404;

/*Voice Actors*/

SELECT * FROM Disney.voice_actors;

SELECT *
FROM voice_actors
ORDER BY movie;

SELECT movie, voice_actor, COUNT(voice_actor)
FROM voice_actors
GROUP BY movie, voice_actor
ORDER BY 3 DESC;

-- Checking to see if there are any voice actors that have done multiple movies

SELECT voice_actor, COUNT(voice_actor) AS Num_of_Films
FROM voice_actors
GROUP BY voice_actor;