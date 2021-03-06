USE [master]
GO
/****** Object:  Database [Minsait]    Script Date: 11/02/2022 12:16:29 a. m. ******/
CREATE DATABASE [Minsait]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Minsait', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Minsait.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Minsait_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Minsait_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Minsait] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Minsait].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Minsait] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Minsait] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Minsait] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Minsait] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Minsait] SET ARITHABORT OFF 
GO
ALTER DATABASE [Minsait] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Minsait] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Minsait] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Minsait] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Minsait] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Minsait] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Minsait] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Minsait] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Minsait] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Minsait] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Minsait] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Minsait] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Minsait] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Minsait] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Minsait] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Minsait] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Minsait] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Minsait] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Minsait] SET  MULTI_USER 
GO
ALTER DATABASE [Minsait] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Minsait] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Minsait] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Minsait] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Minsait] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Minsait] SET QUERY_STORE = OFF
GO
USE [Minsait]
GO
/****** Object:  Table [dbo].[CatPais]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatPais](
	[Id] [int] NOT NULL,
	[strDescripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CatPais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[strIdentificadorFiscal] [varchar](50) NULL,
	[strEmail] [varchar](50) NULL,
	[idPais] [int] NULL,
	[idRazonSocial] [int] NULL,
	[strNombre] [varchar](50) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes_Contacto]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes_Contacto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[idClientes] [int] NOT NULL,
	[idContacto] [int] NOT NULL,
 CONSTRAINT [PK_Clientes_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes_Direccion]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes_Direccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[idClientes] [int] NULL,
	[idDireccion] [int] NULL,
 CONSTRAINT [PK_Clientes_Direccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes_Telefono]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes_Telefono](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdClientes] [int] NULL,
	[IdTelefono] [int] NULL,
 CONSTRAINT [PK_Clientes_Telefono] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[strNombre] [varchar](50) NULL,
	[strPuesto] [varchar](50) NULL,
	[strEmail] [varchar](50) NULL,
	[idTelefono] [int] NULL,
	[strMercado] [varchar](50) NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[strNombre] [varchar](50) NOT NULL,
	[strNumInterior] [varchar](50) NULL,
	[strNumeroExterior] [varchar](50) NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RazonSocial]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RazonSocial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[strNombre] [varchar](50) NOT NULL,
	[strRFC] [varchar](50) NULL,
 CONSTRAINT [PK_RazonSocial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[intNumTelCel] [int] NULL,
	[intNumTelFijo] [int] NULL,
	[intNumTelCasa] [int] NULL,
	[intNumTelTrabajo] [int] NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[strEmail] [varchar](50) NOT NULL,
	[strNombre] [varchar](50) NULL,
	[strRol] [varchar](50) NULL,
	[strPassword] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_CatPais] FOREIGN KEY([idPais])
REFERENCES [dbo].[CatPais] ([Id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_CatPais]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_RazonSocial] FOREIGN KEY([idRazonSocial])
REFERENCES [dbo].[RazonSocial] ([Id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_RazonSocial]
GO
ALTER TABLE [dbo].[Clientes_Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Contacto_Clientes] FOREIGN KEY([idClientes])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Clientes_Contacto] CHECK CONSTRAINT [FK_Clientes_Contacto_Clientes]
GO
ALTER TABLE [dbo].[Clientes_Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Contacto_Contacto] FOREIGN KEY([idContacto])
REFERENCES [dbo].[Contacto] ([Id])
GO
ALTER TABLE [dbo].[Clientes_Contacto] CHECK CONSTRAINT [FK_Clientes_Contacto_Contacto]
GO
ALTER TABLE [dbo].[Clientes_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Direccion_Clientes] FOREIGN KEY([idClientes])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Clientes_Direccion] CHECK CONSTRAINT [FK_Clientes_Direccion_Clientes]
GO
ALTER TABLE [dbo].[Clientes_Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Direccion_Direccion] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([Id])
GO
ALTER TABLE [dbo].[Clientes_Direccion] CHECK CONSTRAINT [FK_Clientes_Direccion_Direccion]
GO
ALTER TABLE [dbo].[Clientes_Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Telefono_Clientes] FOREIGN KEY([IdClientes])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Clientes_Telefono] CHECK CONSTRAINT [FK_Clientes_Telefono_Clientes]
GO
ALTER TABLE [dbo].[Clientes_Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Telefono_Telefono] FOREIGN KEY([IdTelefono])
REFERENCES [dbo].[Telefono] ([Id])
GO
ALTER TABLE [dbo].[Clientes_Telefono] CHECK CONSTRAINT [FK_Clientes_Telefono_Telefono]
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Telefono] FOREIGN KEY([idTelefono])
REFERENCES [dbo].[Telefono] ([Id])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Telefono]
GO
/****** Object:  StoredProcedure [dbo].[paginacionClientes]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paginacionClientes]  
@page int,  
@rows int 
AS 
BEGIN  
 
 SELECT [Id]  
      ,[strIdentificadorFiscal]
      ,[strEmail]
      ,[idPais]
      ,[idRazonSocial]
	  ,[strNombre]
 ,COUNT(*) OVER() TotalRecords
 FROM Clientes
 order by [Id]
 OFFSET @page - 1 ROWS                  
 FETCH NEXT @rows ROWS ONLY
 
END
GO
/****** Object:  StoredProcedure [dbo].[paginacionContacto]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[paginacionContacto]  
@page int,  
@rows int 
AS 
BEGIN  
 
 SELECT [Id]  
      ,[strNombre]
      ,[strPuesto]
      ,[strEmail]
      ,[idTelefono]
      ,[strMercado]
 ,COUNT(*) OVER() TotalRecords
 FROM Contacto
 order by [Id]
 OFFSET @page - 1 ROWS                  
 FETCH NEXT @rows ROWS ONLY
 
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 11/02/2022 12:16:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateUser]  
@email varchar(100),  
@password varchar(20) 
AS 
BEGIN  
SELECT [Id]
      ,[strEmail]
      ,[strNombre]
      ,[strRol]      
FROM [dbo].[User] 
WHERE [strEmail]=@email AND [strPassword]=@password 
END

GO
USE [master]
GO
ALTER DATABASE [Minsait] SET  READ_WRITE 
GO
