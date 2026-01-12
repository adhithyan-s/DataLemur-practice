SELECT
  department.department_name,
  salary_rank.name,
  salary_rank.salary
FROM (
  SELECT 
    name,
    salary,
    department_id,
    DENSE_RANK() OVER (
      PARTITION BY department_id
      ORDER BY salary DESC
    ) AS ranking
  FROM employee
) AS salary_rank
JOIN department
  ON salary_rank.department_id = department.department_id
WHERE salary_rank.ranking <= 3
ORDER BY department.department_name, salary_rank.salary DESC, salary_rank.name;