/*
Question: What are the most in-demand skills for data analysts and Data Engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst and Data Engineer, weather it's a remote job or in the Middle East.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
        skills,
        COUNT(skills_job_dim.skill_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN
     skills_job_dim
         ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim  
         ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
     job_title_short IN('Data Analyst','Data Engineer') AND 
        job_work_from_home = True OR 
            job_location IN ('Egypt','Kuwait','Saudi Arabia','Qatar','United Arab Emirates','Iraq')       
GROUP BY
     skills   
ORDER BY 
    demand_count  DESC    
LIMIT 5;


/*
Here's the breakdown of the most demanded skills for data analysts and Data Engineers in 2024
SQL and Python remain fundamental, emphasizing the need for strong foundational skills in data processing.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support beside the importance of AWS, Azure,and Spark.

[
  {
    "skills": "sql",
    "demand_count": "22568"
  },
  {
    "skills": "python",
    "demand_count": "19215"
  },
  {
    "skills": "AWS",
    "demand_count": "9646"
  },
  {
    "skills": "Azure",
    "demand_count": "8109"
  },
  {
    "skills": "Spark",
    "demand_count": "7273"
  }
]
*/