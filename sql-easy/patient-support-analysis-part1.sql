SELECT COUNT(*)
FROM (
  SELECT policy_holder_id
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3
) as t;