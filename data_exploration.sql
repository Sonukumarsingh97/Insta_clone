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



/*Ques.8 The total number of users with posts*/


SELECT 
    COUNT(DISTINCT (users.id)) AS total_number_of_users_with_posts
FROM
    ig_clone.users 
        JOIN
    ig_clone.photos  ON users.id = photos.user_id;


/*Ques.9 The most popular tag names by usage*/

SELECT 
    tags.tag_name, COUNT(tag_name) AS seen_used
FROM
    ig_clone.tags 
        JOIN
    ig_clone.photo_tags  ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY seen_used DESC
LIMIT 10;



/*Ques.10 The most popular tag names by likes*/

SELECT 
    tags.tag_name AS 'Tag Name',
    COUNT(likes.photo_id) AS 'Number of Likes'
FROM
    ig_clone.photo_tags 
        JOIN
    ig_clone.likes  ON likes.photo_id = photo_tags.photo_id
        JOIN
    ig_clone.tags  ON photo_tags.tag_id = tags.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


/*Ques.11 The users who have liked every single photo on the site*/

SELECT 
    users.id, users.username, COUNT(likes.user_id) AS total_likes_by_user
FROM
    ig_clone.users 
        JOIN
    ig_clone.likes  ON users.id = likes.user_id
GROUP BY users.id
HAVING total_likes_by_user = (SELECT 
        COUNT(*)
    FROM
        ig_clone.photos);



/*Ques.12 Total number of users without comments*/

SELECT 
    COUNT(*) AS total_number_of_users_without_comments
FROM
    (SELECT 
        users.username, comments.comment_text
    FROM
        ig_clone.users 
    LEFT JOIN ig_clone.comments  ON users.id = comments.user_id
    GROUP BY users.id , comments.comment_text
    HAVING comment_text IS NULL) AS users;




