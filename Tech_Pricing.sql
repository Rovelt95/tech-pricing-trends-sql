-- ======================================
-- Portfolio Project: Tech Pricing Trends
-- Companies: Microsoft vs Oracle (2020–2024)
-- Database: tech_pricing_trends
-- ======================================

-- Step 1: Use the project database
USE tech_pricing_trends;

-- Step 2: View the first few rows of contracts
SELECT * FROM contracts LIMIT 10;

-- ======================================
-- Pricing Trend Analysis
-- ======================================

-- 1. Average price per unit by company over time
SELECT company,
       YEAR(contract_date) AS year,
       ROUND(AVG(price_per_unit),2) AS avg_price
FROM contracts
GROUP BY company, year
ORDER BY company, year;

-- 2. Revenue growth by company over time
SELECT company,
       YEAR(contract_date) AS year,
       SUM(revenue) AS total_revenue
FROM contracts
GROUP BY company, year
ORDER BY company, year;

-- 3. Pricing trend by product segment
SELECT company,
       product_segment,
       YEAR(contract_date) AS year,
       ROUND(AVG(price_per_unit),2) AS avg_price
FROM contracts
GROUP BY company, product_segment, year
ORDER BY company, product_segment, year;

-- 4. Compare Microsoft vs Oracle in Cloud segments
SELECT company,
       YEAR(contract_date) AS year,
       SUM(revenue) AS cloud_revenue
FROM contracts
WHERE product_segment LIKE '%Cloud%'
GROUP BY company, year
ORDER BY year, company;

-- 5. Channel performance: revenue by channel
SELECT company,
       channel,
       SUM(revenue) AS total_revenue
FROM contracts
GROUP BY company, channel
ORDER BY company, total_revenue DESC;

-- ======================================
-- Extra Insights
-- ======================================

-- 6. Top 5 highest-value contracts overall
SELECT company, contract_date, region, product_segment, revenue
FROM contracts
ORDER BY revenue DESC
LIMIT 5;

-- 7. Regional breakdown of revenue by company
SELECT company, region, SUM(revenue) AS total_revenue
FROM contracts
GROUP BY company, region
ORDER BY company, total_revenue DESC;
