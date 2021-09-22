/* Picking Los Angeles Lakers team */
SELECT Player,Draft_Year,Predraft_Team
FROM players
WHERE Draft_Year >2000 AND Team ="Los Angeles Lakers"
ORDER BY Draft_Year;
/* players with height >6'8 and play FC,C */

SELECT player, Team,position,height,weight
FROM players
WHERE height > "6'8" AND position LIKE "%c%"
GROUP BY Team;

/* Calculating the BMI of the players (mass/height**2)*/
SELECT player,(weight*0.453592) AS weight_kg, (height*0.3048) AS height_meters,((weight*0.453592)/(height*0.3048* height*0.3048)) AS BMI
FROM players;
/* Picking players with BMI greater than 25 */
SELECT DISTINCT player,age 
FROM players 
WHERE ((weight*0.453592)/(height*0.3048* height*0.3048)) > 25
ORDER BY age DESC;

/* Players that played for carlifonian team before draft */
SELECT player,Team,Position,Predraft_Team
FROM players 
WHERE predraft_Team ="California"
GROUP BY player
ORDER BY TEAM;

/* Searching for details of steph curry */
SELECT *
FROM players
WHERE player="Steph Curry";

/* Searching for details of Lebron James */
SELECT *
FROM players
WHERE player = "Lebron James";

/*Players from the west and 35 years and above*/  
SELECT *
FROM players
WHERE conference="west" AND Age>=35;

/* Average weight of players */
SELECT AVG(weight_kg)
FROM players;

/* Players that are above the avg weight from the calculation above */
SELECT player, Weight_KG, height
FROM players 
WHERE Weight_KG > 102;

/* Players above 120 kg */
SELECT DISTINCT(Player), Weight_KG, Height_CM
FROM players
WHERE Weight_KG >120;
-- Shaquille O'neal has the heighest weight in kg while yao ming is the tallest--

/**SELECT DISTINCT(Player), Weight_KG, Height_CM
FROM players
WHERE WEIGHT IN (SELECT player,(weight/2) AS weight_kg, (height*0.3048) AS height_meters,((weight/2)/(height*0.3048* height*0.3048)) AS BMI
FROM players)
ORDER BY player;**/

SELECT  MIN(Height),player
FROM players;

SELECT  MAX(Height),player
FROM players;

SELECT player,(weight/2) AS weight_kg, (height*0.3048) AS height_meters, Age,
	CASE 
        WHEN ((weight/2)/(height*0.3048* height*0.3048)) > 35 THEN "Above 35"
        WHEN ((weight/2)/(height*0.3048* height*0.3048)) >30 THEN "Above 30"
        ELSE "Below 30"
	END AS BMI
FROM players
WHERE Age >25
HAVING Weight_KG >105 ;

/* Placing the various players according to their BMI using the case clause */
SELECT player,(weight/2) AS weight_kg, (height*0.3048) AS height_meters, Age,
	CASE 
        WHEN ((weight/2)/(height*0.3048* height*0.3048)) > 35 THEN "Above 35"
        WHEN ((weight/2)/(height*0.3048* height*0.3048)) >30 THEN "Above 30"
        ELSE "Below 30"
	END AS BMI
FROM players
HAVING Weight_KG >105 OR Age > 25;

SELECT player,(weight/2) AS weight_kg, (height*0.3048) AS height_meters, Age,
	CASE 
        WHEN ((weight/2)/(height*0.3048* height*0.3048)) > 35 THEN "Above 35"
        WHEN ((weight/2)/(height*0.3048* height*0.3048)) >30 THEN "Above 30"
        ELSE "Below 30"
	END AS BMI
FROM players
WHERE Age >25
HAVING Weight_KG >105;
/*Checking for the number of players who have  a real value of o.5 vs those with real value of 1 */

SELECT DISTINCT COUNT(player),real_value 
FROM players 
GROUP BY real_value;

/* Exploring the number of real value of  players by age and displaying the count,age and the real_value */
SELECT  DISTINCT count(real_value),Age,real_value
FROM players
WHERE AGE BETWEEN 20 AND 30
GROUP BY age,real_value
ORDER BY COUNT(real_value) DESC
LIMIT 20;

