# Project Readme

## Overview

Analysis of customer behavior, retention, and lifetime value for an e-commerce company to improve customer retention and maximize revenue.

## Business Questions

- **Customer Segmentation:** Who are our most valuable customers?
- **Cohort Analysis:** How do different customer groups generate long-term revenue?
- **Retention Analysis:** Which customers haven't purchased recently?
- **Market Basket Analysis:** Which products are frequently bought together?
- **RFM Segmentation:** Who are our true VIPs (Champions) and which high-value customers are we on the verge of losing (At-Risk)?
- **Geographic Performance:** How do our top customers perform locally vs. nationally, and what are their purchasing behaviors?

---

## Analysis Approach

### 1. Customer Segmentation Analysis

- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key metrics: total revenue

🖥️ **Query:** `1_customer_segmentation.sql`  
📈 **Visualization:**

![Customer Segmentation](images/cart%201.png)

📊 **Key Findings:**

- **High-value segment** (25% of customers) drives 66% of revenue ($135.4M)
- **Mid-value segment** (50% of customers) generates 32% of revenue ($66.6M)
- **Low-value segment** (25% of customers) accounts for 2% of revenue ($4.3M)

💡 **Business Insights:**

- **High-Value (66% revenue):** Offer premium membership program to 12,372 VIP customers, as losing one customer significantly impacts revenue.
- **Mid-Value (32% revenue):** Create upgrade paths through personalized promotions, with potential $66.6M → $135.4M revenue opportunity.
- **Low-Value (2% revenue):** Design re-engagement campaigns and price-sensitive promotions to increase purchase frequency.

### 2. Cohort-Based Analysis

- Tracked cumulative revenue per customer cohort
- Analyzed lifetime value trends
- Evaluated acquisition channel performance

🖥️ **Query:** `2_cohort_analysis.sql`  
📈 **Visualization:**

![Cohort Analysis](images/cart%202.png)

📊 **Key Findings:**

- **2023 cohorts:** 25% higher LTV than 2022
- **Social media customers:** 2x higher 12-month LTV
- **Holiday cohorts:** 40% better retention

### 3. Retention Analysis

- Identified customers at risk of churning
- Analyzed last purchase patterns
- Calculated customer-specific metrics and warning indicators

🖥️ **Query:** `3_retention_analysis.sql`  
📈 **Visualization:**

![Retention Analysis](images/cart%203.png)

📊 **Key Findings:**

- **2023 cohort** shows highest first-year LTV ($1.2M avg/month)
- **2022 cohort** plateaus at $1.1M avg/month after 12 months
- **2019-2021 cohorts** show consistent growth pattern:
  - _First 3 months:_ Rapid growth to $800K avg/month
  - _Months 4-8:_ Steady increase to $1M avg/month
  - _Months 9-12:_ Stabilization around $1.1M avg/month

💡 **Business Insights:**

- **Cohort Performance:** 2023 cohort outperforming previous years by 9% in first-year value, suggesting successful acquisition strategies to replicate.
- **Growth Patterns:** Critical engagement window identified in months 4-8, requiring targeted campaigns during plateau periods.
- **Revenue Optimization:** Focus on first 3 months for customer engagement, followed by retention strategies for months 4-8 growth period.

### 4. Market Basket Analysis

- Identified product combinations frequently purchased in the same transaction
- Calculated co-purchase frequencies using Self-Join SQL logic
- Evaluated opportunities for cross-selling and product bundling

🖥️ **Query:** `4_market_basket_analysis.sql`  
📈 **Visualization:**

![Market Basket Analysis](images/cart%204.png)

📊 **Key Findings:**

- **Strong Affinities:** 45% of customers buying "Laptop/PC" also purchase a "Wireless Mouse" or "Laptop Bag" in the same transaction.
- **Cross-Category Trends:** Strong correlation observed between "Home & Kitchen" purchases and "Smart Home Devices".
- **Negative Correlation:** "Toys" are rarely bought together with "Sports equipment".

💡 **Business Insights:**

- **Bundling Strategy:** Create dynamic bundles at checkout (e.g., "Buy this Laptop, get 15% off a Wireless Mouse") to boost Average Order Value (AOV).
- **UI/UX Optimization:** Automatically display targeted cross-sell recommendations (e.g., Smart Home items) right below the 'Add to Cart' button when users browse correlated categories.

### 5. RFM (Recency, Frequency, Monetary) Segmentation

- Evaluated customer purchasing behavior based on last order date, transaction count, and total spend.
- Utilized SQL Window Functions (`NTILE`) to assign comparative scores (1-5) for each RFM metric.
- Categorized users into actionable segments (Champions, Loyal, At-Risk, Hibernating) using conditional logic.

🖥️ **Query:** `5_rfm_segmentation.sql`  
📈 **Visualization:**

![RFM Segmentation](images/cart%205.png)

📊 **Key Findings:**

- **Revenue Concentration:** The "Champions" segment makes up only a small percentage of the total customer base but drives a disproportionately massive share of the total net revenue.
- **Churn Threat:** A significant portion of historically high-value customers have fallen into the "At-Risk" category, showing no activity in recent months despite high past frequency.

💡 **Business Insights:**

- **VIP Treatment for Champions:** Retain top-tier customers by offering exclusive perks (early product access, priority support) rather than eroding margins with standard discounts.
- **Targeted Win-Back:** Deploy aggressive "We Miss You" campaigns with highly personalized, time-sensitive discounts specifically targeted at the "At-Risk" segment to prevent permanent churn.

### 6. Geographic VIP Performance Analysis

- Identified the Top 5 VIP customers in each state using Window Functions (`DENSE_RANK()`).
- Compared local state rankings against national rankings to evaluate regional market maturity.
- Analyzed purchasing behavior (order frequency vs. revenue) to classify top customers as "Whales" or "Loyalists".

🖥️ **Query:** `6_geographic_performance.sql`  
📈 **Visualization:**

![Regional Revenue Benchmarking](images/cart%206.png)
![Local vs National Ranking](images/cart%207.png)

📊 **Key Findings:**

- **Market Gap:** Significant discrepancies exist between a customer's local rank and national rank, highlighting which states are primary revenue drivers versus secondary markets.
- **Customer Typology:** Top revenue contributors fall into two distinct groups: "Whales" (1-2 massive orders, high churn risk) and "Loyalists" (dozens of frequent orders, highly stable revenue).
- **Regional Thresholds:** The revenue required to become a Top 5 customer varies drastically by state, indicating disparate regional purchasing power and market penetration.

💡 **Business Insights:**

- **Tailored Account Management:** Assign dedicated B2B Account Managers to "Whales" to protect vulnerable revenue streams, while enrolling "Loyalists" into automated loyalty reward programs.
- **Localized Promotions:** Adjust minimum-spend thresholds for promotions (e.g., free shipping, tier upgrades) based on a state's specific baseline, rather than enforcing an unrealistic national standard.
- **Strategic Expansion:** Allocate aggressive marketing budgets to states with high local-to-national ranking gaps to improve market penetration in underperforming regions.

---

## Strategic Recommendations

**High-Value Focus ($100K opportunity)**

- Launch premium membership program
- Deploy churn early warning system
- Implement proactive service outreach for "Whale" accounts

**Acquisition Optimization**

- Increase social media investment (2x LTV)
- Optimize seasonal timing
- Adjust CAC by channel performance

**Retention Enhancement**

- Launch segment-specific reactivation campaigns
- Create automated upgrade paths
- Develop targeted loyalty programs and localized promotional thresholds

---

## Technical Details

- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL (Jupyter/SQL Magic)
- **Visualization:** ChatGPT / Python (Pandas, Matplotlib, & Seaborn)
