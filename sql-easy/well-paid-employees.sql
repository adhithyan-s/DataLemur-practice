SELECT emp.employee_id, emp.name AS employee_name
FROM employee AS emp 
INNER JOIN employee AS mgr
  ON emp.manager_id = mgr.employee_id
WHERE emp.salary > mgr.salary