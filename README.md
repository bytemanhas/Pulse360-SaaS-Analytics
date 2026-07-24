# 📊 Pulse360 SaaS Analytics Platform

> An end-to-end Business Intelligence & Data Analytics project that demonstrates the complete analytics lifecycle—from data ingestion and cleaning to SQL data warehousing, interactive Power BI dashboards, Excel automation, and business insights.

---

## 📌 Project Overview

Pulse360 is a simulated SaaS subscription analytics platform developed to showcase an end-to-end analytics workflow. The project integrates multiple data sources, performs ETL and feature engineering, stores data in a MySQL data warehouse, and delivers executive dashboards through Power BI and Excel.

The objective is to help business leaders monitor customer growth, subscription revenue, product adoption, customer support performance, and churn trends to support strategic decision-making.

---

# 🎯 Business Objectives

- Monitor Monthly Recurring Revenue (MRR) and Annual Recurring Revenue (ARR)
- Analyze customer acquisition and subscription plans
- Track product adoption and feature usage
- Measure customer support efficiency
- Identify churn drivers and refund trends
- Deliver automated executive dashboards

---

# 🏗 Project Architecture

```text
Raw Data
     │
     ▼
Python Data Ingestion
     │
     ▼
Data Cleaning & Feature Engineering
     │
     ▼
API Data Integration
     │
     ▼
MySQL Data Warehouse
     │
     ▼
SQL Business Analysis
     │
     ▼
Power BI Dashboards
     │
     ▼
Excel Dashboard + VBA Automation
```

---

# 🛠 Tech Stack

| Category | Technologies |
|-----------|--------------|
| Programming | Python |
| Data Analysis | Pandas, NumPy |
| Visualization | Matplotlib |
| Database | MySQL |
| SQL | MySQL Workbench |
| BI Tool | Power BI |
| Spreadsheet | Microsoft Excel |
| Automation | VBA Macros |
| API | REST APIs |
| Version Control | Git & GitHub |

---

# 📂 Repository Structure

```text
Pulse360-SaaS-Analytics
│
├── API Data
├── Customer360
├── Data
│   ├── Raw
│   └── Clean
├── Docs
├── Excel
├── KPIs and Summary Data
├── Notebooks
├── PowerBI
├── SQL
├── Screenshots
├── README.md
├── requirements.txt
└── LICENSE
```

---

# 🔄 Project Workflow

### Phase 1 — Data Ingestion

- Imported SaaS subscription datasets
- Performed exploratory data analysis
- Data profiling

---

### Phase 2 — Data Cleaning

- Removed duplicates
- Handled missing values
- Corrected data types
- Feature engineering
- Created clean analytical datasets

---

### Phase 3 — API Integration

Integrated external API datasets including:

- Accounts
- Feature Usage
- Customer Support
- Churn Events
- Subscriptions

---

### Phase 4 — Data Warehouse

Created a relational MySQL data warehouse containing:

- Accounts
- Subscriptions
- Feature Usage
- Support Tickets
- Churn Events

Also created analytical SQL Views for reporting.

---

### Phase 5 — SQL Analytics

Performed SQL analysis including:

- Revenue Analysis
- Customer Segmentation
- Product Usage
- Support KPIs
- Churn Analysis

---

### Phase 6 — Power BI

Developed a multi-page executive dashboard including:

- Executive Dashboard
- Customer Analytics
- Product Analytics
- Support Analytics
- Churn Analytics

Features include:

- Interactive slicers
- KPI Cards
- Maps
- Treemaps
- Donut Charts
- Bar Charts
- Executive Reporting

---

### Phase 7 — Excel Executive Dashboard

Created an automated Excel dashboard using:

- Pivot Tables
- Pivot Charts
- KPI Cards
- Slicers
- VBA Automation

Automated features include:

- Dashboard Refresh
- PDF Export
- Timestamp Update
- Filter Reset

---

# 📈 Dashboard Highlights

### Executive Dashboard

- Total Customers
- MRR
- ARR
- Auto Renewal Rate
- Trial Customers
- Revenue by Plan

---

### Customer Analytics

- Industry Distribution
- Geographic Distribution
- Average Seats
- Customer Segmentation

---

### Product Analytics

- Feature Usage
- Product Adoption
- Error Analysis
- Usage Duration

---

### Support Analytics

- Ticket Volume
- Resolution Time
- Escalations
- Customer Satisfaction

---

### Churn Analytics

- Churn Reasons
- Refund Analysis
- Average Refund
- Revenue Loss

---

# 📊 Key Business Insights

- Enterprise customers generate the highest recurring revenue.
- Auto-renew subscriptions account for the majority of active customers.
- Feature adoption varies significantly across products.
- Support performance remains consistent with high customer satisfaction.
- Product features and pricing are the leading contributors to customer churn.

---

# 💼 Skills Demonstrated

- Data Cleaning
- Feature Engineering
- ETL Pipeline Development
- REST API Integration
- MySQL Database Design
- SQL Analytics
- Dashboard Design
- Business Intelligence
- Data Visualization
- Excel Automation
- VBA Programming
- Git & GitHub

---

# 🚀 How to Run

1. Clone the repository

```bash
git clone https://github.com/bytemanhas/Pulse360-SaaS-Analytics.git
```

2. Install dependencies

```bash
pip install -r requirements.txt
```

3. Execute notebooks sequentially

```
01_Data_Ingestion_And_Profiling
02_Data_Cleaning_Feature_Engineering
03_Business_Insights_KPI
04_API_Integration_&_Data_Enrichment
05_Data_Warehouse_&_MySQL_ETL
```

4. Import SQL scripts into MySQL.

5. Open the Power BI dashboard.

6. Open the Excel dashboard.

---

# 📸 Dashboard Screenshots

## Executive Dashboard
<img width="795" height="599" alt="image" src="https://github.com/user-attachments/assets/adf05974-7ced-43e9-b811-6184ac1c7275" />





## Customer Analytics

<img width="985" height="794" alt="image" src="https://github.com/user-attachments/assets/3ab556e8-d1d7-4f9f-bc2e-7f6a007a283a" />

## Product Analytics

<img width="794" height="619" alt="image" src="https://github.com/user-attachments/assets/f2b63961-cfdd-4d59-ae0d-2f9220a138fd" />

## Support Analytics

<img width="798" height="606" alt="image" src="https://github.com/user-attachments/assets/5396615c-4880-4b77-b228-4aade834808e" />


## Churn Analytics

<img width="799" height="613" alt="image" src="https://github.com/user-attachments/assets/31f8c2a9-0f6b-415c-91d4-8449967290c7" />


---

# 📄 License

This project is licensed under the MIT License.

---

# 👨‍💻 Author

**Yashwant Manhas**

- GitHub: https://github.com/bytemanhas
- LinkedIn: https://www.linkedin.com/in/yashwant-manhas-69a2b5413/

---

⭐ If you found this project useful, consider giving it a star!
