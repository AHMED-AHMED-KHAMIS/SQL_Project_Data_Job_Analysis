/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst and Data engineer positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
        skills,
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
     skills   
ORDER BY 
    avg_salary  DESC    
LIMIT 50;

/*
General Trends:

Domain-Specific Skills: Many of the top skills are related to specific data technologies like databases (MongoDB, Couchbase, DynamoDB), data processing frameworks (Spark, PySpark, Airflow), and machine learning libraries (TensorFlow, PyTorch). This highlights the importance of specializing in these areas for high earning potential.
Programming Languages: Strong programming skills are evident throughout the list, with languages like Python (likely used for data analysis and machine learning), Java (widely used for enterprise applications), Golang, and Javascript (Node.js) featuring prominently.
Data Visualization: Skills related to data visualization libraries like ggplot2 suggest a demand for professionals who can effectively communicate insights through data.
Cloud Technologies: Familiarity with cloud platforms like Heroku, AWS (DynamoDB, Aurora), and Kubernetes is beneficial for Data Analysts and Engineers working in cloud-based environments.
Data Analyst vs. Data Engineer:

While there is some overlap, some skills seem more relevant to one role or the other:

Data Analyst: Skills like SQL (not included in the list but assumed to be essential), data visualization (ggplot2), and potentially statistics (R not included but relevant) might be more emphasized for Data Analysts.
Data Engineer: Skills like Apache Kafka, Airflow (data orchestration), Kubernetes (container orchestration), and infrastructure management tools (e.g., Terraform) could be more important for Data Engineers responsible for building and maintaining data pipelines.
Important Caveats:

This data likely represents a specific source and might not reflect the entire job market.
Salary can vary significantly based on location, experience, and other factors.
Not all skills on this list are exclusive to Data Analysts and Engineers.
Overall:

The data suggests that a combination of strong programming skills, domain-specific knowledge of data technologies, and the ability to handle data at scale are key for high-paying data jobs. Focusing on these areas and tailoring your skillset to a specific role (Data Analyst or Engineer) can help you position yourself for success in this growing field.

[
  {
    "skills": "assembly",
    "avg_salary": "192500.0"
  },
  {
    "skills": "mongo",
    "avg_salary": "182222.8"
  },
  {
    "skills": "clojure",
    "avg_salary": "170866.5"
  },
  {
    "skills": "perl",
    "avg_salary": "169000.0"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "167538.6"
  },
  {
    "skills": "neo4j",
    "avg_salary": "166559.4"
  },
  {
    "skills": "solidity",
    "avg_salary": "166250.0"
  },
  {
    "skills": "graphql",
    "avg_salary": "162546.9"
  },
  {
    "skills": "rust",
    "avg_salary": "162059.3"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.0"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.0"
  },
  {
    "skills": "splunk",
    "avg_salary": "160397.1"
  },
  {
    "skills": "fastapi",
    "avg_salary": "157500.0"
  },
  {
    "skills": "mxnet",
    "avg_salary": "157500.0"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "157303.9"
  },
  {
    "skills": "redis",
    "avg_salary": "157000.0"
  },
  {
    "skills": "trello",
    "avg_salary": "155000.0"
  },
  {
    "skills": "numpy",
    "avg_salary": "153887.1"
  },
  {
    "skills": "jquery",
    "avg_salary": "151666.7"
  },
  {
    "skills": "cassandra",
    "avg_salary": "151093.1"
  },
  {
    "skills": "unify",
    "avg_salary": "151000.0"
  },
  {
    "skills": "vmware",
    "avg_salary": "150000.0"
  },
  {
    "skills": "kafka",
    "avg_salary": "149956.1"
  },
  {
    "skills": "keras",
    "avg_salary": "148698.1"
  },
  {
    "skills": "zoom",
    "avg_salary": "147820.0"
  },
  {
    "skills": "golang",
    "avg_salary": "147583.3"
  },
  {
    "skills": "angular",
    "avg_salary": "147020.8"
  },
  {
    "skills": "terraform",
    "avg_salary": "146057.3"
  },
  {
    "skills": "pandas",
    "avg_salary": "146028.3"
  },
  {
    "skills": "ansible",
    "avg_salary": "145750.0"
  },
  {
    "skills": "django",
    "avg_salary": "145000.0"
  },
  {
    "skills": "next.js",
    "avg_salary": "145000.0"
  },
  {
    "skills": "jupyter",
    "avg_salary": "144393.6"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "144142.8"
  },
  {
    "skills": "node",
    "avg_salary": "143777.8"
  },
  {
    "skills": "ggplot2",
    "avg_salary": "142500.0"
  },
  {
    "skills": "pytorch",
    "avg_salary": "142253.9"
  },
  {
    "skills": "datarobot",
    "avg_salary": "141828.5"
  },
  {
    "skills": "opencv",
    "avg_salary": "141250.0"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "141000.0"
  },
  {
    "skills": "scala",
    "avg_salary": "140746.9"
  },
  {
    "skills": "pyspark",
    "avg_salary": "140488.4"
  },
  {
    "skills": "heroku",
    "avg_salary": "140000.0"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "138883.1"
  },
  {
    "skills": "aurora",
    "avg_salary": "138225.0"
  },
  {
    "skills": "airflow",
    "avg_salary": "137918.1"
  },
  {
    "skills": "typescript",
    "avg_salary": "137206.6"
  },
  {
    "skills": "spark",
    "avg_salary": "137158.1"
  },
  {
    "skills": "puppet",
    "avg_salary": "136250.0"
  },
  {
    "skills": "java",
    "avg_salary": "134530.3"
  }
]
*/