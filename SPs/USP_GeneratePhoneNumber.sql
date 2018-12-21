USE MockData
GO

IF OBJECT_ID('USP_GeneratePhoneNumber') IS NULL
  EXEC ('CREATE PROCEDURE USP_GeneratePhoneNumber AS RETURN 0;')
GO

ALTER PROCEDURE USP_GeneratePhoneNumber @count INT = 1
AS
BEGIN


SET NOCOUNT ON


DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random1 INT;
DECLARE @Random2 INT;
DECLARE @Random3 INT;
DECLARE @Random4 INT;
DECLARE @Random5 INT;
DECLARE @Random6 INT;
DECLARE @Random7 INT;
DECLARE @Random8 INT;
DECLARE @Random9 INT;
DECLARE @Random10 INT;

DECLARE @RandomString1 Char(1)
DECLARE @RandomString2 Char(1)
DECLARE @RandomString3 Char(1)
DECLARE @RandomString4 Char(1)
DECLARE @RandomString5 Char(1)
DECLARE @RandomString6 Char(1)
DECLARE @RandomString7 Char(1)
DECLARE @RandomString8 Char(1)
DECLARE @RandomString9 Char(1)
DECLARE @RandomString10 Char(1)

DECLARE @Counter INT


SET @Counter = 0


TRUNCATE TABLE data.PhoneNumber


--Create String Table

IF OBJECT_ID('tempdb.dbo.#RandomPhone') IS NOT NULL
BEGIN
DROP Table #RandomPhone;
END;


CREATE Table #RandomPhone
(Id INT IDENTITY NOT NULL, 
String VARCHAR(1))
INSERT INTO #RandomPhone(String)
VALUES
('0'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9')


WHILE @Counter < @count
BEGIN

--Create random string view

---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 9 ---- The highest random number
SELECT @Random1 = 0
SELECT @Random2 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random3 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random4 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random5 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random6 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random7 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random8 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random9 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)
SELECT @Random10 = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)


SELECT @RandomString1 = @Random1
SELECT @RandomString2 = String FROM #RandomPhone WHERE id = @Random2
SELECT @RandomString3 = String FROM #RandomPhone WHERE id = @Random3
SELECT @RandomString4 = String FROM #RandomPhone WHERE id = @Random4
SELECT @RandomString5 = String FROM #RandomPhone WHERE id = @Random5
SELECT @RandomString6 = String FROM #RandomPhone WHERE id = @Random6
SELECT @RandomString7 = String FROM #RandomPhone WHERE id = @Random7
SELECT @RandomString8 = String FROM #RandomPhone WHERE id = @Random8
SELECT @RandomString9 = String FROM #RandomPhone WHERE id = @Random9
SELECT @RandomString10 = String FROM #RandomPhone WHERE id = @Random10



INSERT INTO data.PhoneNumber(PhoneNumber)
SELECT @RandomString1 + @RandomString2 + @RandomString3 + @RandomString4 + @RandomString5 + @RandomString6 + @RandomString7 + @RandomString8 + @randomString9 + @RandomString10

SET @Counter = @Counter + 1
END


DROP Table #RandomPhone;



END

--Example - Create 100 Phone numbers
--EXECUTE USP_GeneratePhoneNumber 100


--SELECT * FROM data.PhoneNumber