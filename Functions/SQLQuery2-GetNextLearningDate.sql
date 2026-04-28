--SQLQuery2-GetNextLearningDate.sql
USE P_421_Import;

GO

ALTER FUNCTION GetNextLearningDate(@group_name NVARCHAR(10), @date DATE) RETURNS DATE
AS
BEGIN
    DECLARE @next_date TINYINT = dbo.GetNextLearningDay(@date, @group_name);
    
    SET @date = DATEADD(DAY, 1, @date);
    WHILE DATEPART(WEEKDAY, @date) != @next_date
		SET @date = DATEADD(DAY, 1, @date);

    RETURN @date;
END