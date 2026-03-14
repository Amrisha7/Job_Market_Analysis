/*******************************************************************************
PROJECT: Job_Market_Analysis(2026)
AUTHOR: Amrisha
PURPOSE: Analyzing the Indian job market to identify skill gaps and salary ROI.
*******************************************************************************/

--Problem 1: Creating the table called "My Profile" to include my skills: 
--code:
CREATE TABLE my_profile (
    skill_name TEXT
);

INSERT INTO my_profile (skill_name) VALUES 
('SQL'), 
('Excel'), 
('Python'),
('Data Analysis');

--Problem 2: Matching the requirements of different Companies with my skills, also the number of skills that matched with company requirements is also provided: 
--code:
SELECT 
    c1 AS role,
    c3 AS company,  
    c9 AS skills,  
    c15 AS salary_lpa,   
    (SELECT COUNT(*) FROM my_profile WHERE c9 LIKE '%' || skill_name || '%') AS matched_skills_count
FROM Indian_Fresher_Salary_Skills_2025_csv 
WHERE (SELECT COUNT(*) FROM my_profile WHERE c9 LIKE '%' || skill_name || '%') > 0
ORDER BY matched_skills_count DESC, CAST(c15 AS FLOAT) DESC;

--Problem 3: Adding one visualization skill (Power BI) increases job pool by 40% 
--code: 
SELECT 
    'With Power BI' as scenario,
    COUNT(*) as eligible_jobs,
    AVG(CAST(c15 AS FLOAT)) as avg_salary
FROM Indian_Fresher_Salary_Skills_2025_csv
WHERE c9 LIKE '%SQL%' OR c9 LIKE '%Excel%' OR c9 LIKE '%Power BI%';

--Problem 4: To find the Hidden Vacancies in company that are hiring the most for my current skills:
--code:
SELECT c3 AS company, COUNT(*) as vacancy_count
FROM Indian_Fresher_Salary_Skills_2025_csv
WHERE c9 LIKE '%SQL%' OR c9 LIKE '%Excel%'
GROUP BY c3
ORDER BY vacancy_count DESC
LIMIT 5;

--Problem 5: Finds the jobs that pays above average and tells us what skills are exactly required:
--code:
SELECT c1 AS role, c9 AS skills, c15 AS salary
FROM Indian_Fresher_Salary_Skills_2025_csv
WHERE CAST(c15 AS FLOAT) > (SELECT AVG(CAST(c15 AS FLOAT)) FROM Indian_Fresher_Salary_Skills_2025_csv)
ORDER BY CAST(c15 AS FLOAT) DESC
LIMIT 10;

--Problem 6: Tells where should one move to get more LPA jobs, it suggests the salary according to the company location:
--code:
SELECT c5 AS location, AVG(CAST(c15 AS FLOAT)) as avg_city_salary, COUNT(*) as job_count
FROM Indian_Fresher_Salary_Skills_2025_csv
GROUP BY c5
ORDER BY avg_city_salary DESC;

--Problem 7: Calculates the salary hike and probabilty of job opportunities after adding skills (here I took PowerBI as an example):
--code:
SELECT 
    -- Current Status
    (SELECT COUNT(*) FROM Indian_Fresher_Salary_Skills_2025_csv 
     WHERE c9 LIKE '%SQL%' OR c9 LIKE '%Excel%') AS current_job_count,
     
    (SELECT AVG(CAST(c15 AS FLOAT)) FROM Indian_Fresher_Salary_Skills_2025_csv 
     WHERE c9 LIKE '%SQL%' OR c9 LIKE '%Excel%') AS current_avg_salary,

    -- Future Status (After adding Power BI)
    (SELECT COUNT(*) FROM Indian_Fresher_Salary_Skills_2025_csv 
     WHERE c9 LIKE '%SQL%' OR c9 LIKE '%Excel%' OR c9 LIKE '%Power BI%') AS future_job_count,

    (SELECT AVG(CAST(c15 AS FLOAT)) FROM Indian_Fresher_Salary_Skills_2025_csv 
     WHERE c9 LIKE '%SQL%' OR c9 LIKE '%Excel%' OR c9 LIKE '%Power BI%') AS future_avg_salary;

--Problem 8: Calculates the demand of the skills in current Job Market so that one doesn't get confused with the skills they have:
--code:
SELECT c9 AS skill_set, COUNT(*) as demand_count
FROM Indian_Fresher_Salary_Skills_2025_csv
GROUP BY c9
ORDER BY demand_count DESC
LIMIT 10;

--Problem 9: The missing skills that are required to land a high paying job in current job market
--code:
SELECT 
    Skills AS required_skills, 
    Salary
FROM your_table_name
WHERE Salary > 10 -- Looking for high paying jobs
LIMIT 10;
