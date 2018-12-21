USE MockData
GO


IF OBJECT_ID('data.individual','u') IS NOT NULL
BEGIN
DROP TABLE data.individual
END


CREATE TABLE [data].[Individual](
	[id] INT IDENTITY PRIMARY KEY,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[Title] [varchar](50) NOT NULL
) ON [PRIMARY]

IF OBJECT_ID('data.MaleIndividual','u') IS NOT NULL
BEGIN
DROP TABLE data.MaleIndividual
END

CREATE TABLE [Data].[MaleIndividual](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

IF OBJECT_ID('data.FemaleIndividual','u') IS NOT NULL
BEGIN
DROP TABLE data.FemaleIndividual
END

CREATE TABLE [Data].[FemaleIndividual](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
