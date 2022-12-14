USE [master]
GO
/****** Object:  Database [QLNV]    Script Date: 06/08/2022 15:00:08 ******/
CREATE DATABASE [QLNV] ON  PRIMARY 
( NAME = N'QLNV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLNV.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLNV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QLNV_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLNV] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNV] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLNV] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLNV] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLNV] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLNV] SET ARITHABORT OFF
GO
ALTER DATABASE [QLNV] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QLNV] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLNV] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLNV] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLNV] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLNV] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLNV] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLNV] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLNV] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLNV] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLNV] SET  ENABLE_BROKER
GO
ALTER DATABASE [QLNV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLNV] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLNV] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLNV] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLNV] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLNV] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLNV] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLNV] SET  READ_WRITE
GO
ALTER DATABASE [QLNV] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QLNV] SET  MULTI_USER
GO
ALTER DATABASE [QLNV] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLNV] SET DB_CHAINING OFF
GO
USE [QLNV]
GO
/****** Object:  Table [dbo].[BOPHAN]    Script Date: 06/08/2022 15:00:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOPHAN](
	[Mabophan] [varchar](50) NOT NULL,
	[Tenbophan] [nvarchar](200) NOT NULL,
	[Soluongnv] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Mabophan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP0', N'Kiểm Thử', 24)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP1', N'Lập Trình', 50)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP2', N'Phân Tích Hệ Thống', 15)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP3', N'Thiết Kế', 35)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP4', N'Vận Chuyển', 100)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP5', N'Marketing', 45)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP6', N'Kế Toán', 49)
INSERT [dbo].[BOPHAN] ([Mabophan], [Tenbophan], [Soluongnv]) VALUES (N'BP7', N'Tài Chính', 32)
/****** Object:  Table [dbo].[ADMIN_ACCOUNT]    Script Date: 06/08/2022 15:00:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN_ACCOUNT](
	[Matk] [varchar](50) NOT NULL,
	[Username] [varchar](200) NOT NULL,
	[Passwords] [varchar](255) NOT NULL,
 CONSTRAINT [PK_ADMIN_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[Matk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADMIN_ACCOUNT] ([Matk], [Username], [Passwords]) VALUES (N'tk1', N'admin', N'12345')
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 06/08/2022 15:00:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[Manv] [varchar](50) NOT NULL,
	[Hoten] [nvarchar](200) NOT NULL,
	[GT] [nvarchar](5) NOT NULL,
	[NS] [varchar](100) NOT NULL,
	[Sdt] [varchar](100) NOT NULL,
	[Chucvu] [nvarchar](100) NOT NULL,
	[Diachi] [nvarchar](200) NOT NULL,
	[Mabophan] [varchar](50) NOT NULL,
	[Tongluong] [varchar](50) NOT NULL,
 CONSTRAINT [PK__NHANVIEN__2724CB0233D4B598] PRIMARY KEY CLUSTERED 
(
	[Manv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV1', N'Hà Hữu Hùng', N'Nam', N'6/16/2000', N'(098) 726-9911', N'Quản lý', N'Hà Nội', N'BP3', N'48000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV10', N'Bùi Xuân Tùng', N'Nam', N'5/4/2001', N'(038) 972-8742', N'Nhân viên', N'Hòa Bình', N'BP1', N'54500000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV11', N'Nguyễn Thị Huyền Nhi', N'Nữ', N'7/6/2000', N'(098) 928-7824', N'Nhân viên', N'Hà Nội', N'BP7', N'35400000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV2', N'Trần Bá Vũ', N'Nam', N'4/12/2001', N'(038) 274-0124', N'Quản lý', N'Bắc Giang', N'BP1', N'58000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV3', N'Nguyễn Thị Quỳnh', N'Nữ', N'10/20/2000', N'(096) 420-2812', N'Nhân viên', N'Bắc Giang', N'BP0', N'25000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV4', N'Chu Thị Phương Thảo', N'Nữ', N'5/8/1999', N'(097) 266-1624', N'Nhân viên', N'Thanh Hóa', N'BP0', N'23000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV5', N'Hà Hữu Trung', N'Nam', N'11/11/2000', N'(098) 764-2012', N'Quản lý', N'Quảng Ninh', N'BP4', N'46000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV6', N'Nguyễn Thị Thu Trang', N'Nữ', N'11/13/1999', N'(036) 298-7127', N'Nhân viên', N'Hưng Yên', N'BP3', N'28000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV7', N'Trần Thị Huyền', N'Nữ', N'7/26/2000', N'(098) 872-1787', N'Quản lý', N'Hà Nội', N'BP5', N'65000000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV8', N'Hà Thị Huyền Trang', N'Nữ', N'2/10/1998', N'(094) 728-1929', N'Nhân viên', N'Hà Nội', N'BP6', N'22400000')
INSERT [dbo].[NHANVIEN] ([Manv], [Hoten], [GT], [NS], [Sdt], [Chucvu], [Diachi], [Mabophan], [Tongluong]) VALUES (N'NV9', N'Đoàn Quốc Việt', N'Khác', N'7/11/2001', N'(097) 729-4812', N'Nhân viên', N'Hưng Yên', N'BP2', N'36000000')
/****** Object:  ForeignKey [FK_NHANVIEN_BOPHAN]    Script Date: 06/08/2022 15:00:09 ******/
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_BOPHAN] FOREIGN KEY([Mabophan])
REFERENCES [dbo].[BOPHAN] ([Mabophan])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_BOPHAN]
GO
