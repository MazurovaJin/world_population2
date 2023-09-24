
       
/*World Populations SQL Practice II
Overview
Project Goals
I’ll work with a dataset of world population by country data from recent years. I’ll write queries to retrieve interesting data and answer a set of specific questions.*/


-- Q1 How many entries in the countries table are from Africa?

SELECT COUNT(id) 
FROM countries
WHERE continent = 'Africa'
;
-- 56

--Q2 What was the total population of the continent of Oceania in 2005?

SELECT SUM(population_years.population) AS 'population in Oceania in millions'
FROM population_years
JOIN countries ON population_years.country_id = countries.id
WHERE countries.continent = 'Oceania' AND population_years.year = 2005
;
-- 32.66417

-- Q3 What is the average population of countries in South America in 2003?

SELECT round (AVG(population_years.population),2) AS 'Average population of countries in South America (in millions)'
FROM population_years
JOIN countries ON population_years.country_id = countries.id
WHERE countries.continent = 'South America' AND population_years.year = 2003
;
-- 25.89

-- Q4 What country had the smallest population in 2007?
SELECT countries.name AS 'Country with the smallest population in 2007', MIN(population_years.population) 
FROM countries
JOIN population_years ON population_years.country_id = countries.id
WHERE population_years.year = 2003
;
-- Niue	0.00215

-- Q5 What is the average population of Poland during the time period covered by this dataset?
SELECT  AVG(population_years.population)
FROM population_years
JOIN countries ON population_years.country_id = countries.id
WHERE countries.name = 'Poland' 
;
-- 38.5606790909091

-- Q6 How many countries have the word “The” in their name?

SELECT name
FROM countries
WHERE UPPER(name) LIKE '%The%'
;
--4

-- Q7 What was the total population of each continent in 2010?

SELECT  countries.continent, SUM(population_years.population) AS 'population'
FROM population_years
JOIN countries ON population_years.country_id = countries.id
WHERE population_years.year = 2010
GROUP BY countries.continent
ORDER BY 1
;
-- continent	    population
    Africa	        1015.47846
    Asia	        4133.09148
    Europe	        723.06044
    North America	539.79456
    Oceania	        34.95696
    South America	396.58235
    
    








