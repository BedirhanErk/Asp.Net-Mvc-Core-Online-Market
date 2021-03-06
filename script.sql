USE [master]
GO
/****** Object:  Database [BorsaDb]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE DATABASE [BorsaDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BorsaDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BorsaDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BorsaDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BorsaDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BorsaDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BorsaDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BorsaDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BorsaDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BorsaDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BorsaDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BorsaDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BorsaDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BorsaDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BorsaDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BorsaDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BorsaDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BorsaDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BorsaDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BorsaDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BorsaDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BorsaDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BorsaDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BorsaDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BorsaDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BorsaDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BorsaDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BorsaDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BorsaDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BorsaDb] SET RECOVERY FULL 
GO
ALTER DATABASE [BorsaDb] SET  MULTI_USER 
GO
ALTER DATABASE [BorsaDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BorsaDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BorsaDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BorsaDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BorsaDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BorsaDb', N'ON'
GO
ALTER DATABASE [BorsaDb] SET QUERY_STORE = OFF
GO
USE [BorsaDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Birthday] [datetime2](7) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaigns]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Campaigns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddresses]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[Neighborhood] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[AddressTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCards]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[CardTitle] [nvarchar](max) NULL,
	[CardName] [nvarchar](max) NULL,
	[CardNumber] [nvarchar](max) NULL,
	[ExpirationMonth] [nvarchar](max) NULL,
	[ExpirationYear] [nvarchar](max) NULL,
	[Cvv] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DiscountedPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](max) NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[OrderState] [nvarchar](max) NULL,
	[PaymentTypes] [int] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[OrderNote] [nvarchar](max) NULL,
	[PaymentId] [nvarchar](max) NULL,
	[PaymentToken] [nvarchar](max) NULL,
	[ConversationId] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CardName] [nvarchar](max) NULL,
	[CardNumber] [nvarchar](max) NULL,
	[Cvv] [nvarchar](max) NULL,
	[ExpirationMonth] [nvarchar](max) NULL,
	[ExpirationYear] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Brand] [nvarchar](max) NULL,
	[HomeMonth] [bit] NOT NULL,
	[HomeOffer] [bit] NOT NULL,
	[HomePopular] [bit] NOT NULL,
	[HomeToday] [bit] NOT NULL,
	[Stock] [smallint] NOT NULL,
	[DiscountedPrice] [decimal](18, 2) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 4/3/2021 10:23:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CartId] [int] NOT NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210111063821_InitialCreate', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210111161147_changedatabase', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210111205406_AddingIdentity', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210129114303_AddingCartEntities', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210131155826_AddingOrderEntities', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210131174729_ErrorSolution', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210131175628_ErrorSolution', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210203082750_AddingStaffandDepartment', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210211092539_AddingBrand', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210222173517_AddingContact', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210222173803_AddingContact2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210223102814_ChangeProduct', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210224182045_DeleteStaff', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210225091750_ChangeProducts', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210227075019_ChangeIdentity', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210227205105_DeleteEnum', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210228115420_Changeproductandorder', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210228161115_DeleteDprice', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210228164721_AddingCampaign', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210301183217_AddingDiscountedPrice', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210301195251_ErrorSolution2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210302191116_AddingStatus', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307184027_Orderstateischanged', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307192829_AddingAddress', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307193332_Change', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307193440_Change2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307193927_add-migration Change3', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307194552_Change5', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210307200420_ChangeEnd', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311103829_addingcustomeraddress', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311112527_Errorsolution', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311113503_Deletecustomeradddress+', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311114734_changepayment', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311115339_changepaymnet2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311121104_addingcustomeraddress2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311125433_addingaddresstitle', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210311184926_addingcustomercard', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210312102012_trialcard', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210313102442_addingwishlist', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321120611_tryaddress1', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321121433_tryaddress4', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321122026_tryaddress8', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321122237_tryaddress9', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321125916_changeaddress', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321130259_changeaddress2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321131222_trial', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321140734_deneme', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321141140_deneme2', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321142345_deleteorderline', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321151514_addingorderaddress', N'5.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210321160434_trialend', N'5.0.1')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9fc29c92-e5e1-45f3-b7ce-ca477d96cb83', N'User', N'USER', N'8fb15a37-18de-46f1-b3f4-1c74ad229a36')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'd0c27904-a7a9-481b-9ef9-cd1161113ce7', N'Super Admin', N'SUPER ADMIN', N'778e857d-17de-4df3-923d-06843af0e903')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'fa12c6af-e8e0-42c8-b1e0-12a1f74bfe69', N'Admin', N'ADMIN', N'd574efa2-1f5c-4e3e-8b94-a27c2879393e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0ee69445-de88-4f74-b1c0-75c220423f03', N'fa12c6af-e8e0-42c8-b1e0-12a1f74bfe69')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Birthday], [Image]) VALUES (N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Bedirhan Erkilic', N'Bedirhan', N'BEDIRHAN', N'erkilicbedirhan@gmail.com', N'ERKILICBEDIRHAN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEEjE5Blbmj+xt9FFoomldp4kzSaqC+xmMZrFY0UamI0IxQdcAJhvD9IacSXtXmrvzA==', N'5DVCRJUU5G2YLLSCSAZRKKJWUHBE5NUP', N'062d09cc-9374-4ce5-9ead-55553a04760e', N'5398995545', 0, 0, NULL, 1, 0, CAST(N'1999-08-14T04:04:00.0000000' AS DateTime2), N'IMG_20200212_000144_039.jpg')
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Birthday], [Image]) VALUES (N'1a1ae2a6-6d27-49ea-ac5e-668e0bbd6646', N'User User ', N'User', N'USER', N'nhv24650@lcdvd.com', N'NHV24650@LCDVD.COM', 1, N'AQAAAAEAACcQAAAAELNxOQz1dR00+rOnW4qYM5kv1tFtC+o/IznttwZmVmkDsMfsNPgnnC3j30cJUnXhBw==', N'ZETSTGCAZC3WFBMI2TTXY26EYEXGMYU2', N'b096fb20-6e11-47a7-8d2c-de8543720776', N'5398995545', 0, 0, NULL, 1, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Campaigns] ON 

INSERT [dbo].[Campaigns] ([Id], [Description]) VALUES (6, N'Discounts of up to 20%, 30% and 38% have started on baby diapers.')
INSERT [dbo].[Campaigns] ([Id], [Description]) VALUES (7, N'There will be an update on our site between 2 and 4 am. Orders will be suspended before these hours. We apologize for the delay. Have a nice shopping.')
SET IDENTITY_INSERT [dbo].[Campaigns] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItem] ON 

INSERT [dbo].[CartItem] ([Id], [ProductId], [CartId], [Quantity]) VALUES (15, 2, 2, 3)
INSERT [dbo].[CartItem] ([Id], [ProductId], [CartId], [Quantity]) VALUES (16, 3, 2, 1)
INSERT [dbo].[CartItem] ([Id], [ProductId], [CartId], [Quantity]) VALUES (52, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[CartItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (1, N'295e69dc-d7c4-411e-91e3-f142e467a401')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (2, N'6ea38a5f-1f2c-4700-9f49-764592733629')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (3, N'297ae45b-dabc-45d5-bb44-e3b41f45e5db')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (4, N'0ee69445-de88-4f74-b1c0-75c220423f03')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (5, N'2270429c-e385-472b-8d3b-f65ea26cbbf6')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (6, N'c7cc2f39-4dc1-434d-bd75-ccfbf87baaa6')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (7, N'0fcfbb78-aa42-4d44-bba5-50219ab4db93')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (8, N'408bfd3a-2f38-4e06-801b-e1d184e06833')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (9, N'a4795f33-e5cd-468a-88c2-0cd403bbab70')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (10, N'ab6547d0-741a-4a30-a508-581d7f7c4730')
INSERT [dbo].[Carts] ([Id], [UserId]) VALUES (11, N'1a1ae2a6-6d27-49ea-ac5e-668e0bbd6646')
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (16, N'Fruit, Vegetables', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (17, N'Meat, Chicken, Fish', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (18, N'Milk, Breakfast', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (19, N'Food, Confectionery', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (20, N'Beverages', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (21, N'Detergent, Cleaning', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (22, N'Paper, Cosmetics', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (23, N'Baby, Toy', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (24, N'Home, Pet', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (60, N'Electronic', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Message]) VALUES (2, N'Ahmet', N'ahmet@gmail.com', N'There are some errors on your site. If you''re looking for someone to fix these bugs I can help. You can reach me on my mail. Have a nice day.')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAddresses] ON 

INSERT [dbo].[CustomerAddresses] ([Id], [UserId], [FirstName], [LastName], [Address], [City], [District], [Neighborhood], [Phone], [AddressTitle]) VALUES (2, N'0ee69445-de88-4f74-b1c0-75c220423f03', N'İsmail', N'Erkılıç', N'Eyüp İstanbul', N'İstanbul', N'Eyüp', N'Eyüp', N'5346441443', N'Abimin Evi')
INSERT [dbo].[CustomerAddresses] ([Id], [UserId], [FirstName], [LastName], [Address], [City], [District], [Neighborhood], [Phone], [AddressTitle]) VALUES (12, N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Bedirhan ', N'Erkılıç', N'Yukarı Çatak Mahallesi Ümit 1.Sokak No13 Kat3', N'Yozgat', N'Merkez', N'Yukarı Çatak', N'5398995545', N'Ev Adresi')
SET IDENTITY_INSERT [dbo].[CustomerAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerCards] ON 

INSERT [dbo].[CustomerCards] ([Id], [UserId], [CardTitle], [CardName], [CardNumber], [ExpirationMonth], [ExpirationYear], [Cvv]) VALUES (1, N'0ee69445-de88-4f74-b1c0-75c220423f03', N'İş Bankası', N'Bedirhan Erkılıç', N'4895627087810750', N'12', N'2025', N'299')
SET IDENTITY_INSERT [dbo].[CustomerCards] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (1, 1, 2, CAST(15.00 AS Decimal(18, 2)), 2, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (2, 1, 3, CAST(9.95 AS Decimal(18, 2)), 1, CAST(9.95 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (3, 2, 11, CAST(19.90 AS Decimal(18, 2)), 1, CAST(19.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (4, 3, 2, CAST(16.00 AS Decimal(18, 2)), 1, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (5, 3, 22, CAST(19.90 AS Decimal(18, 2)), 1, CAST(19.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (6, 4, 2, CAST(16.00 AS Decimal(18, 2)), 1, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (7, 5, 2, CAST(16.00 AS Decimal(18, 2)), 1, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (8, 10, 4, CAST(104.90 AS Decimal(18, 2)), 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (9, 10, 2, CAST(16.00 AS Decimal(18, 2)), 2, CAST(16.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (10, 11, 23, CAST(20.00 AS Decimal(18, 2)), 1, CAST(19.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (11, 11, 22, CAST(19.90 AS Decimal(18, 2)), 2, CAST(19.90 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (12, 12, 2, CAST(16.00 AS Decimal(18, 2)), 1, CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (13, 13, 2, CAST(16.00 AS Decimal(18, 2)), 1, CAST(13.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (14, 14, 3, CAST(9.95 AS Decimal(18, 2)), 6, CAST(9.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (18, 18, 44, CAST(26.25 AS Decimal(18, 2)), 1, CAST(26.25 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([Id], [OrderId], [ProductId], [Price], [Quantity], [DiscountedPrice]) VALUES (19, 18, 43, CAST(3.45 AS Decimal(18, 2)), 1, CAST(3.25 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (1, N'121122', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'295e69dc-d7c4-411e-91e3-f142e467a401', N'It is Cancelled.', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12789998', NULL, N'f5484310-5a56-4a6a-82a9-6dd973a42dab', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (2, N'540934', CAST(N'2021-01-15T00:00:00.0000000' AS DateTime2), N'295e69dc-d7c4-411e-91e3-f142e467a401', N'It was delivered to the cargo.', 0, N'Fatma', N'Kuru', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12790051', NULL, N'0b4a5093-d2b2-4cbe-8540-20e7ceffa4c9', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (3, N'456212', CAST(N'2021-03-18T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Was Delivered.', 0, N'Fatma', N'Kuru', N'Yozgat Merkez Aşağı nohutlu', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12858366', NULL, N'f60da51f-b920-4099-ae2d-2ef034eba187', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (4, N'671456', CAST(N'2021-06-06T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'It is Cancelled.', 0, N'Fatma', N'Kuru', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12858386', NULL, N'98c82979-37bd-4ed1-91e4-dc2b0b26b7eb', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (5, N'786241', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Pending', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12880663', NULL, N'282c4dc2-3ae8-4945-877d-617f18d8af4f', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (10, N'756961', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'The cargo is on its way.', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12889705', NULL, N'7bfef77b-aae6-41a2-b7a8-a65b25769393', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (11, N'274496', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'The cargo is on its way.', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12889793', NULL, N'6bd6ec33-e802-49a5-9327-fa8e473153e3', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (12, N'155544', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Pending', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12889885', NULL, N'6b12d7b0-66c8-44dc-859e-d112907b719f', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (13, N'546965', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Pending', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12935100', NULL, N'e3b18592-9d01-4405-a6ca-129e61dc5adc', 1, N'John Doe', N'5528790000000008', N'123', N'12', N'2030')
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (14, N'259722', CAST(N'2021-03-12T13:27:46.0240768' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Pending', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12935112', NULL, N'a5bebdea-a069-4eca-a6ec-b857be5e8fd9', 0, N'John Doe', N'5528790000000008', N'123', N'12', N'2030')
INSERT [dbo].[Orders] ([Id], [OrderNumber], [OrderDate], [UserId], [OrderState], [PaymentTypes], [FirstName], [LastName], [Address], [City], [Phone], [Email], [OrderNote], [PaymentId], [PaymentToken], [ConversationId], [Status], [CardName], [CardNumber], [Cvv], [ExpirationMonth], [ExpirationYear]) VALUES (18, N'856256', CAST(N'2021-03-22T14:04:33.6893399' AS DateTime2), N'0ee69445-de88-4f74-b1c0-75c220423f03', N'Pending', 0, N'Bedirhan', N'Erkılıç', N'Yozgat Merkez', N'Yozgat', N'5294883347', N'erkilicbedirhan@gmail.com', NULL, N'12972737', NULL, N'7e7c2f67-6be4-4b40-be4d-4250c780aba6', 0, N'John Doe', N'5528790000000008', N'123', N'12', N'2030')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 2)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 3)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (17, 4)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 5)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 7)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 8)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 9)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 10)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 11)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (16, 13)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (20, 15)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (20, 17)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (20, 18)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (17, 21)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (17, 22)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (21, 23)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (18, 42)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (19, 43)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (22, 44)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (23, 45)
INSERT [dbo].[ProductCategory] ([CategoryId], [ProductId]) VALUES (24, 46)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (2, N'Pear Santa Maria', N'2.jpg', N'<p><strong>Pear Santa Maria, one of the most preferred winter fruits, stands out with its juicy and crunchy. Having a unique appearance and flavor, the fruit stands out with its larger size compared to other pear varieties.</strong></p>
', CAST(16.00 AS Decimal(18, 2)), N'Asma', 0, 0, 0, 0, 200, CAST(13.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (3, N'Local Banana', N'3.jpg', N'<p>Banana, which can be consumed with pleasure at any time of the day, stands out as one of the most popular local fruits. In addition to its nutritiousness, local bananas, which have a very satisfying feature, are consumed by all age groups from children to adults.</p>
', CAST(9.95 AS Decimal(18, 2)), N'Asma', 1, 0, 0, 0, 100, CAST(9.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (4, N'Salmon Slice', N'4.jpg', N'<p>Leroy Salmon Slice, sliced, ready to cook in Norwegian. is salmon. Shipped in vacuum packaging. + 4 &amp; rsquo; de 25 g &amp; uuml; n, -18 &amp; rsquo; &amp; rsquo; can be stored for 9 months.</p>
', CAST(104.90 AS Decimal(18, 2)), N'Leroy', 1, 0, 1, 0, 500, CAST(100.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (5, N'Local Walnut', N'5.jpg', N'<p>Walnuts are among the nuts with high nutritional value. The product, which is suitable for consumption at any time of the day, meets the expectations of individuals who prefer to carry snacks with them. The walnuts, which children and young people consume safely, are offered to consumers in a shelled form.</p>
', CAST(34.95 AS Decimal(18, 2)), N'Asma', 1, 0, 1, 0, 1400, CAST(34.95 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (7, N'Hazelnut', N'6.jpg', N'<p>In addition to being a pleasant snack on its own, hazelnut creates a beautiful image and adds flavor to dessert recipes. It also has many benefits.</p>
', CAST(23.90 AS Decimal(18, 2)), N'Asma', 1, 1, 0, 0, 200, CAST(23.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (8, N'Shelled Almonds', N'7.jpg', N'<p>Rich in magnesium, Omega 3 and zinc, almonds play a role in increasing body resistance, lowering blood pressure and reducing stress. It is among the recommended foods for dieters because it gives a feeling of satiety but is also nutritious.</p>
', CAST(25.90 AS Decimal(18, 2)), N'Asma', 1, 0, 1, 0, 180, CAST(25.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (9, N'Coconut', N'8.jpg', N'<p>Coconut is a delicious tropical plant that can be consumed in different ways. Coconut can be drilled in three places with a corkscrew and its water can be taken. After the peel is broken, the white fruit part in it can be separated and consumed. Coconut is especially used with desserts.</p>
', CAST(6.90 AS Decimal(18, 2)), N'Asma', 0, 0, 0, 0, 120, CAST(6.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (10, N'Grapefruit', N'9.jpg', N'<p>Grapefruit, which can be consumed in many different ways from its peel to fruit, is offered freshly to consumers. Grapefruit, which is a very rich food in terms of vitamin values, can be consumed simply by peeling the skin.</p>
', CAST(4.95 AS Decimal(18, 2)), N'Asma', 0, 0, 0, 0, 1300, CAST(4.95 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (11, N'Kumquat', N'10.jpg', N'<p>Kumquat is a unique type of citrus that is freshly picked from the natural gardens of the Mediterranean. It is one of the fruits consumed with its peel. Kumquat is consumed by everyone who has a healthy diet thanks to its rich content of vitamins and minerals and its unique aroma.</p>
', CAST(19.90 AS Decimal(18, 2)), N'Asma', 0, 1, 0, 0, 50, CAST(19.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (13, N'Apple Starking', N'1.jpg', N'<p>Apple Starking is one of the indispensable fruits of the winter months with its hard, sweet and juicy taste.</p>
', CAST(4.95 AS Decimal(18, 2)), N'Asma', 0, 0, 0, 0, 60, CAST(4.95 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (15, N'Coca Cola 1L', N'12.jpg', N'<p>Coca-Cola cools you with its unique flavor and adds pleasure to your memory.</p>
', CAST(5.00 AS Decimal(18, 2)), N'Coca Cola', 0, 0, 0, 1, 300, CAST(5.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (17, N'Fanta 2.5L', N'13.jpg', N'<p>Take a delicious and refreshing break with Fanta C with vitamin C. Add the product to your cart now!</p>
', CAST(7.25 AS Decimal(18, 2)), N'Fanta', 0, 0, 0, 1, 25, CAST(7.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (18, N'Coca Cola Energy 250 ML', N'14.jpg', N'<p><strong>Coca Cola Energy 250 ML Can</strong></p>

<p><br />
<strong>A completely different taste with a wonderful Coca-Cola taste, a completely different energy *.</strong></p>

<p><strong>Add the product to your cart now!</strong></p>

<p><strong>250 ML<br />
Box<br />
Carbonated beverage<br />
*Energy drink</strong></p>

<p><strong>Completely Different Taste, Completely Different Energy *</strong></p>

<p><strong>If you want a completely different taste experience when you need energy * during the day, this energy * is for you!</strong></p>

<p><strong>*Energy drink</strong></p>
', CAST(5.50 AS Decimal(18, 2)), N'Coca Cola', 0, 1, 1, 1, 1280, CAST(5.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (21, N'Beef Minced Meat', N'15.jpg', N'<p>Beef Minced Meat Kg</p>

<p><br />
Your order will be delivered as ground beef.</p>

<p>Beef Cooking Meat is taken from the brisket of the calf. It is suitable for minced beef, grilled meatballs and pot dishes, which are removed after removing the thick oil, coarse membranes and nerves.</p>

<p>Ingredients: Beef</p>

<p>Storage Condition: Unopened at 0-4 &deg; C until the end of shelf life</p>

<p>2 days after the package is opened.</p>

<p>If you will not consume all of it, you can keep the remainder at -18 &deg; C for 2 months. You can defrost the product taken out of the freezer in the refrigerator or directly cook it without defrosting.</p>
', CAST(42.00 AS Decimal(18, 2)), N'Butcher Fikret', 1, 0, 1, 0, 80, CAST(42.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (22, N'Large Chicken Tenderloin', N'16.jpg', N'<p><strong>Şenpili&ccedil; B&uuml;y&uuml;k Tabaklı Pili&ccedil; Bonfile kg.</strong>&nbsp;pili&ccedil; g&ouml;ğ&uuml;s&uuml;n, sırt kısmı, kemikleri ve derisinin alınmasıyla elde edilir. 1-2 g&uuml;n i&ccedil;inde t&uuml;ketmeyi d&uuml;ş&uuml;nm&uuml;yorsanız, hemen dondurun. Taze &uuml;r&uuml;n&uuml; buzdolabında 0-4&ordm;C&#39;de, donmuş &uuml;r&uuml;n&uuml; derin dondurucuda -18&ordm;C&#39;de muhafaza ediniz. &Uuml;r&uuml;n&uuml; buzdolabında &ccedil;&ouml;zd&uuml;r&uuml;n. &Ccedil;&ouml;z&uuml;nm&uuml;ş &uuml;r&uuml;n&uuml; tekrar dondurmayın.</p>

<p>&nbsp;</p>
', CAST(19.90 AS Decimal(18, 2)), N'Şenpiliç ', 0, 0, 1, 1, 60, CAST(19.90 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (23, N'Bleach Mountain Breeze', N'17.jpg', N'<p>Domestos Bleach Mountain Breeze and Cif Cream Cleaner Ammonia Set is the chief assistant for cleaning at home. This double set also provides convenience to consumers in terms of usage advantages. Thanks to the dense and fluid consistency of Domestos, floors shine and clean extra. Moreover, it neutralizes even the strongest microbes in the shortest time possible.</p>
', CAST(20.00 AS Decimal(18, 2)), N'Domestos', 0, 0, 1, 1, 300, CAST(19.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (42, N'Milk 1 L', N'18.jpg', N'<h3>Pinar Milk 1 L<br />
Pınar S&uuml;t was the first to use UHT technology, which enables milk to reach more people. UHT is Ultra Heat Treatment and extends the life of milk from days to months. In this way, milk reaches more people as fresh as the first day. Milk collected from the most modern farms in Anatolia has been checked 132 times as a result of all stages.</h3>
', CAST(7.45 AS Decimal(18, 2)), N'Pınar', 0, 0, 0, 0, 300, CAST(7.45 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (43, N'Barley Noodle', N'19.jpg', N'<p>Nuh&#39;un Ankara Barley Noodle 500 G</p>

<p><br />
Nuh Ankara Pasta Barley Şehriye 500 gr. It is produced with durum wheat semolina and water. Cooking Time is between 11-13 minutes. It complies with the Turkish Food Codex.</p>
', CAST(3.45 AS Decimal(18, 2)), N'Nuh''un Ankara', 0, 0, 0, 1, 500, CAST(3.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (44, N'Towel 8 Pieces', N'20.jpg', N'<p>Selpak Towel 8 Pieces</p>

<p><br />
You get an effective solution for your daily cleaning needs with Selpak Towel, which provides an economical advantage with its package that contains 8 rolled towels at the same time. You can also benefit from the rolled towels that you can have both in your home and in your car, on your desk at your workplace.</p>

<p>You can enjoy the convenience of high suction power through the Selpak Towel, which creates a very practical use. You can use the powerful suction capacity of the product to the fullest in order to instantly clean the hot drinks such as tea and coffee spilled on your table. Thanks to the Selpak Towel, which is also ideal for drying your hands, you will experience a comfortable use during the day.</p>
', CAST(26.25 AS Decimal(18, 2)), N'Selpak', 0, 1, 0, 0, 630, CAST(26.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (45, N'Hot Wheels Single Cars', N'21.jpg', N'<p>Hotwheels Single Cars</p>

<p><br />
ATM- Single Cars are one of the favorite toys for boys. Often times you want to buy something for the children in the house when going to a visit. In such a situation, it is very important that the gift to be received is useful. Therefore, if there is a boy at your destination, we always recommend you to buy an ATM for boys who are interested in cars and want more. You will both behave in a very gentle manner and make the children very happy.</p>
', CAST(10.90 AS Decimal(18, 2)), N'Hotrwheels', 0, 0, 0, 0, 500, CAST(10.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([Id], [Name], [ImageUrl], [Description], [Price], [Brand], [HomeMonth], [HomeOffer], [HomePopular], [HomeToday], [Stock], [DiscountedPrice], [Status]) VALUES (46, N'Wet Food 400 G', N'22.jpg', N'<p>Whiskas Tuna Canned Fresh Food 400 G</p>

<p><br />
&bull; Our meals provide all the nutrients your cat needs.</p>

<p>&bull; Helps to support a healthy urinary system with the balanced minerals it contains.</p>

<p>&bull; Helps to support healthy hair and skin with the zinc it contains.</p>
', CAST(12.95 AS Decimal(18, 2)), N'Whiskas', 0, 0, 1, 0, 560, CAST(12.95 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItem_CartId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItem_CartId] ON [dbo].[CartItem]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItem_ProductId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_CartItem_ProductId] ON [dbo].[CartItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItem_OrderId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItem_OrderId] ON [dbo].[OrderItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItem_ProductId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItem_ProductId] ON [dbo].[OrderItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductCategory_ProductId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductCategory_ProductId] ON [dbo].[ProductCategory]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Wishlist_CartId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_Wishlist_CartId] ON [dbo].[Wishlist]
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Wishlist_ProductId]    Script Date: 4/3/2021 10:23:09 PM ******/
CREATE NONCLUSTERED INDEX [IX_Wishlist_ProductId] ON [dbo].[Wishlist]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [Birthday]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Status]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ((0.0)) FOR [DiscountedPrice]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HomeMonth]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HomeOffer]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HomePopular]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HomeToday]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([smallint],(0))) FOR [Stock]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Status]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Carts_CartId]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Products_ProductId]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Carts_CartId] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Carts_CartId]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products_ProductId]
GO
USE [master]
GO
ALTER DATABASE [BorsaDb] SET  READ_WRITE 
GO
