-- Player full name and awards won.
SELECT p.namefirst || ' ' || p.namelast AS name, COUNT(a.awardid) AS award_count_total, a.playerid
FROM awardsplayers AS a
JOIN people AS p
    USING (playerid)
GROUP BY 1, 3
ORDER BY 2 DESC

-- Playername and allstar appearances
SELECT p.namefirst || ' ' || p.namelast AS name, COUNT(DISTINCT(a.gameid)) as total_allstar, p.playerid
FROM allstarfull AS a
JOIN people AS p
    USING(playerid)
GROUP BY 1,3
ORDER BY 2 DESC

-- Full name of school    
SELECT DISTINCT(s.schoolname), s.schoolid
FROM schools AS s
JOIN collegeplaying AS c
USING (schoolid)

-- College student
SELECT DISTINCT(p.playerid), c.schoolid
FROM people p
LEFT JOIN collegeplaying c
    ON p.playerid = c.playerid
WHERE c.schoolid IS NOT null

-- None college student
SELECT DISTINCT(p.playerid), c.schoolid
FROM people p
LEFT JOIN collegeplaying c
    ON p.playerid = c.playerid
WHERE c.schoolid IS null

-- Playerid and total career salary
SELECT playerid, SUM(salary)
FROM salaries
GROUP BY 1
ORDER BY 2 DESC

-- IMPORT PART 2
SELECT *
FROM salaries

SELECT *
FROM collegeplaying

SELECT *
FROM allstarfull

SELECT *
FROM awardsplayers

SELECT *
FROM schools

SELECT *
FROM people











































