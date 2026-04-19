--SQLQuery2-INSERT Schedule.sql
USE P_421_Import;
SET DATEFIRST 1;    -- 1 - Ïí., 2 - Âò., 3 - Ñð.....

DECLARE @group              AS INT      = (SELECT group_id          FROM Groups        WHERE group_name = N'P_421');
DECLARE @discipline         AS SMALLINT = (SELECT discipline_id     FROM Disciplines   WHERE discipline_name LIKE N'%MS SQL Server');
DECLARE @number_of_lessons  AS TINYINT  = (SELECT number_of_lessons FROM Disciplines   WHERE discipline_name LIKE N'%MS SQL Server');
DECLARE @lesson_number      AS TINYINT  = 0;
DECLARE @teacher            AS SMALLINT = (SELECT teacher_id        FROM Teachers      WHERE first_name LIKE N'Îëåã');
DECLARE @start_date         AS DATE     = N'2026-03-26';
DECLARE @date               AS DATE     = @start_date;
DECLARE @start_time         AS TIME(0)  = N'14:00';
DECLARE @time               AS TIME(0);
DECLARE @next_lesson_id     AS INT      = ISNULL((SELECT MAX(lesson_id) FROM Schedule), 0) + 1;

WHILE @lesson_number < @number_of_lessons
BEGIN
    SET @time = @start_time;
    
    PRINT FORMATMESSAGE(N'%s %s %s %i', CAST(@date AS NVARCHAR), CAST(@time AS NVARCHAR), DATENAME(WEEKDAY, @date), @lesson_number + 1);
    SET @time = DATEADD(MINUTE, 95, @time);
    
	IF NOT EXISTS (SELECT 1 FROM Schedule WHERE [group]=@group AND discipline=@discipline AND teacher=@teacher AND [date]=@date AND [time]=@time)
    INSERT Schedule (lesson_id, [group], discipline, teacher, [date], [time], spent)
    VALUES          (@next_lesson_id, @group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0));
    
    SET @next_lesson_id += 1;
    SET @lesson_number += 1;

    PRINT FORMATMESSAGE(N'%s %s %s %i', CAST(@date AS NVARCHAR), CAST(@time AS NVARCHAR), DATENAME(WEEKDAY, @date), @lesson_number + 1);
    
    IF NOT EXISTS (SELECT 1 FROM Schedule WHERE [group]=@group AND discipline=@discipline AND teacher=@teacher AND [date]=@date AND [time]=@time)
		INSERT Schedule (lesson_id, [group], discipline, teacher, [date], [time], spent)
    VALUES          (@next_lesson_id, @group, @discipline, @teacher, @date, @time, IIF(@date < GETDATE(), 1, 0));
    
    SET @next_lesson_id += 1;
    SET @date = DATEADD(DAY, IIF(DATEPART(WEEKDAY, @date) = 2, 2, 5), @date);
    SET @lesson_number += 1;
    
    PRINT N'--------------------------------------------------------------------------------------';
END