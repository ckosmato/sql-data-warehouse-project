/*
===============================================
		CREATION OF DATABASE AND SCHEMAS
===============================================
 Script Purpose:
	This script creates a database named "DataWarehouse" after it checks if the database exists.
	If the database exists it gets deleted and recreated. It also creates  schemas for each of
	the three layers: bronze, silver and gold.

 WARNING:
	This script will delete any current database named "DataWarehouse" and create it anew.
*/

USE master;
GO

--DROPS AND RECREATES THE DATABASE
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO


CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
