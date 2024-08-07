/*
Question: What are the top-paying data analyst jobs in New York?
- Identify the top 10 highest-paying Data Analyst roles that are available in NYC
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options in NY.
*/

SELECT
    job_title,
    company_dim.name AS company_name,
    salary_year_avg,
    job_schedule_type
FROM job_postings_fact
LEFT JOIN company_dim 
    ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'New York, NY' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
