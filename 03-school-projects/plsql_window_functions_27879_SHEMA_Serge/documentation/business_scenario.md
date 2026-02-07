# Business Problem Definition
## Step 1: Problem Definition 

### Company: "GlobalTech Electronics"

**Business Context:**
- **Company Type**: Multinational E-commerce Retailer
- **Department**: Sales & Marketing Analytics Division
- **Industry**: Consumer Electronics & Smart Home Devices
- **Market**: North America, Europe, Asia Pacific regions
- **Size**: 500+ employees, $50M annual revenue
- **Challenge**: Data silos preventing unified customer insights

---

## DATA CHALLENGE

### Current Situation:
GlobalTech Electronics operates across three regions with separate inventory systems, disconnected customer databases, and fragmented sales tracking. The marketing team cannot answer critical questions like:

1. **"Which products perform best in each region, and why?"**
2. **"Which customers haven't purchased in 90+ days?"**
3. **"What is our month-over-month growth by product category?"**
4. **"How should we segment customers for targeted promotions?"**
5. **"What are our 3-month sales trends for inventory planning?"**

### Specific Problems:
1. **Data Disconnection**: Customer data (CRM), sales data (POS), and product data (inventory) exist in separate systems with no unified view
2. **Manual Reporting**: Analysts spend 20+ hours weekly compiling Excel reports from multiple sources
3. **Delayed Insights**: Business decisions lag 2-3 weeks behind actual sales events
4. **Inefficient Marketing**: Generic campaigns with 2% conversion rate vs. industry average of 5%
5. **Inventory Imbalances**: Overstock in Europe (40% excess) while Asia experiences stockouts (25% lost sales)

---

## EXPECTED OUTCOME

### Primary Business Decisions Needed:
1. **Inventory Redistribution**: Reallocate $500K worth of inventory across regions to reduce excess by 30% and stockouts by 50%
2. **Marketing Budget Allocation**: Shift $200K from underperforming regions to high-growth areas to increase ROI from 3:1 to 5:1
3. **Customer Retention Strategy**: Implement targeted re-engagement campaigns to reduce churn from 35% to 25% annually
4. **Product Strategy**: Identify 3 underperforming products for promotional campaigns or discontinuation
5. **Regional Focus**: Determine which region should receive 40% of Q3 marketing budget based on growth potential

### Measurable Goals:
- **Increase overall revenue** by 15% within 6 months
- **Reduce inventory holding costs** by $150K annually
- **Improve marketing conversion rates** from 2% to 4%
- **Increase customer lifetime value** by 20% in 12 months
- **Reduce manual reporting time** by 15 hours per week

---

## SUCCESS CRITERIA LINKED TO WINDOW FUNCTIONS
### (Step 2: 5 Measurable Goals)

| # | Business Goal | SQL Window Function | Expected Outcome |
|---|--------------|-------------------|------------------|
| 1 | **Identify Top 5 Products per Region** | `RANK() OVER(PARTITION BY region)` | Optimize regional inventory allocation; increase regional sales by 10% |
| 2 | **Calculate Running Monthly Sales Totals** | `SUM(amount) OVER(ORDER BY month)` | Track cumulative performance vs. targets; improve forecast accuracy by 25% |
| 3 | **Measure Month-over-Month Growth** | `LAG(revenue) OVER(ORDER BY month)` | Identify growth trends; achieve 8% MoM growth in top regions |
| 4 | **Segment Customers into 4 Spending Quartiles** | `NTILE(4) OVER(ORDER BY total_spent)` | Enable targeted marketing; increase top quartile revenue by 15% |
| 5 | **Calculate 3-Month Moving Averages** | `AVG(revenue) OVER(ROWS 2 PRECEDING)` | Smooth seasonal fluctuations; improve inventory planning accuracy by 30% |

---

## DATA SOURCES TO BE INTEGRATED

1. **CRM System** (Salesforce):
   - 50,000+ customer records
   - Demographic data, contact history
   - Customer tier assignments (Bronze, Silver, Gold, Platinum)

2. **E-commerce Platform** (Shopify/Magento):
   - 250,000+ transaction records (3 years)
   - Product catalog with 1,200+ SKUs
   - Pricing and promotion history

3. **Inventory Management** (NetSuite):
   - Real-time stock levels across 5 warehouses
   - Supplier information and lead times
   - Regional distribution data

4. **Marketing Automation** (HubSpot):
   - Campaign performance metrics
   - Customer engagement scores
   - Email open/click rates

---

## STAKEHOLDERS & IMPACT

### Primary Beneficiaries:
1. **Marketing Director**: Needs customer segments for targeted campaigns
2. **Inventory Manager**: Requires regional sales trends for stock planning
3. **Sales Operations**: Needs sales performance dashboards
4. **Finance Team**: Requires revenue forecasts and profitability analysis
5. **CEO/Executives**: Strategic decision-making with data-driven insights

### Expected Business Impact:
- **Cost Savings**: $250K annually through optimized inventory
- **Revenue Growth**: $2.5M additional revenue from targeted marketing
- **Efficiency Gains**: 780 hours/year saved in manual reporting
- **Customer Satisfaction**: 15% improvement in NPS scores
- **Competitive Advantage**: Faster market response times

---

## PROJECT TIMELINE

| Phase | Duration | Key Deliverables |
|-------|----------|------------------|
| **Phase 1: Data Consolidation** | Week 1-2 | Unified database schema, ETL processes |
| **Phase 2: SQL Implementation** | Week 3-4 | JOIN queries, Window functions, initial reports |
| **Phase 3: Analysis & Insights** | Week 5-6 | Business insights, recommendations, dashboards |
| **Phase 4: Implementation** | Week 7-8 | Action plans, KPI tracking, stakeholder review |

---

## RISK ASSESSMENT

| Risk Level | Potential Issue | Mitigation Strategy |
|------------|----------------|---------------------|
| **High** | Data quality issues from legacy systems | Implement data validation rules, clean historical data |
| **Medium** | User adoption resistance from teams | Early stakeholder involvement, training sessions |
| **Low** | Technical complexity of SQL queries | Phased implementation, thorough testing |
| **Medium** | Changing business requirements | Agile approach with weekly checkpoints |

---

## SUCCESS METRICS

### Quantitative (Measurable):
1. **Revenue Impact**: 15% increase within 6 months
2. **Cost Reduction**: $150K annual inventory cost savings
3. **Efficiency**: 65% reduction in manual reporting time
4. **Accuracy**: 95% data accuracy in consolidated reports
5. **Adoption**: 80% of target users actively using insights

### Qualitative (Observable):
1. **Decision Quality**: More data-driven strategic decisions
2. **Team Collaboration**: Cross-departmental data sharing
3. **Customer Experience**: More personalized interactions
4. **Competitive Edge**: Faster response to market changes

---

## CONCLUSION

This business scenario addresses a real-world challenge faced by multinational retailers: leveraging fragmented data for strategic advantage. By implementing SQL JOINs and Window Functions, GlobalTech Electronics will transform raw data into actionable insights, driving measurable business improvements in revenue, efficiency, and customer satisfaction.

**Business Value Statement**: For every $1 invested in this analytics initiative, we expect $5 in return through increased revenue and cost savings within 12 months.

---

*Prepared for: INSY 8311 Database Development with PL/SQL*  
*Student: SHEMA Serge*  
*Date: 02/07/2026*  
*Business Scenario ID: GTECH-ANALYTICS-2025-01*