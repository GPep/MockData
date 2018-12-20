USE MockData
GO
-- Create Random street name
IF OBJECT_ID('USP_GenerateRandomStreetName') IS NULL
  EXEC ('CREATE PROCEDURE USP_GenerateRandomStreetName AS RETURN 0;')
GO


ALTER PROCEDURE USP_GenerateRandomStreetName @Count INT = 1
AS
BEGIN

SET NOCOUNT ON

DECLARE @Random_name_id INT;
DECLARE @Random_street_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_name varchar(50)
DECLARE @Random_street varchar(20)
DECLARE @Counter INT 
DECLARE @Random INT


SET @Counter = 0

TRUNCATE TABLE Data.Street_Name

--Populate Table

IF Object_ID('tempdb.dbo.#Street_Name','u') IS NOT NULL
BEGIN
DROP TABLE #Street_Name
END

CREATE TABLE #Street_Name
(Name Varchar(100) NOT NULL
)


WHILE @Counter < @Count
BEGIN

---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 999 ---- The highest random number
SELECT @Random = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SET @Lower = (SELECT MIN(id) FROM Surname) ---- The lowest random number
SET @Upper = (SELECT MAX(id) FROM Surname) ---- The highest random number
SELECT @Random_name_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SET @Lower = (Select MIN(id) From Street_Type)
SET @Upper = (Select Max(id) FROM Street_type)
SELECT @Random_street_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SELECT @Random_name = Surname.Surname FROM Surname
WHERE id = @Random_name_id

SELECT @Random_street = street_type.name FROM Street_Type
WHERE id = @Random_street_id

INSERT INTO #Street_Name(Name)
SELECT CAST(@Random AS VARCHAR) + ' ' + @Random_Name + ' ' + @Random_Street

SET @Counter = @Counter + 1
END

INSERT INTO data.Street_Name(name)
SELECT Name FROM #Street_Name


DROP TABLE #Street_Name


END


--Example create 100 Street Names
--EXECUTE USP_GenerateRandomStreetName 100