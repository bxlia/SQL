--SQLQuery0-CHECK PROCEDURES.sql
USE P_421_Import;

--DELETE FROM Schedule;

EXECUTE sp_InsertSchedule N'P_421', N'% MS SQL Server', N'Юыху', N'2026-03-26', N'14:00', N'2,4,6';
EXECUTE sp_InsertSchedule N'P_422', N'% MS SQL Server', N'Юыху', N'2026-03-26', N'14:00', N'1,3,5';
EXECUTE sp_SelectSchedule;