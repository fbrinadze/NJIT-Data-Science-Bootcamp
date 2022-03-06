/* 
	Filename: Final Project SQL
    Class: SQL
    Date: 2022-03-06
    Author: Felix Brinadze
*/
# SQL Starts Here

### Part 1 ###

-- Task 1: Query that showws which artists havbe upcoming album releases with those who have the nearest album releases, with those
-- who have the nearest album release date listed first.
SELECT b.bandname, a.albumname, a.releasedate
FROM band b
INNER JOIN album a
ON b.idband = a.idband
Order by a.releasedate DESC;

-- Task 2: Write a query that displays the names of all bands that feature a drummer
SELECT b.bandname as "Bands that feature a Drummer"
FROM band b
INNER JOIN player p 
ON b.idband = p.idband
INNER JOIN instrument i
ON i.instid = p.instid
WHERE i.instrument = 'Drums';

-- Task 3: How many bands feature a certain instrument

SELECT count(b.bandname) as "Number of Bands that feature a Lead Guitar"
FROM band b
INNER JOIN player p 
ON b.idband = p.idband
INNER JOIN instrument i
ON i.instid = p.instid
WHERE i.instrument = 'Lead Guitar';

### Part 2 ###

-- Task 1: Add new bands to the bands table and player table
select * from band;
/* 
-- Bands
22 - weezer
23 - TLC
24 - Paramore
25 - blankpink
26 - Vampire weekend 

-- instruments

1 - lead guitar
2 - bass guitar
3 - vocals
4 - drums
5 - keyboards
6 - DJ
7 - rhythm guitar
8 - saxaphone
9 - strings
*/


insert into band (aid, bandname) 
values (1, 'Weezer'), (1, 'TLC'), (1, 'Paramore'), (1, 'Blackpink'), (1, 'Vampire Weekend');

/* weezer = 22.
   tlc = 23,
   paramore = 24
   blackpink = 25
   vampire weekend = 26
*/

select * from player;

insert into player (instid, idband, pfname, plname, homecity, homestate) 
values 
		(3, 22, 'Rivers', 'Cuomo', 'Rochester', 'NY'),
        (1, 22, 'Brian', 'Bell', 'Iowa City', 'IA'),
        (4, 22, 'Patrick', 'Wilson', 'Buffalo', 'NY'),
        (2, 22, 'Scott', 'Shriner', 'Toledo', 'OH'),
        (3, 23, 'Tionne', 'Watkins', 'Des Moines', 'IA'),
        (3, 23, 'Rozonda', 'Thonaas', 'Columbus', 'GA'),
        (3, 24, 'Hayley', 'Williams', 'Franklin', 'TN'),
        (1, 24, 'Taylor', 'York', 'Nashville', 'TN'),
        (4, 24, 'Zac', 'Farro', 'Voorhees Township', 'NJ'),
        (1, 25, 'Jisoo', 'Kim',null, 'South Korea'),
        (1, 25, 'Jennie', 'Kim',null, 'South Korea'),
        (1, 25, 'Roseanne', 'Park', null, 'South Korea'),
		(1, 25, 'Lisa', 'Manoban', null, 'South Korea'),
		(1, 26, 'Ezra', 'Koenig', 'New York', 'NJ'),
        (2, 26, 'Chris', 'Baio', 'Bronxville', 'NJ'),
        (4, 26, 'Chris', 'Tomson', 'Upper Freehold Township', 'NJ');

select * from player;

-- Task 2: add the new venue to the venu table

/* 
	Venue: Twin City Rock House
    City: Minneapolis
    State: Minnesota
    Zip Code: 55414
    Seats: 2000
*/
select * from venue;

insert into venue (vname, city, state, zipcode, seats) 
values ('Twin City Rock House', 'Minneapolis', 'MN', '55414', 2000);

### Part 3 ###

-- Task 1: Select 3 bands from our band table to perform at the musc festival.  
-- The fesival will take place on the first saturday of next month and will have 2,000 atteendees
-- Each band will need the gig added to the gig table

SELECT * from gig;
/* gig columns

idvenue, idband, gigdate, numattendees

*/

/* 

idvenue = 12
vname = 'Twin City Rock House'
city = 'Minneapolis'
state = 'MN'
zipcode = '55414'
seats = 2000

*/

/*
select b.idband, b.bandname, p.pfname, p.plname
from band b
join player p
on b.idband = p.idband
*/

/* idband 
25= blackpink
8 = bruce springsteen
22 = weezer
*/


select * from gig;

insert into gig (idvenue, idband, gigdate, numattendees)
values (12, 7, '2022/04/22', 2000),
	   (12, 8, '2022/04/22', 2000), 
       (12, 25,'2022/04/22', 2000);

-- Task 2: Create a view that displays the following information
-- Band ID, Band Name, Gig Venue, Gig Date, Number of attendees

CREATE view vw_upcoming_gigs as
SELECT b.idband Band_ID, 
       b.bandname Band_Name,
       v.vname Venue_Name,
       g.gigdate Gig_Date,
       g.numattendees Number_of_Attendees
FROM band b
INNER JOIN gig g
ON b.idband = g.idband
INNER JOIN venue v
ON v.idvenue = g.idvenue;

SELECT * FROM vw_upcoming_gigs;

-- Task 3: Create a view that shows the locatiuon of venues and the hometiwns of our artists.  If the city column is NUll
-- for an artists, display 'International' Instead

/*
select homecity, 
	   homestate, 
       case 
		    when homecity is null then 'International'
            else homestate
		end as homestate
From player;
*/

CREATE VIEW vw_artist_home_towns_and_venues as
SELECT b.idband Band_ID,
       b.bandname Band_Name,
       p.pfname Player_First_Name,
       p.plname Player_Last_Name,
       p.homecity Home_City,
       p.homestate Home_state,
       CASE
			WHEN p.homecity IS NULL THEN 'International'
            ELSE p.homecity 
		END Home_City2,
        p.homestate Home_State ,
        g.gigdate GIG_Date,
        v.vname Venue_Name,
        v.city Venue_City,
        v.state Venue_State
FROM band b
INNER JOIN player p
ON b.idband = p.idband
INNER JOIN gig g
ON p.idband = g.idband
INNER JOIN venue v
on g.idvenue = v.idvenue;

select * from vw_artist_home_towns_and_venues;


### Part 4 ###

-- Task 1: Create a stored proc that allows us to specify as US state and then displays all players who are from that state
-- Fields: Band Name, Player first nanme, player last name, homestate

DELIMITER #

CREATE PROCEDURE GetAllMembersByState ( IN setHomeState varchar(2) )
BEGIN
	SELECT     b.bandname Band_Name,
			   p.pfname Player_First_Name,
			   p.plname Player_Last_Name,
			   p.homestate Home_State
		FROM band b
		INNER Join player p
		ON b.idband = p.idband
		WHERE p.homestate = setHomeState;
END #

DELIMITER ;

call GetAllMembersByState('CA');

-- Task 2 - when a player cannot performa, the first thing we do is try to find another muscician to take their place
-- for the night.  We need a stored proc that allows us to specify whichb instrument we need filled
-- and displays all players who play that instrument and are not alredy schedul;ed for goigis that night


DELIMITER #

CREATE PROCEDURE GetReplacmentPlayer( IN setInstrument varchar(50) )
BEGIN
	SELECT b.bandname Band_Name,
		   p.pfname Player_First_Name,
		   p.plname Player_Last_Name,
		   i.instrument Instrument_Played,
		   g.gigdate Gig_Date
	FROM band b
	INNER JOIN player p
	ON b.idband = p.idband
	JOIN instrument i
	ON p.instid = i.instid
	Left JOIN gig g
	ON p.idband = g.idband
	Where g.gigdate is null and i.instrument = setInstrument;

END #

DELIMITER ;

call GetReplacmentPlayer('Drums');

-- Task 3 - Add your favorite artist to our band table and player table.  Do not forget to add the gig too

/*
	Band Info
    Members:
		Maynard James Keenan - Vocals, Ravenna, OH
        Adam Jones - Lead Guitar, Park Ridge, IL
        Danny Carey - Drums, Lawrence, KS
        Justin Chancellor - Bass, London, England
        
*/

INSERT INTO band (aid, bandname)
VALUES (1, 'TOOL');

SELECT * from band;

/*
-- instruments

1 - lead guitar
2 - bass guitar
3 - vocals
4 - drums
5 - keyboards
6 - DJ
7 - rhythm guitar
8 - saxaphone
9 - strings
*/

INSERT INTO player (InstID, idband, pfname, plname, homecity, homestate)
VALUES 
		(3, 32, 'Maynard', 'Keenan', 'Ravenna', 'OH'),
        (1, 32, 'Adam', 'Jones', 'Park Ridge', 'IL'),
        (4, 32, 'Danny', 'Carey', 'Lawrence', 'ks'),
        (2, 32, 'Justin', 'Chancellor', 'London', 'England');

select * from player;

select * from gig;

INSERT INTO gig (idvenue, idband, gigdate, numattendees)
VALUES (12, 32, '2022/04/22', 2000)