# End-to-End Sales Analytics Dashboard

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
