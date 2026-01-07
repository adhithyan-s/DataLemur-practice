SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM (
  SELECT company_id, COUNT(job_id)
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(job_id) >= 2
) AS duplicate_listings;