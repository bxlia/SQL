--SQLQuery0-CHECK.sql
USE P_421_Import;
SET DATEFIRST 1;

--PRINT dbo.GetTeacherID(N'Юыху');
--PRINT dbo.GetNextLearningDay(N'2026-04-25', N'P_421');
--PRINT dbo.GetNextLearningDate(N'2026-04-25', N'P_421');

--PRINT dbo.GetNewYearHolidaysStartDate(2026);
--PRINT dbo.GetSummerHolidaysStartDate(2023);
PRINT dbo.GetEasterDate(2026);