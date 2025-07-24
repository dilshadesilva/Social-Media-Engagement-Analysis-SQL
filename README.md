# Social-Media-Engagement-Analysis-SQL
MySQL queries for analyzing social media engagement, emotion types, sentiment trends, and platform-based activity.
# 📊 Social Media Engagement Dashboard

This project presents a collection of SQL queries used to analyze engagement data from social media platforms. It supports the creation of a Power BI dashboard that highlights key user engagement metrics, sentiment trends, platform performance, and emotional analysis.

## 🎯 Objective

To extract actionable insights from social media data using MySQL by analyzing:
- Engagement rate trends
- Emotion-based reactions
- Platform-specific metrics
- Toxicity levels
- Sentiment distribution
- Topic category influence

## 🧰 Technologies Used
- 💾 **MySQL** – Data querying and analysis
- 📊 **Power BI** – Dashboard development and data visualization

## 📁 Dataset Used
- Table: `social_media_engagement`
- Sample columns: `Engagement Rate`, `Likes Count`, `Comments Count`, `Shares Count`, `Emotion Type`, `Toxity Score`, `Platform`, `Brand Name`, `Topic Category`, `Day of Week`, `Sentiment Label`

## 📝 Key SQL Queries

🏷️Total Engagement Rate 

SELECT 
    CONCAT(ROUND(SUM(`Engagement Rate`)/1000 , 1),'K') AS total_engagement_rate
FROM social_media_engagement; 

🏷️No Of Location 

SELECT 
    CONCAT(ROUND(COUNT(*)/1000, 0), 'K') AS no_of_locations
FROM social_media_engagement;

🏷️AVG Engagement Rate 

SELECT 
    ROUND(AVG(`Engagement Rate`), 2) AS avg_engagement_rate
FROM social_media_engagement;

🏷️AVG Toxcity Score 

SELECT 
    ROUND(AVG(`Toxity Score`), 2) AS avg_toxity_score
FROM social_media_engagement;

🏷️Like Count by Emotion Type (as %) 

SELECT `Emotion Type`, 
    SUM(`Likes Count`) AS like_count
FROM social_media_engagement
GROUP BY `Emotion Type`;

SELECT `Emotion Type`, 
    ROUND(100 * SUM(`Likes Count`) / (SELECT SUM(`Likes Count`) FROM social_media_engagement), 2) AS likes_count
FROM social_media_engagement
GROUP BY `Emotion Type`;

🏷️Brand Engagement

SELECT 
    `Brand Name`, 
    ROUND(SUM(`Engagement Rate`), 2) AS total_engagement
FROM social_media_engagement
GROUP BY `Brand Name`
ORDER BY total_engagement DESC;

🏷️Days of Week by Sentiment 

SELECT 
    `ï»¿Day of Week`, 
    `Sentiment Label`, 
    ROUND(SUM(`Engagement Rate`), 2) AS total_engagement
FROM social_media_engagement
GROUP BY `ï»¿Day of Week`, `Sentiment Label`;

🏷️Platforms by Parameter 

📱Likes per Platform
SELECT Platform, SUM(`Likes Count`) AS value FROM social_media_engagement GROUP BY Platform;

📱Shares per Platform
SELECT Platform, SUM(`Shares Count`) AS value FROM social_media_engagement GROUP BY Platform;

📱 Comments per Platform
SELECT Platform, SUM(`Comments Count`) AS value FROM social_media_engagement GROUP BY Platform;

📱 Avg Toxity Score per Platform
SELECT Platform, ROUND(AVG(`Toxity Score`), 2) AS value FROM social_media_engagement GROUP BY Platform;

🏷️Topic category 

SELECT 
    `Topic Category`, 
    ROUND(SUM(`Engagement Rate`), 2) AS total_engagement
FROM social_media_engagement
GROUP BY `Topic Category`
ORDER BY total_engagement DESC;


🏷️Platform by Reactions  

SELECT 
    Platform,
    SUM(`Likes Count`) AS total_likes,
    SUM(`Shares Count`) AS total_shares,
    SUM(`Comments Count`) AS total_comments,
    ROUND(AVG(`Toxity Score`), 2) AS avg_toxity_score
FROM social_media_engagement
GROUP BY Platform;

📊 Dashboard Preview
This project is integrated into a Power BI dashboard that visualizes:

Engagement trends

Emotional response percentages

Sentiment distribution across the week

Top brands and topics

Platform-based performance


👩‍💻 Created by

Dilsha De Silva

📍 Business Analyst Intern | ICT Undergraduate | Data Enthusiasist

🌐 LinkedIn Profile (www.linkedin.com/in/dilsha-de-silva-9554a6315)
