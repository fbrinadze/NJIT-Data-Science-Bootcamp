/* Author: Felix Brinadze
   Email: felix.brinadze@gmail.com
   Date: 2022-03-06
   Title: Final_Project.sql
*/

-- Code starts here

-- Part 1
# Task 1 - list all bands that have an upcoming album release
select b.bandname, 
	   a.albumname, 
	   a.releasedate 
from album a
join band b
on a.idband = b.idband
order by releasedate desc;

# Task 2 - query that displays the names of all bands that feature a drummer
select b.bandname
       /*p.pfname, 
	   p.plname,
       i.instrument*/
from band b
join player p
on b.idband = p.idband
join instrument i
on p.InstID = i.InstID
where instrument = 'Drums';

# Task 3 - Need a query that displays the query of bands that featuer a certian instrument
select count(*)
     /*  p.pfname, 
	   p.plname,
       i.instrument */
from band b
join player p
on b.idband = p.idband
join instrument i
on p.InstID = i.InstID
where i.instrument = 'Bass Guitar'
group by i.instrument;

-- Part 2

# Task 1 - add the bands to the correct table
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
values (1, 'TLC'), (1, 'Paramore'), (1, 'Blackpink'), (1, 'Vampire Weekend');

-- select * from player;
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
        (1, 25, 'Jisoo', 'Kim',null, 'KR'),
        (1, 25, 'Jennie', 'Kim',null, 'KR'),
        (1, 25, 'Roseanne', 'Park', null, 'KR'),
		(1, 25, 'Lisa', 'Manoban', null, 'KR'),
		(1, 26, 'Ezra', 'Koenig', 'New York', 'NJ'),
        (2, 26, 'Chris', 'Baio', 'Bronxville', 'NJ'),
        (4, 26, 'Chris', 'Tomson', 'Upper Freehold Township', 'NJ');
        




# Taks 2 - add new venues to the venue table

select * from venue;     

insert into venue (vname, city, state, zipcode, seats)
values ('Twin City Rock House', 'Minneapolis', 'MN', '55414', 2000);

-- Part 3
# Task 1 - Select a band to play at the new venue
select distinct b.bandname
from band b
join player p
on p.idband = b.idband
join instrument i 
on i.InstID = b.idband
where i.instrument in ('Drums', 'lead guitar') or p.homestate in ('NY', 'NJ', 'MN')
limit 3;

# Task 2 - Create a view that displays the the gig date

select b.idband as Band_ID,
       b.bandname as Band_Name,
       v.vname as Gig_Venue,
       g.gigdate as gig_date,
       g.numattendees as number_of_attenedees
from band b
join gig g 
on b.idband = g.idband
join venue v
on
g.idvenue = v.idvenue;

# Task 3 - if the homecity is null write as international in a view

create view vw_band_list as
select b.idband as band_id,
       b.bandname as band_name ,
       p.pfname as player_first_name,
       p.plname as player_last_name,
       ifnull(p.homecity, "international") as home_city,
       p.homestate as home_state,
       g.gigdate as gig_date,
       v.vname as venue_name,
       v.city as venue_city,
       v.state as venue_state
from band b
inner join player p
on b.idband = p.idband
inner join gig g
on g.idband = b.idband
inner join venue v
on g.idvenue = v.idvenue;

select * from vw_band_list;

-- Part 4

# Task 1 - create stored proc

/* test query
select b.bandname as BAND_NAME,
	   p.pfname as PLAYER_FIRST_NAME,
       p.plname as PLAYER_LAST_NAME,
       p.homestate as HOME_STATE
from band b
inner join player p
on b.idband = p.idband
*/

DELIMITER #
CREATE PROCEDURE getBandInfo()
BEGIN
		select b.bandname as BAND_NAME,
			   p.pfname as PLAYER_FIRST_NAME,
			   p.plname as PLAYER_LAST_NAME,
			   p.homestate as HOME_STATE
	    from band b
		inner join player p
	    on b.idband = p.idband;
END #
DELIMITER ;

call getBandInfo();

# Task 2 - Stored proc to specify which instruments we need filled and displayys who are not already schedul;ed






