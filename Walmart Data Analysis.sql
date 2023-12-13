## WALMART MySQL DATA SCIENCE PROJECT :

SELECT * FROM walmart_data.sales; 
-- TIME OF THE DAY
SELECT time FROM walmart_data.sales;

-- 
SELECT 'Time',
              ( CASE
				     WHEN 'time' BETWEEN '01:00:00'AND '11:00:00' THEN 'Morning'
                     WHEN 'time' BETWEEN '11:01:00' AND '15:00:00' THEN 'AfterNooon'
                     ELSE 'Evening'
                   END
                     ) AS Time_of_Date
FROM walmart_data.sales;
  -- Day Name 
  SELECT date,DAYNAME(date)
 FROM walmart_data.sales;
 ALTER TABLE walmart_data.sales ADD COLUMN day_name VARCHAR (10);
 
 UPDATE walmart_data.sales 
 SET day_name =DAYNAME(date);
 
-- Month Name
SELECT date,MONTHNAME(date)
FROM walmart_data.sales;
ALTER TABLE walmart_data.sales ADD COLUMN month_name VARCHAR(10);

SELECT DISTINCT branch FROM walmart_data.sales;

-- How many unique product lines does the data have?
USE walmart_data;
SELECT COUNT(DISTINCT Product line) FROM walmart_data.sales;

SELECT DATABASE();
USE walmart_data;
SELECT * FROM walmart_data.sales;

USE walmart_data;
SELECT  Gender 
FROM walmart_data.sales
WHERE Gender = 'Male';





