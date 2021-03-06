USE [master]
GO
/****** Object:  Database [mybookstore]    Script Date: 22/11/2017 11:37:42 AM ******/
CREATE DATABASE [mybookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mybookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mybookstore.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mybookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mybookstore_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mybookstore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mybookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mybookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mybookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mybookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mybookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mybookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [mybookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mybookstore] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mybookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mybookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mybookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mybookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mybookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mybookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mybookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mybookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mybookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mybookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mybookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mybookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mybookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mybookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mybookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mybookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mybookstore] SET RECOVERY FULL 
GO
ALTER DATABASE [mybookstore] SET  MULTI_USER 
GO
ALTER DATABASE [mybookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mybookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mybookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mybookstore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mybookstore', N'ON'
GO
USE [mybookstore]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 22/11/2017 11:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[authors](
	[authorID] [int] IDENTITY(1,1) NOT NULL,
	[authorLN] [varchar](40) NOT NULL,
	[authorFN] [varchar](20) NOT NULL,
	[authorPhone] [char](12) NOT NULL,
	[authorAddress] [varchar](40) NULL,
	[authorCity] [varchar](20) NULL,
	[authorState] [char](2) NULL,
	[authorZip] [char](5) NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[authorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 22/11/2017 11:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[publishers](
	[pubID] [int] IDENTITY(1,1) NOT NULL,
	[pubName] [varchar](40) NULL,
 CONSTRAINT [PK_publishers] PRIMARY KEY CLUSTERED 
(
	[pubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[titles]    Script Date: 22/11/2017 11:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[titles](
	[titleID] [int] IDENTITY(1,1) NOT NULL,
	[pubID] [int] NULL,
	[authorID] [int] NULL,
	[titleName] [varchar](80) NOT NULL,
	[titlePrice] [decimal](18, 2) NULL,
	[titlePubDate] [datetime] NULL,
	[titleNotes] [varchar](200) NULL,
 CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED 
(
	[titleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[types]    Script Date: 22/11/2017 11:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[types](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_types] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 22/11/2017 11:37:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NULL,
	[userEmail] [varchar](80) NULL,
	[userPW] [varchar](max) NULL,
	[userFN] [varchar](80) NULL,
	[userLN] [varchar](80) NULL,
	[userPhone] [varchar](12) NULL,
	[userAddress] [varchar](200) NULL,
	[userStatus] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[authors] ON 

INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (1, N'Green', N'Marjorie', N'415 986-7020', N'309 63rd St. #411', N'Oakland', N'CA', N'94618')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (2, N'Dull', N'Ann', N'415 836-7128', N'3410 Blonde St.', N'Palo Alto', N'CA', N'94301')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (3, N'Panteley', N'Sylvia', N'301 946-8853', N'1956 Arlington Pl.', N'Rockville', N'MD', N'20853')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (4, N'del Castillo', N'Innes', N'615 996-8275', N'2286 Cram Pl. #86', N'Ann Arbor', N'MI', N'48105')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (5, N'Smith', N'Meander', N'913 843-0462', N'10 Mississippi Dr.', N'Lawrence', N'KS', N'66044')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (6, N'Straight', N'Dean', N'415 834-2919', N'5420 College Av.', N'Oakland', N'CA', N'94609')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (7, N'O''Leary', N'Michael', N'408 286-2428', N'22 Cleveland Av. #14', N'San Jose', N'CA', N'95128')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (8, N'Hunter', N'Sheryl', N'415 836-7128', N'3410 Blonde St.', N'Palo Alto', N'CA', N'94301')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (9, N'Blotchet-Halls', N'Reginald', N'503 745-6402', N'55 Hillsdale Bl.', N'Corvallis', N'OR', N'97330')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (10, N'McBadden', N'Heather', N'707 448-4982', N'301 Putnam', N'Vacaville', N'CA', N'95688')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (11, N'Ringer', N'Anne', N'801 826-0752', N'67 Seventh Av.', N'Salt Lake City', N'UT', N'84152')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (12, N'Locksley', N'Charlene', N'415 585-4620', N'18 Broadway Av.', N'San Francisco', N'CA', N'94130')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (13, N'Stringer', N'Dirk', N'415 843-2991', N'5420 Telegraph Av.', N'Oakland', N'CA', N'94609')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (14, N'Carson', N'Cheryl', N'415 548-7723', N'589 Darwin Ln.', N'Berkeley', N'CA', N'94705')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (15, N'Yokomoto', N'Akiko', N'415 935-4228', N'3 Silver Ct.', N'Walnut Creek', N'CA', N'94595')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (16, N'Gringlesby', N'Burt', N'707 938-6445', N'PO Box 792', N'Covelo', N'CA', N'95428')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (17, N'DeFrance', N'Michel', N'219 547-9982', N'3 Balding Pl.', N'Gary', N'IN', N'46403')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (18, N'Ringer', N'Albert', N'801 826-0752', N'67 Seventh Av.', N'Salt Lake City', N'UT', N'84152')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (19, N'Karsen', N'Livia', N'415 534-9219', N'5720 McAuley St.', N'Oakland', N'CA', N'94609')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (20, N'MacFeather', N'Stearns', N'415 354-7128', N'44 Upland Hts.', N'Oakland', N'CA', N'94612')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (21, N'White', N'Johnson', N'408 496-7223', N'10932 Bigge Rd.', N'Menlo Park', N'CA', N'94025')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (22, N'Bennet', N'Abraham', N'415 658-9932', N'6223 Bateman St.', N'Berkeley', N'CA', N'94705')
INSERT [dbo].[authors] ([authorID], [authorLN], [authorFN], [authorPhone], [authorAddress], [authorCity], [authorState], [authorZip]) VALUES (23, N'Greene', N'Morningstar', N'615 297-2723', N'22 Graybar House Rd.', N'Nashville', N'TN', N'37215')
SET IDENTITY_INSERT [dbo].[authors] OFF
SET IDENTITY_INSERT [dbo].[publishers] ON 

INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (1, N'GGG&G')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (2, N'Ramona Publishers')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (3, N'Five Lakes Publishing')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (4, N'New Moon Books')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (5, N'Scootney Books')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (6, N'Binnet & Hardley')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (7, N'Algodata Infosystems')
INSERT [dbo].[publishers] ([pubID], [pubName]) VALUES (8, N'Lucerne Publishing')
SET IDENTITY_INSERT [dbo].[publishers] OFF
SET IDENTITY_INSERT [dbo].[titles] ON 

INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (1, 6, 19, N'Computer Phobic AND Non-Phobic Individuals: Behavior Variations', CAST(21.59 AS Decimal(18, 2)), CAST(0x000092F400000000 AS DateTime), N'A must for the specialist, this book examines the difference between those who hate and fear computers and those who don''t.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (2, 6, 11, N'The Gourmet Microwave', CAST(2.99 AS Decimal(18, 2)), CAST(0x00008B0D00000000 AS DateTime), N'Traditional French gourmet recipes adapted for modern microwave cooking.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (3, 4, 21, N'Prolonged Data Deprivation: Four Case Studies', CAST(19.99 AS Decimal(18, 2)), CAST(0x000090BC00000000 AS DateTime), N'What happens when the data runs dry?  Searching evaluations of information-shortage effects.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (4, 7, 20, N'Cooking with Computers: Surreptitious Balance Sheets', CAST(11.95 AS Decimal(18, 2)), CAST(0x00008F4C00000000 AS DateTime), N'Helpful hints on how to use your electronic resources to the best advantage.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (5, 4, 1, N'You Can Combat Computer Stress!', CAST(2.99 AS Decimal(18, 2)), CAST(0x000092F800000000 AS DateTime), N'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (6, 7, 22, N'The Busy Executive''s Database Guide', CAST(19.99 AS Decimal(18, 2)), CAST(0x00008DE100000000 AS DateTime), N'An overview of available database systems with emphasis on common business applications. Illustrated.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (7, 6, 3, N'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean', CAST(20.95 AS Decimal(18, 2)), CAST(0x00008B8A00000000 AS DateTime), N'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (8, 7, 14, N'But Is It User Friendly?', CAST(22.95 AS Decimal(18, 2)), CAST(0x00008C8600000000 AS DateTime), N'A survey of software for the naive user, focusing on the ''friendliness'' of each.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (9, 6, 9, N'Fifty Years in Buckingham Palace Kitchens', CAST(11.95 AS Decimal(18, 2)), CAST(0x00008C7400000000 AS DateTime), N'More anecdotes from the Queen''s favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (10, 6, 4, N'Silicon Valley Gastronomic Treats', CAST(19.99 AS Decimal(18, 2)), CAST(0x000092FC00000000 AS DateTime), N'Favorite recipes for quick, easy, and elegant meals.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (11, 6, 15, N'Sushi, Anyone?', CAST(14.99 AS Decimal(18, 2)), CAST(0x00008DE100000000 AS DateTime), N'Detailed instructions on how to make authentic Japanese sushi in your spare time.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (12, 7, 8, N'Secrets of Silicon Valley', CAST(20.00 AS Decimal(18, 2)), CAST(0x000092FF00000000 AS DateTime), N'Muckraking reporting on the world''s largest computer hardware and software manufacturers.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (13, 4, 12, N'Emotional Security: A New Algorithm', CAST(7.99 AS Decimal(18, 2)), CAST(0x00008C7400000000 AS DateTime), N'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (14, 7, 12, N'Net Etiquette', NULL, CAST(0x00008F8600000000 AS DateTime), N'A must-read for computer conferencing.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (15, 7, 6, N'Straight Talk About Computers', CAST(19.99 AS Decimal(18, 2)), CAST(0x0000923300000000 AS DateTime), N'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (16, 4, 18, N'Life Without Fear', CAST(7.00 AS Decimal(18, 2)), CAST(0x0000929C00000000 AS DateTime), N'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.')
INSERT [dbo].[titles] ([titleID], [pubID], [authorID], [titleName], [titlePrice], [titlePubDate], [titleNotes]) VALUES (17, 4, 18, N'Is Anger the Enemy?', CAST(10.95 AS Decimal(18, 2)), CAST(0x0000922C00000000 AS DateTime), N'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.')
SET IDENTITY_INSERT [dbo].[titles] OFF
SET IDENTITY_INSERT [dbo].[types] ON 

INSERT [dbo].[types] ([typeID], [typeName]) VALUES (1, N'Administrator')
INSERT [dbo].[types] ([typeID], [typeName]) VALUES (2, N'Supervisor')
INSERT [dbo].[types] ([typeID], [typeName]) VALUES (3, N'Personnel')
SET IDENTITY_INSERT [dbo].[types] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [typeID], [userEmail], [userPW], [userFN], [userLN], [userPhone], [userAddress], [userStatus]) VALUES (1, 1, N'abramjohn.limpin@benilde.edu.ph', N'ujJTh2rta8ItSm/1PYQGxq2GQZXtFEq1yHYhtsIztUi66uaVbfNG7IwX9eoQ817jy8UUeX7X3dMUVGTioLq0Ew==', N'Abram John', N'Limpin', N'', N'', N'Active')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [aunmind]    Script Date: 22/11/2017 11:37:42 AM ******/
CREATE NONCLUSTERED INDEX [aunmind] ON [dbo].[authors]
(
	[authorLN] ASC,
	[authorFN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [titleind]    Script Date: 22/11/2017 11:37:42 AM ******/
CREATE NONCLUSTERED INDEX [titleind] ON [dbo].[titles]
(
	[titleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PK_users]    Script Date: 22/11/2017 11:37:42 AM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [PK_users] PRIMARY KEY NONCLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [mybookstore] SET  READ_WRITE 
GO
