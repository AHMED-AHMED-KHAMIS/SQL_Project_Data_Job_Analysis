/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst and Data Engineer roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis and Data Engineeing
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3

WITH skills_demand AS (
    SELECT 
            skills_dim.skill_id,
            skills_dim.skills,
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
         skills_dim.skill_id   
), 
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
average_salary AS (
    SELECT 
             skills_job_dim.skill_id,
            ROUND(COALESCE(AVG(salary_year_avg),0),1) AS avg_salary
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
         skills_job_dim.skill_id  
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 50;



-- rewriting this same query more concisely
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short IN('Data Analyst','Data Engineer')
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True OR 
                job_location IN ('Egypt','Kuwait','Saudi Arabia','Qatar','United Arab Emirates','Iraq')
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 50;

/*
High Demand Skills:

Big Data & Cloud: Skills related to cloud platforms (AWS, GCP, Azure), Big Data processing (Spark, Hadoop), and data warehousing (Snowflake, Redshift) are in high demand. This reflects the increasing adoption of cloud-based data storage and analytics solutions.
Programming Languages: Proficiency in languages like Java, Python (including libraries like Pandas, NumPy), Scala, and Javascript (including Node.js) is crucial for both Data Analysts and Engineers.
Containerization: Docker and Kubernetes are becoming increasingly important for building, deploying, and managing data pipelines and applications.
Version Control & Automation: Skills like Git for version control and tools like Airflow for workflow automation are valuable for Data Engineers to manage data pipelines efficiently.
Other Interesting Observations:

Database Skills: Demand for specific databases like MongoDB, Cassandra, and NoSQL in general remains strong.
Security: Data security and compliance regulations like GDPR are becoming more prominent, with skills like GDPR showing up in the data.
Data Visualization: While not explicitly mentioned in your data, Data Visualization skills using tools like Tableau or Power BI are still highly sought after for Data Analysts.
Keep in mind:

This data likely represents a snapshot of current trends. The landscape can change quickly, so staying updated on emerging technologies is important.
The specific skills required for a role will vary depending on the industry, company size, and the nature of the data being analyzed.


[
  {
    "skill_id": 32,
    "skills": "assembly",
    "demand_count": "15",
    "avg_salary": "192500"
  },
  {
    "skill_id": 24,
    "skills": "mongo",
    "demand_count": "25",
    "avg_salary": "182223"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "30",
    "avg_salary": "169000"
  },
  {
    "skill_id": 58,
    "skills": "neo4j",
    "demand_count": "21",
    "avg_salary": "166559"
  },
  {
    "skill_id": 116,
    "skills": "graphql",
    "demand_count": "11",
    "avg_salary": "162547"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "demand_count": "15",
    "avg_salary": "160397"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "147",
    "avg_salary": "157304"
  },
  {
    "skill_id": 55,
    "skills": "redis",
    "demand_count": "16",
    "avg_salary": "157000"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "87",
    "avg_salary": "153887"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "86",
    "avg_salary": "151093"
  },
  {
    "skill_id": 73,
    "skills": "vmware",
    "demand_count": "47",
    "avg_salary": "150000"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "257",
    "avg_salary": "149956"
  },
  {
    "skill_id": 100,
    "skills": "keras",
    "demand_count": "65",
    "avg_salary": "148698"
  },
  {
    "skill_id": 248,
    "skills": "zoom",
    "demand_count": "17",
    "avg_salary": "147820"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "23",
    "avg_salary": "147583"
  },
  {
    "skill_id": 136,
    "skills": "angular",
    "demand_count": "28",
    "avg_salary": "147021"
  },
  {
    "skill_id": 212,
    "skills": "terraform",
    "demand_count": "76",
    "avg_salary": "146057"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "129",
    "avg_salary": "146028"
  },
  {
    "skill_id": 223,
    "skills": "ansible",
    "demand_count": "35",
    "avg_salary": "145750"
  },
  {
    "skill_id": 139,
    "skills": "django",
    "demand_count": "14",
    "avg_salary": "145000"
  },
  {
    "skill_id": 102,
    "skills": "jupyter",
    "demand_count": "21",
    "avg_salary": "144394"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demand_count": "31",
    "avg_salary": "144143"
  },
  {
    "skill_id": 154,
    "skills": "node",
    "demand_count": "13",
    "avg_salary": "143778"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "91",
    "avg_salary": "142254"
  },
  {
    "skill_id": 122,
    "skills": "opencv",
    "demand_count": "12",
    "avg_salary": "141250"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "117",
    "avg_salary": "141000"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "263",
    "avg_salary": "140747"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "116",
    "avg_salary": "140488"
  },
  {
    "skill_id": 64,
    "skills": "dynamodb",
    "demand_count": "39",
    "avg_salary": "138883"
  },
  {
    "skill_id": 83,
    "skills": "aurora",
    "demand_count": "17",
    "avg_salary": "138225"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "251",
    "avg_salary": "137918"
  },
  {
    "skill_id": 17,
    "skills": "typescript",
    "demand_count": "27",
    "avg_salary": "137207"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "550",
    "avg_salary": "137158"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "416",
    "avg_salary": "134530"
  },
  {
    "skill_id": 214,
    "skills": "docker",
    "demand_count": "153",
    "avg_salary": "134286"
  },
  {
    "skill_id": 30,
    "skills": "ruby",
    "demand_count": "32",
    "avg_salary": "133722"
  },
  {
    "skill_id": 144,
    "skills": "ruby",
    "demand_count": "32",
    "avg_salary": "133722"
  },
  {
    "skill_id": 105,
    "skills": "gdpr",
    "demand_count": "20",
    "avg_salary": "133526"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "86",
    "avg_salary": "133286"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "208",
    "avg_salary": "132974"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "327",
    "avg_salary": "132836"
  },
  {
    "skill_id": 145,
    "skills": "node.js",
    "demand_count": "17",
    "avg_salary": "132688"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "90",
    "avg_salary": "132350"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "90",
    "avg_salary": "132350"
  },
  {
    "skill_id": 211,
    "skills": "jenkins",
    "demand_count": "65",
    "avg_salary": "132232"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "267",
    "avg_salary": "131950"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "296",
    "avg_salary": "131056"
  },
  {
    "skill_id": 75,
    "skills": "databricks",
    "demand_count": "203",
    "avg_salary": "130918"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demand_count": "12",
    "avg_salary": "130757"
  },
  {
    "skill_id": 11,
    "skills": "css",
    "demand_count": "39",
    "avg_salary": "130750"
  }
]
*/