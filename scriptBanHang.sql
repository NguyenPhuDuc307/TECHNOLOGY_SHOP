USE [master]
GO
/****** Object:  Database [BanHang]    Script Date: 3/29/2022 8:52:01 PM ******/
CREATE DATABASE [BanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BanHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHang] SET RECOVERY FULL 
GO
ALTER DATABASE [BanHang] SET  MULTI_USER 
GO
ALTER DATABASE [BanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanHang', N'ON'
GO
ALTER DATABASE [BanHang] SET QUERY_STORE = OFF
GO
USE [BanHang]
GO
/****** Object:  Table [dbo].[tb_DonHang]    Script Date: 3/29/2022 8:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_DonHang](
	[idDonHang] [int] IDENTITY(1,1) NOT NULL,
	[idTaiKhoan] [int] NOT NULL,
	[ngayDat] [datetime] NOT NULL,
	[ngayGiao] [datetime] NOT NULL,
 CONSTRAINT [PK__tb_DonHa__D5DE7ED70DB330BB] PRIMARY KEY CLUSTERED 
(
	[idDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_DonHang_SanPham]    Script Date: 3/29/2022 8:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_DonHang_SanPham](
	[idDonHang] [int] IDENTITY(1,1) NOT NULL,
	[idSP] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[donGia] [money] NOT NULL,
	[thanhTien] [money] NOT NULL,
 CONSTRAINT [PK__tb_DonHa__6C05FDD3A8F364EC] PRIMARY KEY CLUSTERED 
(
	[idDonHang] ASC,
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_HangSanPham]    Script Date: 3/29/2022 8:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_HangSanPham](
	[idHang] [int] IDENTITY(1,1) NOT NULL,
	[tenHang] [nvarchar](50) NOT NULL,
	[logo] [varchar](100) NOT NULL,
	[linhVuc] [nvarchar](max) NOT NULL,
	[quocGia] [nvarchar](50) NOT NULL,
	[namThanhLap] [int] NOT NULL,
 CONSTRAINT [PK__tb_HangS__03D9F6792D66A976] PRIMARY KEY CLUSTERED 
(
	[idHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_LoaiSanPham]    Script Date: 3/29/2022 8:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_LoaiSanPham](
	[idLoaiSP] [int] IDENTITY(1,1) NOT NULL,
	[idHang] [int] NOT NULL,
	[tenLoaiSP] [nvarchar](100) NOT NULL,
	[trangThai] [bit] NOT NULL,
 CONSTRAINT [PK__tb_LoaiS__5BB3A83C197D6AA3] PRIMARY KEY CLUSTERED 
(
	[idLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_SanPham]    Script Date: 3/29/2022 8:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SanPham](
	[idSP] [int] IDENTITY(1,1) NOT NULL,
	[idLoaiSP] [int] NOT NULL,
	[tenSP] [nvarchar](100) NOT NULL,
	[trangThai] [bit] NOT NULL,
	[giaBan] [money] NOT NULL,
	[moTa] [nvarchar](1000) NOT NULL,
	[hinh] [nvarchar](100) NOT NULL,
	[soLuongTon] [int] NOT NULL,
	[ngayCapNhat] [datetime] NOT NULL,
 CONSTRAINT [PK__tb_SanPh__9DB8304A43933F64] PRIMARY KEY CLUSTERED 
(
	[idSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TaiKhoan]    Script Date: 3/29/2022 8:52:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TaiKhoan](
	[idTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[tenDangNhap] [varchar](20) NOT NULL,
	[matKhau] [varchar](20) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[soDienThoai] [char](10) NOT NULL,
	[diaChi] [nvarchar](100) NOT NULL,
	[eMail] [varchar](50) NOT NULL,
	[laAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__tb_TaiKh__8FA29E4A16FA791A] PRIMARY KEY CLUSTERED 
(
	[idTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_HangSanPham] ON 

INSERT [dbo].[tb_HangSanPham] ([idHang], [tenHang], [logo], [linhVuc], [quocGia], [namThanhLap]) VALUES (1, N'SAMSUNG', N'/Content/images/logo_samsung.png', N'Điện thoại, Máy tính bảng, Laptop, Hàng điện tử tiêu dùng,... ', N'Hàn Quốc', 1938)
INSERT [dbo].[tb_HangSanPham] ([idHang], [tenHang], [logo], [linhVuc], [quocGia], [namThanhLap]) VALUES (3, N'APPLE', N'/Content/images/logo_apple.png', N'Điện thoại, Máy tính bảng, Laptop, Thiết bị điện tử,...', N'Hoa Kỳ', 1976)
SET IDENTITY_INSERT [dbo].[tb_HangSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_TaiKhoan] ON 

INSERT [dbo].[tb_TaiKhoan] ([idTaiKhoan], [tenDangNhap], [matKhau], [hoTen], [soDienThoai], [diaChi], [eMail], [laAdmin]) VALUES (2, N'nguyenphuduc', N'1911066051', N'Nguyễn Phú Đức', N'0964732222', N'Bình Dương', N'meo@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[tb_TaiKhoan] OFF
GO
ALTER TABLE [dbo].[tb_DonHang]  WITH CHECK ADD  CONSTRAINT [FK__tb_DonHan__idTai__30F848ED] FOREIGN KEY([idTaiKhoan])
REFERENCES [dbo].[tb_TaiKhoan] ([idTaiKhoan])
GO
ALTER TABLE [dbo].[tb_DonHang] CHECK CONSTRAINT [FK__tb_DonHan__idTai__30F848ED]
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_DonHan__idDon__31EC6D26] FOREIGN KEY([idDonHang])
REFERENCES [dbo].[tb_DonHang] ([idDonHang])
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham] CHECK CONSTRAINT [FK__tb_DonHan__idDon__31EC6D26]
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_DonHang__idSP__2E1BDC42] FOREIGN KEY([idSP])
REFERENCES [dbo].[tb_SanPham] ([idSP])
GO
ALTER TABLE [dbo].[tb_DonHang_SanPham] CHECK CONSTRAINT [FK__tb_DonHang__idSP__2E1BDC42]
GO
ALTER TABLE [dbo].[tb_LoaiSanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_LoaiSa__idHan__300424B4] FOREIGN KEY([idHang])
REFERENCES [dbo].[tb_HangSanPham] ([idHang])
GO
ALTER TABLE [dbo].[tb_LoaiSanPham] CHECK CONSTRAINT [FK__tb_LoaiSa__idHan__300424B4]
GO
ALTER TABLE [dbo].[tb_SanPham]  WITH CHECK ADD  CONSTRAINT [FK__tb_SanPha__idLoa__2F10007B] FOREIGN KEY([idLoaiSP])
REFERENCES [dbo].[tb_LoaiSanPham] ([idLoaiSP])
GO
ALTER TABLE [dbo].[tb_SanPham] CHECK CONSTRAINT [FK__tb_SanPha__idLoa__2F10007B]
GO
USE [master]
GO
ALTER DATABASE [BanHang] SET  READ_WRITE 
GO
