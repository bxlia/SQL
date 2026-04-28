--SQLQuery7-GetHolidaysStartDate.sql
USE P_421_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION GetHolidaysStartDate(@year AS SMALLINT, @holiday_name AS NVARCHAR(150))RETURNS DATE
AS
BEGIN
	DECLARE @start_date AS DATE = 
	CASE    @holiday
	WHEN    @holiday LIKE N'Новый год'
	THEN    
END