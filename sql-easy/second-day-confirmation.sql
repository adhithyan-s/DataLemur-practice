SELECT user_id
FROM emails 
WHERE email_id IN (
  SELECT email_id
  FROM texts
  GROUP BY email_id
  HAVING 
      MIN(CASE WHEN signup_action = 'Confirmed' THEN DATE(action_date) END)
      -
      MIN(CASE WHEN signup_action = 'Not Confirmed' THEN DATE(action_date) END)
    = 1
);