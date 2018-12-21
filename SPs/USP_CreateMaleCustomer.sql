USE MockData
GO
-- Create Random street name
IF OBJECT_ID('usp_createMaleCustomer') IS NULL
  EXEC ('CREATE PROCEDURE usp_createMaleCustomer AS RETURN 0;')
GO

ALTER PROCEDURE usp_createMaleCustomer @Count INT = 1
AS

BEGIN

SET NOCOUNT ON

--declare variables for any error reporting
DECLARE @ErrorNumber AS INT, @ErrorMessage AS NVarchar(1000), @error_severity AS INT



BEGIN TRY;
BEGIN TRANSACTION;

EXECUTE USP_CreateMaleIndividual @Count = @Count
EXECUTE USP_GeneratePhoneNumber @Count = @Count
EXECUTE USP_RandomBirthDate @Count = @Count


COMMIT TRANSACTION;

END TRY


BEGIN CATCH
IF @@Trancount > 0 
ROLLBACK TRANSACTION;
SELECT @errornumber = ERROR_NUMBER(), @errormessage = ERROR_MESSAGE(),
@error_severity = ERROR_SEVERITY();
raiserror ('USP_CreateMaleCustomer Failed: %d: %s', 16, 1, @errornumber, @errormessage);
END CATCH


END
