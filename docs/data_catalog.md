# 📒 Data Catalog — Gold Layer

## Overview  
The **Gold Layer** contains business-ready data designed for **analytics and reporting**.  
It follows a **star schema** with dimensions (descriptive attributes) and fact tables (events/transactions).  

---

## 🧑‍🤝‍🧑 gold.dim_customers
**Purpose:** Holds customer master data, enriched with demographics and geography.  

**Key Columns:**  
- `customer_key` → surrogate key used in the warehouse.  
- `customer_id`, `customer_number` → business identifiers from source systems.  
- `first_name`, `last_name` → customer name details.  
- `country`, `gender`, `marital_status` → demographic info.  
- `birthdate` → useful for age-based segmentation.  
- `create_date` → when the record was created in the source system.  

📌 *Supports customer segmentation, geographic analysis, and links to sales.*  

---

## 🚲 gold.dim_products
**Purpose:** Stores product details and categorization for sales analysis.  

**Key Columns:**  
- `product_key` → surrogate key for the warehouse.  
- `product_id`, `product_number` → product identifiers.  
- `product_name` → descriptive product name.  
- `category`, `subcategory` → hierarchical classification.  
- `product_line` → grouping such as Road, Mountain, Touring.  
- `cost` → base cost of the product.  
- `start_date` → availability start date.  

📌 *Supports revenue by product line, profitability by category, and product performance reporting.*  

---

## 💰 gold.fact_sales
**Purpose:** Central fact table containing sales transactions.  

**Key Columns:**  
- `order_number` → unique order reference.  
- `product_key` → foreign key to `dim_products`.  
- `customer_key` → foreign key to `dim_customers`.  
- `order_date`, `shipping_date`, `due_date` → important sales lifecycle dates.  
- `quantity`, `price`, `sales_amount` → sales metrics.  

📌 *Supports revenue tracking, trend analysis, and customer/product performance insights.*  
