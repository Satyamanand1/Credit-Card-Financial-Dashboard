# 💳 Credit Card Financial Dashboard using Power BI & PostgreSQL

<p align="center">

![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-025E8C?style=for-the-badge)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![Power Query](https://img.shields.io/badge/Power_Query-742774?style=for-the-badge)
![DAX](https://img.shields.io/badge/DAX-FFB000?style=for-the-badge)

</p>

---

# 📌 Project Overview

The **Credit Card Financial Dashboard** is an end-to-end Business Intelligence project developed using **Power BI**, **PostgreSQL**, **SQL**, **Power Query**, **DAX**, and **Microsoft Excel**.

The objective of this project is to provide **real-time weekly insights** into credit card transactions and customer behavior, enabling stakeholders to monitor KPIs, identify business trends, analyze customer demographics, and make data-driven decisions.

Unlike a basic dashboard project, this solution simulates a **real-world data pipeline** where raw Excel datasets are imported into PostgreSQL, transformed through SQL and Power Query, modeled inside Power BI, and finally visualized through interactive dashboards.

The project also demonstrates **incremental weekly data updates** by loading **Week 53 (31 December 2023)** records into PostgreSQL and refreshing the dashboard without redesigning the report.

---

# 🚀 Project Objectives

✔ Build an end-to-end Business Intelligence solution

✔ Import Excel data into PostgreSQL

✔ Perform SQL-based data storage and querying

✔ Create a relational data model

✔ Design dynamic Power BI dashboards

✔ Build DAX measures for KPIs

✔ Monitor weekly business performance

✔ Analyze customer demographics

✔ Track transaction performance

✔ Demonstrate incremental database updates

✔ Refresh dashboards automatically after database updates

---

# 🏗 Project Architecture

```

              Excel Dataset
                     │
                     ▼
              CSV Conversion
                     │
                     ▼
            PostgreSQL Database
                     │
        ┌────────────┴────────────┐
        │                         │
Customer_Detail Table      CreditCard_Detail Table
        │                         │
        └────────────┬────────────┘
                     │
                SQL Queries
                     │
                     ▼
              Power BI Desktop
                     │
        ┌────────────┴─────────────┐
        │                          │
Customer Dashboard        Transaction Dashboard
                     │
                     ▼
             Business Insights

```

---

# 🧰 Tech Stack

| Technology | Purpose |
|------------|----------|
| Power BI | Dashboard Development |
| PostgreSQL | Database Management |
| SQL | Data Querying |
| Power Query | Data Cleaning & Transformation |
| DAX | KPI Calculations |
| Microsoft Excel | Raw Dataset |
| CSV | Data Import |
| pgAdmin 4 | PostgreSQL Administration |

---

# 📂 Repository Structure

```

Credit-Card-Financial-Dashboard/

│

├── Dataset/

│ ├── credit_card.csv

│ ├── customer.csv

│ ├── cc_add.csv

│ └── cust_add.csv

│

├── SQL/

│ ├── Sql_Quries.sql

│

├── Dashboard/

│ ├── Credit_Card_Financial_Dashboard.pbix

│ ├── Credit Card Customer Dashboard.pdf

│ ├── Credit Card Transaction Dashboard.pdf

│

├── Images/

│ ├── customer_dashboard.png

│ ├── transaction_dashboard.png

│ ├── data_model.png

│ ├── postresql_import.png

│ └── week53_update.png

│

└── README.md

```

---

# 📊 Dataset Information

The project consists of **two datasets**.

## 1️⃣ Credit Card Detail

Contains transaction-related information including:

- Client Number
- Card Category
- Credit Limit
- Revenue
- Interest Earned
- Annual Fees
- Transaction Amount
- Transaction Count
- Expenditure Type
- Quarter
- Week Number
- Revenue
- Activation Days
- Utilization Ratio
- Revolving Balance

---

## 2️⃣ Customer Detail

Contains customer demographic information such as:

- Client Number
- Gender
- Income
- Education
- Age
- Occupation
- State
- Marital Status
- Dependents
- Home Owner
- Car Owner
- Personal Loan
- Customer Satisfaction Score

---

# 🗄 Database Design

Two relational tables were created inside PostgreSQL.

```

Customer_Detail
---------------
client_num (PK)
gender
income
education_level
customer_job
state_cd
customer_age
dependent_count
...

CreditCard_Detail
-----------------
client_num (FK)
card_category
revenue
interest_earned
credit_limit
transaction_amount
transaction_count
quarter
week_number
...

```

Both tables are connected using

```
client_num
```

forming a **one-to-one relationship** inside Power BI.

---

# ⚙ Database Workflow

### Step 1

Raw Excel files were converted into CSV format.

↓

### Step 2

Created PostgreSQL database.

↓

### Step 3

Created tables using SQL.

Example:

```sql
CREATE TABLE creditcard_detail(
client_num BIGINT,
card_category VARCHAR(20),
annual_fees INT,
activation_30_days INT,
customer_acq_cost INT,
week_start_date DATE,
week_num VARCHAR(20),
qtr VARCHAR(10),
...
);
```

---

### Step 4

Imported CSV files using PostgreSQL COPY command.

```sql
COPY creditcard_detail

FROM 'credit_card.csv'

DELIMITER ','

CSV HEADER;
```

Similarly,

```sql
COPY customer_detail

FROM 'customer.csv'

DELIMITER ','

CSV HEADER;
```

---

### Step 5

Verified imported records.

```sql
SELECT *

FROM creditcard_detail

LIMIT 100;
```

---

### Step 6

Connected PostgreSQL database with Power BI.

---

### Step 7

Created relationships.

```
Customer Detail

↓

Client Number

↓

Credit Card Detail

```

---

# 🔄 Incremental Weekly Data Update

Initially, the dashboard contained data till

```
Week 52

24 December 2023
```

New weekly data became available for

```
Week 53

31 December 2023
```

Instead of rebuilding the dashboard, the new records were imported using two new CSV files:

```
cc_add.csv

cust_add.csv
```

These files were inserted into PostgreSQL using the same COPY command.

```sql
COPY creditcard_detail

FROM 'cc_add.csv'

DELIMITER ','

CSV HEADER;
```

```sql
COPY customer_detail

FROM 'cust_add.csv'

DELIMITER ','

CSV HEADER;
```

After refreshing Power BI,

Initial Records

```
10,108
```

↓

Final Records

```
10,293
```

The dashboards updated automatically, demonstrating a real-world incremental data refresh workflow.

---

# 📈 Dashboard 1 — Customer Report

The Customer Dashboard provides insights into customer demographics, income distribution, satisfaction levels, and revenue contribution.

## KPIs

- Total Income
- Customer Satisfaction Score
- Revenue by Week
- Revenue by Age Group
- Revenue by Education
- Revenue by Income Group
- Revenue by Top States
- Gender Distribution
- Card Category Distribution
- Dependency Analysis

---

## Customer Dashboard Features

### Revenue Analysis
- Weekly Revenue Trend
- Revenue by Income Group
- Revenue by Age Group
- Revenue by Education Level
- Revenue by State

### Customer Segmentation
- Gender-wise Analysis
- Card Category Distribution
- Income Distribution
- Dependency Distribution

### Geographic Analysis
- Interactive map showing customer distribution across U.S. states.

### Interactive Filters
- Quarter
- Gender
- Card Category

---

# 📊 Dashboard 2 — Transaction Report

The Transaction Dashboard focuses on financial performance, transaction analysis, card usage, expenditure behavior, and quarterly business trends.

## KPIs

- Revenue
- Interest Earned
- Total Transaction Amount
- Number of Transactions

---

## Transaction Dashboard Features

### Revenue Analysis

- Quarterly Revenue Trend
- Revenue by Card Category
- Revenue by Card Type
- Revenue by Expenditure Type
- Revenue by Job Type
- Revenue by Education

### Transaction Analysis

- Total Transactions
- Transaction Amount
- Interest Earned
- Revenue by Use Type
- Quarterly Comparison

### Interactive Filters

- Week Number
- Quarter
- Gender

---

# 📷 Dashboard Screenshots

## Customer Dashboard

> Add screenshot here

```
Images/customer_dashboard.png
```

---

## Transaction Dashboard

> Add screenshot here

```
Images/transaction_dashboard.png
```

---

## Power BI Data Model

> Add screenshot here

```
Images/data_model.png
```

---

## PostgreSQL Database

> Add screenshot here

```
Images/postgresql_import.png
```

---

## Week 53 Data Update

> Add screenshot here

```
Images/week53_update.png
```

---

# 📊 Key Performance Indicators (KPIs)

## Customer Dashboard

| KPI | Description |
|------|-------------|
| Income | Total customer income |
| Customer Satisfaction | Average satisfaction score |
| Revenue by Week | Weekly revenue trend |
| Revenue by Education | Revenue contribution by education |
| Revenue by Age | Revenue by customer age group |
| Revenue by State | Top performing states |
| Revenue by Income Group | Revenue across income categories |
| Dependency Analysis | Customer dependency distribution |

---

## Transaction Dashboard

| KPI | Description |
|------|-------------|
| Revenue | Total generated revenue |
| Interest Earned | Interest generated from customers |
| Transaction Amount | Total amount transacted |
| Transaction Count | Number of completed transactions |
| Card Category | Revenue by card category |
| Card Type | Revenue by card type |
| Expenditure Type | Spending category analysis |
| Job Type | Revenue by customer occupation |

---

# 📈 Business Insights

## Customer Insights

- Customers aged **40–50 years** contribute the highest revenue.
- Graduate customers generate the maximum revenue among education groups.
- Texas, New York, and California are the top revenue-generating states.
- Female and male customers contribute almost equally to total revenue.
- Customers with **Very High** income generate the highest revenue.

---

## Transaction Insights

- Blue Card contributes the largest share of revenue.
- Swipe transactions dominate compared to Chip and Online transactions.
- Bills and Entertainment are the highest expenditure categories.
- Businessmen and White-Collar professionals generate the highest revenue.
- Quarter 4 records the strongest financial performance.

---

# 📊 Power BI Features Used

✔ Interactive Dashboards

✔ Drill Down

✔ Slicers

✔ KPI Cards

✔ Map Visualization

✔ Matrix Tables

✔ Bar Charts

✔ Line Charts

✔ Treemap

✔ Donut Chart

✔ Conditional Formatting

✔ Bookmarks

✔ Cross Filtering

✔ Data Modeling

✔ Relationships

---

# 📐 Data Modeling

The project follows a relational model.

```

Customer Detail

        │

        │ Client Number

        ▼

Credit Card Detail

```

Relationship Type

```
One-to-One
```

Primary Key

```
client_num
```

---

# ⚡ Power Query Transformations

The following transformations were performed before loading data:

- Data Type Conversion
- Null Value Handling
- Duplicate Removal
- Column Renaming
- Calculated Columns
- Data Cleaning
- Relationship Validation

---

# 🧮 DAX Measures

Examples of DAX measures used in the project:

```DAX
Revenue =
SUM(creditcard_detail[Revenue])
```

```DAX
Interest Earned =
SUM(creditcard_detail[interest_earned])
```

```DAX
Total Transaction Amount =
SUM(creditcard_detail[total_trans_amt])
```

```DAX
Number of Transactions =
SUM(creditcard_detail[total_trans_ct])
```

```DAX
Income =
SUM(customer_detail[income])
```

```DAX
Customer Satisfaction =
AVERAGE(customer_detail[cust_satisfaction_score])
```

---

# 🗃 SQL Operations Performed

### Database Creation

```sql
CREATE DATABASE creditcarddb;
```

### Table Creation

- customer_detail
- creditcard_detail

### Data Import

```sql
COPY customer_detail
FROM 'customer.csv'
DELIMITER ','
CSV HEADER;
```

```sql
COPY creditcard_detail
FROM 'credit_card.csv'
DELIMITER ','
CSV HEADER;
```

### Week 53 Update

```sql
COPY customer_detail
FROM 'cust_add.csv'
DELIMITER ','
CSV HEADER;
```

```sql
COPY creditcard_detail
FROM 'cc_add.csv'
DELIMITER ','
CSV HEADER;
```

### Verification

```sql
SELECT *
FROM creditcard_detail;
```

---

# 📁 Files Included

```
📦 Dataset
 ├── customer.csv
 ├── credit_card.csv
 ├── cust_add.csv
 └── cc_add.csv

📦 SQL
 ├── create_tables.sql
 ├── import_data.sql
 └── queries.sql

📦 Dashboard
 ├── Credit Card Customer Dashboard.pbix
 └── Credit Card Transaction Dashboard.pbix

📦 Images
 ├── customer_dashboard.png
 ├── transaction_dashboard.png
 ├── postgresql_import.png
 ├── data_model.png
 └── week53_update.png
```

---

# 🚀 How to Run the Project

### Step 1

Clone the repository.

```bash
git clone https://github.com/yourusername/Credit-Card-Financial-Dashboard.git
```

### Step 2

Open PostgreSQL.

### Step 3

Create the database.

### Step 4

Run the SQL scripts.

### Step 5

Import both CSV files.

### Step 6

Open the Power BI (.pbix) file.

### Step 7

Update the PostgreSQL credentials if required.

### Step 8

Click **Refresh**.

The dashboards will populate automatically.

---

# 🎯 Skills Demonstrated

- Business Intelligence
- Dashboard Design
- Data Visualization
- SQL
- PostgreSQL
- Data Modeling
- ETL
- Power Query
- DAX
- KPI Development
- Database Management
- Data Cleaning
- Data Analysis
- Analytical Thinking
- Reporting Automation
- Incremental Data Loading

---

# 📚 Learning Outcomes

Through this project, I gained hands-on experience in:

- Designing end-to-end BI solutions
- Building relational databases in PostgreSQL
- Importing CSV data using SQL COPY commands
- Creating Power BI data models
- Developing DAX measures
- Designing interactive dashboards
- Performing business performance analysis
- Implementing incremental weekly data updates
- Building production-style reporting workflows

---

# 🔮 Future Improvements

- Connect directly to a live PostgreSQL database.
- Automate weekly refresh using Power BI Service.
- Integrate Python for predictive analytics.
- Add forecasting using Power BI Analytics.
- Implement Row-Level Security (RLS).
- Publish dashboards to the Power BI Service.
- Create executive and mobile-friendly dashboard layouts.

---

# 👨‍💻 Author

**Satyam Anand**

📧 Email: satyamanand9555@gmail.com

💼 LinkedIn: https://www.linkedin.com/in/satyam-anand-sa9555/

💻 GitHub: https://github.com/Satyamanand1

---

# ⭐ If you found this project useful, consider giving it a Star!

It helps support the project and encourages future Business Intelligence and Data Analytics work.
