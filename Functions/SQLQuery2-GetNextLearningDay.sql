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
	--WHILE @next_day < 14
	--BEGIN
	--	IF (POWER(2, @next_day%7-1) & @learning_days) <> 0 RETURN @next_day%7+1;
	--	SET @next_day+=1;
	--END
	--RETURN @next_day%7+1;
END



