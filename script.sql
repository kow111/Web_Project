USE [master]
GO
/****** Object:  Database [SocialNetwork]    Script Date: 12/14/2023 11:38:08 AM ******/
CREATE DATABASE [SocialNetwork]

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialNetwork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialNetwork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialNetwork] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialNetwork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialNetwork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialNetwork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialNetwork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialNetwork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialNetwork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialNetwork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialNetwork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialNetwork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialNetwork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialNetwork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialNetwork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialNetwork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialNetwork] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SocialNetwork] SET  MULTI_USER 
GO
ALTER DATABASE [SocialNetwork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialNetwork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialNetwork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialNetwork] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialNetwork] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialNetwork] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SocialNetwork] SET QUERY_STORE = ON
GO
ALTER DATABASE [SocialNetwork] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SocialNetwork]
GO
USE [SocialNetwork]
GO
/****** Object:  Sequence [dbo].[art_sequence]    Script Date: 12/14/2023 11:38:09 AM ******/
CREATE SEQUENCE [dbo].[art_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
USE [SocialNetwork]
GO
/****** Object:  Sequence [dbo].[hibernate_sequence]    Script Date: 12/14/2023 11:38:09 AM ******/
CREATE SEQUENCE [dbo].[hibernate_sequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[Article]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [bigint] NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [varchar](50) NULL,
	[Likes] [int] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[UserID] [bigint] NOT NULL,
	[ArticleID] [bigint] NOT NULL,
	[Comment] [nvarchar](500) NOT NULL,
	[id] [bigint] NOT NULL,
	[Time] [datetime] NULL,
	[Image] [varchar](50) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[receiver] [bigint] NOT NULL,
	[sender] [bigint] NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Like]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[UserID] [bigint] NOT NULL,
	[ArticleID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[usersend] [bigint] NOT NULL,
	[userreceive] [bigint] NOT NULL,
	[message] [nvarchar](500) NOT NULL,
	[id] [bigint] NOT NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[notif] [nvarchar](50) NULL,
	[sender] [bigint] NULL,
	[receiver] [bigint] NULL,
	[Time] [datetime] NULL,
	[article] [bigint] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/14/2023 11:38:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[phone_number] [char](12) NOT NULL,
	[Image] [nvarchar](500) NULL,
	[Password] [nvarchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (6, 2, N'Tieu de 1', N'1699266299718.jpg', 3, CAST(N'2023-11-03T15:28:39.773' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (11, 1, N'Lại là Tèo', N'1701870197317.jpg', 2, CAST(N'2023-11-28T21:14:34.337' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (12, 1, N'Gau sieu to khong lo', N'1701180889645.jpg', 1, CAST(N'2023-11-28T21:14:50.960' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (13, 1, N'Tèo', NULL, 2, CAST(N'2023-11-28T21:16:05.207' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (14, 1, N'Buon that kh z -2', N'1701870005781.jpg', 2, CAST(N'2023-11-28T21:18:25.947' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (18, 1, N'Bài đăng nè', NULL, 1, CAST(N'2023-12-03T18:30:32.157' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (22, 9, N'Bài thứ 1 nè', N'1701869530129.jpg', 1, CAST(N'2023-12-06T20:32:12.930' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (23, 2, N'Tieu de 2', N'1701869718593.jpg', 1, CAST(N'2023-12-06T20:35:20.857' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [UserID], [Description], [Image], [Likes], [Time]) VALUES (24, 1, N'Tí nè bây', N'1702524714743.jpg', 1, CAST(N'2023-12-14T10:29:58.160' AS DateTime))
GO
INSERT [dbo].[Comment] ([UserID], [ArticleID], [Comment], [id], [Time], [Image]) VALUES (1, 6, N'Tèo ', 12, CAST(N'2023-12-04T00:34:57.673' AS DateTime), NULL)
INSERT [dbo].[Comment] ([UserID], [ArticleID], [Comment], [id], [Time], [Image]) VALUES (2, 6, N'', 13, CAST(N'2023-12-06T20:34:20.983' AS DateTime), N'1701869659182.jpg')
INSERT [dbo].[Comment] ([UserID], [ArticleID], [Comment], [id], [Time], [Image]) VALUES (10, 6, N'Hình đẹp z', 14, CAST(N'2023-12-06T20:56:43.483' AS DateTime), NULL)
INSERT [dbo].[Comment] ([UserID], [ArticleID], [Comment], [id], [Time], [Image]) VALUES (1, 6, N'Gấu đẹp quá', 15, CAST(N'2023-12-06T23:18:08.460' AS DateTime), N'1701879485797.jpg')
INSERT [dbo].[Comment] ([UserID], [ArticleID], [Comment], [id], [Time], [Image]) VALUES (1, 24, N'Tí đâu bây', 16, CAST(N'2023-12-14T10:30:38.740' AS DateTime), N'1702524661751.jpg')
GO
SET IDENTITY_INSERT [dbo].[Friend] ON 

INSERT [dbo].[Friend] ([receiver], [sender], [id], [status]) VALUES (3, 1, 2, 0)
INSERT [dbo].[Friend] ([receiver], [sender], [id], [status]) VALUES (2, 1, 11, 1)
INSERT [dbo].[Friend] ([receiver], [sender], [id], [status]) VALUES (1, 15, 12, 1)
SET IDENTITY_INSERT [dbo].[Friend] OFF
GO
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 6)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 14)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (2, 23)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (3, 6)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 11)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 22)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 18)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 24)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (2, 6)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (2, 14)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (2, 13)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 12)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (1, 13)
INSERT [dbo].[Like] ([UserID], [ArticleID]) VALUES (10, 11)
GO
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Hello', 1, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (2, 1, N'Ban', 2, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (3, 1, N'Nhe', 3, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (2, 3, N'Chao Ban', 4, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Chao Ban', 5, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Hello?', 6, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (2, 1, N'Day day', 7, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Alo', 8, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Anhon', 9, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'B&#7841;n &#417;i', 10, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'Ko', 11, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'ko', 12, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Hello, where are you', 13, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'alo
', 14, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'a
', 15, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'b', 16, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'c', 17, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'2', 18, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'3', 19, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Ni Shuo senmasdashduahskdjhsajkjashdjkhasjdhjkashdkjashdjkhjakshdkjashkdjhakjshdjkashdkashdhsajdhjkasdjkashdsa', 20, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'NI shuo
', 21, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Ni shuo?', 22, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (2, 1, N'cai gi ma spam du z ne', 23, CAST(N'2023-11-03T15:26:18.493' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Shuo?', 24, CAST(N'2023-11-27T21:36:17.987' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Ni Shuo senmasdashduahskdjhsajkjashdjkhasjdhjkashdkjashdjkhjakshd kjashkdjhakjshdjkashdkashdhsajdhjkasdjkashdsa', 25, CAST(N'2023-11-27T21:38:36.223' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Ni Shuo senmasdashduahskdjhsajkjashdjkhasjdhjkashdkjashdjkhjakshd kjashkdjhakjs hdjkashdkashdhsajdhjkasdjkashdsa', 26, CAST(N'2023-11-27T21:38:52.740' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Ni Shuo senmasdashduahskdjhsajkjashdjkhasjdhjkashd', 27, CAST(N'2023-11-27T21:38:58.057' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (2, 1, N'ehehe', 28, CAST(N'2023-11-29T08:43:14.133' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'asdsad', 29, CAST(N'2023-11-29T09:56:08.247' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'asdasdsa', 30, CAST(N'2023-11-30T15:13:49.107' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'???', 34, CAST(N'2023-12-01T09:39:16.623' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 1, N'Tiếng việt nè', 35, CAST(N'2023-12-03T18:29:55.707' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 1, N'Chào', 36, CAST(N'2023-12-06T17:06:21.680' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Chào', 37, CAST(N'2023-12-06T17:06:30.550' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Bạn', 38, CAST(N'2023-12-06T17:06:33.910' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'123', 39, CAST(N'2023-12-06T17:07:19.227' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'Làm sao đc z
', 40, CAST(N'2023-12-06T17:07:59.273' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Hi there', 41, CAST(N'2023-12-06T17:17:31.537' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (9, 2, N'Chào T1 con', 42, CAST(N'2023-12-06T20:33:26.067' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Hello Tèo', 44, CAST(N'2023-12-07T00:02:02.817' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 2, N'Nói gì đi', 45, CAST(N'2023-12-07T00:02:08.197' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (2, 1, N'Đây đây', 46, CAST(N'2023-12-07T00:06:24.930' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'Dù đã cố
', 47, CAST(N'2023-12-11T20:51:48.613' AS DateTime))
INSERT [dbo].[Message] ([usersend], [userreceive], [message], [id], [Time]) VALUES (1, 3, N'Nhưng người vẫn buông', 48, CAST(N'2023-12-14T10:34:01.247' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (2, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-11-28T17:58:21.723' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (4, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-11-28T18:03:41.310' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (5, N'Tí đã like bài viết của bạn', 2, 1, CAST(N'2023-11-30T15:14:38.143' AS DateTime), 14, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (6, N'Tí đã like bài viết của bạn', 2, 1, CAST(N'2023-11-30T15:14:39.553' AS DateTime), 13, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (7, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:03:06.993' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (8, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:03:07.960' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (9, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:06:51.967' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (10, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:06:53.027' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (11, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:09:46.870' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (15, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:10:55.163' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (16, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:12:52.367' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (17, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:12:53.497' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (18, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:12:54.413' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (19, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:12:55.057' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (20, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:12:55.447' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (21, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:12:59.507' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (22, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:13:00.597' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (34, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:19:22.363' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (35, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:19:23.527' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (42, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:21:15.070' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (43, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:21:16.173' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (44, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:21:17.070' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (45, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:21:18.053' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (46, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:21:18.817' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (62, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:34:03.983' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (67, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:35:26.957' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (69, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:35:29.077' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (71, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:35:41.343' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (73, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:35:46.273' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (77, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:40:58.607' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (78, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:40:58.973' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (81, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:12.137' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (82, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:13.440' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (83, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:14.510' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (84, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:15.413' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (85, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:16.327' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (86, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:17.240' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (87, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:42:18.500' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (94, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:46:39.033' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (95, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:46:39.967' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (99, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:09.800' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (100, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:15.890' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (101, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:16.823' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (102, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:17.683' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (103, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:18.567' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (104, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:19.453' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (105, N'Teo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-01T22:52:20.390' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (111, N'Teo đã comment bài viết của bạn', 1, 2, CAST(N'2023-12-04T00:34:57.660' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (112, N'Teo đã gửi yêu cầu kết bạn', 1, 2, CAST(N'2023-12-05T16:12:26.597' AS DateTime), NULL, 2)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (113, N'Nguyễn Văn Tèo đã comment bài viết của bạn', 1, 2, CAST(N'2023-12-06T17:29:46.800' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (114, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 9, CAST(N'2023-12-06T20:43:45.423' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (115, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:52:53.423' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (116, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:52:57.197' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (117, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:52:58.330' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (118, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:53:08.087' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (119, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:53:09.353' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (120, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:53:18.853' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (121, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:53:20.643' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (122, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:53:26.523' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (123, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:54:33.093' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (124, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T20:54:34.297' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (125, N'Nguyễn Việt Hoài đã like bài viết của bạn', 10, 2, CAST(N'2023-12-06T20:56:31.967' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (126, N'Nguyễn Việt Hoài đã like bài viết của bạn', 10, 2, CAST(N'2023-12-06T20:56:33.170' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (127, N'Nguyễn Việt Hoài đã like bài viết của bạn', 10, 2, CAST(N'2023-12-06T20:56:36.353' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (128, N'Nguyễn Việt Hoài đã comment bài viết của bạn', 10, 2, CAST(N'2023-12-06T20:56:43.477' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (132, N'Nguyễn Việt Hoài đã like bài viết của bạn', 10, 1, CAST(N'2023-12-06T21:43:08.957' AS DateTime), 11, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (133, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-06T23:17:52.483' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (134, N'Nguyễn Văn Tèo đã comment bài viết của bạn', 1, 2, CAST(N'2023-12-06T23:18:08.453' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (135, N'Nguyễn Văn Tèo đã comment bài viết của bạn', 1, 2, CAST(N'2023-12-07T00:01:20.357' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (136, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 2, CAST(N'2023-12-07T00:01:50.067' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (137, N'Nguyễn Văn Tí đã gửi yêu cầu kết bạn', 1, 2, CAST(N'2023-12-07T00:03:41.527' AS DateTime), NULL, 2)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (138, N'T1 Con đã chấp nhận yêu cầu kết bạn', 2, 1, CAST(N'2023-12-07T00:03:59.720' AS DateTime), NULL, 2)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (142, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-11T20:51:16.893' AS DateTime), 6, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (143, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T15:48:51.330' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (144, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T15:48:55.150' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (145, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T15:56:31.887' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (146, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T15:56:33.433' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (147, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T15:56:33.817' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (148, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:20.407' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (149, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:23.327' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (150, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:24.360' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (151, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:25.170' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (152, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:26.087' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (153, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:27.043' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (154, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:29.640' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (155, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:30.497' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (156, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:01:37.450' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (157, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:01:38.983' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (158, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:01:40.133' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (159, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:01:41.243' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (160, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:01:42.247' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (161, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:47.030' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (162, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:48.240' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (163, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:51.480' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (164, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:52.253' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (165, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:01:53.110' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (166, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:07:10.213' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (167, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:07:14.147' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (168, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:07:15.460' AS DateTime), 23, 1)
GO
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (169, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:07:16.567' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (170, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:07:20.143' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (171, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:07:21.737' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (172, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:08:33.610' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (173, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:08:35.437' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (174, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:08:38.030' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (175, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:11:00.797' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (176, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:12:11.547' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (177, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:12:16.170' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (178, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:12:50.653' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (179, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:12:53.127' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (180, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:14:43.747' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (181, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:14:46.323' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (182, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:02.217' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (183, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:02.217' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (184, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:03.397' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (185, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:03.397' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (186, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:04.500' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (187, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:04.500' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (188, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:05.573' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (189, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:19:05.573' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (190, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:20:46.077' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (191, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:03.683' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (192, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:03.683' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (193, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:05.790' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (194, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:06.597' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (195, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:07.270' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (196, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:07.270' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (197, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:08.773' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (198, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:22:08.777' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (199, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:23:05.803' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (200, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:24:34.957' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (201, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:24:46.997' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (202, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:26:19.743' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (203, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:26:21.177' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (204, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:26:23.787' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (205, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-13T16:26:25.330' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (206, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:27:05.993' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (207, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-13T16:27:07.263' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (208, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-14T10:29:35.707' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (209, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-14T10:29:36.823' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (210, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 2, CAST(N'2023-12-14T10:29:37.937' AS DateTime), 23, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (211, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-14T10:29:40.733' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (212, N'Nguyễn Văn Tí đã like bài viết của bạn', 1, 9, CAST(N'2023-12-14T10:29:41.873' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (213, N'Nguyễn Văn Tèo đã gửi yêu cầu kết bạn', 1, 2, CAST(N'2023-12-14T10:38:04.110' AS DateTime), NULL, 2)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (214, N'T1 Con đã chấp nhận yêu cầu kết bạn', 2, 1, CAST(N'2023-12-14T10:38:20.927' AS DateTime), NULL, 2)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (215, N'Nguyễn Văn Tèo đã like bài viết của bạn', 1, 9, CAST(N'2023-12-14T10:59:41.183' AS DateTime), 22, 1)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (216, N'Tèo em đã gửi yêu cầu kết bạn', 15, 1, CAST(N'2023-12-14T11:12:36.927' AS DateTime), NULL, 2)
INSERT [dbo].[Notification] ([id], [notif], [sender], [receiver], [Time], [article], [Type]) VALUES (217, N'Nguyễn Văn Tèo đã chấp nhận yêu cầu kết bạn', 1, 15, CAST(N'2023-12-14T11:12:47.893' AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (1, N'Nguyễn Văn Tèo', N'0963094408  ', N'1701882161113.jpg', N'1234', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (2, N'T1 Con', N'0963094409  ', N'1701858765278.jpg', N'1254', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (3, N'Pham Ngoc Thach', N'0909855059  ', N'1699115835337.jpg', N'1234', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (8, N'Tiếng việt', N'123123123   ', N'default.jpg', N'123', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (9, N'Nguyễn Việt Anh', N'0909855056  ', N'1701869548724.jpg', N'1234', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (10, N'Nguyễn Việt Hoài', N'0978123123  ', N'1701870962212.jpg', N'1234', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (11, N'Phạm Thanh Phong', N'0123123     ', N'default.jpg', N'123', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (12, N'Phạm Hải', N'098098098   ', N'default.jpg', N'123123', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (13, N'Trần Quân', N'090909877   ', N'default.jpg', N'123', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (14, N'Nguyễn Quân', N'123123133   ', N'default.jpg', N'123', 1)
INSERT [dbo].[User] ([UserID], [Name], [phone_number], [Image], [Password], [Active]) VALUES (15, N'Tèo em', N'0902855056  ', N'default.jpg', N'1234', 1)
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_User]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [FK_Friend_User] FOREIGN KEY([receiver])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [FK_Friend_User]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [FK_Friend_User1] FOREIGN KEY([sender])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [FK_Friend_User1]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_Article]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_User]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User] FOREIGN KEY([usersend])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_User1] FOREIGN KEY([userreceive])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
USE [master]
GO
ALTER DATABASE [SocialNetwork] SET  READ_WRITE 
GO
