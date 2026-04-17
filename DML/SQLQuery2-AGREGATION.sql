--SQLQuery2-AGREGATION.sql
USE P_421_Import;

--SELECT COUNT(*) FROM Directions;

--SELECT
--		[Направление обучения] = direction_name,
--		[Количество групп] = COUNT(group_id)
--FROM Groups, Directions
--WHERE direction=direction_id
--GROUP BY direction_name
--;

--SELECT
--		[Направление группы] = group_name,
--		[Количество студентов] = COUNT(stud_id)
--FROM Groups, Students
--WHERE [group]=group_id
--GROUP BY group_name
--;

--SELECT
--		[Направление обучения] = direction_name,
--		[Количество студентов] = COUNT(stud_id)
--FROM Students, Directions, Groups
--WHERE direction=direction_id AND [group]=group_id
--GROUP BY direction_name
--;

--SELECT
--		[Дисциплина обучения] = discipline_name,
--		[Количество преподователей] = COUNT(teacher_id)
--FROM Teachers, Disciplines, TeachersDisciplinesRelation
--WHERE discipline=discipline_id AND teacher=teacher_id
--GROUP BY discipline_name
--;

--всех студентов от 25 до 35 лет

--1
--SELECT 
--		[Студенты от 25 до 35 лет] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
--		[Возраст] = DATEDIFF(HOUR, birth_date, GETDATE())/8766
--FROM Students
--WHERE DATEDIFF(YEAR, birth_date, GETDATE()) >=25
--AND DATEDIFF(YEAR, birth_date, GETDATE()) <=35;

--2
--SELECT
--		[Название группы] = group_name,
--		[Количество студентов] = COUNT(stud_id)
--FROM Groups, Students
--WHERE [group]=group_id
--AND stud_id < 10
--GROUP BY group_name
--;

--3
--SELECT
--		[Название группы] = group_name,
--		[Количество студентов] = COUNT(stud_id)
--FROM Groups, Students
--WHERE [group]=group_id
--AND stud_id IS NULL
--GROUP BY group_name
--;

--4
--INSERT Disciplines(discipline_id, discipline_name, number_of_lessons)
--VALUES
--		(1, N'ООП', 1),
--		(2, N'С++', 11),
--		(3, N'С++', 21),
--		(4, N'UML', 27),
--		(5, N'Файлы', 31),
--		(6, N'Классы', 33),
--		(7, N'Windows Forms', 41),
--		(8, N'ERD', 47),
--		(9, N'SQL', 53)
--;

--INSERT Teachers(teacher_id, first_name, last_name)
--VALUES
--		(1, N'Илья', N'Ермилов'),
--		(2, N'Олег', N'Ковтун')
--;

--INSERT Groups(group_id, group_name)
--VALUES
--		(1, N'P_421')
--;

--INSERT Schedule(lesson_id, [group], discipline, teacher, [date], [time], spent)
--VALUES
--		(1, 1, 1, 1, N'02-09-2025', N'14:00', 1),
--		(2, 1, 1, 2, N'04-09-2025', N'14:00', 1),
--		(3, 1, 2, 3, N'16-09-2025', N'14:00', 1),
--		(4, 1, 2, 4, N'07-10-2025', N'14:00', 1),
--		(5, 1, 2, 5, N'11-11-2025', N'14:00', 1),
--		(6, 1, 2, 6, N'18-12-2025', N'14:00', 1),
--		(7, 1, 2, 7, N'05-03-2025', N'14:00', 1),
--		(8, 1, 2, 8, N'31-03-2025', N'14:00', 1),
--		(9, 1, 2, 9, N'17-04-2026', N'14:00', 0)
--;
