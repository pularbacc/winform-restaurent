USE [master]
GO
/****** Object:  Database [Quan_Li_Nha_Hang]    Script Date: 24-Dec-20 5:57:19 PM ******/
CREATE DATABASE [Quan_Li_Nha_Hang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quan_Li_Nha_Hang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Quan_Li_Nha_Hang.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Quan_Li_Nha_Hang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Quan_Li_Nha_Hang_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quan_Li_Nha_Hang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET  MULTI_USER 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Quan_Li_Nha_Hang]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[ID_Ban] [int] NOT NULL,
	[Tang] [int] NOT NULL,
	[Ten_Ban] [int] NOT NULL,
	[Tinh_Trang_Ban] [nvarchar](50) NOT NULL CONSTRAINT [DF__Ban__Tinh_Trang___108B795B]  DEFAULT ('0'),
 CONSTRAINT [PK__Ban__142B84F954A0754F] PRIMARY KEY CLUSTERED 
(
	[ID_Ban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Coupon](
	[Ma_Coupon] [varchar](15) NOT NULL,
	[Ten_Chuong_Trinh_Khuyen_Mai] [nvarchar](200) NOT NULL,
	[Phan_Tram_Giam] [int] NOT NULL,
	[Ngay_Bat_Dau] [date] NOT NULL,
	[Ngay_Ket_Thuc] [date] NOT NULL,
 CONSTRAINT [PK__Coupon__8665E4273F2DBF9F] PRIMARY KEY CLUSTERED 
(
	[Ma_Coupon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hoa_Don]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hoa_Don](
	[ID_Bill] [int] IDENTITY(1,1) NOT NULL,
	[Ngay_Xuat] [date] NULL,
	[Ngay_Nhap] [date] NOT NULL,
	[ID_Ban] [int] NOT NULL,
	[Trang_Thai_Thanh_Toan] [bit] NOT NULL CONSTRAINT [DF__Hoa_Don__Trang_T__1FCDBCEB]  DEFAULT ('0'),
	[ID_Quan_Li] [int] NOT NULL,
	[Ma_Coupon] [varchar](15) NOT NULL CONSTRAINT [DF__Hoa_Don__Ma_Coup__2AA05119]  DEFAULT ('0'),
	[Ten] [nvarchar](100) NOT NULL CONSTRAINT [DF__Hoa_Don__Ten__2B947552]  DEFAULT ('0'),
	[Email] [varchar](100) NOT NULL CONSTRAINT [DF__Hoa_Don__Email__2C88998B]  DEFAULT ('0'),
	[Dia_Chi_Khach] [nvarchar](max) NOT NULL CONSTRAINT [DF__Hoa_Don__Dia_Chi__2D7CBDC4]  DEFAULT ('0'),
	[So_Dien_Thoai] [varchar](15) NOT NULL CONSTRAINT [DF__Hoa_Don__So_Dien__2E70E1FD]  DEFAULT ('0'),
	[Tong_Tien] [bigint] NULL CONSTRAINT [DF__Hoa_Don__Tong_Ti__7ABC33CD]  DEFAULT ((0)),
 CONSTRAINT [PK__Hoa_Don__F098680A0710C632] PRIMARY KEY CLUSTERED 
(
	[ID_Bill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Loai_Thuc_An]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loai_Thuc_An](
	[ID_Loai] [varchar](20) NOT NULL,
	[Ten_Loai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nguoi_Quan_Li]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nguoi_Quan_Li](
	[ID_Quan_Li] [int] IDENTITY(1,1) NOT NULL,
	[Email_Dang_Nhap] [varchar](100) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[Dia_Chi] [nvarchar](255) NOT NULL,
	[Gioi_Tinh] [nvarchar](15) NOT NULL,
	[Ngay_Sinh] [date] NOT NULL,
	[So_Dien_Thoai] [varchar](15) NOT NULL,
	[Chu_Quan] [int] NOT NULL CONSTRAINT [DF__Nguoi_Quan__Type__5DCAEF64]  DEFAULT ('0'),
	[Trang_Thai_Dang_Nhap] [bit] NOT NULL CONSTRAINT [DF__Nguoi_Qua__Trang__473C8FC7]  DEFAULT ((0)),
	[Tang] [int] NOT NULL,
	[Password] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Nguoi_Quan_Li_1] PRIMARY KEY CLUSTERED 
(
	[ID_Quan_Li] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Thong_Tin_Hoa_Don]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thong_Tin_Hoa_Don](
	[ID_Bill] [int] NOT NULL,
	[ID_Mon] [int] NOT NULL,
	[So_Mon] [int] NOT NULL,
	[Gia_Hien_Tai] [int] NOT NULL,
	[Tong_Tien_Mon] [int] NOT NULL,
	[ID_TTHD] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Thong_Ti__D9991862B0D623FA] PRIMARY KEY CLUSTERED 
(
	[ID_TTHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Thuc_An]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Thuc_An](
	[ID_Mon] [int] NOT NULL,
	[Ten_Mon] [nvarchar](100) NOT NULL,
	[ID_Loai] [varchar](20) NOT NULL,
	[Tinh_Trang] [nvarchar](50) NOT NULL CONSTRAINT [DF__Thuc_An__Tinh_Tr__4D94879B]  DEFAULT ('1'),
	[Gia] [int] NOT NULL,
	[Don_Vi_Tinh] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Thuc_An] PRIMARY KEY CLUSTERED 
(
	[ID_Mon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (1, 1, 101, N'Có Người')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (2, 1, 102, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (3, 1, 103, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (4, 1, 104, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (5, 1, 105, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (6, 1, 106, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (7, 1, 107, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (8, 1, 108, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (9, 1, 109, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (10, 1, 110, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (11, 1, 111, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (12, 1, 112, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (13, 1, 113, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (14, 1, 114, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (15, 1, 115, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (16, 1, 116, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (17, 1, 117, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (18, 1, 118, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (19, 1, 119, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (20, 1, 120, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (21, 1, 121, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (22, 1, 122, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (23, 1, 123, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (24, 1, 124, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (25, 1, 125, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (26, 1, 126, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (27, 1, 127, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (28, 1, 128, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (29, 1, 129, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (30, 1, 130, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (31, 2, 201, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (32, 2, 202, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (33, 2, 203, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (34, 2, 204, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (35, 2, 205, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (36, 2, 206, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (37, 2, 207, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (38, 2, 208, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (39, 2, 209, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (40, 2, 210, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (41, 2, 211, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (42, 2, 212, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (43, 2, 213, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (44, 2, 214, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (45, 2, 215, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (46, 2, 216, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (47, 2, 217, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (48, 2, 218, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (49, 2, 219, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (50, 2, 220, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (51, 2, 221, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (52, 2, 222, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (53, 2, 223, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (54, 2, 224, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (55, 2, 225, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (56, 2, 226, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (57, 2, 227, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (58, 2, 228, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (59, 2, 229, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (60, 2, 230, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (61, 3, 301, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (62, 3, 302, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (63, 3, 303, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (64, 3, 304, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (65, 3, 305, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (66, 3, 306, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (67, 3, 307, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (68, 3, 308, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (69, 3, 309, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (70, 3, 310, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (71, 3, 311, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (72, 3, 312, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (73, 3, 313, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (74, 3, 314, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (75, 3, 315, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (76, 3, 316, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (77, 3, 317, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (78, 3, 318, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (79, 3, 319, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (80, 3, 320, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (81, 3, 321, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (82, 3, 322, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (83, 3, 323, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (84, 3, 324, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (85, 3, 325, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (86, 3, 326, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (87, 3, 327, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (88, 3, 328, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (89, 3, 329, N'Trống')
INSERT [dbo].[Ban] ([ID_Ban], [Tang], [Ten_Ban], [Tinh_Trang_Ban]) VALUES (90, 3, 330, N'Trống')
INSERT [dbo].[Coupon] ([Ma_Coupon], [Ten_Chuong_Trinh_Khuyen_Mai], [Phan_Tram_Giam], [Ngay_Bat_Dau], [Ngay_Ket_Thuc]) VALUES (N'0', N'Khong KM', 0, CAST(N'1753-01-01' AS Date), CAST(N'3800-01-01' AS Date))
INSERT [dbo].[Coupon] ([Ma_Coupon], [Ten_Chuong_Trinh_Khuyen_Mai], [Phan_Tram_Giam], [Ngay_Bat_Dau], [Ngay_Ket_Thuc]) VALUES (N'1', N'KM 20PT', 20, CAST(N'2020-12-22' AS Date), CAST(N'2020-12-27' AS Date))
SET IDENTITY_INSERT [dbo].[Hoa_Don] ON 

INSERT [dbo].[Hoa_Don] ([ID_Bill], [Ngay_Xuat], [Ngay_Nhap], [ID_Ban], [Trang_Thai_Thanh_Toan], [ID_Quan_Li], [Ma_Coupon], [Ten], [Email], [Dia_Chi_Khach], [So_Dien_Thoai], [Tong_Tien]) VALUES (91, NULL, CAST(N'2020-12-23' AS Date), 1, 0, 24, N'1', N'0', N'0', N'0', N'0', 0)
SET IDENTITY_INSERT [dbo].[Hoa_Don] OFF
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'American Beef', N'Bò Mỹ')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Australian Abalone', N'Bào ngư Úc')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Australian Beef', N'Bò Úc')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Babylonia', N'Ốc hương')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Barbfish', N'Cá ngạnh')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Beef', N'Thịt Bò')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Bird', N'Chim')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Blue mussels', N'Vẹm xanh')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Canadian Beef', N'Bò Canada')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Canadian Oyster', N'Hàu Canada')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Chicken', N'Gà')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Clam ', N'Ngao')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Cod', N'Cá tuyết')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Crab ', N'Cua thịt')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Crab full of fat', N'Cua Gạch')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Dessert', N'Tráng Miệng')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Dong Tao Chicken', N'Gà Đông Tảo')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Flounder', N'Cá Bơn')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Flower Crab', N'Ghẹ')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Fried Dishes', N'Món Chiên')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Geoduck', N'Tu hài')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Groupper', N'Cá Song thường')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Hot Pot', N'Lẩu')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Japanese Wagyu Beef', N'Bò Wagyu Nhật ')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'King Crab', N'Cua Hoàng Đế')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Kobe Beef', N'Bò Kobe')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Lamb', N'Thịt Cừu')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Lamprey Eel', N'Cá chình trắng')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Lobster', N'Tôm Hùng')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Norwegian Salmon', N'Cá hồi Nauy')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Oyster', N'Hàu sữa')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Pork', N'Thịt Heo')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Prawn', N'Tôm Sú')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Rice & Noodle', N'Cơm & Mỳ')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Rice & Soup ', N'Cơm & Canh')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Salad', N'Sa Lát')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Sapa Salmon', N'Cá hồi Sapa')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Savory dishes', N'Món mặn')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Soft Shell Crab', N'Cua Lột')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Soup', N'Súp')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'South Africa Abalone', N'Bào ngư Nam Phi')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Soya Curd', N'Đậu Phụ')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Squid', N'Mực')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Sturgeon', N'Cá tầm')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Tortoise', N'Baba')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Vegetables', N'Rau')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'VN Scapllop', N'Sò điệp Việt Nam')
INSERT [dbo].[Loai_Thuc_An] ([ID_Loai], [Ten_Loai]) VALUES (N'Wild Duck', N'Vịt Trời')
SET IDENTITY_INSERT [dbo].[Nguoi_Quan_Li] ON 

INSERT [dbo].[Nguoi_Quan_Li] ([ID_Quan_Li], [Email_Dang_Nhap], [Ten], [Dia_Chi], [Gioi_Tinh], [Ngay_Sinh], [So_Dien_Thoai], [Chu_Quan], [Trang_Thai_Dang_Nhap], [Tang], [Password]) VALUES (24, N'a', N'Nguyễn Tấn Nhất', N'Số 11,Phạm Văn Đồng', N'Nam', CAST(N'2001-09-13' AS Date), N'0328348008', 1, 0, 4, N'$2a$10$3FP5gxYui4REHpC.QeDhTuSTK1rHYI.W9VD08uhVoqfwN4V5gjF.W')
SET IDENTITY_INSERT [dbo].[Nguoi_Quan_Li] OFF
SET IDENTITY_INSERT [dbo].[Thong_Tin_Hoa_Don] ON 

INSERT [dbo].[Thong_Tin_Hoa_Don] ([ID_Bill], [ID_Mon], [So_Mon], [Gia_Hien_Tai], [Tong_Tien_Mon], [ID_TTHD]) VALUES (91, 105, 2, 910000, 1820000, 173)
INSERT [dbo].[Thong_Tin_Hoa_Don] ([ID_Bill], [ID_Mon], [So_Mon], [Gia_Hien_Tai], [Tong_Tien_Mon], [ID_TTHD]) VALUES (91, 106, 3, 910000, 2730000, 174)
SET IDENTITY_INSERT [dbo].[Thong_Tin_Hoa_Don] OFF
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (1, N'Gà', N'Soup', N'Súp', 45000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (2, N'Súp hải sản tuyết nhĩ', N'Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (3, N'Súp cá bớp lá lốt', N'Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (4, N'Súp tôm chua cay lẩu Thái', N'Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (5, N'Súp gân bò', N'Soup', N'Còn', 125000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (6, N'Súp bào ngư Nam Phi nấm tươi (Bát nhỏ)', N'Soup', N'Còn', 660000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (7, N'Súp bào ngư Nam Phi (bát lớn)', N'Soup', N'Đã Hết', 1320000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (8, N'Súp vi cá đặc biệt (bát nhỏ) ', N'Soup', N'Đã Hết', 520000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (9, N'Súp vi cá đặc biệt (bát to)', N'Soup', N'Còn ', 980000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (10, N'Súp tổ yến (bát nhỏ)', N'Soup', N'Còn', 660000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (11, N'Súp tổ yến (bát to)', N'Soup', N'Còn', 1280000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (12, N'Rau dền luộc (theo mùa)', N'Vegetables', N'Còn', 58000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (13, N'Rau muống xào (luộc)', N'Vegetables', N'Còn ', 58000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (14, N'Rau mồng tơi xào tỏi (luộc)', N'Vegetables', N'Còn', 58000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (15, N'Ngọn su su / Rau bí xào tỏi (luộc)', N'Vegetables', N'Còn', 58000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (16, N'Măng tây tươi xào tôm', N'Vegetables', N'Đã Hết', 210000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (17, N'Ngồng cải luộc chấm trứng (theo mùa)', N'Vegetables', N'Đã Hết', 660000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (18, N'Rau bò khai xào tỏi (theo mùa)', N'Vegetables', N'Còn', 88000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (19, N'Rau bò khai xào trứng (theo mùa)', N'Vegetables', N'Còn', 98000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (20, N'Củ quả luộc chấm muối vừng', N'Vegetables', N'Còn ', 66000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (21, N'Rau củ quả chấm mắm kho quẹt', N'Vegetables', N'Còn', 132000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (22, N'Salad cà chua dưa chuột', N'Salad', N'Còn', 68000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (23, N'Gõi mướp đắng ruốc', N'Salad', N'Đã Hết', 82000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (24, N'Sala rau trộn', N'Salad', N'Đã Hết', 99000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (25, N'Salad Nga', N'Salad', N'Còn', 99000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (26, N'Nộm hoa chuối tai heo', N'Salad', N'Còn', 110000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (27, N'Nộm bắp bò cần mỹ', N'Salad', N'Còn', 115000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (28, N'Salad rau quả', N'Salad', N'Đã Hết', 128000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (29, N'Nộm hoa chuối tôm thịt', N'Salad', N'Còn', 128000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (30, N'Nộm ngó sen tôm thịt', N'Salad', N'Còn', 128000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (31, N'Nộm sứa gà xé', N'Salad', N'Còn', 128000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (32, N'Nộm cũ hũ dừa tôm thịt', N'Salad', N'Còn', 158000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (33, N'Ngô mỹ chiên ', N'Fried Dishes', N'Còn', 66000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (34, N'Khoai lang Nhật chiên', N'Fried Dishes', N'Đã Hết', 78000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (35, N'Khoai tây chiên', N'Fried Dishes', N'Còn', 66000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (36, N'Sake chiên', N'Fried Dishes', N'Đã Hết', 83000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (37, N'Nem Sài Gòn', N'Fried Dishes', N'Còn', 66000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (38, N'Đậu mơ rán giòn', N'Soya Curd', N'Còn', 68000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (39, N'Đậu mơ lướt ván', N'Soya Curd', N'Đã Hết', 68000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (40, N'Đậu Nhật chiên trứng muối', N'Soya Curd', N'Còn', 86000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (41, N'Đậu Nhật hấp xì dầu', N'Soya Curd', N'Còn', 68000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (42, N'Ba chỉ quay', N'Pork', N'Còn ', 169000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (43, N'Đùi heo phá lấu ', N'Pork', N'Đã Hết', 320000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (44, N'Đùi heo hầm củ sen', N'Pork', N'Còn', 350000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (45, N'Đùi heo hầm kiểu Đức', N'Pork', N'Còn', 280000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (46, N'Sườn lợn nướng sốt BBQ', N'Pork', N'Còn ', 320000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (47, N'Hấp xôi', N'Wild duck', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (48, N'Om khoa', N'Wild duck', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (49, N'Tiềm củ sen', N'Wild duck', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (50, N'Sốt cam', N'Wild duck', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (51, N'Bò xào rau', N'Beef', N'Còn', 198000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (52, N'Bò cuốn lá cải', N'Beef', N'Còn', 228000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (53, N'Bò nướng mật ong', N'Beef', N'Đã Hết', 228000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (54, N'Bò sốt tiêu đen + bánh bao', N'Beef', N'Còn', 252000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (55, N'Bò ta kho + bánh mỳ', N'Beef', N'Còn', 330000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (56, N'Đuôi bò hầm cà ri cốt dừa', N'Beef', N'Đã Hết', 560000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (57, N'Lúc lắc bơ tỏi', N'Australian Beef', N'Còn', 390000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (58, N'Nước sốt tiêu đen', N'Australian Beef', N'Đã Hết', 390000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (59, N'Nướng sốt vang đỏ', N'Australian Beef', N'Còn', 390000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (60, N'Nướng gừng sốt Nhật ', N'Australian Beef', N'Còn', 390000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (61, N'Bò Canada bít tết', N'Canadian Beef', N'Còn ', 760000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (62, N'Bò Canada sốt tiêu đen', N'Canadian Beef', N'Đã Hết', 760000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (63, N'Bò Canada sốt nấm', N'Canadian Beef', N'Còn', 760000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (64, N'Bò Canada nướng gừng sốt Nhật', N'Canadian Beef', N'Còn', 760000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (65, N'Bò T-Bones Mỹ nướng gừng sốt Nhật', N'American Beef', N'Còn', 580000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (66, N'Sườn bò Mỹ nướng', N'American Beef', N'Đã Hết', 580000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (67, N'Bò Kobe bít tết/sốt nấm /sốt tiêu đen/sốt vang đỏ', N'Kobe Beef', N'Còn', 2700000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (68, N'Rẻ sườn bò Kobe rút xương nướng (suất to)', N'Kobe Beef', N'Còn', 1800000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (69, N'Rẻ sườn bò Kobe rút xương nướng (xuất nhỏ)', N'Kobe Beef', N'Còn', 950000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (70, N'Bò Wagyu ', N'Japanese Wagyu Beef', N'Đã Hết', 1880000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (71, N'Bò Wagyu sốt nấm với khoai tây nướng', N'Japanese Wagyu Beef', N'Còn', 1880000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (72, N'Bò Wagyu sốt tiêu đen với khoai tây nướng', N'Japanese Wagyu Beef', N'Còn', 1880000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (73, N'Bò Wagyu sốt vang đỏ với khoai tây nướng', N'Japanese Wagyu Beef', N'Còn', 1880000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (74, N'Sườn cừu nướng sốt tỏi lá thơm', N'Lamb', N'Còn', 580000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (75, N'Đùi cừu nướng sốt tỏi lá thơm', N'Lamb', N'Còn', 580000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (76, N'Gà hấp lá chanh', N'Chicken', N'Còn', 218000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (77, N'Gà rang muối/rang gừng', N'Chicken', N'Còn', 228000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (78, N'Gà rút xương sốt nhật/sốt mơ/nướng gừng', N'Chicken', N'Còn', 228000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (79, N'Gà quay mật ong', N'Chicken', N'Đã Hết', 238000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (80, N'Gà rút xương quay', N'Chicken', N'Còn', 258000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (81, N'Gà quay sốt nấm Đông cô', N'Chicken', N'Còn', 260000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (82, N'Hấp gừng xả', N'Dong Tao chicken', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (83, N'Rang muối', N'Dong Tao chicken', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (84, N'Xào lăn', N'Dong Tao chicken', N'Còn', 680000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (85, N'Chim câu rang tương', N'Bird', N'Còn', 198000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (86, N'Chim câu nướng ngũ vị hoặc quay', N'Bird', N'Còn', 198000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (87, N'Ăn gỏi (đầu chiên giòn)', N'Prawn', N'Còn', 1050000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (88, N'Hấp bia/nước dừa xiêm', N'Prawn', N'Còn', 1260000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (89, N'Rang muối/Xóc bơ tỏi', N'Prawn', N'Đã Hết', 1260000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (90, N'Bỏ lò phô mai', N'Prawn', N'Còn', 1260000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (91, N'Sốt phô mai', N'Prawn', N'Còn ', 1360000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (92, N'Ăn gỏi', N'Lobster', N'Đã Hết', 1450000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (93, N'Bỏ lò phô mai /Rang muối', N'Lobster', N'Còn', 1450000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (94, N'Đầu nấu cháo/Ăn lẩu', N'Lobster', N'Còn', 1450000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (95, N'Rang muối/Chiên bơ tỏi', N'Soft shell Crab', N'Còn', 125000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (96, N'Hấp bia/Sốt cay', N'Crab', N'Còn', 300000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (97, N'Rang me/Rang muối', N'Crab', N'Còn', 300000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (98, N'Hấp bia', N'Flower Crab', N'Đã Hết', 270000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (99, N'Nấu rau muống', N'Flower Crab', N'Đã Hết', 270000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (100, N'Bào ngư Úc sốt sò điệp', N'Australian Abalone', N'Còn', 520000, N'Đĩa')
GO
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (101, N'Bào ngư Úc hầm gà ác đậu đỏ', N'Australian Abalone', N'Còn', 638000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (102, N'Bào ngư Nam Phi sốt nấm', N'South Africa Abalone', N'Còn', 1630000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (103, N'Nướng mỡ hành', N'VN Scapllop', N'Còn', 198000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (104, N'Nướng mỡ hành', N'Blue mussels', N'Đã Hết', 180000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (105, N'Rang muối', N'Tortoise', N'Còn', 910000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (106, N'Om chuối đậu', N'Tortoise', N'Còn', 910000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (107, N'Hầm nấm', N'Tortoise', N'Còn', 910000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (108, N'Lẩu rượu vang ', N'Tortoise', N'Còn', 910000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (109, N'Nướng riềng mẻ', N'Sturgeon', N'Đã Hết', 638000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (110, N'Sụn rang muối', N'Sturgeon', N'Đã Hết', 638000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (111, N'Bỏ lò phô mai', N'Sturgeon', N'Đã Hết', 638000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (112, N'Đầu om măng(om chuối đậu)', N'Sturgeon', N'Đã Hết', 638000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (113, N'Ăn gỏi', N'Sapa Salmon', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (114, N'Nướng sốt kem nấm', N'Sapa Salmon', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (115, N'Nướng sốt bơ tỏi', N'Sapa Salmon', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (116, N'Bỏ lò phô mai', N'Sapa Salmon', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (117, N'Đầu đuôi nấu canh chua', N'Sapa Salmon', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (118, N'Nướng sốt kem nấm', N'Norwegian Salmon', N'Đã Hết', 1280000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (119, N'Nướng sốt chanh dây', N'Norwegian Salmon', N'Đã Hết', 1280000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (120, N'Nướng sốt rượu vang trắng', N'Norwegian Salmon', N'Đã Hết', 1280000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (121, N'Nướng sốt đặc biệt Hoa An Viên', N'Norwegian Salmon', N'Đã Hết', 1280000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (122, N'Bỏ lò phô mai', N'Norwegian Salmon', N'Đã Hết', 1280000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (123, N'Nướng riềng mẻ', N'Lamprey Eel', N'Còn', 980000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (124, N'Nướng sốt đặc biệt Hoa An Viên', N'Lamprey Eel', N'Còn', 980000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (125, N'Om chuối đậu', N'Lamprey Eel', N'Còn', 980000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (126, N'Canh chua', N'Lamprey Eel', N'Còn', 980000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (127, N'Canh măng', N'Lamprey Eel', N'Còn', 980000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (128, N'Nướng riềng mẻ', N'Barbfish', N'Còn', 528000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (129, N'Om chuối đậu', N'Barbfish', N'Đã Hết', 528000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (130, N'Nấu canh chua', N'Barbfish', N'Đã Hết', 528000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (131, N'Canh măng', N'Barbfish', N'Đã Hết', 528000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (132, N'Ăn gỏi', N'Groupper', N'Còn', 890000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (133, N'Nướng ngủ vị', N'Groupper', N'Còn', 890000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (134, N'Hấp xì dầu', N'Groupper', N'Còn', 890000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (135, N'Nấu cháo', N'Groupper', N'Còn ', 890000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (136, N'Nấu cháo ( Canh chua)', N'Groupper', N'Còn', 890000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (137, N'Nướng sốt đặc biệt', N'Cod', N'Đã Hết', 486000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (138, N'Nướng', N'Babylonia', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (139, N'Hấp gừng', N'Babylonia', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (140, N'Xào cay húng thơm', N'Babylonia', N'Còn', 960000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (141, N'Hấp gừng xả', N'Clam', N'Còn', 99000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (142, N'Xào kiểu thái', N'Clam', N'Còn', 198000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (143, N'Ăn gỏi', N'Canadian Oyster', N'Đã Hết', 135000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (144, N'Nướng mỡ hành', N'Canadian Oyster', N'Đã Hết', 135000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (145, N'Bỏ lò phô mai ', N'Canadian Oyster', N'Đã Hết', 135000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (146, N'Ăn gỏi', N'Oyster', N'Còn', 38000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (147, N'Nướng mỡ hành', N'Oyster', N'Còn', 38000, N'Con')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (148, N'Hấp/Xào', N'Squid', N'Còn', 238000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (149, N'Chiên bơ tỏi', N'Squid', N'Còn', 238000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (150, N'Nướng sa tế', N'Squid', N'Còn', 238000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (151, N'Trứng đúc thịt', N'Savory dishes', N'Còn', 72000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (152, N'Trứng đúc tôm tươi', N'Savory dishes', N'Còn', 198000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (153, N'Ba chỉ rang cháy cạnh', N'Savory dishes', N'Còn', 120000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (154, N'Ba chỉ luộc chấm mắm tép', N'Savory dishes', N'Còn', 120000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (155, N'Thăn lợn rim tôm', N'Savory dishes', N'Đã Hết', 238000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (156, N'Ba chỉ rim tôm', N'Savory dishes', N'Đã Hết', 238000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (157, N'Ba chỉ rang tôm', N'Savory dishes', N'Đã Hết', 238000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (158, N'Sườn rim mặn', N'Savory dishes', N'Còn', 180000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (159, N'Sườn xào chua ngọt', N'Savory dishes', N'Còn', 180000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (160, N'Cá kho tộ', N'Savory dishes', N'Còn', 110000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (161, N'Mỳ xào bò', N'Rice & Noodle', N'Còn', 95000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (162, N'Mỳ xào hải sản', N'Rice & Noodle', N'Còn', 110000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (163, N'Phở xào bò', N'Rice & Noodle', N'Còn', 95000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (164, N'Cơm rang thập cẩm', N'Rice & Noodle', N'Còn', 95000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (165, N'Cơm rang hải sản', N'Rice & Noodle', N'Còn', 110000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (166, N'Lẩu đuôi bò', N'Hot Pot', N'Đã Hết', 780000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (167, N'Lẩu riêu cua bò Úc', N'Hot Pot', N'Đã Hết', 946000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (168, N'Lẩu riêu cua bò Canada', N'Hot Pot', N'Còn', 1080000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (169, N'Lẩu gà Đông Tảo', N'Hot Pot', N'Còn', 980000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (170, N'Lẩu Thái hải sản', N'Hot Pot', N'Còn', 1100000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (171, N'Lẩu bò Kobe', N'Hot Pot', N'Đã Hết', 1560000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (172, N'Lẩu bò Wagyu', N'Hot Pot', N'Đã Hết', 1380000, N'Nồi')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (173, N'Mỳ tôm ( ăn thêm )', N'Hot Pot', N'Còn', 11000, N'Gói')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (174, N'Rau ( ăn thêm)', N'Hot Pot', N'Còn', 45000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (175, N'Bún (ăn thêm)', N'Hot Pot', N'Còn', 22000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (176, N'Canh cua mồng tơi', N'Rice & Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (177, N'Canh ngao chua', N'Rice & Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (178, N'Canh thịt nấu chua', N'Rice & Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (179, N'Canh cải thịt', N'Rice & Soup', N'Còn', 68000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (180, N'Canh rau dền om trứng bách thảo', N'Rice & Soup', N'Đã Hết', 98000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (181, N'Cà pháo', N'Rice & Soup', N'Còn', 15000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (182, N'Cơm trắng', N'Rice & Soup', N'Còn', 38000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (183, N'Bưởi da xanh ', N'Dessert', N'Còn', 158000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (184, N'Hoa quả thập cẩm', N'Dessert', N'Còn', 132000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (185, N'Cam canh', N'Dessert', N'Đã Hết', 120000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (186, N'Dưa hấu', N'Dessert', N'Còn', 95000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (187, N'Ổi', N'Dessert', N'Đã Hết', 100000, N'Đĩa')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (188, N'Kem Nga nhập khẩu', N'Dessert', N'Còn', 55000, N'Cái')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (189, N'Hấp', N'King Crab', N'Còn', 570000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (190, N'Rang muối/Rang me', N'King Crab', N'Còn', 570000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (191, N'Bỏ lò phô mai', N'King Crab', N'Còn', 570000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (192, N'Sốt cay kiểu Singapore', N'King Crab', N'Còn', 570000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (193, N'Nấu cháo / Ăn lẩu', N'King Crab', N'Còn', 570000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (194, N'Ăn gỏi', N'Flounder', N'Còn', 240000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (195, N'Hấp xì dầu/Hấp nấm Đông Cô', N'Flounder', N'Còn', 240000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (196, N'Nấu cháo / Nấu canh chua', N'Flounder', N'Còn', 240000, N'Kg')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (197, N'Biet r', N'Soup', N'Súp', 123, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (198, N'Súp gà ngô kem', N'Soup', N'Súp', 45000, N'Bát')
INSERT [dbo].[Thuc_An] ([ID_Mon], [Ten_Mon], [ID_Loai], [Tinh_Trang], [Gia], [Don_Vi_Tinh]) VALUES (199, N'Món mới', N'Beef', N'Thịt Bò', 100000, N'Bát')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Nguoi_Qu__E92368C5F69B6010]    Script Date: 24-Dec-20 5:57:19 PM ******/
ALTER TABLE [dbo].[Nguoi_Quan_Li] ADD  CONSTRAINT [UQ__Nguoi_Qu__E92368C5F69B6010] UNIQUE NONCLUSTERED 
(
	[Email_Dang_Nhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hoa_Don]  WITH CHECK ADD  CONSTRAINT [FK__Hoa_Don__ID_Ban__17F790F9] FOREIGN KEY([ID_Ban])
REFERENCES [dbo].[Ban] ([ID_Ban])
GO
ALTER TABLE [dbo].[Hoa_Don] CHECK CONSTRAINT [FK__Hoa_Don__ID_Ban__17F790F9]
GO
ALTER TABLE [dbo].[Hoa_Don]  WITH CHECK ADD  CONSTRAINT [FK__Hoa_Don__Ma_Coup__4183B671] FOREIGN KEY([Ma_Coupon])
REFERENCES [dbo].[Coupon] ([Ma_Coupon])
GO
ALTER TABLE [dbo].[Hoa_Don] CHECK CONSTRAINT [FK__Hoa_Don__Ma_Coup__4183B671]
GO
ALTER TABLE [dbo].[Hoa_Don]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_Nguoi_Quan_Li] FOREIGN KEY([ID_Quan_Li])
REFERENCES [dbo].[Nguoi_Quan_Li] ([ID_Quan_Li])
GO
ALTER TABLE [dbo].[Hoa_Don] CHECK CONSTRAINT [FK_Hoa_Don_Nguoi_Quan_Li]
GO
ALTER TABLE [dbo].[Thong_Tin_Hoa_Don]  WITH CHECK ADD  CONSTRAINT [FK__Thong_Tin__ID_Bi__79FD19BE] FOREIGN KEY([ID_Bill])
REFERENCES [dbo].[Hoa_Don] ([ID_Bill])
GO
ALTER TABLE [dbo].[Thong_Tin_Hoa_Don] CHECK CONSTRAINT [FK__Thong_Tin__ID_Bi__79FD19BE]
GO
ALTER TABLE [dbo].[Thong_Tin_Hoa_Don]  WITH CHECK ADD  CONSTRAINT [FK_Thong_Tin_Hoa_Don_Thuc_An] FOREIGN KEY([ID_Mon])
REFERENCES [dbo].[Thuc_An] ([ID_Mon])
GO
ALTER TABLE [dbo].[Thong_Tin_Hoa_Don] CHECK CONSTRAINT [FK_Thong_Tin_Hoa_Don_Thuc_An]
GO
ALTER TABLE [dbo].[Thuc_An]  WITH CHECK ADD  CONSTRAINT [FK_Thuc_An_Loai_Thuc_An] FOREIGN KEY([ID_Loai])
REFERENCES [dbo].[Loai_Thuc_An] ([ID_Loai])
GO
ALTER TABLE [dbo].[Thuc_An] CHECK CONSTRAINT [FK_Thuc_An_Loai_Thuc_An]
GO
/****** Object:  StoredProcedure [dbo].[USP_AddFoodInAdmin]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_AddFoodInAdmin]
@ID_Mon int, @Ten_Mon nvarchar(100), @ID_Loai varchar(20),@Tinh_Trang nvarchar(50),@Gia int,@Don_Vi_Tinh nvarchar(MAX)
as
begin
	insert Thuc_An values (@ID_Mon,@Ten_Mon,@ID_Loai,@Tinh_Trang,@Gia,@Don_Vi_Tinh)
end


GO
/****** Object:  StoredProcedure [dbo].[USP_ChangeFoodInAdmin]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_ChangeFoodInAdmin]
@ID_Mon int , @Ten_Mon nvarchar(100), @ID_Loai varchar(20),@Tinh_Trang nvarchar(50), @Gia int,@Don_Vi_Tinh nvarchar(MAX)
as
begin
	update Thuc_An set Ten_Mon = @Ten_Mon, ID_Loai = @ID_Loai, Tinh_Trang = @Tinh_Trang, Gia = @Gia, Don_Vi_Tinh = @Don_Vi_Tinh where ID_Mon = @ID_Mon
end



GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetAccountByUserName]
@username nvarchar(100)
as
begin
	select * from Nguoi_Quan_Li where Ten = @username;
end



GO
/****** Object:  StoredProcedure [dbo].[USP_getCountCoupon]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_getCountCoupon]
@now date
as
begin
	select count(*) from Coupon where Ngay_Bat_Dau < @now and Ngay_Ket_Thuc > @now and Phan_Tram_Giam != 0
end


GO
/****** Object:  StoredProcedure [dbo].[USP_getFoodOneByOneByGia]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_getFoodOneByOneByGia]
@Gia int
as
begin
	select * from Thuc_An where Gia = @Gia;
end

GO
/****** Object:  StoredProcedure [dbo].[USP_getFoodOneByOneByID_Mon]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_getFoodOneByOneByID_Mon]
@id_mon varchar(20)
as
begin
	select * from Thuc_An where ID_Loai = @id_mon
end
GO
/****** Object:  StoredProcedure [dbo].[USP_getListBillByDate]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_getListBillByDate]
@dateStart Date,@dateEnd Date
as 
begin
	select HD.* from Hoa_Don as HD where Ngay_Xuat >= @dateStart and Ngay_Nhap <= @dateEnd
end


GO
/****** Object:  StoredProcedure [dbo].[USP_getPhanTramGiam]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_getPhanTramGiam]
@now date
as
begin
	select Phan_Tram_Giam from Coupon where Ngay_Bat_Dau < @now and Ngay_Ket_Thuc > @now and Phan_Tram_Giam != 0
end


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[USP_InsertBill]
@idTable int, @idQuanLi varchar(15)                                                                                                                                                                                                                                                                                                                                                                                                                         
as
begin 
	declare @macoupon varchar(15) = '0';
	declare @endKhuyenMai date;
	set @macoupon = (select Ma_Coupon from Coupon where GETDATE() < Ngay_Ket_Thuc and Ma_Coupon != '0')
	if(isnull(@macoupon,'0') = '0')
		begin
			set @macoupon = '0'
		end
	insert Hoa_Don(Ngay_Nhap,ID_Ban,Trang_Thai_Thanh_Toan,ID_Quan_Li, Ma_Coupon, Ten, Email, Dia_Chi_Khach, So_Dien_Thoai, Tong_Tien) values (GETDATE(),@idTable,'0',@idQuanLi,@macoupon,'0','0','0','0','0')
end --insert vào bill


GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfor]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_InsertBillInfor]
@idBill int, @idFood int, @count INT, @giaHienTai int
as 
begin
	declare @isExistBill int
	declare @foodCount int =  1
	declare @checkRowBill int = 0 
	select  @isExistBill = ID_TTHD, @foodCount = TTHD.So_Mon from Thong_Tin_Hoa_Don as TTHD where ID_Bill = @idBill and ID_Mon = @idFood

	if(@isExistBill > 0)
		begin
			declare @newCount int = @foodCount + @count		
				if(@newCount>0)
			begin 						
				update Thong_Tin_Hoa_Don set So_Mon = @foodCount + @count, Gia_Hien_Tai = @giaHienTai, Tong_Tien_Mon = @giaHienTai * (@foodCount + @count) where ID_Mon = @idFood					
			end		
				else
			begin
				delete Thong_Tin_Hoa_Don where ID_Bill = @idBill and ID_Mon = @idFood
			
				set @checkRoWBill = (select count(ID_TTHD) from Thong_Tin_Hoa_Don where ID_Bill = @idBill)
				if(@checkRowBill = 0)
					delete from Hoa_Don where ID_Bill = @idBill
			end
		end
	else
	begin
		insert Thong_Tin_Hoa_Don( ID_Bill,ID_Mon,So_Mon,Gia_Hien_Tai,Tong_Tien_Mon) values (@idBill,@idFood,@count,@giaHienTai,@giaHienTai * @count)
	end
end


GO
/****** Object:  StoredProcedure [dbo].[USP_insertCoupon]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_insertCoupon]
@ma varchar(15),@TenCT nvarchar(200), @PTG int, @dateStart date, @dateEnd date
as
begin
	insert Coupon values (@ma,@tenCT,@PTG,@dateStart,@dateEnd)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_insertNewAccount]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_insertNewAccount]
@ten nvarchar(100), @diachi nvarchar(255), @gioiTinh nvarchar(15), @ngaySinh date, @soDienThoai varchar(15),@email varchar(100),@passWord varchar(255),@chuQuan int,@tang int
as
begin
	insert into Nguoi_Quan_Li(Ten,Dia_Chi,Gioi_Tinh,Ngay_Sinh,So_Dien_Thoai,Email_Dang_Nhap,Password,Chu_Quan,Trang_Thai_Dang_Nhap,Tang) values (@ten,@diachi,@gioiTinh,@ngaySinh,@soDienThoai,@email,@passWord,@chuQuan,0,@tang)
	if(@chuQuan = 1) update Nguoi_Quan_Li set Tang = 4 where Email_Dang_Nhap = @email
end



GO
/****** Object:  StoredProcedure [dbo].[USP_SelectBan]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[USP_SelectBan]
@tang int
as
begin
    if(@tang < 4 )
	begin
	select B.ID_Ban,B.Tang,B.Ten_Ban,B.Tinh_Trang_Ban from Ban as B where Tang = @Tang 
	end
	else if(@tang = 4)
	begin
	select * from Ban 
	end
end


GO
/****** Object:  StoredProcedure [dbo].[USP_selectListAccount]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_selectListAccount]
as
begin
select NQL.Email_Dang_Nhap, NQL.Ten, NQL.Gioi_Tinh , NQL.So_Dien_Thoai, NQL.Ngay_Sinh , NQL.Dia_Chi,NQL.Tang from Nguoi_Quan_Li as NQL
end
exec USP_selectListAccount



GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateProfile]    Script Date: 24-Dec-20 5:57:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_UpdateProfile]
@emailLogin varchar(100),@Ten nvarchar(100),@diaChi nvarchar(255),@gioiTinh nvarchar(15), @ngaySinh Date,@soDienThoai varchar(15), @passWord varchar(255) , @TangPhucVu int
as 
begin
	declare @isRightPass int = 0
	select @isRightPass = count(*) from Nguoi_Quan_Li where @emailLogin = Email_Dang_Nhap and @passWord = Nguoi_Quan_Li.Password
	if(@isRightPass = 1)
		begin
			update Nguoi_Quan_Li set Tang = @TangPhucVu, Ten = @Ten, Dia_Chi = @diaChi, Gioi_Tinh = @gioiTinh, Ngay_Sinh = @ngaySinh, So_Dien_Thoai = @soDienThoai where Email_Dang_Nhap = @emailLogin and Password = @passWord
		end
end


GO
USE [master]
GO
ALTER DATABASE [Quan_Li_Nha_Hang] SET  READ_WRITE 
GO
