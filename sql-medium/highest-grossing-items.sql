SELECT 
  category,
  product,
  total_spent
FROM (
  SELECT
    category, 
    product,
    SUM(spend) AS total_spent,
    RANK() OVER (
      PARTITION BY category
      ORDER BY SUM(spend) DESC
    ) as category_rank
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
  ORDER BY category_rank
) as ranked_products
WHERE category_rank <= 2
ORDER BY category, total_spent DESC;