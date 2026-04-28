--SQLQuery7-GetNewYearHolidaysStartDate.sql
USE P_421_Import;
SET DATEFIRST 1;
GO

ALTER FUNCTION GetNewYearHolidaysStartDate(@year AS SMALLINT) RETURNS DATE
AS
BEGIN
	DECLARE @start_date AS  DATE        = DATEFROMPARTS(@year, 1,1);
	DECLARE @weekday    AS  TINYINT     = DATEPART(WEEKDAY, @start_date);
	IF @weekday > 4  OR @weekday=1    
		SET @start_date = DATEADD(DAY, -2, @start_date);
	ELSE				SET @start_date	= DATEADD(DAY, 1 - @weekday, @start_date);
		SET @start_date = DATEADD(DAY, 1-@weekday, @start_date);
	RETURN @start_date;
END