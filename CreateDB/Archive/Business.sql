USE [MockData]
GO

IF OBJECT_ID('data.Business','u') IS NOT NULL
BEGIN
DROP TABLE data.Business
END

CREATE TABLE [data].[Business](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [varchar](200) NOT NULL UNIQUE)

SET ANSI_PADDING OFF
GO


