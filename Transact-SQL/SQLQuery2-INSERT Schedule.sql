--SQLQuery2-INSERT Schedule.sql
USE P_421_Import;
SET DATEFIRST 1; --1 - Ïם, 2 - Âע ט עה

--INSERT Groups(group_id, group_name, direction) VALUES (421, N'P_421', 1);

DECLARE @group				AS INT		= (SELECT group_id		FROM Groups		 WHERE group_name=N'P_421');
DECLARE @discipline			AS SMALLINT = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE N'%MS SQL Server');
DECLARE @number_of_lessons	AS TINYINT	= (SELECT number_of_lessons FROM Disciplines WHERE discipline_name LIKE N'%MS SQL Server');
DECLARE @lesson_number		AS TINYINT	= 0
DECLARE @teacher			AS SMALLINT = (SELECT teacher_id	FROM Teachers	 WHERE first_name LIKE N'Îכוד');
DECLARE @start_date			AS DATE		= N'2026-03-06';
DECLARE @date				AS DATE		= @start_date;
DECLARE @start_time			AS TIME(0)	= N'14:00';
DECLARE @time				AS TIME(0);

WHILE @lesson_numder < @number_of_lessons
BEGIN	--{
	SET @time = @start_time;

	PRINT FORMATMESSAGE(N'%s %s %s %i', CAST(@date AS NVARCHAR), CAST(@time AS NVARCHAR), DATENAME(WEEKDAY, @lesson_number+1);
	SET @time = DATEADD(MINUTE, 95, @time);
	INSERT Schedule([group], discipline, teacher, [date], [time], spent)
	VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
	SET @lesson_number += 1;

	PRINT FORMATMESSAGE(N'%s %s %s %i', @date, @time, DATENAME(WEEKDAY, lesson_number+1);
	INSERT Schedule([group], discipline, teacher, [date], [time], spent)
	VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
	SET @date = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date)=2,2,5), @date);
	SET @lesson_number += 1;
	PRINT N'-----------------------------------------------------------------------------';
END		--}