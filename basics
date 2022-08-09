---SELECT

SELECT * -- all columns
  FROM tutorial.us_housing_units
  
  
SELECT year,
    month,
    west
  FROM tutorial.us_housing_units
  
SELECT west AS "west reg"
    FROM tutorial.us_housing_units

--LIMIT

SELECT west AS West_Region, --results will only return capital letters if you put column names in double quotes
       south AS South_Region
  FROM tutorial.us_housing_units
LIMIT 10

--WHERE
--comparison ooperators 

SELECT *
    FROM tutorial.us_housing_units
    WHERE month=11 AND south>1 --notice ordering 
    
  
    
SELECT year, month, west
    FROM tutorial.us_housing_units
    WHERE west>50
    
SELECT *
    FROM tutorial.us_housing_units
    --WHERE month_name='January'
    --WHERE month_name>'m' -- words that start w m or later letters
    WHERE month_name<='l'

--SELECT west+midwest AS west_midwest --aggregation across columns --called "derived columns"
SELECT *,(west+midwest)*1000 AS west_midwest_unitchanged --all columns & new column
    FROM tutorial.us_housing_units
    
    
SELECT west,midwest+northeast AS midwest_northeast --all columns & new column
    FROM tutorial.us_housing_units
    WHERE west>(midwest+northeast) -- cant use midwest_northeast bc unsaved 
    
    
SELECT west/(west+midwest+northeast+south) AS west_perc,
    midwest/(west+midwest+northeast+south) AS midwest_perc,
    northeast/(west+midwest+northeast+south) AS northeast_perc,
    south/(west+midwest+northeast+south) AS south_perc,
    year--not necessary
    FROM tutorial.us_housing_units
    WHERE year>=2000
    
SELECT * FROM tutorial.billboard_top_100_year_end

SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank
 
--logical operators 

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" LIKE 'Snoop%' --cant be double quote!!
  --In general, putting double quotes around a word or phrase will indicate that you are referring to that column name. 
  --"group" appears in quotations above because GROUP is a function
  -- % represents any character or set of characters. In this case, % is referred to as a "wildcard."
  --LIKE is case-sensitive
  --to ignore case: WHERE "group" ILIKE 'snoop%'
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist ILIKE 'dr_ke' -- _ (a single underscore) to substitute for an individual character --and no matter where the string appears
 

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%ludacris%' -- % at front and end! 
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE 'dj%'
 
--IN

SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank IN (1,2,3)
    
SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IN ('Drake','Ludacris') --caps matter! --searching for the EXACT string within ''
    
SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%Hammer%'
    
SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" IN ('Elvis Presley', 'M.C. Hammer', 'Hammer')
    
--BETWEEN 

SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank BETWEEN 5 AND 10 --BETWEEN includes the range bounds
    
--same as
SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank >= 5 AND year_rank <= 10
    
SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year BETWEEN 1985 AND 1990
    
--IS NULL: find rows with missing data

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name IS NULL
  
--AND

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year=2010 AND year_rank<3
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year=2010 
  AND year_rank<=10 
  AND "group" ILIKE 'k%'
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank<=10
  AND "group" ILIKE '%Ludacris%'
  --AND "group" IN ('Ludacris') --compare
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank=1
  AND year IN (1990,2000,2010)
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969
  AND song_name ILIKE '%love%'
  
--OR

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank=1 OR artist = 'Drake'
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 2013
  AND ("group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%')
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <=10
  AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%Bon Jovi%')
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%california%'
  AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999)
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%Dr. Dre%'
  AND (year <2001 OR year >2009)
  
--NOT: put before any conditional statement

SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year NOT BETWEEN 1985 AND 1990
    
--NOT is commonly used with LIKE
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969
  AND song_name NOT ILIKE '%love%'
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND artist IS NOT NULL
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND song_name NOT ILIKE '%a%'

--ORDER BY: ascending by default 

SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY artist
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY year_rank DESC
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY song_name DESC

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
 ORDER BY year DESC, year_rank

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
 ORDER BY 1 DESC, 2 --substituting numbers for column names, but doesnt work everywhere!
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 2010
 ORDER BY year_rank, artist
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%T-Pain%'
 ORDER BY year_rank DESC
 
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 10 AND 20
  AND year IN (1993,2003,2013)
 ORDER BY year, year_rank 
 
/* commenting
 multiple
 lines */
