# 📊 Data Warehouse and Analytics Project

This project was built as part of my **data engineering learning journey**, following [Baraa’s SQL Data Warehouse course](https://datawithbaraa.substack.com).  

My goal was to **practice modern data warehousing concepts** using the Medallion Architecture (Bronze–Silver–Gold), **design ETL pipelines**, and **prepare analytical models** in SQL Server.  

---

## 🏗️ Data Architecture

The project uses the **Medallion Architecture** pattern with three layers:  
![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer** → Raw ingestion of CSV files (ERP & CRM data) into SQL Server.  
2. **Silver Layer** → Cleansing, standardization, and integration of datasets.  
3. **Gold Layer** → Star schema with fact and dimension tables for reporting & analytics.  

---

## 📖 Key Learnings & Contributions  

Through this project I practiced:  

- **Data Ingestion**: Loading raw CSV datasets into SQL Server (BULK INSERT).  
- **ETL Design**: Building transformations across Bronze → Silver → Gold layers.  
- **Data Modeling**: Designing a **star schema** (fact + dimension tables).  
- **SQL Development**: Writing analytical queries, window functions, and transformations.  
- **Documentation**: Creating data catalog, naming conventions, and architecture diagrams.  

This was a **learning project**, not production-ready, but it gave me hands-on experience with the core steps of building a modern warehouse.  

---

## 🚀 Project Requirements  

**Objective**  
Develop a small-scale **modern data warehouse** in SQL Server to consolidate ERP & CRM data into a unified model for analysis.  

**Scope & Specifications**  
- Data sources: CSV files simulating ERP and CRM systems.  
- Transformations: Cleaning, deduplication, standardization, integration.  
- Data model: Analytical star schema.  
- Documentation: Data catalog, architecture, and ETL design.  

---


---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.  

---

## 🙏 Acknowledgment  

This project was inspired by [Baraa’s SQL Data Warehouse course](https://datawithbaraa.substack.com).  
The datasets, logic, and architecture were reproduced for **educational purposes only**.  
