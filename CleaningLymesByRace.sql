  SELECT year,	[Asian/pacific islander] AS [Pacific_Islander], [Black],
  [Native American], [White]
  INTO lymesByRace
  FROM Lyme_Disease_Number_of_Cases_by_Race_United_States
  PIVOT (
  SUM(cases)
  FOR race IN ([Asian/pacific islander], [Black],
  [Native American], [White])) AS pivotTable 
  
  SELECT * FROM lymesByRace
