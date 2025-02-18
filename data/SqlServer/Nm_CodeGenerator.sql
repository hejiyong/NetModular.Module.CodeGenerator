USE [master]
GO
/****** Object:  Database [Nm_CodeGenerator]    Script Date: 2019/9/29 14:34:30 ******/
CREATE DATABASE [Nm_CodeGenerator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nm_CodeGenerator', FILENAME = N'D:\Database\SqlServer\Nm_CodeGenerator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nm_CodeGenerator_log', FILENAME = N'D:\Database\SqlServer\Nm_CodeGenerator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nm_CodeGenerator] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nm_CodeGenerator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nm_CodeGenerator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nm_CodeGenerator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Nm_CodeGenerator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nm_CodeGenerator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET RECOVERY FULL 
GO
ALTER DATABASE [Nm_CodeGenerator] SET  MULTI_USER 
GO
ALTER DATABASE [Nm_CodeGenerator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nm_CodeGenerator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nm_CodeGenerator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nm_CodeGenerator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nm_CodeGenerator] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nm_CodeGenerator', N'ON'
GO
ALTER DATABASE [Nm_CodeGenerator] SET QUERY_STORE = OFF
GO
USE [Nm_CodeGenerator]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[BaseEntityType] [smallint] NOT NULL,
	[Remarks] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Method]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Method](
	[Id] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[Query] [bit] NOT NULL,
	[Add] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enum]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enum](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Remarks] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enum_Item]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enum_Item](
	[Id] [uniqueidentifier] NOT NULL,
	[EnumId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [int] NOT NULL,
	[Remarks] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model_Property]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model_Property](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[ModelType] [smallint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Type] [smallint] NOT NULL,
	[Nullable] [bit] NOT NULL,
	[EnumId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](200) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[No] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Copyright] [nvarchar](200) NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedTime] [datetime] NOT NULL,
	[DeletedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 2019/9/29 14:34:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectId] [uniqueidentifier] NOT NULL,
	[ClassId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsPrimaryKey] [bit] NOT NULL,
	[IsInherit] [bit] NOT NULL,
	[Type] [smallint] NOT NULL,
	[Length] [int] NOT NULL,
	[Precision] [int] NOT NULL,
	[Scale] [int] NOT NULL,
	[EnumId] [uniqueidentifier] NOT NULL,
	[Nullable] [bit] NOT NULL,
	[Remarks] [nvarchar](200) NOT NULL,
	[Sort] [int] NOT NULL,
	[ShowInList] [bit] NOT NULL,
	[HasDefaultValue] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ModifiedTime] [datetime] NOT NULL,
	[ModifiedBy] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [BaseEntityType]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Class_Method] ADD  DEFAULT ((0)) FOR [Query]
GO
ALTER TABLE [dbo].[Class_Method] ADD  DEFAULT ((0)) FOR [Add]
GO
ALTER TABLE [dbo].[Class_Method] ADD  DEFAULT ((0)) FOR [Delete]
GO
ALTER TABLE [dbo].[Class_Method] ADD  DEFAULT ((0)) FOR [Edit]
GO
ALTER TABLE [dbo].[Class_Method] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Class_Method] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Enum] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Enum] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Enum_Item] ADD  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Model_Property] ADD  DEFAULT ((0)) FOR [ModelType]
GO
ALTER TABLE [dbo].[Model_Property] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Model_Property] ADD  DEFAULT ((0)) FOR [Nullable]
GO
ALTER TABLE [dbo].[Model_Property] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Model_Property] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Model_Property] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT ((0)) FOR [No]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (getdate()) FOR [DeletedTime]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [IsPrimaryKey]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [IsInherit]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [Length]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [Precision]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [Scale]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [Nullable]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [ShowInList]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT ((0)) FOR [HasDefaultValue]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Property] ADD  DEFAULT (getdate()) FOR [ModifiedTime]
GO
USE [master]
GO
ALTER DATABASE [Nm_CodeGenerator] SET  READ_WRITE 
GO
