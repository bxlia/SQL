--SQLQuery2-GetNextLearningDate.sql
USE P_421_Import;

GO

ALTER FUNCTION GetNextLearningDate(@date DATE, @group_name NVARCHAR(10)) RETURNS DATE
AS
BEGIN
    DECLARE @next_date TINYINT = dbo.GetNextLearningDay(@date, @group_name);
    
    SET @date = DATEADD(DAY, 1, @date);
    WHILE DATEPART(WEEKDAY, @date) != @next_date
		SET @date = DATEADD(DAY, 1, @date);

    RETURN @date;
END