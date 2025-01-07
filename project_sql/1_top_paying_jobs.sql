/*
 Question: What are the top-paying Business analyst jobs?
 - Identify the top 10 highest-paying Business Analyst roles that are available 
 - Focuses on job postings with specified salaries (remove nulls)
 - BONUS: Include company names of top 10 roles
 - Why? Highlight the top-paying opportunities for Business Analysts, offering insights into employment options and location flexibility.
 */
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Business Analyst' -- AND job_location = 'Bangkok, Thailand'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 100