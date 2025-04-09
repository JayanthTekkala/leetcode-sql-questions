--1683. Invalid Tweets
SELECT tweet_id from Tweets 
WHERE LENGTH(content)>15;