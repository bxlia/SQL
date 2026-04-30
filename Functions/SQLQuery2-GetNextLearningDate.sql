--SQLQuery2-GetNextLearningDate.sql
USE P_421_Import;

GO

ALTER FUNCTION GetNextLearningDate(@group_name NVARCHAR(10), @date DATE) RETURNS DATE
AS
BEGIN
 --   DECLARE @next_date TINYINT = dbo.GetNextLearningDay(@date, @group_name);
    
 --   SET @date = DATEADD(DAY, 1, @date);
 --   WHILE DATEPART(WEEKDAY, @date) != @next_date
	--SET @date = DATEADD(DAY, 1, @date);
	DECLARE @interval AS INT       = CAST(dbo.GetNextLearningDay(@date, @group_name)AS INT) - DATEPART(WEEKDAY, @date) != @next_date
	If @interval < 0 SET @interval = @interval+7;
	DECLARE @next_date AS DATE     = DATEADD(DAY, @interval, @date);
	IF EXISTS(SELECT holiday FROM DaysOFF WHERE [date]=@next_date)
		SET @next_date = dbo.GetNextLearningDate(@group_name, @next_date);

    RETURN @next_date;
END