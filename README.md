# SQL Data Warehouse & Analytics Project

Welcome to my **SQL Data Warehouse and Analytics Project**!

This project is part of my learning journey in **Data Engineering, SQL, Data Warehousing, ETL, Data Modeling, and Analytics**.

The goal of this project is to understand how data from different sources can be loaded into a data warehouse, cleaned and transformed, modeled for analysis, and then used to generate useful business insights.

---

## Data Architecture

This project follows the **Medallion Architecture**, which consists of three layers:

### Bronze Layer

The Bronze layer stores the **raw data** as it comes from the source systems.

The data is imported from CSV files into SQL Server.

### Silver Layer

The Silver layer is used for **data cleansing, standardization, and transformation**.

The purpose is to prepare the raw data so it can be used reliably for analysis.

### Gold Layer

The Gold layer contains **business-ready data**.

The data is modeled using fact and dimension tables to support reporting and analytics.

---

## Project Overview

This project focuses on the following areas:

1. **Data Architecture**
   Designing a modern data warehouse using the Bronze, Silver, and Gold layers.

2. **ETL Pipelines**
   Extracting, transforming, and loading data from the source systems into the data warehouse.

3. **Data Modeling**
   Developing fact and dimension tables designed for analytical queries.

4. **Analytics & Reporting**
   Using SQL to analyze the data and generate insights related to customers, products, and sales.

---

# Project Requirements

## Building the Data Warehouse

### Objective

Develop a modern data warehouse using **SQL Server** to consolidate sales data and support analytical reporting.

### Specifications

* **Data Sources:** Import data from two source systems, ERP and CRM, provided as CSV files.
* **Data Quality:** Clean and resolve data quality issues before analysis.
* **Integration:** Combine data from both sources into a single user-friendly data model.
* **Scope:** Focus on the latest dataset only. Historization is not required.
* **Documentation:** Document the data model to support understanding and analysis.

---

## BI: Analytics & Reporting

### Objective

Develop SQL-based analytics to provide insights into:

* **Customer Behavior**
* **Product Performance**
* **Sales Trends**

The analysis is intended to provide useful business metrics and support decision-making.

---

# Repository Structure

```text
data-warehouse-project/
│
├── datasets/                           # Raw ERP and CRM datasets
│
├── docs/                               # Project documentation
│   ├── data_layers.pdf                 # Data architecture documentation
│   └── naming-conventions.md           # Naming conventions
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Extracting and loading raw data
│   ├── silver/                         # Cleaning and transforming data
│   └── gold/                           # Creating analytical models
│
├── tests/                              # Test scripts and data quality checks
│
├── README.md                           # Project documentation
├── LICENSE                             # License information
└── requirements.txt                    # Project requirements
```

---

## Learning Goal

Through this project, I am learning how the different stages of a data warehouse work together — from **raw data ingestion and transformation to data modeling and analytics**.

The project helps me build practical experience with **SQL Server, ETL, data warehousing, data modeling, and SQL-based analytics**.

---

## Documentation

The project documentation is available in the `docs/` folder.

* [Data Layers](docs/data_layers.pdf)
* [Naming Conventions](docs/NamingConventions.md)

---

## Connect With Me

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://www.linkedin.com/in/vibhorchauhan/)
