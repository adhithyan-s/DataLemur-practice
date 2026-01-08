SELECT
  age_bucket,
  ROUND(100.0 * time_spent_sending / (time_spent_sending + time_spent_opening), 2) AS send_perc,
  ROUND(100.0 * time_spent_opening / (time_spent_sending + time_spent_opening), 2) AS open_perc
FROM (
  SELECT
    ab.user_id,
    ab.age_bucket,
    SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) AS time_spent_sending,
    SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) AS time_spent_opening
  FROM age_breakdown AS ab
  JOIN activities AS a
    ON ab.user_id = a.user_id
  GROUP BY ab.user_id, ab.age_bucket
) as t
ORDER BY age_bucket ASC;