CREATE DATABASE social_media
USE social_media

SELECT * FROM social_media_engagement

-- Total Engagement Rate 
SELECT 
    CONCAT(ROUND(SUM(`Engagement Rate`)/1000 , 1),'K') AS total_engagement_rate
FROM social_media_engagement; 

-- No Of Location 
SELECT 
    CONCAT(ROUND(COUNT(*)/1000, 0), 'K') AS no_of_locations
FROM social_media_engagement;

-- AVG Engagement Rate 
SELECT 
    ROUND(AVG(`Engagement Rate`), 2) AS avg_engagement_rate
FROM social_media_engagement;

-- 	AVG Toxcity Score 
SELECT 
    ROUND(AVG(`Toxity Score`), 2) AS avg_toxity_score
FROM social_media_engagement;

-- Like Count by Emotion Type (for donut chart) 
SELECT `Emotion Type`, 
    SUM(`Likes Count`) AS like_count
FROM social_media_engagement
GROUP BY `Emotion Type`;

SELECT `Emotion Type`, 
    ROUND(100 * SUM(`Likes Count`) / (SELECT SUM(`Likes Count`) FROM social_media_engagement), 2) AS likes_count
FROM social_media_engagement
GROUP BY `Emotion Type`;

-- Brand Engagement (for funnel chart) 
SELECT 
    `Brand Name`, 
    ROUND(SUM(`Engagement Rate`), 2) AS total_engagement
FROM social_media_engagement
GROUP BY `Brand Name`
ORDER BY total_engagement DESC;

-- Days of Week by Sentiment (for clustered bar chart) 
SELECT 
    `ï»¿Day of Week`, 
    `Sentiment Label`, 
    ROUND(SUM(`Engagement Rate`), 2) AS total_engagement
FROM social_media_engagement
GROUP BY `ï»¿Day of Week`, `Sentiment Label`;


-- Platforms by Parameter 
-- Likes per Platform
SELECT Platform, SUM(`Likes Count`) AS value FROM social_media_engagement GROUP BY Platform;

-- Shares per Platform
SELECT Platform, SUM(`Shares Count`) AS value FROM social_media_engagement GROUP BY Platform;

-- Comments per Platform
SELECT Platform, SUM(`Comments Count`) AS value FROM social_media_engagement GROUP BY Platform;

-- Avg Toxity Score per Platform
SELECT Platform, ROUND(AVG(`Toxity Score`), 2) AS value FROM social_media_engagement GROUP BY Platform;


-- Topic category 
SELECT 
    `Topic Category`, 
    ROUND(SUM(`Engagement Rate`), 2) AS total_engagement
FROM social_media_engagement
GROUP BY `Topic Category`
ORDER BY total_engagement DESC;


-- Platform by Reactions (for matrix) 
SELECT 
    Platform,
    SUM(`Likes Count`) AS total_likes,
    SUM(`Shares Count`) AS total_shares,
    SUM(`Comments Count`) AS total_comments,
    ROUND(AVG(`Toxity Score`), 2) AS avg_toxity_score
FROM social_media_engagement
GROUP BY Platform;









