USE [MockData]
GO

IF OBJECT_ID('USP_CreateBusiness') IS NULL
  EXEC ('CREATE PROCEDURE USP_CreateBusiness AS RETURN 0;')
GO

ALTER PROCEDURE USP_CreateBusiness @count INT = 1
AS
BEGIN

SET NOCOUNT ON;

DECLARE @Random_Business_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_Business_name varchar(50)
DECLARE @Counter INT 
DECLARE @Random INT


SET @Counter = 0


TRUNCATE TABLE data.business


IF Object_ID('tempdb.dbo.#business','u') IS NOT NULL
BEGIN
DROP TABLE #business
END

CREATE TABLE #business
([name] [varchar](50) NULL
)


WHILE @Counter < @Count
BEGIN

SET @Lower = (SELECT MIN(id) FROM BusinessName) ---- The lowest random number
SET @Upper = (SELECT MAX(id) FROM BusinessName) ---- The highest random number
SELECT @Random_business_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)


SELECT @Random_business_name = businessName.Name FROM businessName
WHERE id = @Random_business_id

INSERT INTO #Business(Name)
VALUES(@Random_Business_name)

SET @Counter = @Counter + 1

END


INSERT INTO data.Business(name)
SELECT Name FROM #Business



DROP TABLE #Business


END

--Example
--EXECUTE usp_CreateBusiness 100
