SELECT tweet_bucket, COUNT(*) AS user_num
FROM (
  SELECT COUNT(tweet_id) AS tweet_bucket
  FROM tweets
  WHERE YEAR(tweet_date) = 2022
  GROUP BY user_id
) t
GROUP BY tweet_bucket
ORDER BY tweet_bucket;