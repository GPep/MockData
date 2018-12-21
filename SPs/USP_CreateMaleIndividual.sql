USE [MockData]
GO

IF OBJECT_ID('USP_CreateMaleIndividual') IS NULL
  EXEC ('CREATE PROCEDURE USP_CreateMaleIndividual AS RETURN 0;')
GO

ALTER PROCEDURE USP_CreateMaleIndividual @count INT = 1
AS
BEGIN

SET NOCOUNT ON;

DECLARE @Random_Male_id INT;
DECLARE @Random_Surname_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_Male_name varchar(50)
DECLARE @Random_Surname VARCHAR(50)
DECLARE @Counter INT 
DECLARE @Random INT
DECLARE @Random_title_id INT
DECLARE @Random_Title Char(4)
DECLARE @EmailAddress Varchar(50)

SET @Counter = 0


TRUNCATE TABLE data.MaleIndividual

IF Object_ID('tempdb.dbo.#MaleIndividual','u') IS NOT NULL
BEGIN
DROP TABLE #MaleIndividual
END

CREATE TABLE #MaleIndividual
([first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[gender] [varchar](1) NULL,
	[Title] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL
)

IF OBJECT_ID('tempdb.dbo.#MaleTitle') IS NOT NULL
BEGIN
DROP TABLE #MaleTitle 
END

CREATE TABLE #MaleTitle
(ID INT IDENTITY NOT NULL,
Title Varchar(4) NOT NULL) 

INSERT INTO #MaleTitle(Title)
SELECT Title FROM Title
WHERE GENDER IN ('M','B')

INSERT INTO #MaleTitle(Title)
VALUES('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr'),('Mr') --improve selection

WHILE @Counter < @Count
BEGIN

SET @Lower = (SELECT MIN(id) FROM FirstNames WHERE GENDER = 'M') ---- The lowest random number
SET @Upper = (SELECT MAX(id) FROM FirstNames WHERE GENDER = 'M') ---- The highest random number
SELECT @Random_male_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SET @Lower = (SELECT MIN(id) FROM Surname) ---- The lowest random number
SET @Upper = (SELECT MAX(id) FROM Surname) ---- The highest random number
SELECT @Random_Surname_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)

SET @Lower = (SELECT MIN(ID) FROM #MaleTitle)
SET @Upper = (SELECT MAX(ID) FROM #MaleTitle) 
SELECT @Random_title_id = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)



SELECT @Random_Male_name = FirstNames.Name FROM FirstNames
WHERE id = @Random_male_id

SELECT @Random_surname = Surname.Surname FROM Surname
WHERE id = @Random_surname_id

SELECT @Random_Title = Title FROM #MaleTitle
WHERE id = @Random_title_id

EXECUTE USP_GenerateEmail @surname = @Random_surname

SELECT @EmailAddress = email FROM data.EmailAddress

INSERT INTO #MaleIndividual(First_Name, last_name, gender, Title, EmailAddress)
VALUES(@Random_Male_name, @Random_Surname, 'M', @Random_title, @EmailAddress)




SET @Counter = @Counter + 1

END


INSERT INTO data.MaleIndividual(first_name, last_name, gender, Title, EmailAddress)
SELECT First_Name, Last_name, gender, title, EmailAddress FROM #MaleIndividual



DROP TABLE #MaleIndividual


END

--Example
--EXECUTE usp_CreateMaleIndividual 100


