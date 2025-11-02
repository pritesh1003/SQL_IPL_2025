create database ipl2025;
show databases;
use ipl2025;

/*============================Create tables=================================*/
 /*===Matches===*/
 CREATE TABLE Matches
 (Match_id INT PRIMARY KEY,
 Match_date DATE ,
 Team1 varchar(100),
 Team2 VARCHAR(100),
 Toss_winner VARCHAR(100),
 Decision VARCHAR(100));
 
 /*===Scores===*/
   CREATE TABLE Scores (
  Score_id INT PRIMARY KEY,
  Match_id INT,
  first_score INT,
  first_wkts INT,
  second_score INT,
  second_wkts INT,
  FOREIGN KEY (Match_id) REFERENCES Matches(Match_id)); 
  
  /*===Results===*/
CREATE TABLE Results (
  Result_id INT PRIMARY KEY,
  Match_id INT,
  winner VARCHAR(50),
  player_of_the_match VARCHAR(50),
  FOREIGN KEY (match_id) REFERENCES Matches(match_id));
  
  /*===performance===*/
CREATE TABLE Performance (
 Performance_id INT PRIMARY KEY,
 Match_id INT,
 most_runs VARCHAR(50),
 most_wkts VARCHAR(50),
 FOREIGN KEY (Match_id) REFERENCES Matches(Match_id));
 
show tables;
desc matches;
desc scores;
desc results;
desc performance;

/*====Alter tables===*/
/*===add column===*/
alter table matches add column umpire_name varchar(50);

/*====modify column=====*/
alter table results modify winner varchar(100);

/*=========Drop column========*/
alter table matches drop column umpire_name ;

/*==========================DML========================*/
desc matches;
insert into matches values('1','2025-04-01','Mumbai_Indians','Chennai_Super_Kings','Mumbai_Indians','bat');
insert into matches values('2','2025-04-02','Delhi_Capitals','Royal_Challengers_Bangalore','Delhi_Capitals','field');
insert into matches values('3','2025-04-03','Kolkata_Knight_Riders','Punjab_Kings','Punjab_Kings','bat');
insert into matches values('4','2025-04-04','Sunrisers_Hyderabad','Gujarat_Titans','Sunrisers_Hyderabad','field');
insert into matches values('5','2025-04-05','Lucknow_Super_Giants','Rajasthan_Royals','Lucknow_Super_Giants','bat');
insert into matches values('6','2025-04-06','Chennai_Super_Kings','Delhi_Capitals','Chennai_Super_Kings','field');
insert into matches values('7','2025-04-07','Royal_Challengers_Bangalore','Mumbai_Indians','Mumbai_Indians','bat');
insert into matches values('8','2025-04-08','Rajasthan_Royals','Kolkata_Knight_Riders','Kolkata_Knight_Riders','field');
insert into matches values('9','2025-04-09','Punjab_Kings','Sunrisers_Hyderabad','Sunrisers_Hyderabad','bat');
insert into matches values('10','2025-04-10','Gujarat_Titans','Lucknow_Super_Giants','Gujarat_Titans','field');

select *from matches;

/*=======scores table=======*/

insert into scores values ('1','1','173','6','176','4');
insert into scores values ('2','2','174','9','177','6');
insert into scores values ('3','3','208','7','204','7');
insert into scores values ('4','4','193','4','173','6');
insert into scores values ('5','5','168','6','162','9');
insert into scores values ('6','6','176','6','178','6');
insert into scores values ('7','7','206','6','143','8');
insert into scores values ('8','8','277','3','246','5');
insert into scores values ('9','9','185','5','173','5');
insert into scores values ('10','10','182','6','186','3');

select * from scores;

/*=========results table==========*/

insert into results values ('1','1','Mumbai_Indians','Surya_kumar_yadav');
insert into results values ('2','2','Royal_challengers_Bangalore','Virat_kohli');
insert into results values ('3','3','Punjab_kings','Shreyas_Iyer');
insert into results values ('4','4','Sunrisers_Hydrabad','Bhuvneshwar_kumar');
insert into results values ('5','5','Rajasthan_Royals','Yashasvi_Jaiswal');
insert into results values ('6','6','Delhi_Capitals','KL_Rahul');
insert into results values ('7','7','Royal_Challegers_Bangalore','Rajat_Patidar');
insert into results values ('8','8','Kolkata_Night_Riders','Rinku_Singh');
insert into results values ('9','9','Pujab_Kings','Arshdeep_Singh');
insert into results values ('10','10','Gujrat_Titans','Sai_sudarshan');

select *from results;

/*===============Performance table============*/

insert into performance value('1','1','Surya_Kumar_yadav','Pathirana');
insert into performance value('2','2','Virat_kohli','Axar_Patel');
insert into performance value('3','3','Shreyas_Iyer','Harshit_Rana');
insert into performance value('4','4','Travis_Head','Bhuvneshwar_Kumar');
insert into performance value('5','5','Yashasvi_Jaiswal','Shardul_Thakur');
insert into performance value('6','6','Kl_Rahul','Pathirana');
insert into performance value('7','7','Rajat_Patidar','Hardik_Pandya');
insert into performance value('8','8','Rinku_Singh','Harshit_Rana');
insert into performance value('9','9','Shreyas_Iyer','Arshdeep_Singh');
insert into performance value('10','10','Sai_Sudarshan','Shardul_Thakur');

select*from performance;

/*Insert given values into table Matches Match_id=11, Match_date=2025-04-16, 
Team1=Royal_challengers_Bangalore,Team2=Chennai_Super_Kings ,Toss_winner= Royal_challengers_Bangalore ,Decision=Bat*/
insert into matches value ('11','2025-04-16','Royal_challengers_Bangalore','Chennai_Super_Kings','Royal_challengers_Bangalore','Bat');

/*Retrive  The details of the matches where  the  decision after winning the toss was ‘field’.*/
Select *from matches where Decision='Field';

/*How do you update the team1 for a match_id =11 in the Matches table to Decision'Bat'
 where the Toss_winner is 'team1' and the Match_date is '2025-04-16'*/
 UPDATE Matches SET team1 = 'Mumbai_Indians', Decision = 'Bat',
 Toss_winner ='Mumbai_Indians', Match_date = '2025-04-20' WHERE Match_id='11'; 
 
 select * from matches;
 
 /*Delete the match record from the Matches table where the Match_id is 11*/
 Delete from matches where match_id=11;
 
 /*==================Between Function=======================*/
 
 /*Find all matches that occurred between '2025-04-03' to '2025-04-25'*/
 Select Match_id, Match_date, Team1, Team2 from Matches where Match_date between '2025-04-03' and '2025-04-25';
 
 /*======================Aggregate function====================*/
 
 /*===Count====*/
 /*count the total number of matches played.*/
Select COUNT(Match_id) as Total_Matches from Matches;

/*====Sum====*/
/*calculate the total runs scored by both teams across all matches*/
Select SUM(first_score + second_score) as Total_Runs from Scores;

/*======AVG=========*/
/*What was the average score of teams batting first in IPL 2025*/
Select round(avg(first_score)) as avg_first_inning_score from Scores join Matches on 
Scores.match_id = Matches.match_id;

/*=======MIN============*/

/*find the minimum score by Team 2 across all matches*/
Select MIN(first_score) as Minimum_Team2_Score from Scores where first_score>1;

/*=============MAX===============*/
/*What is the highest score made by any team in the first innings*/
select MAX(first_score) as highest_first_innings_score from Scores;

/*==========LOGICAL OPERATOR===========*/

/*==========USING AND ================*/
/*Find matches where delhi capitals played and they wonn the toss*/
select	* from matches where (Team1 = 'Delhi_Capitals' OR Team2 = 'Delhi_Capitals') and Toss_Winner = 'Delhi_Capitals';

/*==============USING OR===================*/
/*Get performance where eithr most_runs is virat kolhi or most wkts is pathiran*/
select * from performance where most_runs = 'Virat_Kohli' OR most_wkts = 'Pathirana';

/*================USING NOT==========*/
/*Get all results where the player of the match is not virat kohli*/
select *from results where Player_of_the_match <> 'Virat_Kohli';

/*===============USING BETWEEN ======*/
/*Show result where the match id is between 3 and 7*/
select *from results where Match_id between 3 and 7;

/*=====================USING IN===============*/
/*Show rows where the first scores is 173,208,277*/
select *from scores where First_Score in (173,208,277);

/*=====================USING ANY====================*/
/*Find matches where match id is less than any of (7,9)*/
select * from matches where Match_id < ANY (select val from(select 7 as val union all select 9) as t);

/*==========USING ALL=============*/
/*Find rows where first score is greater than all of (150,160,170)*/
select * from scores where First_score > ALL (select val from (select 150 as val union all select 160 union all select 170 )as t);

/*=====Group by clause===========*/
 
 /*Find the number of matches each team has played*/
select Team1 AS Team, COUNT(Match_id) AS Matches_Played from Matches GROUP BY Team1
UNION
Select Team2 AS Team, COUNT(Match_id) AS Matches_Played from Matches GROUP BY Team2;

/*====Order by=============*/

/*Find the top 5 highest-scoring matches based on the total score of both teams*/
Select Match_id, (first_score + second_score) as Total_Runs from Scores
order by Total_Runs desc limit 5;

/*==================Having clause==============================*/

/*Find players who have won "Player of the Match" more than once*/
Select player_of_the_match, COUNT(result_id) as Awards from Results group by player_of_the_match
having COUNT(result_id) > 0;

/*==================Distinct Function====================*/

/*Find all distinct teams that have participated in matches*/
Select Distinct Team1 as Team from Matches union select distinct Team2 as Team from Matches;
 
 /*================Using Like function==================*/
 
 /*Find all players who won "Player of the Match" and have a name starting with the letter "R"*/
 Select player_of_the_match, match_id from Results where player_of_the_match like 'R%';
 
 /*===================Using UNION==========================*/
 /*Combine both scores and wickes together*/
 select first_score as Runs, first_wkts as Wkts from scores union select second_score, second_wkts from scores;
 
 /*==================================JOINS=========================================*/
 
 /*================INNER JOIN==================*/
 /*Get match details and scores together*/
 select m.match_id, m.team1, m.Team2, s.first_score, s.first_wkts from matches m 
 inner join scores s on m.Match_id = s.Match_id;
 
 /*========================LEFT JOIN=========================*/
 /*What is the performance summary (total runs, total wickets) for the toss-winning team in each match*/
select Matches.toss_winner, SUM(Scores.first_score + Scores.second_score)  as Total_runs,
SUM(Scores.first_wkts + Scores.second_wkts) as Total_wickets
from Matches left join Scores on Matches.match_id = Scores.match_id 
where year(Matches.match_date) = 2025 group by Matches.toss_winner order by Total_runs desc;

/*==================RIGHT JOIN===========================*/
/*Show only matches played after 2025-04-01*/
select s.score_id,s.match_id, s.first_score, s.first_wkts, s.second_score, s.second_wkts, 
m.match_date, m.team1, m.team2 from scores s right join 
matches m on s.match_id = m.match_id where m.match_date > '2025-04-06';

/*==========================SUBQUERIES====================*/
/*=====================SINGLE ROW SUBQUERRY=====================================*/

/*Find all scores where first score is higher than the highest second score*/
select * from scores where first_score > (select max(second_score) from scores);

/*=================MULTIPLE ROW SUBQUERRY===================*/
/*Display all match id and the count of records per match , only for matches where the avg first score exceeds 200*/
select match_id, count(*) as Total_records from scores 
group by match_id having avg(first_score) > 200;

/*========================MULTIPLE COLUMN SUBQUERRY=================*/
/*All records whose first score, second score pair matches any first score , second score pair where first wkts is less than 5*/
select * from scores where (first_score, second_score) in (select first_score, second_score 
from scores where first_wkts < 5);

/*================================VIEW=======================*/
/*Create view showing each match id with total first score and total second score per match*/

create view match_totals as select match_id, sum(first_score) as Total_first_score, 
sum(second_score) as Total_second_score from scores group by match_id;

select* from match_totals;

 