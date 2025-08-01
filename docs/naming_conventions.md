# 📝 Naming Conventions

This document describes the **standards and conventions** followed when naming schemas, tables, columns, and other SQL objects in the data warehouse.  
Consistent naming makes the project easier to maintain, scale, and understand.  

---

## 🔑 General Principles
- Use **snake_case** (lowercase + underscores).  
- All names are in **English**.  
- Avoid using **SQL reserved words**.  
- Choose **descriptive names** that are meaningful to both technical and business users.  

---

## 📦 Table Naming Conventions

### Bronze Layer
- Tables mirror the **original source system**.  
- Format: `<source>_<entity>`  
- Example:  
  - `crm_customer_info` → Raw CRM data for customers.  
  - `erp_product` → Raw ERP data for products.  

### Silver Layer
- Tables still keep **source system prefixes**, but may include cleaned or standardized versions.  
- Format: `<source>_<entity>`  
- Example:  
  - `crm_customer_info_cleaned`  
  - `erp_sales_orders_standardized`  

### Gold Layer
- Tables use **business-aligned names** for clarity.  
- Format: `<category>_<entity>`  
- Examples:  
  - `dim_customers` → Customer dimension.  
  - `fact_sales` → Sales transactions fact table.  

#### Common Gold Prefixes
| Prefix   | Meaning             | Example              |
|----------|---------------------|----------------------|
| `dim_`   | Dimension table     | `dim_products`       |
| `fact_`  | Fact table          | `fact_sales`         |
| `report_`| Reporting table     | `report_monthly_sales` |

---

## 📑 Column Naming Conventions

### Surrogate Keys  
- Always end with `_key`.  
- Example: `customer_key`, `product_key`.  

### Business Keys  
- Retain source identifiers, e.g., `customer_id`, `order_number`.  

### Technical / Metadata Columns  
- Always begin with `dwh_`.  
- Examples:  
  - `dwh_load_date` → timestamp when record was loaded.  
  - `dwh_update_user` → system or user who updated the record.  

---

## ⚙️ Stored Procedures

- Use the prefix `load_` followed by the layer.  
- Examples:  
  - `load_bronze` → Handles ingestion from raw sources.  
  - `load_silver` → Runs cleansing & standardization.  
  - `load_gold` → Builds business-ready tables.  
