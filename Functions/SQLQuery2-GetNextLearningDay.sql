--SQLQuery2-GetNextLearningDay.sql
USE P_421_Import;
SET DATEFIRST 1;
GO

ALTER FUNCTION GetNextLearningDay(@date AS DATE, @group_name AS NVARCHAR(10)) RETURNS TINYINT 
AS
BEGIN
    DECLARE @learning_days AS TINYINT = (SELECT learning_days FROM Groups WHERE group_name=@group_name);
    DECLARE @next_day AS TINYINT = (DATEPART(WEEKDAY, @date) % 7) + 1;

	WHILE (@learning_days & POWER(2, @next_day - 1)) = 0
        SET @next_day = (@next_day % 7) + 1;

    RETURN @next_day;
END
GO

CREATE FUNCTION GetNextLearningDate(@date DATE, @group_name NVARCHAR(10)) RETURNS DATE
AS
BEGIN
    DECLARE @next_date TINYINT = dbo.GetNextLearningDay(@date, @group_name);
    
    SET @date = DATEADD(DAY, 1, @date);
    WHILE DATEPART(WEEKDAY, @date) != @next_date
		SET @date = DATEADD(DAY, 1, @date);

    RETURN @date;
END
GO
