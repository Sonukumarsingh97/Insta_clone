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
   

/* Ques.3 most popular day of week for ragistration */

select DAYNAME(created_at) as day,
COUNT(id) as total
from ig_clone.users
GROUP BY day
ORDER BY total desc;

  
/*Ques.4 The users who have never posted a photo*/

SELECT username
FROM ig_clone.users
LEFT JOIN ig_clone.photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;


