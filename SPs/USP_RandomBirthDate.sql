--Create Random Date
USE MockData
GO

IF OBJECT_ID('USP_RandomBirthDate') IS NULL
  EXEC ('CREATE PROCEDURE USP_RandomBirthDate AS RETURN 0;')
GO

ALTER PROCEDURE USP_RandomBirthDate @count INT = 1
AS
BEGIN

SET NOCOUNT ON;

--This creates a random date between 01/01/1935 and 31/12/2000
DECLARE @Counter INT
DECLARE @RandomDate date

SET @Counter = 0

TRUNCATE TABLE data.Birth_Date

WHILE @Counter < @count
BEGIN
SELECT @randomDate = DateAdd(d, ROUND(DateDiff(d, '1935-01-01', '2000-12-31') * RAND(CHECKSUM(NEWID())), 0),
      DATEADD(second,CHECKSUM(NEWID())%48000, '1935-01-01'))

SET @Counter = @Counter +1

INSERT INTO data.Birth_Date(Birth_Date)
VALUES(@RandomDate)

END
END

GO


--Example
--EXECUTE USP_RandomBirthDate 100000


