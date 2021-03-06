
create database ProductDB_Musa

USE ProductDB_Musa
GO
/****** Object:  Database [ProductDb]    Script Date: 25.05.2022 16:37:30 ******/
CREATE DATABASE [ProductDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProductDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProductDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProductDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProductDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProductDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductDb] SET  MULTI_USER 
GO
ALTER DATABASE [ProductDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductDb] SET QUERY_STORE = OFF
GO
USE [ProductDb]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 25.05.2022 16:37:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'СервисПив', 6, N'840377, Рязанская область, город Щёлково, пл. Бухарестская, 42', N'6861024038', N'218034630', N'Никита Александрович Королёв', N'+7 (922) 325-12-93', N'email: znosov@vasilev.ru', N'нет', 329)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'СантехСеверЛенМашина', 2, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 214-73-94', N'email: pgorbacev@vasilev.net', N'\agents\agent_99.png', 201)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'ЭлектроРемОрионЛизинг', 1, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 513-93-16', N'email: anfisa.fedotova@tvetkov.ru', N'\agents\agent_93.png', 198)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'РыбАлмазГаражСнаб', 1, N'278792, Воронежская область, город Люберцы, ул. Космонавтов, 07', N'2135119617', N'916748563', N'Власов Ян Львович', N'(35222) 46-54-74', N'diana.gorbunov@gromov.ru', N'\agents\agent_29.png', 50)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'CибБашкирТекстиль', 5, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(35222) 92-28-68', N'vzimina@zdanova.com', N'\agents\agent_94.png', 218)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ЮпитерТяжОрионЭкспедиция', 3, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N'(812) 819-51-58', N'gblokin@orlov.net', N'\agents\agent_69.png', 446)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'КазаньТекстиль', 3, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'+7 (922) 936-37-67', N'osimonova@andreeva.com', N'\agents\agent_72.png', 156)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'МясИнфоМясТраст', 3, N'873144, Курская область, город Талдом, проезд Домодедовская, 46', N'6387079446', N'113956342', N'Лихачёваа Оксана Романовна', N'(812) 375-59-29', N'dgulyev@krasilnikov.ru', N'\agents\agent_43.png', 16)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'АвтоТомскЦементЦентр', 5, N'282009, Вологодская область, город Красногорск, пл. Домодедовская, 14', N'8317739640', N'940326934', N'Леонид Иванович Афанасьева', N'(35222) 24-98-18', N'kabanov.valentina@subbotina.ru', N'\agents\agent_40.png', 71)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'Радио', 4, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'(35222) 84-44-92', N'rtretykova@kozlov.ru', N'\agents\agent_68.png', 221)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'ДизайнФинансМикро', 3, N'775051, Иркутская область, город Серебряные Пруды, спуск Домодедовская, 41', N'2700182907', N'141912770', N'Кузьма Борисович Королёва', N'(495) 223-67-97', N'email: varvara15@belousov.ru', N'отсутствует', 462)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'Креп', 1, N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N'(495) 315-25-86', N'savina.dominika@belousova.com', N'\agents\agent_64.png', 371)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'ЖелДорДизайнМетизТраст', 4, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'8-800-692-72-18', N'lnikitina@kulikova.com', N'нет', 290)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'Асбоцемент', 2, N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N'(812) 152-28-78', N'email: antonin19@panfilov.ru', N'\agents\agent_59.png', 273)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'Мобайл', 4, N'273144, Калужская область, город Наро-Фоминск, бульвар Чехова, 70', N'3655195522', N'395816585', N'Горшков Кузьма Фёдорович', N'(495) 532-54-42', N'email: rafail22@orlov.ru', N'\agents\agent_53.png', 40)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'ТекстильУралАвтоОпт', 1, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N'(495) 418-67-55', N'hkononova@pavlova.ru', N'\agents\agent_97.png', 176)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Башкир', 6, N'513065, Рязанская область, город Одинцово, шоссе Славы, 93', N'3105334340', N'117513650', N'Одинцова Розалина Дмитриевна', N'8-800-656-63-99', N'iskra.sergeev@zykov.com', N'\agents\agent_33.png', 35)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'ГорДор', 5, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(812) 364-46-64', N'maiy12@koklov.net', N'\agents\agent_77.png', 175)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'Компания Рос', 2, N'479740, Оренбургская область, город Наро-Фоминск, наб. Будапештсткая, 36', N'5502989807', N'518320454', N'Алёна Ивановна Тимофеева', N'(35222) 32-99-94', N'email: odenisov@knyzeva.ru', N'нет', 252)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'КазЮпитерТомск', 3, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'(35222) 24-85-54', N'tgavrilov@frolov.ru', N'\agents\agent_85.png', 244)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'СеверГаз', 4, N'509479, Орловская область, город Павловский Посад, спуск Бухарестская, 28', N'7908427926', N'249521550', N'Валериан Андреевич Кириллова', N'(812) 973-88-81', N'smukina@evseev.com', N'\agents\agent_15.png', 83)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'Компания КазАлмаз', 2, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'+7 (922) 692-21-57', N'irina.gusina@vlasova.ru', N'\agents\agent_105.png', 396)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'ЦементАсбоцементОрионТраст', 3, N'221534, Орловская область, город Серебряные Пруды, проезд Гагарина, 54', N'2972154471', N'668972219', N'Павлова Марк Александрович', N'(495) 979-36-66', N'igulyeva@kostina.ru', N'\agents\agent_28.png', 441)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'Компания Электро', 2, N'183744, Рязанская область, город Клин, въезд Косиора, 29', N'4335399269', N'780051451', N'Кабанов Кирилл Максимович', N'(35222) 63-92-83', N'blokin.sofiy@terentev.ru', N'\agents\agent_41.png', 340)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'БашкирЮпитерТомск', 1, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 395-91-75', N'email: dyckov.veniamin@kotova.ru', N'\agents\agent_84.png', 139)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ОрионВектор', 1, N'138159, Свердловская область, город Подольск, спуск Балканская, 72', N'5687675108', N'816451597', N'Алексей Борисович Семёнова', N'+7 (922) 456-59-29', N'email: subbotin.rostislav@zueva.org', N'\agents\agent_22.png', 496)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'Рос', 6, N'412597, Калужская область, город Клин, пр. Гагарина, 57', N'6729448041', N'935241906', N'Никифороваа Рената Сергеевна', N'+7 (922) 822-88-76', N'potapov.abram@trofimova.org', N'\agents\agent_36.png', 158)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'ДизайнВосток', 5, N'680394, Оренбургская область, город Павловский Посад, спуск Косиора, 50', N'6222265808', N'245694799', N'Добрыня Сергеевич Кабанов', N'+7 (922) 767-84-15', N'efimova.timofei@tretykova.ru', N'\agents\agent_17.png', 188)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'РемГаражЛифт', 3, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N'(35222) 18-85-61', N'novikova.gleb@sestakov.ru', N'\agents\agent_90.png', 374)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'ПивГлав', 2, N'244290, Астраханская область, город Талдом, проезд Космонавтов, 17', N'3090235456', N'870818930', N'Клим Иванович Юдин', N'8-800-153-74-46', N'email: sofiy.bolsakov@isakova.ru', N'\agents\agent_27.png', 329)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'Компания Гараж', 2, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'(35222) 22-47-12', N'email: asiryeva@andreeva.com', N'\agents\agent_91.png', 413)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Монтаж', 6, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 783-36-97', N'zakar.sazonova@gavrilov.ru', N'\agents\agent_66.png', 300)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'ВодГараж', 3, N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'(35222) 11-75-66', N'pmaslov@fomiceva.com', N'\agents\agent_92.png', 250)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'Компания Метал', 2, N'908229, Иркутская область, город Истра, бульвар Бухарестская, 97', N'9933367989', N'856443865', N'Валентина Ивановна Громова', N'(35222) 99-39-28', N'vasileva.tatyna@lebedeva.net', N'\agents\agent_16.png', 167)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'Бум', 6, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'+7 (922) 282-82-91', N'email: belova.vikentii@konstantinova.net', N'\agents\agent_103.png', 82)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'Гор', 4, N'245009, Белгородская область, город Коломна, шоссе Домодедовская, 93', N'6196739969', N'784512010', N'Адриан Александрович Одинцов', N'(812) 327-52-23', N'rostislav.savelev@dmitrieva.ru', N'\agents\agent_46.png', 85)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'МясРеч', 1, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'(812) 256-74-95', N'bkozlov@volkov.ru', N'\agents\agent_83.png', 355)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'МясТрансМоторЛизинг', 3, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'(495) 489-75-57', N'email: vlad.sokolov@andreev.org', N'\agents\agent_87.png', 268)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'Компания ТелекомХмельГаражПром', 2, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'8-800-617-13-37', N'qkolesnikova@kalinina.ru', N'\agents\agent_96.png', 457)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'МетизТехАвтоПроф', 2, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N'8-800-192-74-77', N'anastasiy.gromov@samsonova.com', N'\agents\agent_58.png', 321)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'РосАвтоМонтаж', 2, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'8-800-468-91-51', N'lapin.inessa@isaeva.com', N'\agents\agent_80.png', 10)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'Компания КрепГаз', 2, N'415525, Воронежская область, город Орехово-Зуево, спуск Ленина, 14', N'2910821636', N'169856199', N'Эмилия Фёдоровна Шилова', N'8-800-971-62-32', N'iturova@isakova.ru', N'\agents\agent_48.png', 50)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'БухТеле', 1, N'481781, Астраханская область, город Орехово-Зуево, спуск Ломоносова, 67', N'3547826061', N'581933218', N'Клавдия Романовна Савина', N'(35222) 89-78-68', N'vasilev.svetlana@saskov.org', N'\agents\agent_18.png', 171)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'ТяжМяж', 4, N'255489, Самарская область, город Озёры, ул. Ломоносова, 09', N'6391522710', N'209038885', N'Юлия Львовна Горбунова', N'(812) 425-28-46', N'email: bzykov@baranov.com', N'\agents\agent_55.png', 472)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'Тех', 3, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'+7 (922) 113-94-49', N'vasilisa99@belyev.ru', N'\agents\agent_86.png', 278)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ГлавITФлотПроф', 6, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N'(35222) 33-48-16', N'email: savva.rybov@kolobov.ru', N'\agents\agent_89.png', 62)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'Восток', 6, N'284236, Воронежская область, город Павловский Посад, бульвар Ленина, 28', N'8929775900', N'788028687', N'Савинаа Нина Александровна', N'(495) 227-66-48', N'nsitnikova@tikonova.org', N'не указано', 380)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'ТелекомЮпитер', 5, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 798-33-53', N'kulikov.adrian@zuravlev.org', N'\agents\agent_106.png', 302)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'МонтажВекторМобайлЦентр', 1, N'094869, Ленинградская область, город Ступино, наб. Ленина, 80', N'4433392652', N'757806909', N'Захар Александрович Панова', N'(495) 566-98-62', N'pavel.davydova@tretykov.net', N'\agents\agent_32.png', 372)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'ВостокГлав', 2, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'+7 (922) 329-34-28', N'gordei95@kirillov.ru', N'\agents\agent_88.png', 107)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'Компания КрепЦемент', 2, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N'8-800-628-79-67', N'email: rusakov.efim@nikiforov.ru', N'\agents\agent_75.png', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'ЖелДор', 1, N'860124, Иркутская область, город Егорьевск, пер. Гагарина, 67', N'9392505809', N'911026119', N'Симоноваа Лариса Борисовна', N'(35222) 26-55-64', N'email: karitonova.fedosy@vasileva.net', N'\agents\agent_51.png', 429)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'Компания Хмель', 2, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N'(35222) 27-19-66', N'email: ermakov.mark@isakova.ru', N'\agents\agent_67.png', 2)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'Цемент', 2, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'+7 (922) 859-19-97', N'email: panova.klementina@bobrov.ru', N'\agents\agent_79.png', 340)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'ЛенМобайлМикро', 6, N'737175, Ростовская область, город Одинцово, ул. Космонавтов, 99', N'6729041572', N'828657559', N'Изабелла Евгеньевна Дьячкова', N'(35222) 96-34-97', N'frolov.artem@zuravlev.ru', N'\agents\agent_52.png', 341)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'Компания ТверьДизайн', 2, N'672492, Калининградская область, город Москва, проезд Сталина, 64', N'3567301661', N'623881311', N'Доминика Александровна Никитинаа', N'8-800-234-93-22', N'email: ypotapov@kolesnikova.ru', N'\agents\agent_37.png', 271)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'ВодТверьХозМашина', 1, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'(495) 756-36-72', N'tkrylov@baranova.net', N'\agents\agent_81.png', 8)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'ТелеГлавВекторСбыт', 1, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'+7 (922) 619-91-52', N'nsitnikov@kovaleva.ru', N'\agents\agent_56.png', 185)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'БашкирИнжКрепСбыт', 2, N'191420, Новосибирская область, город Ногинск, пер. Будапештсткая, 28', N'6771467761', N'977595370', N'Алиса Фёдоровна Архипова', N'+7 (922) 495-46-18', N'email: vlad.molcanov@fomicev.ru', N'\agents\agent_24.png', 475)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'ТрансТверь', 5, N'818676, Томская область, город Павловский Посад, ул. Ладыгина, 27', N'3311036393', N'590018934', N'Алина Романовна Овчинникова', N'(35222) 22-74-12', N'dorofeev.milan@vorobeva.net', N'\agents\agent_25.png', 495)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'ТелеСеверМикро', 5, N'046300, Орловская область, город Ступино, бульвар Бухарестская, 13', N'9534974527', N'344691556', N'Селезнёв Василий Евгеньевич', N'(35222) 66-26-65', N'koseleva.ylii@potapov.ru', N'\agents\agent_12.png', 254)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'CибПивОмскСнаб', 1, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'(812) 743-49-87', N'evorontova@potapova.ru', N'не указано', 477)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'ЛенБухМикро-H', 6, N'078797, Мурманская область, город Коломна, пр. Гоголя, 94', N'5943902570', N'103426359', N'Субботин Герасим Владимирович', N'(812) 421-59-75', N'email: rybov.tatyna@merkuseva.com', N'\agents\agent_30.png', 242)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'ЮпитерЛенГараж-М', 5, N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(812) 229-34-18', N'larkipova@gorbunov.ru', N'\agents\agent_73.png', 470)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'МорВостокТомскПром', 3, N'034623, Белгородская область, город Павловский Посад, проезд Ломоносова, 72', N'4082127026', N'544686044', N'Гавриил Евгеньевич Селиверстов', N'+7 (922) 258-96-16', N'lev.efremov@frolov.ru', N'\agents\agent_20.png', 198)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'Компания ФинансСервис', 2, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'8-800-358-54-99', N'email: robert.serbakov@safonova.ru', N'\agents\agent_63.png', 395)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'Метиз', 2, N'455463, Ярославская область, город Серпухов, пер. Бухарестская, 01', N'4433116074', N'949226221', N'Ян Иванович Егоров', N'(35222) 81-78-92', N'email: mersova@rodionova.ru', N'\agents\agent_54.png', 168)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'ФлотБух', 5, N'741647, Ульяновская область, город Наро-Фоминск, ул. 1905 года, 11', N'4868711532', N'409331823', N'Муравьёваа Мария Дмитриевна', N'+7 (922) 155-75-21', N'tkuznetova@sukanova.ru', N'\agents\agent_21.png', 385)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'КазХоз', 3, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'8-800-955-44-52', N'istrelkova@fomin.ru', N'не указано', 213)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Орион', 4, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'(35222) 58-77-96', N'aleksei63@kiselev.ru', N'\agents\agent_102.png', 166)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'РечИнж', 3, N'862241, Кемеровская область, город Москва, пер. Славы, 63', N'9289300952', N'534867576', N'Донат Иванович Кудрявцев', N'(812) 971-47-98', N'qloginova@antonov.com', N'\agents\agent_8.png', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'РосПивТверь', 3, N'053965, Магаданская область, город Видное, наб. Балканская, 41', N'2857470864', N'732899890', N'Люся Фёдоровна Горшковаа', N'+7 (922) 692-73-72', N'vitalii.melnikov@kopylov.com', N'\agents\agent_11.png', 368)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'КрепТелекомТекстильМашина', 6, N'754514, Тверская область, город Люберцы, пл. Домодедовская, 84', N'7626613684', N'187506967', N'Богданов Денис Максимович', N'+7 (922) 278-54-95', N'ignatov.adam@kononova.org', N'\agents\agent_39.png', 259)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'МорГлавМонтажЭкспедиция', 3, N'313619, Читинская область, город Чехов, ул. Ленина, 38', N'8619846965', N'796144573', N'Анастасия Львовна Субботинаа', N'(812) 161-96-49', N'flukin@moiseeva.com', N'\agents\agent_34.png', 329)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'ТекстильУралВод', 4, N'872673, Ярославская область, город Видное, спуск Славы, 04', N'8336124514', N'871193263', N'Эльвира Фёдоровна Герасимова', N'(495) 614-67-93', N'email: obespalov@alekseev.org', N'\agents\agent_9.png', 28)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'Газ', 6, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'8-800-278-78-32', N'ulyna.antonov@noskov.ru', N'\agents\agent_101.png', 170)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'ТомскТранс', 2, N'271624, Свердловская область, город Озёры, ул. Косиора, 21', N'6523850838', N'970092830', N'Архипова Юрий Дмитриевич', N'(35222) 66-22-46', N'antonina.krasilnikov@nikonov.ru', N'\agents\agent_47.png', 427)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'Компания ТехТеле', 2, N'285256, Магаданская область, город Дмитров, шоссе Ладыгина, 20', N'1553744119', N'713327632', N'Тихонова Валериан Владимирович', N'8-800-943-36-45', N'anfisa63@sobolev.ru', N'\agents\agent_42.png', 465)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'СофтИнжIT', 3, N'146295, Тверская область, город Одинцово, въезд Бухарестская, 78', N'2368693812', N'791368408', N'Виктор Львович Михайлова', N'8-800-319-27-45', N'yliy.efimov@zdanova.ru', N'\agents\agent_50.png', 460)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'Компания Монтаж', 2, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N'(495) 626-86-13', N'afanasev.anastasiy@muravev.ru', N'\agents\agent_100.png', 124)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'СтройГорНефть', 3, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N'(495) 852-82-84', N'email: lysy.kolesnikova@molcanova.com', N'\agents\agent_62.png', 161)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'ЦементХмельОрионНаладка', 3, N'014379, Кировская область, город Озёры, пр. Будапештсткая, 28', N'2118874929', N'482607758', N'Максим Евгеньевич Гурьева', N'+7 (922) 419-14-19', N'email: daniil.selezneva@safonova.com', N'\agents\agent_49.png', 61)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'Компания ОрионСтройЛифт', 2, N'819305, Воронежская область, город Талдом, шоссе Ломоносова, 36', N'8834229587', N'958311664', N'Щукина Искра Максимовна', N'8-800-381-59-97', N'artemii.abramova@arkipov.ru', N'отсутствует', 467)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'Тяж', 6, N'650482, Смоленская область, город Коломна, проезд Косиора, 95', N'5484904441', N'943388774', N'Белов Влад Александрович', N'+7 (922) 547-77-52', N'rodionova.ulyna@noskov.ru', N'\agents\agent_35.png', 207)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'ЦементАсбоцемент', 1, N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'+7 (922) 133-68-96', N'polykov.veronika@artemeva.ru', N'\agents\agent_76.png', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'ГазДизайнЖелДор', 5, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(35222) 39-88-91', N'email: elizaveta.komarov@rybakov.net', N'\agents\agent_74.png', 236)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'РемСантехОмскБанк', 3, N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N'(35222) 76-15-56', N'email: anisimov.mark@vorobev.ru', N'\agents\agent_82.png', 442)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'Мясо', 6, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'1876413796', N'955381891', N'Терентьев Илларион Максимович', N'+7 (922) 315-51-42', N'email: ulyna.antonov@noskov.ru', N'\agents\agent_107.png', 170)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'КрепГаражСантехМаш', 4, N'207204, Пензенская область, город Одинцово, пер. Гагарина, 80', N'7574946061', N'146206755', N'Аркадий Романович Тихонов', N'(495) 172-31-91', N'vladlen84@ersova.net', N'\agents\agent_10.png', 330)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'ИнжITЖелДор-H', 6, N'019291, Вологодская область, город Клин, ул. Космонавтов, 96', N'8103088511', N'604606043', N'Колесникова Август Владимирович', N'(495) 324-18-82', N'karitonov.aleksandra@samoilov.com', N'\agents\agent_14.png', 129)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'Рем', 1, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N'(35222) 46-69-69', N'zanna25@nikiforova.com', N'\agents\agent_104.png', 329)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (92, N'ФинансТелеТверь', 4, N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(495) 839-58-56', N'medvedev.klim@afanasev.com', N'\agents\agent_70.png', 100)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Строй', 6, N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'+7 (922) 129-57-13', N'email: soloveva.adam@andreev.ru', N'\agents\agent_57.png', 12)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'ЭлектроITITСбыт', 1, N'855489, Вологодская область, город Серебряные Пруды, пл. Ломоносова, 57', N'1532104861', N'112607081', N'Якушеваа Варвара Романовна', N'(812) 326-15-27', N'email: eliseeva.sofy@gorskov.net', N'\agents\agent_23.png', 452)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'ЛенХозМясБанк', 5, N'702413, Саратовская область, город Люберцы, въезд Чехова, 15', N'9266199692', N'335770867', N'Арсений Алексеевич Виноградова', N'(35222) 26-15-93', N'email: bobrov.viktor@kazakova.ru', N'\agents\agent_31.png', 17)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'ЭлектроМоторТрансСнос', 3, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N'(495) 951-23-53', N'inessa.voronov@sidorova.ru', N'\agents\agent_98.png', 151)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'Компания СервисРадиоГор', 2, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'(812) 871-21-15', N'nika.nekrasova@kovalev.ru', N'\agents\agent_65.png', 169)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'Компания МясДизайнДизайн', 2, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N'(495) 752-21-98', N'gleb.gulyev@belyeva.com', N'\agents\agent_78.png', 491)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'БашкирФлотМотор-H', 5, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N'(812) 737-79-77', N'morozova.nika@kazakova.ru', N'\agents\agent_61.png', 416)
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'СофтМонтажХозСбыт', 3, N'860932, Калужская область, город Наро-Фоминск, ул. Балканская, 78', N'5408216010', N'737659265', N'Харитонов Антонин Владимирович', N'(495) 396-23-64', N'zinaida90@filippov.org', N'\agents\agent_44.png', 403)
SET IDENTITY_INSERT [dbo].[Agent] OFF
SET IDENTITY_INSERT [dbo].[AgentPriorityHistory] ON 

INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (201, 1, CAST(N'2014-06-25T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (202, 2, CAST(N'2011-01-04T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (203, 3, CAST(N'2015-07-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (204, 4, CAST(N'2019-06-06T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (205, 5, CAST(N'2014-03-28T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (206, 6, CAST(N'2019-02-13T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (207, 7, CAST(N'2012-04-26T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (208, 8, CAST(N'2019-01-22T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (209, 9, CAST(N'2017-12-09T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (210, 10, CAST(N'2013-03-18T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (211, 11, CAST(N'2016-11-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (212, 11, CAST(N'2018-08-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (213, 12, CAST(N'2012-08-06T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (214, 13, CAST(N'2011-02-27T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (215, 14, CAST(N'2016-01-09T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (216, 15, CAST(N'2018-01-14T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (217, 16, CAST(N'2010-07-20T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (218, 17, CAST(N'2012-11-24T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (219, 18, CAST(N'2017-12-15T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (220, 19, CAST(N'2015-06-24T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (221, 20, CAST(N'2018-03-05T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (222, 1, CAST(N'2016-12-16T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (223, 6, CAST(N'2019-03-10T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (224, 1, CAST(N'2017-10-25T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (225, 21, CAST(N'2013-06-16T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (226, 22, CAST(N'2016-05-05T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (227, 23, CAST(N'2018-05-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (228, 24, CAST(N'2011-03-17T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (229, 25, CAST(N'2010-05-08T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (230, 26, CAST(N'2014-01-16T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (231, 16, CAST(N'2010-09-13T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (232, 27, CAST(N'2017-06-15T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (233, 26, CAST(N'2011-01-06T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (234, 28, CAST(N'2013-01-28T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (235, 29, CAST(N'2014-09-13T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (236, 30, CAST(N'2010-11-04T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (237, 31, CAST(N'2017-12-19T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (238, 26, CAST(N'2013-06-26T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (239, 32, CAST(N'2012-10-15T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (240, 33, CAST(N'2015-09-05T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (241, 22, CAST(N'2012-08-26T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (242, 18, CAST(N'2012-06-04T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (243, 34, CAST(N'2012-06-11T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (244, 22, CAST(N'2018-05-23T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (245, 31, CAST(N'2013-08-24T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (246, 31, CAST(N'2011-05-10T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (247, 30, CAST(N'2013-02-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (248, 15, CAST(N'2017-06-24T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (249, 6, CAST(N'2010-09-13T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (250, 11, CAST(N'2017-09-10T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (251, 11, CAST(N'2016-09-17T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (252, 30, CAST(N'2013-04-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (253, 27, CAST(N'2010-08-27T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (254, 30, CAST(N'2017-07-06T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (255, 1, CAST(N'2013-07-10T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (256, 20, CAST(N'2019-12-23T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (257, 26, CAST(N'2019-11-07T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (258, 24, CAST(N'2011-07-20T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (259, 29, CAST(N'2011-02-05T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (260, 22, CAST(N'2016-04-17T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (261, 17, CAST(N'2018-02-06T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (262, 28, CAST(N'2012-01-04T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (263, 9, CAST(N'2018-12-07T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (264, 22, CAST(N'2019-02-12T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (265, 27, CAST(N'2010-11-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (266, 16, CAST(N'2013-03-23T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (267, 35, CAST(N'2019-09-26T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (268, 25, CAST(N'2013-08-24T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (269, 35, CAST(N'2015-10-18T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (270, 36, CAST(N'2012-12-28T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (271, 4, CAST(N'2019-08-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (272, 15, CAST(N'2010-03-23T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (273, 37, CAST(N'2010-12-21T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (274, 37, CAST(N'2010-02-21T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (275, 20, CAST(N'2014-03-24T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (276, 28, CAST(N'2018-04-18T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (277, 38, CAST(N'2011-11-12T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (278, 39, CAST(N'2017-12-17T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (279, 40, CAST(N'2018-06-24T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (280, 6, CAST(N'2014-07-10T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (281, 12, CAST(N'2019-03-05T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (282, 41, CAST(N'2017-07-20T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (283, 42, CAST(N'2019-01-08T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (284, 37, CAST(N'2017-05-05T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (285, 10, CAST(N'2013-01-12T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (286, 23, CAST(N'2012-10-12T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (287, 43, CAST(N'2014-04-12T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (288, 33, CAST(N'2018-09-11T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (289, 33, CAST(N'2018-01-18T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (290, 41, CAST(N'2015-03-07T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (291, 16, CAST(N'2012-10-08T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (292, 27, CAST(N'2014-01-08T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (293, 37, CAST(N'2011-10-27T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (294, 35, CAST(N'2012-08-18T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (295, 44, CAST(N'2011-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (296, 12, CAST(N'2011-12-16T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (297, 40, CAST(N'2013-04-18T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (298, 25, CAST(N'2010-06-09T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (299, 45, CAST(N'2015-02-12T00:00:00.000' AS DateTime), 12)
GO
INSERT [dbo].[AgentPriorityHistory] ([ID], [AgentID], [ChangeDate], [PriorityValue]) VALUES (300, 46, CAST(N'2012-08-01T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AgentPriorityHistory] OFF
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'ЗАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'ООО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'ОАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ПАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'МКК', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'МФО', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Вата серый 1x1', 7, N'1', 191, 34, NULL, CAST(6009.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Ткань белый 2x2', 10, N'1', 713, 18, NULL, CAST(13742.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Металлический стержень белый 0x2', 9, N'2', 280, 12, NULL, CAST(10633.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Силикон серый 1x1', 2, N'1', 981, 12, NULL, CAST(2343.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Силикон белый 0x3', 8, N'2', 307, 17, NULL, CAST(12097.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'Силикон белый 1x3', 4, N'2', 345, 46, NULL, CAST(13550.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Ткань серый 0x3', 10, N'1', 965, 17, NULL, CAST(15210.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'Резинка зеленый 1x0', 8, N'2', 256, 9, NULL, CAST(32616.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'Металлический стержень белый 2x2', 9, N'1', 65, 36, NULL, CAST(36753.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'Ткань синий 3x3', 5, N'1', 387, 39, NULL, CAST(32910.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Ткань белый 3x2', 9, N'1', 398, 25, NULL, CAST(782.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'Вата розовый 1x0', 3, N'1', 589, 32, NULL, CAST(35776.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'Вата серый 3x2', 5, N'2', 471, 40, NULL, CAST(20453.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'Ткань розовый 0x0', 3, N'1', 654, 29, NULL, CAST(41101.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'Металлический стержень цветной 3x1', 4, N'1', 988, 49, NULL, CAST(55742.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'Резинка синий 1x0', 3, N'2', 191, 11, NULL, CAST(1407.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Металлический стержень цветной 1x2', 8, N'1', 173, 26, NULL, CAST(26137.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'Ткань цветной 2x1', 2, N'1', 993, 34, NULL, CAST(15628.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'Силикон белый 2x0', 10, N'1', 851, 38, NULL, CAST(22538.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Силикон зеленый 3x1', 2, N'1', 776, 46, NULL, CAST(17312.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'Вата серый 3x3', 1, N'2', 237, 12, NULL, CAST(19528.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Вата белый 2x0', 8, N'2', 983, 49, NULL, CAST(38432.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'Вата розовый 3x1', 3, N'2', 246, 41, NULL, CAST(44015.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'Ткань синий 2x0', 4, N'1', 146, 16, NULL, CAST(19507.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'Металлический стержень зеленый 2x2', 4, N'1', 478, 34, NULL, CAST(32205.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'Резинка зеленый 0x0', 7, N'1', 594, 19, NULL, CAST(42640.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'Ткань синий 0x2', 8, N'2', 841, 21, NULL, CAST(27338.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'Ткань зеленый 2x2', 4, N'1', 692, 7, NULL, CAST(55083.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Металлический стержень синий 0x1', 9, N'1', 259, 20, NULL, CAST(19715.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'Резинка белый 3x3', 1, N'1', 586, 26, NULL, CAST(35230.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'Резинка зеленый 3x0', 10, N'2', 976, 40, NULL, CAST(41227.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'Ткань белый 1x3', 8, N'1', 492, 9, NULL, CAST(38232.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'Силикон цветной 1x0', 10, N'1', 843, 28, NULL, CAST(34664.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'Силикон зеленый 0x3', 9, N'2', 124, 35, NULL, CAST(24117.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Вата серый 0x1', 8, N'1', 25, 38, NULL, CAST(42948.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Металлический стержень белый 3x1', 9, N'1', 749, 30, NULL, CAST(9136.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'Резинка синий 3x1', 4, N'2', 232, 36, NULL, CAST(36016.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'Металлический стержень синий 3x1', 6, N'1', 336, 24, NULL, CAST(26976.00 AS Decimal(10, 2)), NULL, 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'Силикон белый 1x2', 2, N'1', 793, 30, NULL, CAST(33801.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'Резинка цветной 1x1', 8, N'1', 347, 13, NULL, CAST(26244.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'Силикон розовый 1x3', 9, N'1', 997, 25, NULL, CAST(33874.00 AS Decimal(10, 2)), NULL, 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'Резинка синий 3x2', 5, N'1', 284, 31, NULL, CAST(44031.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Резинка розовый 1x0', 1, N'1', 265, 21, NULL, CAST(36574.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'Резинка зеленый 0x3', 8, N'2', 856, 17, NULL, CAST(45349.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'Резинка цветной 0x1', 8, N'1', 290, 32, NULL, CAST(47198.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'Вата розовый 3x3', 10, N'1', 536, 31, NULL, CAST(2517.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Резинка цветной 0x2', 10, N'1', 189, 31, NULL, CAST(55495.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'Вата серый 3x0', 8, N'2', 48, 32, NULL, CAST(49181.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Резинка серый 3x3', 4, N'1', 373, 8, NULL, CAST(51550.00 AS Decimal(10, 2)), NULL, 5)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Резинка серый 0x0', 7, N'1', 395, 20, NULL, CAST(43414.00 AS Decimal(10, 2)), NULL, 5)
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Вата', 10)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Ткань', 24)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Стержень', 65)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' Силикон', 45)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (5, N' Резинка', 38)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Полумаска "Moon" (Элипс) P3', 1, N'59922', NULL, N'/products/5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Повязка санитарно–гигиеническая многоразовая с логотипом СОЮЗСПЕЦОДЕЖДА', 2, N'5028556', NULL, NULL, 5, 9, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Повязка санитарно–гигиеническая многоразовая черная', 2, N'5028272', NULL, NULL, 4, 4, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Маска одноразовая трехслойная из нетканого материала, нестерильная', 2, N'5028247', NULL, N'/products/5fb128cc69235.jpg', 3, 2, CAST(6.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Повязка санитарно–гигиеническая многоразовая с принтом', 2, N'5028229', NULL, N'/products/5fb128cc69235.jpg', 2, 10, CAST(49.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Маска из нетканого материала KN95', 3, N'5030981', NULL, N'/products/5fb128cc719a6.jpg', 3, 5, CAST(59.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Маска из нетканого материала с клапаном KN95', 3, N'5029784', NULL, N'/products/5fb128cc753e3.jpg', 3, 4, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Респиратор У-2К', 3, N'58953', NULL, N'/products/5fb128cc7941f.jpg', 2, 6, CAST(95.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Респиратор 9101 FFP1', 4, N'5026662', NULL, N'/products/5fb128cc7d798.jpg', 5, 8, CAST(189.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Респиратор противоаэрозольный 9312', 4, N'59043', NULL, N'/products/5fb128cc80a10.jpg', 4, 7, CAST(399.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Респиратор 3M 8112 противоаэрозольный с клапаном выдоха', 4, N'58376', NULL, N'/products/5fb128cc84474.jpg', 3, 1, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Респиратор 3M 8101 противоаэрозольный', 4, N'58375', NULL, N'/products/5fb128cc87b90.jpg', 1, 4, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Респиратор "Алина" 110', 4, N'59324', NULL, N'/products/5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Респиратор "Алина" 100', 4, N'58827', NULL, N'/products/5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Респиратор "Нева" 109', 4, N'59898', NULL, N'/products/5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Респиратор "Юлия" 109', 4, N'59474', NULL, N'/products/5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Респиратор "Юлия" 119', 4, N'59472', NULL, N'/products/5fb128cc9bd36.jpg', 3, 7, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Респиратор 3M с клапаном 9162', 4, N'5033136', NULL, N'/products/5fb128cc9f069.jpg', 2, 9, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Респиратор 3M 9152 FFP2', 4, N'5028048', NULL, N'/products/5fb128cca31d9.jpg', 2, 8, CAST(390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Респиратор противоаэрозольный 9322', 4, N'58796', NULL, N'/products/5fb128cca6910.jpg', 4, 4, CAST(449.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Респиратор с клапаном 9926', 4, N'58568', NULL, N'/products/5fb128cca9d9b.jpg', 3, 5, CAST(699.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Респиратор 3M 8102 противоаэрозольный', 4, N'58466', NULL, N'/products/5fb128ccae21a.jpg', 3, 9, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Респиратор 3M 8122', 4, N'58445', NULL, N'/products/5fb128ccb1958.jpg', 3, 6, CAST(299.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Респиратор M1200VWC FFP2 Delta Plus (Дельта Плюс)', 4, N'5031919', NULL, N'/products/5fb128ccb4e8c.jpg', 2, 8, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Респиратор RK6021', 4, N'5030026', NULL, N'/products/5fb128ccb97a0.jpg', 5, 8, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Респиратор RK6020', 4, N'5030020', NULL, N'/products/5fb128ccbd227.jpg', 3, 5, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Респиратор Алина 210', 4, N'5030072', NULL, N'/products/5fb128ccc1592.jpg', 1, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Респиратор Алина 211', 4, N'5030062', NULL, N'/products/5fb128ccc4a86.jpg', 1, 6, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Респиратор "Алина" 200', 4, N'58826', NULL, N'/products/5fb128ccc9a9e.jpg', 1, 5, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Респиратор "Алина" П', 4, N'58825', NULL, N'/products/5fb128cccdbee.jpg', 4, 5, CAST(290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Респиратор "Алина" АВ', 4, N'58584', NULL, N'/products/5fb128ccd133c.jpg', 2, 5, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Респиратор "Нева" 210', 4, N'59736', NULL, N'/products/5fb128ccd5dc2.jpg', 1, 3, CAST(109.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Респиратор "Нева" 200', 4, N'59735', NULL, N'/products/5fb128ccd8ff6.jpg', 2, 3, CAST(79.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Респиратор полумаска НРЗ-0102 FFP2 NR D', 4, N'5027238', NULL, N'/products/5fb128ccdca1e.jpg', 4, 4, CAST(149.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Респиратор "Юлия" 219', 4, N'59475', NULL, N'/products/5fb128cce0042.jpg', 4, 8, CAST(249.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Респиратор "Юлия" 215', 4, N'59473', NULL, N'/products/5fb128cce39fa.jpg', 3, 4, CAST(349.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Респиратор "Юлия" 209', 4, N'59470', NULL, N'/products/5fb128cce7971.jpg', 2, 8, CAST(179.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Респиратор M1300V2С FFP3 Delta Plus (Дельта Плюс)', 4, N'5031924', NULL, N'/products/5fb128cceae7c.jpg', 5, 2, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Респиратор RK6030', 4, N'5030022', NULL, N'/products/5fb128ccef256.jpg', 3, 6, CAST(390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Респиратор "Алина" 310', 4, N'58850', NULL, N'/products/5fb128ccf3dd2.jpg', 5, 6, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Респиратор "Нева" 310', 4, N'59739', NULL, N'/products/5fb128cd0544b.jpg', 4, 3, CAST(289.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Респиратор "Юлия" 319', 4, N'59471', NULL, N'/products/5fb128cd08e3f.jpg', 4, 8, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Полумаска "Elipse" (Элипс) ABEK1P3', 4, N'5027980', NULL, N'/products/5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Полумаска "Elipse" (Элипс) A2P3', 1, N'5027965', NULL, N'/products/5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Полумаска "Elipse" (Элипс) А1', 1, N'5027958', NULL, N'/products/5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Полумаска "Elipse" (Элипс) P3 (анти-запах)', 1, N'59923', NULL, N'/products/5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Полумаска "Elipse" (Элипс) P3', 1, N'59922', NULL, N'/products/5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Полумаска "Elipse" (Элипс) A1P3', 1, N'59921', NULL, N'/products/5fb128cd2215f.jpg', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Полумаска "Elipse" (Элипс) ABEK1', 1, N'59920', NULL, N'/products/5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Респиратор-полумаска "3М" серия 6000', 1, N'58974', NULL, N'/products/5fb128cd2ab69.jpg', 5, 9, CAST(3490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (51, N'Респиратор-полумаска Исток 300/400', 1, N'59334', NULL, N'/products/5fb128cd2ef7a.jpg', 4, 7, CAST(490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (52, N'Комплект для защиты дыхания J-SET 6500 JETA', 1, N'4969295', NULL, N'/products/5fb128cd331c4.jpg', 4, 4, CAST(2490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (53, N'Лицевая маска Elipse Integra А1P3', 1, N'5029610', NULL, N'/products/5fb128cd3674d.jpg', 2, 10, CAST(9890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (54, N'Лицевая маска Elipse Integra P3', 5, N'5029091', NULL, N'/products/5fb128cd3af5c.jpg', 5, 9, CAST(7490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (55, N'Лицевая маска Elipse Integra (Элипс интегра) P3 (анти-запах)', 5, N'60360', NULL, N'/products/5fb128cd3e7e4.jpg', 2, 4, CAST(7590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (56, N'Полнолицевая маска 5950 JETA', 5, N'4958042', NULL, N'/products/5fb128cd41ece.jpg', 1, 5, CAST(11490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (57, N'Сменный патрон с фильтром 6054 для масок и полумасок "3М" серии 6000', 6, N'59271', NULL, N'/products/5fb128cd4672c.jpg', 4, 2, CAST(1890.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (58, N'Сменный патрон с фильтром 6059 для масок и полумасок "3М" серии 6000', 7, N'59253', NULL, N'/products/5fb128cd4c99d.jpg', 2, 9, CAST(2290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (59, N'Сменный фильтр 6510 A1 JETA', 7, N'5028197', NULL, N'/products/5fb128cd50a70.jpg', 5, 9, CAST(990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (60, N'Запасные фильтры к полумаске Elipse ABEK1P3', 7, N'5027978', NULL, N'/products/5fb128cd5433e.jpg', 3, 6, CAST(2990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (61, N'Запасные фильтры к полумаске Elipse A2P3', 8, N'5027961', NULL, N'/products/5fb128cd5838d.jpg', 2, 9, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (62, N'Запасные фильтры к полумаске Elipse (Элипс) А1', 8, N'5027921', NULL, N'/products/5fb128cd5bb7d.jpg', 3, 4, CAST(1290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (63, N'Сменный фильтр 6541 ABEK1 JETA', 7, N'4958040', NULL, N'/products/5fb128cd5ff78.jpg', 4, 6, CAST(1290.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (64, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3 (анти-запах)', 8, N'59919', NULL, N'/products/5fb128cd63666.jpg', 4, 4, CAST(1690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (65, N'Запасные фильтры к полумаске "Elipse" (Элипс) P3', 8, N'59918', NULL, N'/products/5fb128cd66df6.jpg', 4, 7, CAST(1390.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (66, N'Запасные фильтры к полумаске "Elipse" (Элипс) A1P3', 8, N'59917', NULL, N'/products/5fb128cd6a2b6.jpg', 1, 3, CAST(2190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (67, N'Запасные фильтры к полумаске "Elipse" (Элипс) ABEK1', 8, N'59916', NULL, N'/products/5fb128cd6e4ee.jpg', 3, 10, CAST(2590.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (68, N'Запасные фильтры (пара) АВЕ1 к полумаскам "Адвантейдж"', 8, N'59708', NULL, N'/products/5fb128cd71db3.jpg', 2, 3, CAST(1490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (69, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка В', 8, N'67661', NULL, N'/products/5fb128cd7518c.jpg', 5, 9, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (70, N'Запасной фильтр к полумаске Исток-300 (РПГ-67) марка А', 8, N'67660', NULL, N'/products/5fb128cd78fce.jpg', 3, 1, CAST(110.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (71, N'Держатель предфильтра 5101 JETA', 8, N'4958041', NULL, N'/products/5fb128cd7d2cd.jpg', 1, 7, CAST(199.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (72, N'Держатели предфильтра для масок и полумасок "3М" серии 6000', 9, N'58431', NULL, N'/products/5fb128cd80a06.jpg', 1, 4, CAST(264.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (73, N'Предфильтр Р2 (4 шт) 6020 JETA', 9, N'4958039', NULL, N'/products/5fb128cd8417e.jpg', 1, 7, CAST(380.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (74, N'Предфильтры для масок и полумасок "3М" серии 6000', 10, N'58917', NULL, N'/products/5fb128cd8818d.jpg', 5, 3, CAST(409.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (75, N'Респиратор "Мадонна" 110', 4, N'59324', NULL, N'/products/5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (76, N'Респиратор "Витязь" 100', 4, N'58827', NULL, N'/products/5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (77, N'Респиратор "Серёга" 109', 4, N'59898', NULL, N'/products/5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (78, N'Респиратор "Амперметр" 109', 4, N'59474', NULL, N'/products/5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (79, N'Респиратор "Фирюза" 110', 4, N'59324', NULL, N'/products/5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (80, N'Респиратор "Красный" 100', 4, N'58827', NULL, N'/products/5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (81, N'Респиратор "Волга" 109', 4, N'59898', NULL, N'/products/5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (82, N'Респиратор "Мадонна" 220', 4, N'59474', NULL, N'/products/5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (83, N'Респиратор "Витязь" 220', 4, N'59324', NULL, N'/products/5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (84, N'Респиратор "Серёга" 220', 4, N'58827', NULL, N'/products/5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (85, N'Респиратор "Амперметр" 220', 4, N'59898', NULL, N'/products/5fb128cc9414b.jpg', 4, 1, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (86, N'Респиратор "Фирюза" 220', 4, N'59474', NULL, N'/products/5fb128cc97ff4.jpg', 4, 8, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (87, N'Респиратор "Красный" 220', 4, N'59324', NULL, N'/products/5fb128cc8b750.jpg', 3, 9, CAST(129.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (88, N'Респиратор "Волга" 220', 4, N'58827', NULL, N'/products/5fb128cc8f4dd.jpg', 2, 8, CAST(99.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (89, N'Полумаска "Sunset" ABEK1P3', 4, N'5027980', NULL, N'/products/5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (90, N'Полумаска "Sunset" A2P3', 1, N'5027965', NULL, N'/products/5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (91, N'Полумаска "Sunset" А1', 1, N'5027958', NULL, N'/products/5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (92, N'Полумаска "Sunset" P3 (анти-запах)', 1, N'59923', NULL, N'/products/5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (93, N'Полумаска "Sunset" (Элипс) P3', 1, N'59922', NULL, N'/products/5fb128cd1e2b9.jpg', 5, 4, CAST(2690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (94, N'Полумаска "Sunset" A1P3', 1, N'59921', NULL, N'/products/5fb128cd2215f.jpg', 3, 9, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (95, N'Полумаска "Sunset" ABEK1', 1, N'59920', NULL, N'/products/5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (96, N'Полумаска "Moon" ABEK1', 1, N'59920', NULL, N'/products/5fb128cd268bf.jpg', 2, 8, CAST(5690.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (97, N'Полумаска "Moon" ABEK1P3', 4, N'5027980', NULL, N'/products/5fb128cd0d0b1.jpg', 2, 1, CAST(4990.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (98, N'Полумаска "Moon" A2P3', 1, N'5027965', NULL, N'/products/5fb128cd10ec2.jpg', 4, 2, CAST(4490.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (99, N'Полумаска "Moon" А1', 1, N'5027958', NULL, N'/products/5fb128cd157f9.jpg', 2, 4, CAST(3190.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (100, N'Полумаска "Moon" P3 (анти-запах)', 1, N'59923', NULL, N'/products/5fb128cd19baa.jpg', 1, 9, CAST(2790.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 3, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 41, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 15, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 35, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 3, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 14, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 31, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 45, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 8, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 7, 7)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 14, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 20, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 22, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 28, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 20, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 21, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 31, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 43, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 26, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 32, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 45, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 7, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 23, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 29, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 44, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 42, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 6, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 17, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 47, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 25, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 34, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 7, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 9, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 27, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 32, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 11, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (18, 48, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (20, 41, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (21, 49, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 2, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 11, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 37, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 12, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 33, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 36, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 38, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 6, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 26, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 29, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 6, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 14, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 36, 7)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (26, 7, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (27, 29, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (28, 1, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 16, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 36, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 21, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 23, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 27, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 36, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 14, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 43, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (32, 38, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 6, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 16, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 15, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 47, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 50, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 3, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 8, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 11, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 4, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 16, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 29, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 3, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 13, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 49, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 7, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 31, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 2, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 42, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 19, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 31, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (42, 20, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (43, 37, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 14, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 24, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 29, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (45, 45, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (46, 21, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 27, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 33, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 46, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 6, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 20, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 35, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (50, 50, 17)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Полумаски', 20)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Повязки', 64)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Маски', 23)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Респираторы', 90)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'На лицо', 91.5)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (6, N'Полнолицевые', 10.4)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (7, N'Сменные части', 25.3)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (8, N'Запасные части', 42.2)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (9, N'Держители', 159.1)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (10, N'Предфильтры', 176)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [ProductDb] SET  READ_WRITE 
GO
