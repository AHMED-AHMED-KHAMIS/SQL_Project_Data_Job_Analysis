/*
Question: What are the top-paying data analyst and data engineer jobs?
- Identify the top 10 highest-paying Data Analyst and Data Engineer roles that are available remotely in Middle East
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts and Data Engineers, offering insights into employment options and location flexibility.
*/


SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short IN ('Data Engineer','Data Analyst') AND 
    job_location IN ('Egypt','Kuwait','Saudi Arabia','Qatar','United Arab Emirates','Iraq') AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

/*

Here you'll find that Egypt comes in first place with six positions five of them are for Data Engineers and UAE comes in second place.
To sum up, The Middle East has good potential, but it would be better if you focus more on remote positions.

Top Paying Jobs:

Data Engineer: This role appears most frequently and has the highest average salary (around $147,500) in this dataset. This suggests a strong demand for skilled data engineers in Egypt.
Data Engineering Lead: This leadership position within data engineering also boasts a high average salary (around $79,200).
Salary Ranges:

There's a significant range in salaries for Data Engineer roles, with the highest being over twice the amount of the lowest ($147,500 vs. $72,960). This could be due to factors like experience, specific skills (e.g., cloud expertise), or company size.
Data Analyst salaries appear lower than Data Engineer salaries in this sample (around $75,550 compared to $147,500 for Data Engineer).
Location:

All the jobs listed are in Egypt or the United Arab Emirates. It's difficult to say definitively from this limited data, but it might suggest these regions offer high compensation for data professionals.
Additional Considerations:

This data is a small sample set and might not represent the entire job market.
The job posting date could influence the results, as salaries might have changed over time.
Overall, the data suggests that Data Engineer roles are in high demand and offer the highest potential salaries in this dataset. There's also a range within Data Engineer salaries based on potential influencing factors. It's important to consider a wider range of data sources for a more comprehensive picture of the data analyst and data engineer job market.

[
  {
    "job_id": 131921,
    "job_title": "Data Engineer",
    "job_location": "Egypt",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "147500.0",
    "job_posted_date": "2023-05-09 03:39:03",
    "company_name": "Klivvr"
  },
  {
    "job_id": 737652,
    "job_title": "Data Engineer",
    "job_location": "Egypt",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "96773.0",
    "job_posted_date": "2023-08-14 12:16:39",
    "company_name": "Nawy Real Estate"
  },
  {
    "job_id": 30171,
    "job_title": "Data Engineering Lead",
    "job_location": "Egypt",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-01-31 04:33:49",
    "company_name": "Klivvr"
  },
  {
    "job_id": 151019,
    "job_title": "Data Analyst - D&T",
    "job_location": "Egypt",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "75550.0",
    "job_posted_date": "2023-12-10 12:17:22",
    "company_name": "HEINEKEN"
  },
  {
    "job_id": 1789900,
    "job_title": "Data Engineer remote",
    "job_location": "United Arab Emirates",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "72960.0",
    "job_posted_date": "2023-01-18 20:33:06",
    "company_name": "TASC Outsourcing"
  },
  {
    "job_id": 1122656,
    "job_title": "Data Quality Engineer",
    "job_location": "Egypt",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-01-30 12:33:49",
    "company_name": "Klivvr"
  },
  {
    "job_id": 751554,
    "job_title": "Market Data Analyst f/m",
    "job_location": "Egypt",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "51014.0",
    "job_posted_date": "2023-01-19 07:21:12",
    "company_name": "Bosch Group"
  }
]
*/
