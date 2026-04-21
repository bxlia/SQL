--SQLQuery1-SELECT Schedule.sql
USE P_421_Import;

SELECT * FROM Schedule;
--DELETE FROM Schedule;

SELECT 
    lesson_id AS N'ID',
    (SELECT group_name											FROM Groups		 WHERE group_id = [group])		   AS N'Группа',
    (SELECT discipline_name										FROM Disciplines WHERE discipline_id = discipline) AS N'Дисциплина',
    (SELECT last_name + ' ' + first_name + ' ' + middle_name	FROM Teachers	 WHERE teacher_id = teacher)	   AS N'Преподаватель',
    [date] AS N'Дата',
    [time] AS N'Время',
    DATENAME(WEEKDAY, [date]) AS N'День недели',
    CASE WHEN spent = 1 THEN N'Проведено' ELSE N'Запланировано' END AS N'Статус'
FROM Schedule
ORDER BY [date], [time];
