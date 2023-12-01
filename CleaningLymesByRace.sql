/****** Script for SelectTopNRows command from SSMS  ******/
SELECT * FROM LymesByRACE

 EXEC  sp_RENAME 'lymesByRace.Pacific_Islander', 'Asian/PacificIslander', 'COLUMN';

SELECT Year, [Asian/Pacific Islander] AS [Asian/PacificIslander], [Black],[Native American],[Other],
[Unknown],[White]
INTO UsPopulationRace
FROM Lyme_Disease_Number_of_Cases_by_Race_United_States
PIVOT(
SUM(cases)
FOR race IN ([Asian/Pacific Islander], [Black],[Native American],[Other],
[Unknown],[White])
)AS pivotTable

ALTER TABLE UsPopulationRace
ADD Other1 INT

UPDATE UsPopulationRace
SET Other1 = Other + Unknown

ALTER TABLE UsPopulationRace
DROP COLUMN Other, Unknown


EXEC  sp_RENAME 'UsPopulationRace.Other1', 'Other', 'COLUMN';
SELECT *
FROM UsPopulationRace

exec sp_rename 'UsPopulationRace', 'LymesRace'

SELECT *
FROM LymesRace

SELECT * FROM Lyme_Disease_Number_of_Cases_by_Race_United_States


SELECT year,	[Asian/pacific islander] AS [Pacific_Islander], [Black],
  [Native American], [White]
  INTO lymesByRace
  FROM Lyme_Disease_Number_of_Cases_by_Race_United_States
  PIVOT (
  SUM(cases)
  FOR race IN ([Asian/pacific islander], [Black],
  [Native American], [White])) AS pivotTable 
  
  SELECT * FROM lymesByRace
