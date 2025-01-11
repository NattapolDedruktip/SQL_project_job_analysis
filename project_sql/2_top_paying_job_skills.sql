/*
 Question: What skills are required for the top-paying business analyst jobs ?
 - Use the top 10 highest-paying Data Analyst jobs from first query
 - Add the specific skills required for these roles
 - Why? It provides a detailed look at which high-paying jobs demand certain skills, 
 helping job seekers understand which skills to develop that align with top salaries
 */
WITH top_paying_job_Thailand AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name as company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Business Analyst' -- AND job_location = 'Bangkok, Thailand'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 100
)
SELECT top_paying_job_Thailand.*,
    skills
FROM top_paying_job_Thailand
    INNER JOIN skills_job_dim ON top_paying_job_Thailand.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY salary_year_avg DESC