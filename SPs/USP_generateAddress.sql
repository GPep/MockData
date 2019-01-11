USE [MockData]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('USP_GenerateAddress') IS NULL
  EXEC ('CREATE PROCEDURE USP_GenerateAddress AS RETURN 0;')
GO


ALTER PROCEDURE USP_GenerateAddress @Count INT = 1
AS
BEGIN

SET NOCOUNT ON

-- =============================================
-- Author:		Glenn Pepper
-- Create date: 2018-11-16
-- Version: 1.0
-- Description:	This Stored Procedure will create a new address
-- =============================================

EXECUTE USP_GenerateRandomStreetName @count 
EXECUTE USP_GenerateTown @Count
EXECUTE USP_GenerateLocation @count
EXECUTE USP_GenerateRandomPostCode @count


TRUNCATE TABLE Data.Address

--Populate Table

IF Object_ID('tempdb.dbo.#Address','u') IS NOT NULL
BEGIN
DROP TABLE #Address
END

CREATE TABLE #Address
(Address1 Varchar(100) NOT NULL,
Town Varchar(50) NOT NULL,
County Varchar(50) NOT NULL,
Country Varchar(25) NOT NULL,
Post_code Varchar(7) NOT NULL
)

INSERT INTO #Address (Address1, town, County, Country, Post_code)
SELECT sn.name, tn.Name, loc.county, loc.country, pc.Name
FROM data.Street_Name AS sn
INNER JOIN data.town as tn 
ON sn.ID = tn.ID
INNER JOIN data.location as loc
ON sn.ID = loc.ID
INNER JOIN data.PostCode AS pc
ON sn.id = pc.ID

INSERT INTO data.Address(Address1, town, County, Country, Post_code)
SELECT Address1, town, County, Country, Post_code
FROM #Address

DROP TABLE #Address

END

--EXECUTE usp_generateAddress @count = 500