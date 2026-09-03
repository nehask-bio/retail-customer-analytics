# Retail & Customer Analytics with SQL, Excel, Python and Power BI

I built this project using the Olist Brazilian e-commerce dataset to understand how the business was performing across orders, customers, products and regions.

The analysis was carried out using SQL, Excel, Python and Power BI. I used SQL for querying and data checks, Python for cleaning and exploratory analysis, Excel for KPI calculations and pivot-based analysis, and Power BI for the final dashboard.

The main aim was to answer practical business questions such as:

- How many orders were successfully delivered?
- How much merchandise value was generated?
- Which months performed best or worst?
- Which product categories contributed the most value?
- Where are most customers located?
- How many customers returned to place another order?

## Tools Used

- PostgreSQL and pgAdmin
- SQL
- Python
- pandas
- Matplotlib
- Excel
- Power BI
- DAX

## What I Completed

- Created and loaded the main Olist tables into PostgreSQL
- Performed SQL data-quality checks and business analysis
- Cleaned and validated the data in Python
- Analysed monthly performance, customer behaviour, product categories and geography
- Used Excel for XLOOKUP, COUNTIFS, SUMIFS, PivotTables and PivotCharts
- Built a Power BI data model and created DAX measures
- Created three Power BI pages:
  - Executive Overview
  - Customer Analysis
  - Product Performance

## Project Status

The project is complete. The final workflow includes PostgreSQL and SQL analysis, Python-based data validation and exploratory analysis, Excel-based KPI and pivot analysis, and a three-page Power BI dashboard covering overall business performance, customer behaviour and product performance.

## Key Findings

A few clear patterns stood out from the analysis.

- The dataset contains 96,478 delivered orders.
- Delivered merchandise value was about 13.22 million.
- Average delivered order value was about 137.04.
- November 2017 was the strongest month, with merchandise value of 987,765.37.
- The biggest month-on-month increase was in February 2017 at about 109.5%.
- The biggest month-on-month fall was in December 2017 at about 26.5%.
- Customer retention was quite low. Only 2,997 customers placed more than one order, giving a repeat customer rate of about 3.12%.
- São Paulo had by far the largest customer base, followed by Rio de Janeiro and Minas Gerais.
- The highest-value product categories included health and beauty, watches and gifts, bed and bath, sports and leisure, and computer accessories.
- I also found some data-quality issues, including missing product categories and a very small number of delivered orders with missing delivery dates.



## Business Recommendations

Based on the analysis, there are a few areas the business could focus on.

- Customer retention should be a priority because only a small percentage of customers placed more than one order. Retention campaigns, loyalty offers or follow-up promotions could help encourage repeat purchases.
- São Paulo is the largest customer market, so it would make sense to prioritise marketing, delivery performance and customer service in that region.
- High-value product categories such as health and beauty, watches and gifts, bed and bath, sports and leisure, and computer accessories should receive close attention because they contribute a large share of merchandise value.
- The strong performance in November 2017 suggests that seasonal or promotional periods can have a major impact. Similar campaign periods could be analysed further to understand what drove the increase.
- The sharp decline in December 2017 should be investigated alongside seasonality, stock availability and delivery performance to understand whether the drop was expected or operational.
- Missing product categories and a small number of missing delivery dates should continue to be monitored because data-quality issues can affect reporting accuracy.

## Power BI Dashboard

### Executive Overview

![Executive Overview](figures/executive_overview.png)

### Customer Analysis

![Customer Analysis](figures/customer_analysis.png)

### Product Performance

![Product Performance](figures/product_performance.png)