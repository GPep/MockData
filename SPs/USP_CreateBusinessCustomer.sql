USE MockData
GO
-- Create Random street name
IF OBJECT_ID('usp_createBusinessCustomer') IS NULL
  EXEC ('CREATE PROCEDURE usp_createBusinessCustomer AS RETURN 0;')
GO

ALTER PROCEDURE usp_createBusinessCustomer @Count INT
AS

BEGIN

SET NOCOUNT ON

--declare variables for any error reporting
DECLARE @ErrorNumber AS INT, @ErrorMessage AS NVarchar(1000), @error_severity AS INT



BEGIN TRY;
BEGIN TRANSACTION;

EXECUTE USP_CreateBusiness @Count = @Count
EXECUTE USP_GeneratePhoneNumber @Count = @Count
EXECUTE USP_GenerateAddress @Count = @Count

COMMIT TRANSACTION;

END TRY


BEGIN CATCH
IF @@Trancount > 0 
ROLLBACK TRANSACTION;
SELECT @errornumber = ERROR_NUMBER(), @errormessage = ERROR_MESSAGE(),
@error_severity = ERROR_SEVERITY();
raiserror ('USP_CreateBusinessCustomer Failed: %d: %s', 16, 1, @errornumber, @errormessage);
END CATCH


END
