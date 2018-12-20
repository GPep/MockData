USE MockData
GO

IF OBJECT_ID('USP_GenerateEmail') IS NULL
  EXEC ('CREATE PROCEDURE USP_GenerateEmail AS RETURN 0;')
GO

ALTER PROCEDURE USP_GenerateEmail @id INT = 1, @surname varchar(50)
AS
BEGIN

/*This stored procedure is only run from inside the usp_createMaleIndividual and usp_CreateFemaleIndividual Stored procedures to create a 
a relevent email address*/


SET NOCOUNT ON


DECLARE @Random_email_id INT;
DECLARE @Upper INT;
DECLARE @Lower INT;
DECLARE @Random_suffix Varchar(50)
DECLARE @Random INT


TRUNCATE TABLE data.EmailAddress


--Create String Table

IF OBJECT_ID('tempdb.dbo.#RandomEmailAddress') IS NOT NULL
BEGIN
DROP Table #RandomEmailAddress;
END;


CREATE Table #RandomEmailAddress
(Id INT NOT NULL, 
Email VARCHAR(50))


--Create random string view

---- This will create a random number between 1 and 999
SET @Lower = 1 ---- The lowest random number
SET @Upper = 9 ---- The highest random number
SELECT @Random  = ROUND(((@Upper - @Lower -1) * RAND() + @Lower),0)

SELECT @Random_suffix = email.NAME FROM dbo.Email
WHERE id = @Random



INSERT INTO data.EmailAddress(id, email)
SELECT @id, @surname + '@' + @Random_suffix




DROP Table #RandomEmailAddress;



END

--Example - Create email address
--EXECUTE USP_GenerateEmail @id = 1, @surname = 'Pepper'


--SELECT * FROM data.EmailAddress