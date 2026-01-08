SELECT
  salary AS second_highest_salary
FROM (
  SELECT 
    salary,
    RANK() OVER(
      ORDER BY salary DESC
    ) AS salary_rank
  FROM employee
) as salary_rank_table
WHERE salary_rank = 2;