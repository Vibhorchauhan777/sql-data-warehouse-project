CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    DECLARE @start_time DATETIME,
			@batch_start_time DATETIME,
            @end_time   DATETIME,
			@batch_end_time   DATETIME;

    BEGIN TRY
		SET @batch_start_time = GETDATE();
        PRINT '=======================================================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=======================================================================================';


        -------------------------------------------------------------------------------
        -- CRM TABLES
        -------------------------------------------------------------------------------

        PRINT '=======================================================================================';
        PRINT 'Loading CRM Tables';
        PRINT '=======================================================================================';

	
        -------------------------------------------------------------------------------
        -- CRM: Customer Information
        -------------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: crm_cust_info';

        TRUNCATE TABLE bronze.crm_cust_info;

        PRINT '>> Inserting Data Into: crm_cust_info';

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\vibho\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';

        SELECT COUNT(*) AS crm_cust_info_count
        FROM bronze.crm_cust_info;


        -------------------------------------------------------------------------------
        -- CRM: Product Information
        -------------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: crm_prd_info';

        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting Data Into: crm_prd_info';

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\vibho\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';

        SELECT COUNT(*) AS crm_prd_info_count
        FROM bronze.crm_prd_info;


        -------------------------------------------------------------------------------
        -- CRM: Sales Details
        -------------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: crm_sales_details';

        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting Data Into: crm_sales_details';

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\vibho\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';

        SELECT COUNT(*) AS crm_sales_details_count
        FROM bronze.crm_sales_details;


        -------------------------------------------------------------------------------
        -- ERP TABLES
        -------------------------------------------------------------------------------

        PRINT '=======================================================================================';
        PRINT 'Loading ERP Tables';
        PRINT '=======================================================================================';


        -------------------------------------------------------------------------------
        -- ERP: Customer
        -------------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: erp_cust_az12';

        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting Data Into: erp_cust_az12';

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\vibho\Downloads\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';

        SELECT COUNT(*) AS erp_cust_az12_count
        FROM bronze.erp_cust_az12;


        -------------------------------------------------------------------------------
        -- ERP: Location
        -------------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: erp_loc_a101';

        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting Data Into: erp_loc_a101';

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\vibho\Downloads\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';

        SELECT COUNT(*) AS erp_loc_a101_count
        FROM bronze.erp_loc_a101;


        -------------------------------------------------------------------------------
        -- ERP: Product Category
        -------------------------------------------------------------------------------

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: erp_px_cat_g1v2';

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting Data Into: erp_px_cat_g1v2';

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\vibho\Downloads\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';

        SELECT COUNT(*) AS erp_px_cat_g1v2_count
        FROM bronze.erp_px_cat_g1v2;


        -------------------------------------------------------------------------------
        -- SUCCESS
        -------------------------------------------------------------------------------

        PRINT '=======================================================================================';
        PRINT 'Bronze Layer Loaded Successfully';
        PRINT '=======================================================================================';

	SET @batch_end_time = GETDATE();

    PRINT '>> Whole Bronze Layer Load Duration: '
            + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR)
            + ' seconds';
    END TRY

    BEGIN CATCH

        PRINT '=======================================================================================';
        PRINT 'ERROR OCCURRED WHILE LOADING BRONZE LAYER';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR);
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR);
        PRINT '=======================================================================================';

    END CATCH;

END;
GO
