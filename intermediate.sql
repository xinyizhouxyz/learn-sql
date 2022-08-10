SELECT * FROM tutorial.aapl_historical_stock_price

--aggregate functions -- aggregators only aggregate vertically. perform a calculation across rows with simple arithmetic


--COUNT 

SELECT COUNT(*) --or COUNT(1)
    FROM tutorial.aapl_historical_stock_price

SELECT COUNT(high) --counting non NA rows in a column
    FROM tutorial.aapl_historical_stock_price
    
SELECT COUNT(date) AS count_of_date, --or "count of date"; Single quotes for everything else
    COUNT(low) as count_of_low
    FROM tutorial.aapl_historical_stock_price

--SUM: can only use SUM on columns containing numerical values -- SUM treats nulls as 0

SELECT SUM(high)
    FROM tutorial.aapl_historical_stock_price

SELECT SUM(open)/COUNT(open)
    FROM tutorial.aapl_historical_stock_price
    
--MIN/MAX: can be used on non-numerical columns 
--MIN returns the lowest number, earliest date, or non-numerical value as close alphabetically to "A" as possible

SELECT MIN(volume) AS min_vol,
    MAX(open) AS max_open
    FROM tutorial.aapl_historical_stock_price
    
SELECT MAX(close-open)
    FROM tutorial.aapl_historical_stock_price
    
--AVG: ignores nulls completely

SELECT AVG(high)
  FROM tutorial.aapl_historical_stock_price
 WHERE high IS NOT NULL
 
--same as:
SELECT AVG(high)
  FROM tutorial.aapl_historical_stock_price
  
--GROUP BY: separate data into groups, which can be aggregated independently

SELECT year,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year
  
SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year, month
  
SELECT year,
       month,
       SUM(volume)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  --ORDER BY year, month
  ORDER BY month, year
  
SELECT year,
  AVG(close-open)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year

SELECT year,
  month,
  MIN(low),
  MAX(high)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year, month
  
--HAVING: filter a query that has been aggregated,

SELECT year,
  month,
  MAX(high)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  HAVING MAX(high)>400
  ORDER BY year, month
  
/*
Query clause order
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

--CASE: if/then logic
/*followed by at least one pair of WHEN and THEN statements
Every CASE statement must end with the END statement
The ELSE statement is optional, and provides a way to capture values not specified in the WHEN/THEN statements.
*/

SELECT * FROM benn.college_football_players

SELECT player_name, 
    year,
    CASE WHEN year = 'SR' THEN 'yes' --The CASE statement always goes in the SELECT clause
        ELSE NULL END AS is_a_senior 
    FROM benn.college_football_players
    
SELECT player_name, 
    year,
    CASE WHEN year = 'SR' THEN 'yes'
        ELSE 'no' END AS is_a_senior 
    FROM benn.college_football_players

SELECT player_name, 
    hometown,
    CASE WHEN hometown ILIKE '%CA' THEN 'yes'
        ELSE 'no' END AS from_california 
    FROM benn.college_football_players
    ORDER BY from_california DESC

SELECT player_name, 
    weight,
    CASE WHEN weight >250 THEN 'over 250' --single quotes
        WHEN weight >200 THEN '200 - 250' --the WHEN/THEN statements will get evaluated in the order that they're written
        ELSE 'below 200' END AS weight_grp
    FROM benn.college_football_players
    
SELECT player_name, 
    weight,
    CASE WHEN weight >250 THEN 'over 250' 
        WHEN weight >200 AND weight <=250 THEN '200 - 250' --best practice to create statements that don't overlap
        ELSE 'below 200' END AS weight_grp
    FROM benn.college_football_players

SELECT player_name,
       CASE WHEN year = 'FR' AND position = 'WR' THEN 'frosh_wr'
            ELSE NULL END AS sample_case_statement
  FROM benn.college_football_players
  
SELECT *,
       CASE WHEN year = 'JR' or year = 'SR' THEN player_name --or year IN ('JR', 'SR') 
            ELSE NULL END AS sample_case_statement
  FROM benn.college_football_players
  
SELECT CASE WHEN year = 'FR' THEN 'FR'
    ELSE 'not FR' END AS year_grp,
    COUNT(1)
    FROM benn.college_football_players
    GROUP BY year_grp
    
SELECT CASE WHEN year = 'FR' THEN 'FR'
            ELSE 'Not FR' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY CASE WHEN year = 'FR' THEN 'FR'
               ELSE 'Not FR' END --"AS year_grp" removed 

SELECT COUNT(1) AS fr_c
    FROM benn.college_football_players
    WHERE year='FR' --where can only count one group
    
SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
    WHEN state ='TX' THEN 'TEXAS'
    ELSE 'other' END AS region,
    COUNT(1)
    FROM benn.college_football_players
    WHERE weight>=300
    GROUP BY region
    
SELECT CASE WHEN year IN ('FR','SO') THEN 'underclass'
    WHEN year IN ('JR','SR') THEN 'upperclass'
    END AS class,
    sum(weight)
    FROM benn.college_football_players
    WHERE state='CA'
    GROUP BY class

--long format 
SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY 1
 
--wide format: Using CASE inside of aggregate functions
SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS FR_C,
    COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS SO_C,
    COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS JR_C,
    COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS SR_C
    FROM benn.college_football_players


SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS FR_C,
    COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS SO_C,
    COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS JR_C,
    COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS SR_C,
    COUNT(year) AS total,
    state
    FROM benn.college_football_players
    GROUP BY state
    ORDER BY total DESC
    
SELECT CASE WHEN school_name < 'N' THEN 'a-m' --no comma
    ELSE 'm-z' END AS school,
    COUNT(1)
    FROM benn.college_football_players
    GROUP BY school
    
--DISTINCT: returns unique values 

SELECT DISTINCT month
    FROM tutorial.aapl_historical_stock_price
    
SELECT DISTINCT year, month --all of the unique pairs of those two columns
    FROM tutorial.aapl_historical_stock_price
    
SELECT DISTINCT year
    FROM tutorial.aapl_historical_stock_price
    ORDER BY year
    
SELECT COUNT(DISTINCT year) AS c_y
    FROM tutorial.aapl_historical_stock_price
    
SELECT month,
    AVG(volume)
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY AVG(volume) DESC
    
SELECT COUNT(DISTINCT month) AS c_y,
    year
    FROM tutorial.aapl_historical_stock_price
    GROUP BY year
    
SELECT COUNT(DISTINCT month) AS c_m,
    COUNT(DISTINCT year) AS c_y
    FROM tutorial.aapl_historical_stock_price
    
--joins 

SELECT *
    FROM benn.college_football_teams
    
--alias 
SELECT players.school_name,
    players.player_name,
    players.position,
    players.weight
    FROM benn.college_football_players players
    WHERE players.state = 'GA'
    ORDER BY players.weight DESC
    
SELECT teams.conference,
    AVG(players.weight)
    FROM benn.college_football_players players
    JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name -- "foreign keys" or "join keys"
    GROUP BY teams.conference
    ORDER BY AVG(players.weight)
