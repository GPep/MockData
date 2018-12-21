USE MockData
GO

CREATE FUNCTION fn_checkForValidEmail(@email varchar(100))
RETURNS BIT
AS
BEGIN
DECLARE @isValid BIT
IF @email <> '' AND @email NOT LIKE '_%@__%.__%' SET @isvalid = '0';
ELSE SET @isvalid = '1';
RETURN @isvalid;
END