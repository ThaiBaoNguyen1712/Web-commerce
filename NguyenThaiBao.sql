USE [master]
GO
/****** Object:  Database [QL_BanLe]    Script Date: 05/07/2023 8:18:03 PM ******/
CREATE DATABASE [QL_BanLe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_BanLe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QL_BanLe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_BanLe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QL_BanLe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_BanLe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_BanLe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_BanLe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_BanLe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_BanLe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_BanLe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_BanLe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_BanLe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_BanLe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_BanLe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BanLe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_BanLe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_BanLe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_BanLe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_BanLe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_BanLe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_BanLe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_BanLe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_BanLe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_BanLe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_BanLe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_BanLe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_BanLe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_BanLe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_BanLe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_BanLe] SET  MULTI_USER 
GO
ALTER DATABASE [QL_BanLe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_BanLe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_BanLe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_BanLe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QL_BanLe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QL_BanLe]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[ID_HD] [int] NOT NULL,
	[ID_SP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[Gia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[ID_SP] ASC,
	[ID_HD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](255) NULL,
	[NhomHang] [int] NULL,
	[ThuongHieu] [int] NULL,
	[GiaVon] [decimal](18, 0) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
	[ViTri] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[Created] [datetime2](0) NULL CONSTRAINT [DF_HangHoa_Created]  DEFAULT (getdate()),
	[GhiChu] [nvarchar](1000) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime2](7) NULL CONSTRAINT [DF_HoaDon_CreatedDate]  DEFAULT (getdate()),
	[ID_KhachHang] [int] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nchar](11) NULL,
	[ShipAddress] [nvarchar](255) NULL,
	[ShipEmail] [nchar](50) NULL,
	[TrangThai] [nvarchar](50) NULL CONSTRAINT [DF_HoaDon_TrangThai]  DEFAULT (N'Đang xử lý...'),
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](50) NOT NULL,
	[DienThoai] [nchar](11) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MaSoThue] [nchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Facebook] [nvarchar](50) NULL,
	[NhomKH] [int] NULL,
	[HinhAnh] [nvarchar](255) NULL,
	[GhiChu] [nvarchar](255) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomHangHoa]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomHangHoa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomHH] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhomHangHoa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhomKhachHang]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomKhachHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhomKhachHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](50) NULL,
	[Password] [nchar](50) NULL,
	[GroupID] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[View]    Script Date: 05/07/2023 8:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[ID] [int] NOT NULL,
	[Seen] [int] NULL,
 CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (23, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (24, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (48, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (56, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (57, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (58, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (59, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (60, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (70, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (84, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (90, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (108, 5, 1, CAST(3200 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (110, 5, 1, CAST(16089000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (114, 5, 1, CAST(7900000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (23, 6, 1, CAST(241 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (24, 6, 1, CAST(241 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (48, 6, 1, CAST(241 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (57, 6, 1, CAST(241 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (58, 6, 1, CAST(241 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (84, 6, 1, CAST(241 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (110, 6, 1, CAST(37990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (116, 6, 1, CAST(37990000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (24, 9, 1, CAST(1487 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (46, 9, 1, CAST(1487 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (48, 9, 1, CAST(1487 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (84, 9, 1, CAST(1487 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (110, 9, 1, CAST(15489000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (113, 9, 1, CAST(15489000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (43, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (44, 11, 2, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (50, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (61, 11, 2, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (62, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (63, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (64, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (86, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (87, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (89, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (91, 11, 1, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (102, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (103, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (107, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (109, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (111, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (115, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (117, 19, 1, CAST(23290000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (81, 20, 1, CAST(25490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (93, 20, 1, CAST(25490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (101, 20, 1, CAST(25490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (109, 20, 2, CAST(25490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (83, 21, 1, CAST(11490000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([ID_HD], [ID_SP], [SoLuong], [Gia]) VALUES (111, 21, 1, CAST(11490000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (5, N'LAPTOP DELL INSPIRON 15', 2, 4, CAST(6000000 AS Decimal(18, 0)), CAST(7900000 AS Decimal(18, 0)), 10, N'dn', N'SP5.jpg', NULL, N'Vi xử lý: Intel Core i5-4210U (1.7GHz/3MB)/Intel Core i5-4210U (1.7GHz/3MB)

RAM: 4GB/8GB DDR3

Chipset: Intel ® HM8 Series Express

Màn hình: 15.6" HD (1366x768)

Card màn hình: NVIDIA GeForce 820M 2GB

Hệ điều hành: Windows 10 Bản Quyền')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (6, N'LAPTOP DELL INSPIRON 15', 2, 4, CAST(30000000 AS Decimal(18, 0)), CAST(37990000 AS Decimal(18, 0)), 13, N'ĐN', N'SP6.jpg', NULL, N'Bộ xử lý: Intel Core i5-1135G7 tối đa 4.1 GHz
Bộ nhớ RAM: 8 GB DDR4 bus 3200 MHz
Ổ cứng SSD 256GB
Màn hình: 15 inch FHD (1920×1080)
Windows 11 bản quyền
Trọng lượng: khoảng 1.8 kg (có Pin)
Hàng Brandnew 100% bảo hành 12 tháng.
')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (9, N'LAPTOP GAMING MSI GF63', 2, NULL, CAST(12000000 AS Decimal(18, 0)), CAST(15489000 AS Decimal(18, 0)), 15, N'ĐNa', N'SP9.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (11, N'ThinkPad T460S', 2, 1, CAST(10000000 AS Decimal(18, 0)), CAST(13000000 AS Decimal(18, 0)), 0, N'Tam Hiệp', N'SP11.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (13, N'Gaming Razer', 3, 7, CAST(12000000 AS Decimal(18, 0)), CAST(15890000 AS Decimal(18, 0)), 5, N'ĐNa1', N'SP13.jpg', NULL, N'CPU: Core intel i7 | Dung lượng: 512GB | Kích thước màn hình: 17 inch, 1920x1080 | Trọng lượng: 2.7kg | VGA: RTX 2080 | Ram: 16GB.')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (15, N'Máy pc intel 12th', 1, 1, CAST(10000000 AS Decimal(18, 0)), CAST(13000000 AS Decimal(18, 0)), 20, N'Tam Hiệp', N'SP15.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (16, N'Laptop Gaming x2 pro', 1, NULL, CAST(30000000 AS Decimal(18, 0)), CAST(41190000 AS Decimal(18, 0)), 1, N'Tân Hiệp', N'SP16.jpg', CAST(N'2023-06-08 10:07:21.0000000' AS DateTime2), N'Laptop gaming là dòng laptop được các nhà sản xuất dành riêng cho các game thủ. Các dòng laptop gaming thường sở hữu những ưu điểm như hiệu năng vượt trội, tản nhiệt tốt, pin trâu. ')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (19, N'LAPTOP GAMING GIGABYTE G5', 2, 1, CAST(23290000 AS Decimal(18, 0)), CAST(23290000 AS Decimal(18, 0)), 0, N'Đồng Nai', N'SP19.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (20, N' LAPTOP GAMING MSI CYBORG 15 A12VE- 240VN', 2, 2, CAST(25490000 AS Decimal(18, 0)), CAST(25490000 AS Decimal(18, 0)), 0, N'Đồng Nai', N'SP20.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (21, N'BHC ARES I ( I5 10400F / 8GB / 120GB / GTX 1650)', 1, 1, CAST(11490000 AS Decimal(18, 0)), CAST(11490000 AS Decimal(18, 0)), 3, N'Đồng Nai', N'SP21.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (23, N'LAPTOP GAMING MSI GF63', 2, NULL, CAST(180000000 AS Decimal(18, 0)), CAST(19689000 AS Decimal(18, 0)), 10, N'ĐN', N'SP23.jpg', NULL, NULL)
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (24, N'LAPTOP GAMING GIGABYTE G5 MF-F2VN333SH', 2, 8, CAST(20000000 AS Decimal(18, 0)), CAST(23290000 AS Decimal(18, 0)), 5, N'Biên Hòa Đòng Nai', N'SP24.jpg', NULL, N'CORE i5-12450H | RTX 4050 6GB | 8GB RAM | 512GB SSD | 15.6'' FHD 144Hz | Win 11')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (25, N'Sạc Laptop Asus 19V - 4.74A 90W Cục Vuông Đầu Kim Nhỏ', 3, 1, CAST(400000 AS Decimal(18, 0)), CAST(540000 AS Decimal(18, 0)), 10, N'Biên Hòa Đòng Nai', NULL, CAST(N'2023-07-04 21:39:00.0000000' AS DateTime2), N'Cài Đặt Phần Mềm và Vệ Sinh Máy Miễn Phí Trọn Đời.')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (26, N'PC VĂN PHÒNG BHC HERA A LITE', 1, 1, CAST(4000000 AS Decimal(18, 0)), CAST(5180000 AS Decimal(18, 0)), 5, N'Biên Hòa Đòng Nai', NULL, CAST(N'2023-07-05 18:15:33.0000000' AS DateTime2), N'(AMD 3200G/8GB/240GB)')
INSERT [dbo].[HangHoa] ([ID], [TenHang], [NhomHang], [ThuongHieu], [GiaVon], [GiaBan], [SoLuong], [ViTri], [HinhAnh], [Created], [GhiChu]) VALUES (27, N'tét', 2, 2, CAST(21 AS Decimal(18, 0)), CAST(32 AS Decimal(18, 0)), 10, N'Biên Hòa Đòng Nai', N'SP27.jpg', CAST(N'2023-07-05 18:20:20.0000000' AS DateTime2), N'dsa')
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (23, NULL, 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 khu phố 5 Tam hiệp biên hòa đồng nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (24, NULL, 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 khu phố 5 Tam hiệp biên hòa đồng nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (43, CAST(N'2023-06-30 18:54:54.2411053' AS DateTime2), 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (44, CAST(N'2023-06-30 19:35:59.6780517' AS DateTime2), 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (46, CAST(N'2023-06-30 20:38:10.3407553' AS DateTime2), 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (48, CAST(N'2023-06-30 21:52:58.7714375' AS DateTime2), 4, N'Nguyen Van An', N'0384064947 ', N'108', N'nguyenthaibao@gmail.com                           ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (50, CAST(N'2023-07-01 11:39:51.0512938' AS DateTime2), 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (56, CAST(N'2023-07-01 15:29:27.6380033' AS DateTime2), 9, N'Nguyen Van An', N'0384064947 ', N'108', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (57, CAST(N'2023-07-01 15:36:39.0549744' AS DateTime2), 9, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (58, CAST(N'2023-07-01 15:38:28.7002190' AS DateTime2), 9, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (59, CAST(N'2023-07-01 15:44:00.6733828' AS DateTime2), 9, N'Nguyen Van An', N'0384064947 ', N'108', N'                                                  ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (60, CAST(N'2023-07-01 15:58:07.4780924' AS DateTime2), 4, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (61, CAST(N'2023-07-01 16:34:36.6616894' AS DateTime2), 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (62, CAST(N'2023-07-02 17:41:02.9029570' AS DateTime2), 9, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (63, CAST(N'2023-07-02 22:02:33.0757495' AS DateTime2), 1, N'admin', N'0000000000 ', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'admin@gmail.com                                   ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (64, CAST(N'2023-07-02 22:03:10.4391302' AS DateTime2), 1, N'admin', N'0000000000 ', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'admin@gmail.com                                   ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (70, CAST(N'2023-07-02 22:14:15.2224582' AS DateTime2), 1, N'admin', N'0000000000 ', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'admin@gmail.com                                   ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (81, CAST(N'2023-07-02 22:52:13.7571370' AS DateTime2), 28, N'Nguyen Van An', N'0384064947 ', N'bien hoÀ', N'dungtinnherambo@gmail.com                         ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (83, CAST(N'2023-07-02 22:58:13.6160902' AS DateTime2), 29, N'Phạm Văn Kim Đồng', N'0924955581 ', N'Gần Siêu thị', N'indochinemail@hcm.vnn.vn                          ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (84, CAST(N'2023-07-02 22:59:55.9643911' AS DateTime2), 29, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (86, CAST(N'2023-07-02 23:16:23.3836997' AS DateTime2), 27, N'Phạm Văn Kim', N'0924955581 ', N'36 Đống Đa, Hà Nội', N'indochinemail@hcm.vnn.vn                          ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (87, CAST(N'2023-07-02 23:19:49.5572458' AS DateTime2), 20, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (89, CAST(N'2023-07-02 23:25:17.0613842' AS DateTime2), 27, N'Phạm Văn Kim', N'0924955581 ', N'36 Đống Đa, Hà Nội', N'indochinemail@hcm.vnn.vn                          ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (90, CAST(N'2023-07-02 23:26:43.4455823' AS DateTime2), 27, N'Phạm Văn Kim', N'0924955581 ', N'36 Đống Đa, Hà Nội', N'indochinemail@hcm.vnn.vn                          ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (91, CAST(N'2023-07-02 23:34:16.7511874' AS DateTime2), 27, N'Phạm Văn Kim', N'0924955581 ', N'36 Đống Đa, Hà Nội', N'indochinemail@hcm.vnn.vn                          ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (93, CAST(N'2023-07-03 10:20:52.4679226' AS DateTime2), 20, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (101, CAST(N'2023-07-03 17:44:07.6273179' AS DateTime2), 28, N'Nguyen Van An', N'0384064947 ', N'bien hoÀ', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (102, CAST(N'2023-07-03 17:46:45.0980439' AS DateTime2), 28, N'Nguyen Van An', N'0384064947 ', N'bien hoÀ', N'dungtinnherambo@gmail.com                         ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (103, CAST(N'2023-07-03 17:47:04.9875823' AS DateTime2), 28, N'Nguyen Van An', N'0384064947 ', N'bien hoÀ', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (107, CAST(N'2023-07-03 18:03:30.2619168' AS DateTime2), 27, N'Phạm Văn Kim', N'0924955581 ', N'36 Đống Đa, Hà Nội', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (108, CAST(N'2023-07-03 18:15:41.2428306' AS DateTime2), 10, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (109, CAST(N'2023-07-03 18:24:42.6180269' AS DateTime2), 27, N'Phạm Văn Kim', N'0924955581 ', N'36 Đống Đa, Hà Nội', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (110, CAST(N'2023-07-03 20:29:48.7069855' AS DateTime2), 30, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (111, CAST(N'2023-07-04 08:24:32.5665272' AS DateTime2), 31, N'Trần Đăng Quang', N'0924955581 ', N'Hà Tĩnh', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (113, CAST(N'2023-07-04 22:19:25.7162667' AS DateTime2), 9, N'Nguyen Van An', N'0384064947 ', N'108', N'new@gmail.com                                     ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (114, CAST(N'2023-07-04 22:36:15.8344808' AS DateTime2), 1, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Tam Hiệp, Biên Hòa,Đồng Nai', N'gamingbao32@gmail.com                             ', N'Thành công')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (115, CAST(N'2023-07-05 17:31:47.3450166' AS DateTime2), 20, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Biên Hòa , Đồng Nai', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (116, CAST(N'2023-07-05 18:11:00.6322248' AS DateTime2), 33, N'test Khách hàng', N'0000000000 ', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'gamingbao32@gmail.com                             ', N'Chờ xác nhận')
INSERT [dbo].[HoaDon] ([ID], [CreatedDate], [ID_KhachHang], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [TrangThai]) VALUES (117, CAST(N'2023-07-05 20:02:30.3316847' AS DateTime2), 4, N'Nguyễn Thái Bảo', N'0384064947 ', N'108/29 Tam Hiệp, Biên Hòa,Đồng Nai', N'gamingbao32@gmail.com                             ', N'Thành công')
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (1, N'Nguyễn Thái Bảo', N'0384064947 ', NULL, N'Nam', N'108/29', N'21421421                                          ', N'nthaibao1712@gmail.com', N'Thái Bảo', 2, N'KH1.jpg', N'none', NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (4, N'Nguyen Van An', N'0924988249 ', NULL, N'Nữ', N'bien hoÀ', N'21411123                                          ', N'thunghiem@gmail.com', N'ntbao123', 1, N'SP4.jpg', N'khách quen', NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (8, N'Nguyen Van An', N'0924988249 ', CAST(N'2023-05-31' AS Date), N'Nam', N'bien hoÀ', N'214                                               ', N'thunghiem@gmail.com', N'ntbao123', NULL, N'KH8.jpg', NULL, NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (9, N'Đàm Vĩnh Hưng', N'09124194   ', CAST(N'2023-05-28' AS Date), N'Nam', N'Bình chánh.TPHCM', N'2984949                                           ', N'hungvinhdam@gmail.com', N'HungDam', 1, N'KH9.jpg', N'none', NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (10, N'Phạm Văn Kim', N'903787685  ', CAST(N'2023-06-06' AS Date), N'Nam', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', NULL, N'indochinemail@hcm.vnn.vn', N'indochinemail@yahoo.com; indochinemail@hcm.vnn.vn', 2, N'none.jpg', NULL, NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (11, N'Phạm Văn Kim Đồng', N'051844848  ', CAST(N'2023-05-31' AS Date), N'Nam', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'21411123                                          ', N'thunghiem@gmail.com', N'indochinemail@yahoo.com; indochinemail@hcm.vnn.vn', 2, N'none.jpg', N'a', NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (14, N'Hoàng Văn Khoa', N'0924955581 ', NULL, N'Nam', N'36 Đống Đa, Hà Nội', N'21411123                                          ', N'thunghiemtest@gmail.com', N'Văn Khoa', NULL, N'none.jpg', NULL, NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (16, N'Nguyen Van A', N'0924988249 ', NULL, N'Nam', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', NULL, N'thunghiemtest@gmail.com', NULL, NULL, N'none.jpg', NULL, NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (17, N'Hoàng Văn Khoa', N'0924988249 ', CAST(N'2023-06-01' AS Date), N'Nam', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'21411123                                          ', N'thunghiem@gmail.com', N'indochinemail@yahoo.com; indochinemail@hcm.vnn.vn', 3, N'none.jpg', NULL, NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (18, N'CTY TNHH Máy tính Biên Hòa', N'04946111616', CAST(N'2023-06-04' AS Date), N'Nam', N'Gần Siêu thị', N'213                                               ', N'dungtinnhe@gmail.com', N'indochinemail@yahoo.com; indochinemail@hcm.vnn.vn', 3, N'none.jpg', N'none', NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (19, N'Long Ma Bắc Giang', N'0987522953 ', CAST(N'2008-02-07' AS Date), N'Nam', N'Bắc giang.', N'92528484                                          ', N'magianglong@gmail.com', N'Long Ma', 1, N'KH19.jpg', NULL, NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (20, N'Nguyễn Thái Bảo', N'0384064947 ', CAST(N'2002-12-17' AS Date), N'Nam', N'108/29 Biên Hòa , Đồng Nai', N'321                                               ', N'gamingbao32@gmail.com', N'Thái Bảo', 1, N'none.jpg', NULL, 9)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (26, N'admin', N'0000000000 ', CAST(N'2023-07-01' AS Date), N'Nam', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'00000000000                                       ', N'admin@gmail.com', N'ADMIN', 1, N'none.jpg', N'ADMIN', 1)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (27, N'Phạm Văn Kim', N'0924955581 ', CAST(N'2023-06-07' AS Date), N'Nam', N'36 Đống Đa, Hà Nội', N'33333333                                          ', N'indochinemail@hcm.vnn.vn', N'Văn Khoa', NULL, N'none.jpg', NULL, 24)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (28, N'Nguyen Van An', N'0384064947 ', CAST(N'2023-06-07' AS Date), N'Nam', N'bien hoÀ', N'213                                               ', N'dungtinnherambo@gmail.com', N'Văn Khoa', NULL, N'none.jpg', NULL, 25)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (29, N'Phạm Văn Kim Đồng', N'0924955581 ', CAST(N'2023-07-04' AS Date), N'Nam', N'Gần Siêu thị', N'214                                               ', N'indochinemail@hcm.vnn.vn', N'ntbao123', 2, N'SP29.jpg', NULL, 26)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (30, N'Justin Biebier', N'903787685  ', CAST(N'2023-11-07' AS Date), N'Nam', N'Mỹ Tho', N'214                                               ', N'gamingbao32@gmail.com', N'Justin Bieber', NULL, N'KH30.jpg', N'Ca sĩ', NULL)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (31, N'Trần Đăng Quang', N'0924955581 ', CAST(N'2023-07-12' AS Date), N'Nam', N'Hà Tĩnh', NULL, N'gamingbao32@gmail.com', NULL, 1, N'SP31.jpg', NULL, 27)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (32, N'test', N'0000000000 ', CAST(N'2023-07-13' AS Date), N'Nam', N'36 Đống Đa, Hà Nội', N'00000000                                          ', N'gamingbao32@gmail.com', N'admin', 1, N'KH32.jpg', NULL, 28)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (33, N'test Khách hàng', N'0000000000 ', CAST(N'2023-08-01' AS Date), N'Nam', N'143/6 Lê Thị Riêng, P. Bến Thành, Q. 1,', N'00111                                             ', N'gamingbao32@gmail.com', N'Thái bảo', 2, N'SP33.jpg', NULL, 29)
INSERT [dbo].[KhachHang] ([ID], [TenKhachHang], [DienThoai], [NgaySinh], [GioiTinh], [DiaChi], [MaSoThue], [Email], [Facebook], [NhomKH], [HinhAnh], [GhiChu], [UserID]) VALUES (34, N'Trần Minh Nhật', N'0000000000 ', CAST(N'2023-11-07' AS Date), N'Nam', N'36 Đống Đa, Hà Nội', NULL, N'gamingbao32@gmail.com', N'admin', 4, N'KH34.jpg', N'Thu nhgiem', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[NhomHangHoa] ON 

INSERT [dbo].[NhomHangHoa] ([ID], [TenNhomHH]) VALUES (1, N'Máy bộ')
INSERT [dbo].[NhomHangHoa] ([ID], [TenNhomHH]) VALUES (2, N'Laptop')
INSERT [dbo].[NhomHangHoa] ([ID], [TenNhomHH]) VALUES (3, N'Phụ kiện')
INSERT [dbo].[NhomHangHoa] ([ID], [TenNhomHH]) VALUES (4, N'Combo')
INSERT [dbo].[NhomHangHoa] ([ID], [TenNhomHH]) VALUES (5, N'Like new')
INSERT [dbo].[NhomHangHoa] ([ID], [TenNhomHH]) VALUES (6, N'Old')
SET IDENTITY_INSERT [dbo].[NhomHangHoa] OFF
SET IDENTITY_INSERT [dbo].[NhomKhachHang] ON 

INSERT [dbo].[NhomKhachHang] ([ID], [TenNhomKH]) VALUES (1, N'Cá nhân')
INSERT [dbo].[NhomKhachHang] ([ID], [TenNhomKH]) VALUES (2, N'Công ty')
INSERT [dbo].[NhomKhachHang] ([ID], [TenNhomKH]) VALUES (3, N'Đại lý')
INSERT [dbo].[NhomKhachHang] ([ID], [TenNhomKH]) VALUES (4, N'Bán lẻ')
SET IDENTITY_INSERT [dbo].[NhomKhachHang] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (1, N'Asus')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (2, N'MSI')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (3, N'Lenovo')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (4, N'Dell')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (5, N'HP')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (6, N'Apple')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (7, N'Razer')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (8, N'Acer')
INSERT [dbo].[ThuongHieu] ([ID], [TenThuongHieu]) VALUES (9, N'Microsoft')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (1, N'admin                                             ', N'21232f297a57a5a743894a0e4a801fc3                  ', 1, N'admin')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (2, N'thunghiem                                         ', N'098f6bcd4621d373cade4e832627b4f6                  ', 2, N'Thu Nghiem')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (4, N'thaibao187                                        ', N'098f6bcd4621d373cade4e832627b4f6                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (5, N'tranminhkhoa569                                   ', N'8eccaf129d23796a3557b77d9e8fd5b0                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (6, N'tranminhduc912                                    ', N'25f9e794323b453885f5181f1b624d0b                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (7, N'tranquocanh123                                    ', N'0ab1c6751dfa29a8780321c8fe6bbb7b                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (8, N'longtho192                                        ', N'21232f297a57a5a743894a0e4a801fc3                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (9, N'thaibao1712                                       ', N'c4ca4238a0b923820dcc509a6f75849b                  ', 2, N'Nguyễn Thái Bảo')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (22, N'test1                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (23, N'test2                                             ', N'098f6bcd4621d373cade4e832627b4f6                  ', 2, NULL)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (24, N'test3                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', 2, N'Phạm Văn Kim')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (25, N'test4                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', 2, N'Nguyen Van An')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (26, N'test5                                             ', N'c4ca4238a0b923820dcc509a6f75849b                  ', 2, N'Phạm Văn Kim Đồng')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (27, N'test11                                            ', N'098f6bcd4621d373cade4e832627b4f6                  ', 2, N'Trần Đăng Quang')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (28, N'test20                                            ', N'098f6bcd4621d373cade4e832627b4f6                  ', 2, N'test')
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name]) VALUES (29, N'test21                                            ', N'c4ca4238a0b923820dcc509a6f75849b                  ', 2, N'test')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserGroup] ON 

INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
INSERT [dbo].[View] ([ID], [Seen]) VALUES (1, 61)
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HangHoa] FOREIGN KEY([ID_SP])
REFERENCES [dbo].[HangHoa] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HangHoa]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([ID_HD])
REFERENCES [dbo].[HoaDon] ([ID])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_NhomHangHoa] FOREIGN KEY([NhomHang])
REFERENCES [dbo].[NhomHangHoa] ([ID])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_NhomHangHoa]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_ThuongHieu] FOREIGN KEY([ThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([ID])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_ThuongHieu]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([ID_KhachHang])
REFERENCES [dbo].[KhachHang] ([ID])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_NhomKhachHang] FOREIGN KEY([NhomKH])
REFERENCES [dbo].[NhomKhachHang] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_NhomKhachHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserGroup]
GO
USE [master]
GO
ALTER DATABASE [QL_BanLe] SET  READ_WRITE 
GO
