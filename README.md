# Tech Pricing Trends Analysis (SQL Portfolio Project)

## Project Overview
This project compares **Microsoft** and **Oracle** between 2020–2024 using a contract-level dataset.  
The goal is to analyze **pricing trends**, **revenue growth**, and **business performance** across segments, channels, and regions.

- **Data Source:** Synthetic contract data (~240 rows), **anchored to real public financial data** from Microsoft and Oracle SEC filings (FY2024).  
- **Focus:** Pricing & revenue trends in the technology sector.  
- **Tools:** MySQL Workbench (SQL).  

---

## Database Structure
**Database:** `tech_pricing_trends`  
**Table:** `contracts`  
Columns:
- `contract_id` (INT, Primary Key)  
- `company` (VARCHAR) – Microsoft / Oracle  
- `contract_date` (DATE) – 2020–2024  
- `region` (VARCHAR) – North America, Europe, Asia, LatAm  
- `product_segment` (VARCHAR) – aligned with SEC filings  
- `channel` (VARCHAR) – Direct, Partner, Online  
- `units` (INT) – synthetic contract size  
- `price_per_unit` (DECIMAL) – simulated pricing  
- `revenue` (DECIMAL) – units × price  

---

## Key Queries & Insights
### 1. Average Price Per Unit by Year
```sql
SELECT company, YEAR(contract_date) AS year, 
       ROUND(AVG(price_per_unit),2) AS avg_price
FROM contracts
GROUP BY company, year
ORDER BY company, year;
