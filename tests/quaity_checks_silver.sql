/*
================================================================================
Quality Checks
================================================================================
Script Purpose:
  This script performs various quality checks for data consistency. accuracy,
and standardization across the 'silver' schemas. It includes check for:
- Null or duplicate primary keys.
- Unwanted spaces in string fields.
- Data standardization and consistency.
- Invalid date ranges and orders.
- Data consistency between related fields.

Usage Notes:
  - Run these checks after data loading Silver Layer.
  - Investigate and resolve any discrepancies found during the checks.
================================================================================
*/
-- ===============================================
-- Table silver.crm_cust_info Checks
-- ===============================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results
SELECT
  cst_id,
  COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT
  cst_key
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Data Standardization & Consistency
SELECT DISTINCT
  cst_marital_status
FROM silver.crm_cust_info;

-- ===============================================
-- Table silver.crm_prd_info Checks
-- ===============================================
-- Checks for NULLS or Dublicates in Primary Key
-- Expectation: No Results
SELECT
  prd_id,
  COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for Unwanted Spaces
-- Expectations: No Results
SELECT
  prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(pr_nm);

-- Check for NULLs or Negative Values in Cost
-- Expectation: No Results
SELECT
  prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Data Standardization & Consistency
SELECT DISTINCT
  prd_line
FROM silver.crm_prd_info;

-- Check for Invalid Date Orders (Start Date > End Date)
-- Expectation: No Results
SELECT
*
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;
-- ===============================================
-- Table silver.crm_sales_details Checks
-- ===============================================
-- Check for Invalid Dates
-- Expectation: No Invalid Dates
SELECT
    NULLIF(sls_due_dt,0) AS sls_due_dt
FROM bronze.crm.sales.details
WHERE sls_due_dt <= 0
   OR LEN(sls_due_dt) != 8
   OR sls_due_dt > 20500101
   OR sls_due_dt < 19000101;

-- Check for Invalid Date Orders (Order Date > Shipping/Due Dates)
-- Expectation: No Results
SELECT 
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
   OR sls_order_dt > sls_due_dt;

-- Check Data Consistency: Sales = Quality * Price
-- Expectation: No Results
SELECT DISTINCT
     sls_sales,
     sls_quantiny,
     sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantiny *sls_price
   OR sls_sales IS NULL
   OR sls_quantiny IS NULL
   OR sls_price IS NULL
   OR sls_sales <= 0
   OR sls_quantiny <= 0
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantiny, sls_price; 
-- ===============================================
-- Table silver.erp_cust_az12 Checks
-- ===============================================
-- Identify Out-of-Range Dates
-- Expectation: Birthdates between 1924-01-01 and Today
SELECT DISTINCT
  c_birth_dt
FROM silver.erp_cust_az12
WHERE c_birth_dt < '1924-01-01'
      OR c_birth_dt > GETDATE();

-- Data Standardization & Consistency
SELECT DISTINCT
  c_gndr
FROM silver.erp_cust_az12;

-- ===============================================
-- Table silver.erp_loc_a101 Checks
-- ===============================================
-- Data Standardization & Consistency
SELECT DISTINCT
  c_country
FROM  silver.erp_loc_a101;

-- ===============================================
-- Table silver.erp_px_cat_g1v2 Checks
-- ===============================================
-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT
*
FROM  silver.erp_px_cat_g1v2
WHERE prd_cat != TRIM(prd_cat)
   OR prd_sub_cat != TRIM(prd_sub_cat)
   OR prd_maintenance != TRIM(prd_maintenance);

-- Data Standardization & Consistency
SELECT DISTINCT
  prd_maintenance
FROM  silver.erp_px_cat_g1v2;
