/****** Script for SelectTopNRows command from SSMS  ******/
use[Lymes]
GO
create function ClearNonNumericCharacters(@str nvarchar(max))
returns nvarchar(max)
as
begin
 while patindex('%[^0-9]%', @str) > 0
  set @str = stuff(@str, patindex('%[^0-9]%', @str), 1, '')
 return @str
end
GO

WITH CTE AS(
SELECT CAST(LEFT([Year],4) AS INT) AS Year
      ,CAST(dbo.ClearNonNumericCharacters(White) AS INT) AS white
      ,CAST(dbo.ClearNonNumericCharacters(Black) AS INT) AS Black
      ,CAST(dbo.ClearNonNumericCharacters(His_panic) AS INT) AS His_panic
      ,CAST(dbo.ClearNonNumericCharacters(Asian) AS INT) AS Asian
      ,CAST(dbo.ClearNonNumericCharacters(Pacific_Islander) AS INT) AS Pacific_Islander
      ,CAST(dbo.ClearNonNumericCharacters(American_Indian_Alaska_Native) AS INT) AS American_Indian_Alaska_Native
      ,CAST(dbo.ClearNonNumericCharacters(Two_or_more_races) AS INT) AS Two_or_more_races
FROM usPopulationbyRace
)

SELECT Year,SUM(WHITE) AS White,SUM(BLACK) AS Black,SUM(HIS_PANIC) AS Hispanic,
SUM(ASIAN) AS Asian, SUM(PACIFIC_ISLANDER) AS Pacific_Islander,
SUM(AMERICAN_INDIAN_ALASKA_NATIVE) AS American_Indian_Alaska_Native ,
SUM(TWO_OR_MORE_RACES) AS Two_or_more_races
INTO UsPopulation
FROM CTE
WHERE YEAR BETWEEN 2008 AND 2021
GROUP BY YEAR
  
SELECT *
FROM UsPopulation
