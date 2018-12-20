USE [master]
GO

IF EXISTS(select * from sys.databases where name='MockData')
BEGIN
DROP DATABASE MockData
END


/****** Object:  Database [MockData]    Script Date: 25/06/2018 16:19:17 ******/
CREATE DATABASE [MockData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MockData', FILENAME = N'E:\MSSQL\DATA\MockData.mdf' , SIZE = 209920KB , MAXSIZE = UNLIMITED, FILEGROWTH = 204800KB )
 LOG ON 
( NAME = N'MockData_log', FILENAME = N'L:\MSSQL\LOGS\MockData_log.ldf' , SIZE = 103424KB , MAXSIZE = 2048GB , FILEGROWTH = 102400KB )
GO

ALTER DATABASE [MockData] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MockData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [MockData] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [MockData] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [MockData] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [MockData] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [MockData] SET ARITHABORT OFF 
GO

ALTER DATABASE [MockData] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [MockData] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [MockData] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [MockData] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [MockData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [MockData] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [MockData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [MockData] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [MockData] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [MockData] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [MockData] SET  DISABLE_BROKER 
GO

ALTER DATABASE [MockData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [MockData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [MockData] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [MockData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [MockData] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [MockData] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [MockData] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [MockData] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [MockData] SET  MULTI_USER 
GO

ALTER DATABASE [MockData] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [MockData] SET DB_CHAINING OFF 
GO

ALTER DATABASE [MockData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [MockData] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [MockData] SET  READ_WRITE 
GO


ALTER AUTHORIZATION on DATABASE:: MockData to C4rb0n
GO




