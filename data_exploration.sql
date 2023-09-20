 /*INSTAGRAM CLONE EXPLORATORY DATA ANALYSIS USING SQL*/

 /*SQL SKILLS: joins, date manipulation, regular expressions, views, stored procedures, aggregate functions, string manipulation*/
 
-- --------------------------------------------------------------------------------------------------------------

  /*Ques.1 The first 10 users on the platform*/

SELECT 
    *
FROM
    ig_clone.users
ORDER BY created_at asc
limit 10;

  /*Ques.2 Total number of users*/

  SELECT count(*) as users
   from ig_clone.users ; 


