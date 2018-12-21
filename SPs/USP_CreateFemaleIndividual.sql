USE [MockData]
GO

IF OBJECT_ID('USP_CreateFemaleIndividual') IS NULL
  EXEC ('CREATE PROCEDURE USP_CreateFemaleIndividual AS RETURN 0;')
GO

ALTER PROCEDURE USP_CreateFemaleIndividual @count INT = 1
AS
BEGIN

SET NOCOUNT ON;


DECLARE @Random_Female_id INT;
DECLARE @Random_Surname_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_Female_name varchar(50)
DECLARE @Random_Surname VARCHAR(50)
DECLARE @Counter INT 
DECLARE @Random INT
DECLARE @Random_title_id INT
DECLARE @Random_Title Char(4)
DECLARE @EmailAddress Varchar(50)


SET @Counter = 0



TRUNCATE TABLE Data.FemaleIndividual



IF Object_ID('tempdb.dbo.#FemaleIndividual','u') IS NOT NULL
BEGIN
DROP TABLE #FemaleIndividual
END

CREATE TABLE #FemaleIndividual
([first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[gender] [varchar](1) NULL,
	[Title] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL
)

IF OBJECT_ID('tempdb.dbo.#FemaleTitle') IS NOT NULL
BEGIN
DROP TABLE #FemaleTitle 
END

CREATE TABLE #FemaleTitle
(ID INT IDENTITY NOT NULL,
Title Varchar(4) NOT NULL) 

INSERT INTO #FemaleTitle(Title)
SELECT Title FROM Title
WHERE GENDER IN ('F','B')

INSERT INTO #FemaleTitle(Title)
VALUES('Miss'),('Miss'),('Ms'),('Mrs'),('Mrs'),('Mrs'),('Mrs'),('Miss'),('Miss'),('Ms'),('Miss'),('Miss'),('Ms'),('Miss') --improve selection

WHILE @Counter < @Count
BEGIN

SET @Lower = (SELECT MIN(id) FROM FirstNames WHERE GENDER = 'F') ---- The lowest random number
SET @Upper = (SELECT MAX(id) FROM FirstNames WHERE GENDER = 'F') ---- The highest random number
SELECT @Random_female_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SET @Lower = (SELECT MIN(id) FROM Surname) ---- The lowest random number
SET @Upper = (SELECT MAX(id) FROM Surname) ---- The highest random number
SELECT @Random_Surname_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SET @Lower = (SELECT MIN(ID) FROM #FemaleTitle)
SET @Upper = (SELECT MAX(ID) FROM #FemaleTitle) 
SELECT @Random_title_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SELECT @Random_Female_name = FirstNames.Name FROM FirstNames
WHERE id = @Random_female_id

SELECT @Random_surname = Surname.Surname FROM Surname
WHERE id = @Random_surname_id

SELECT @Random_Title = Title FROM #FemaleTitle
WHERE id = @Random_title_id

EXECUTE USP_GenerateEmail @surname = @Random_surname

SELECT @EmailAddress = email FROM data.EmailAddress

INSERT INTO #FemaleIndividual(First_Name, last_name, gender, Title, EmailAddress)
VALUES(@Random_Female_name, @Random_Surname, 'F', @Random_Title, @EmailAddress)

SET @Counter = @Counter + 1

END


INSERT INTO data.FemaleIndividual(first_name, last_name, gender, Title, EmailAddress)
SELECT First_Name, Last_name, gender, title, EmailAddress FROM #femaleIndividual


DROP TABLE #FemaleIndividual

DROP TABLE #FemaleTitle


END


--EXECUTE USP_CreateFemaleIndividual 100
