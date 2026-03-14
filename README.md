# Job_Market_Analysis
I built a SQL-based Career Intelligence Engine to analyze the 2026 job market

## Project Title & Overview
Project Name: AI-Driven Career Path & Salary Optimizer (2026)

## Objective: 
A SQL-based intelligence engine designed to help freshers identify high-paying job opportunities, calculate skill-match probability, and visualize the "Salary ROI" of learning new technical skills.

## Core Insights from the 2026 Engine:

### The Skill Multiplier: Adding Power BI expands the fresher job market by 25.4%, making it the most effective "career-opening" skill for SQL users.

### The Salary Ceiling: Entry-level pay peaks at 11.94 LPA, but requires a shift toward Machine Learning and Cloud (AWS/Linux).

### Geographic Sweet Spot: Kolkata currently offers the highest average salary (7.23 LPA) for this skill set, followed closely by Delhi.

## The Problem Statement
How can a fresher navigate thousands of job postings to find the highest-paying role? This project solves the "Blind Application" problem by using SQL logic to match specific user profiles against a dataset of 5,000+ Indian job listings.

## The Tech Stack
Database: SQLite (SQL Online)

Data Source: Kaggle (Indian Fresher Salary & Skill Trends 2025/26)

Logic: Multi-column joins, Subqueries, and Data Normalization.

Dataset Schema: Column Mapping:

c1: Job Role / Title
c3: Company Name
c9: Required Skills (Comma-separated)
c15: Salary (LPA)
c5: Job Location

## Here are my example profile I created with some skills :


<img width="546" height="599" alt="Screenshot 2026-03-12 222927" src="https://github.com/user-attachments/assets/d2f1f2d1-360d-46c9-9e5d-20804631806c" />

### Insight 1: The Matching Engine
What I did: Created a my_profile table and ran a matching query using LIKE.

The Result: <img width="1108" height="649" alt="job matcher" src="https://github.com/user-attachments/assets/9eda1b14-87ad-4f63-bf48-4b518c29b686" />

The "So What?": Successfully filtered the database to show jobs where I currently meet at least 50% of the requirements, even it's mentioned that how many skills of my profile are matched with the company requirements.

### Insight 2: The "Elite Job" Filter
What I did: Filtered for jobs paying above the national average (c15 > AVG).

The Result: <img width="1104" height="649" alt="pays more acc to skills" src="https://github.com/user-attachments/assets/bf5c0486-c36b-4dbb-9ba0-44257b81dea1" />

The "So What?": Identified that 'Elite' jobs paying 11+ LPA primarily require Machine Learning and AWS, shifting the focus from general skills to specialized tech.

### Insight 3: The Simulation (The ROI)
What I did: Ran a "What-If" query for Power BI.

The Result: <img width="1112" height="648" alt="addition of powerBI" src="https://github.com/user-attachments/assets/157cf507-3aaf-4a3f-ba85-4dd1bf7808c6" />

The "So What?": Proven that adding one visualization skill (Power BI) expands the eligible job pool by 25.4% and increases average starting salary by 6.9 LPA.

### Insight 4: The "City Analysis" Filter
What I did: Filtered for jobs according to the city and salary

The Result: ![image alt]()

The "So What?": Identified that jobs paying 7+ LPA primarily for the same skill sets in Kolkata followed by Delhi
