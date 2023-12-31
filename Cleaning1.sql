SELECT REPLACE(Ctyname,' COUNTY','') AS county, Stname AS State,
ststatus AS Incidence_Level, 
CAST(Cases2001 AS INT) AS "2001", CAST(Cases2002 AS INT) AS "2002",CAST(Cases2003 AS INT) AS "2003"
,CAST(Cases2004 AS INT) AS "2004",CAST(Cases2005 AS INT) AS "2005",
CAST(Cases2006 AS INT) AS "2006",CAST(Cases2007 AS INT) AS "2007",
CAST(Cases2008 AS INT) AS "2008",CAST(Cases2009 AS INT) AS "2009",
CAST(Cases2010 AS INT) AS "2010",CAST(Cases2011 AS INT) AS "2011",
CAST(Cases2012 AS INT) AS "2012" ,CAST(Cases2013 AS INT) AS "2013",
CAST(Cases2014 AS INT) AS "2014",CAST(Cases2015 AS INT) AS "2015",
CAST(Cases2016 AS INT) AS "2016",CAST(Cases2017 AS INT) AS "2017",
CAST(Cases2018 AS INT)AS "2018",CAST(Cases2019 AS INT) AS "2019",
CAST(Cases2020 AS INT) AS "2020"
FROM Cases_by_county
