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


/*Ques.5 The most likes on a single photo*/

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM ig_clone.photos
INNER JOIN ig_clone.likes
    ON likes.photo_id = photos.id
INNER JOIN ig_clone.users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;



/*Ques.6 The number of photos posted by most active users*/

SELECT 
	users.username AS 'Username',
    COUNT(photos.image_url) AS 'Number of Posts'
FROM
    ig_clone.users 
        JOIN
    ig_clone.photos  ON users.id = photos.user_id
GROUP BY users.id
ORDER BY 2 DESC
LIMIT 5;


/*Ques.7 The total number of posts*/

SELECT 
    SUM(user_posts.total_posts_per_user) AS 'Total Posts by Users'
FROM
    (SELECT 
        users.username, COUNT(photos.image_url) AS total_posts_per_user
    FROM
        ig_clone.users 
    JOIN ig_clone.photos  ON users.id = photos.user_id
    GROUP BY users.id) AS user_posts;









