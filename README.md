# End-to-End Sales Analytics Dashboard

![Project Banner](images/sales-dashboard.png)

## Project Overview

This project demonstrates an end-to-end Business Intelligence solution built using SQL Server and Power BI.

The goal of this project is to transform raw sales data into meaningful business insights through data modeling, SQL analysis, and interactive dashboard design.

## Business Context

The dataset represents a B2B sales environment where customers belong to different industries and countries.

The company sells multiple products across various categories and needs analytical insights to understand sales performance, profitability, customer behavior, and product trends.

## Data Model

The project follows a Star Schema data warehouse design.

### Fact Table

**Sales**
- SalesID
- CustomerID
- ProductID
- DateID
- Quantity
- Revenue Amount
- Cost Amount
- Profit Amount

### Dimension Tables

**Customer**
- CustomerID
- First Name
- Last Name
- Industry
- Country

**Product**
- ProductID
- Product Name
- Category
- Price

**Date**
- DateID
- Year
- Half Year Name
- Quarter Name
- Month Name
- Year Half Year Date
- Year Quarter Date
- Year Month Date

## Technologies Used

- SQL Server
- Power BI
- Data Warehouse Modeling
- Star Schema Design
- SQL Analytics
- Business Intelligence

## Repository Structure

```text
sales-analytics-dashboard
│
├── README.md
├── images/
├── sql/
├── powerbi/
└── docs/
```

## SQL Solution

SQL Server was used to prepare and analyze the data.

The project includes analytical SQL queries using:

- Common Table Expressions (CTEs)
- Window Functions
- CASE Statements
- Aggregations
- Views
- Stored Procedures

These solutions were designed to answer business questions and support Power BI reporting.

## Power BI Dashboard

The Power BI dashboard was developed to visualize sales performance and provide actionable business insights.

The dashboard includes:

- KPI tracking
- Sales and profitability analysis
- Customer analysis
- Product performance analysis
- Time-based trends
- Interactive filtering, drill-down, and drill-through functionality

## Business Insights

The dashboard was designed to answer key business questions, including:

- Which country and industry generate the highest revenue and profit?
- What are the monthly and yearly revenue and profit trends?
- How does profit develop throughout the year?
- Which products generate the highest profit?
- How much does profit change from month to month?
- Which products are among the Top N based on yearly profit?
