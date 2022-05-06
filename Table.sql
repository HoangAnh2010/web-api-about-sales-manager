USE [WebAPIx]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[id_loai] [uniqueidentifier] NOT NULL,
	[ten_loai] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[id_loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetAllLoaiSP]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[F_GetAllLoaiSP]( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM LoaiSP )
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[id_sp] [uniqueidentifier] NOT NULL,
	[tensp] [nvarchar](max) NOT NULL,
	[mota] [nvarchar](max) NULL,
	[soluong] [int] NOT NULL,
	[anh] [nvarchar](50) NULL,
	[id_loai] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[id_sp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetAllSP]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[F_GetAllSP]( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham )
GO
/****** Object:  Table [dbo].[HoaDonB]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonB](
	[id_hoadon] [uniqueidentifier] NOT NULL,
	[ngaydat] [datetime] NOT NULL,
	[tongtientt] [float] NOT NULL,
	[diachinhanhang] [nvarchar](max) NOT NULL,
	[sdt] [nchar](10) NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetAllHoaDonB]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[F_GetAllHoaDonB]( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM HoaDonB )
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetSPTheoMaLoai]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_GetSPTheoMaLoai](@maloai uniqueidentifier)
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE id_loai=@maloai)
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[id_nguoidung] [uniqueidentifier] NOT NULL,
	[hoten] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[matkhau] [char](32) NOT NULL,
	[sdt] [nchar](10) NULL,
	[diachi] [nvarchar](255) NULL,
	[id_quyen] [int] NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[id_nguoidung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetTKTheoMa]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_GetTKTheoMa](@manguoidung uniqueidentifier)
RETURNS TABLE
AS
  RETURN (SELECT * FROM NguoiDung WHERE id_nguoidung=@manguoidung)
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetSPTheoTen]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_GetSPTheoTen](@ten nvarchar(max))
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE tensp like '%'+@ten+'%')
GO
/****** Object:  Table [dbo].[GiaBan]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaBan](
	[id_gia] [uniqueidentifier] NOT NULL,
	[dongia] [float] NOT NULL,
	[ngaycohieuluc] [datetime] NOT NULL,
	[ngayhethieuluc] [datetime] NULL,
	[id_sp] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_GiaBan] PRIMARY KEY CLUSTERED 
(
	[id_gia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetSPTheoKhoangGia]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[F_GetSPTheoKhoangGia](@giamin float, @giamax float)
RETURNS TABLE
AS
  RETURN (SELECT tensp,mota,dongia,soluong FROM SanPham s inner join GiaBan g on s.id_sp=g.id_sp WHERE dongia>=@giamin and dongia<=@giamax)
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetSoLuongSPNhoHon4]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_GetSoLuongSPNhoHon4]()
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE soluong<4)
GO
/****** Object:  Table [dbo].[ChiTietHoaDonB]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonB](
	[id_chitiethd] [uniqueidentifier] NOT NULL,
	[id_hoadon] [uniqueidentifier] NOT NULL,
	[id_sp] [uniqueidentifier] NOT NULL,
	[soluong] [int] NOT NULL,
	[thanhtien] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[id_chitiethd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetSPBanChay]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_GetSPBanChay]()
RETURNS TABLE
AS
  RETURN (SELECT top(5) tensp,mota FROM SanPham s inner join ChiTietHoaDonB ct on ct.id_sp=s.id_sp WHERE ct.soluong>2 order by tensp desc)
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetDoanhThu]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[F_GetDoanhThu](@thoigianbd datetime, @thoigiankt datetime)
RETURNS TABLE
AS
  RETURN (SELECT id_hoadon,ngaydat,tongtientt FROM HoaDonB WHERE @thoigianbd<=ngaydat and @thoigiankt>=ngaydat)
GO
/****** Object:  Table [dbo].[ChiTietHoaDonN]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDonN](
	[id_chitiethdnhap] [uniqueidentifier] NOT NULL,
	[id_hoadonn] [uniqueidentifier] NOT NULL,
	[id_sanpham] [uniqueidentifier] NOT NULL,
	[soluong] [int] NOT NULL,
	[thanhtien] [float] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDonN] PRIMARY KEY CLUSTERED 
(
	[id_chitiethdnhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonN]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonN](
	[id_hoadonn] [uniqueidentifier] NOT NULL,
	[id_ncc] [uniqueidentifier] NOT NULL,
	[ngaynhap] [datetime] NOT NULL,
	[tongtientt] [float] NOT NULL,
 CONSTRAINT [PK_HoaDonN] PRIMARY KEY CLUSTERED 
(
	[id_hoadonn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[id_nhacungcap] [uniqueidentifier] NOT NULL,
	[tenncc] [nvarchar](100) NOT NULL,
	[sdt] [nchar](10) NULL,
	[diachi] [nvarchar](255) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[id_nhacungcap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[id_quyen] [int] NOT NULL,
	[ten_quyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[id_quyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHoaDonB] ([id_chitiethd], [id_hoadon], [id_sp], [soluong], [thanhtien]) VALUES (N'0a64b656-83ec-48bf-bbfd-05c59a0cfd9a', N'8a64b656-83ec-48bf-bbfd-05c59a0cfd9a', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2', 1, 299000)
GO
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd00', 200000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a5d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd10', 499000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-586a5d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd20', 139000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a4d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd30', 315000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a9d30aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd40', 299000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-676a9d30aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd50', 289000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-656a9d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd60', 169000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a9d40aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd70', 169000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-786a9d30aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd80', 150000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-685a9d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd90', 49000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a6d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd91', 200000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a7d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd92', 149000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a8d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd93', 99000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd94', 249000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-aae0aa4ac0e2')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd95', 159000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-bae0ae4ac0e2')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd96', 199000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-aae0ae4bc0e2')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd97', 250000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-aae1ae4ac0e2')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd98', 249000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-aae0ae4ac1e2')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd99', 99000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e9')
INSERT [dbo].[GiaBan] ([id_gia], [dongia], [ngaycohieuluc], [ngayhethieuluc], [id_sp]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd9a', 299000, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
GO
INSERT [dbo].[HoaDonB] ([id_hoadon], [ngaydat], [tongtientt], [diachinhanhang], [sdt]) VALUES (N'8a64b656-83ec-48bf-bbfd-05c59a0cfd9a', CAST(N'2022-06-04T00:00:00.000' AS DateTime), 299000, N'Mỹ Hào, Hưng Yên', N'0987654321')
GO
INSERT [dbo].[LoaiSP] ([id_loai], [ten_loai]) VALUES (N'a868f1bc-102d-4bed-9a41-686a9d50aaaf', N'Thuc pham chuc nang')
INSERT [dbo].[LoaiSP] ([id_loai], [ten_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a9d50aaaf', N'Chăm sóc da')
INSERT [dbo].[LoaiSP] ([id_loai], [ten_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2', N'Trang điểm')
GO
INSERT [dbo].[NguoiDung] ([id_nguoidung], [hoten], [email], [matkhau], [sdt], [diachi], [id_quyen]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2', N'oriole', N'hoanganh04092001@gmail.com', N'123                             ', N'0978227010', N'Hưng Yên', 1)
INSERT [dbo].[NguoiDung] ([id_nguoidung], [hoten], [email], [matkhau], [sdt], [diachi], [id_quyen]) VALUES (N'102c84ef-0aa5-4d79-8747-aae0ae4ac0e2', N'ori', N'dingu@gmail.com', N'456                             ', N'0123456789', N'Hà Nội', 2)
GO
INSERT [dbo].[PhanQuyen] ([id_quyen], [ten_quyen]) VALUES (1, N'admin')
INSERT [dbo].[PhanQuyen] ([id_quyen], [ten_quyen]) VALUES (2, N'customer')
GO
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-586a5d50aaaf', N'Bộ sản phẩm dưỡng', N'Bộ sản phẩm bao gồm:
 01 Tinh chất trà xanh dưỡng ẩm innisfree Green Tea Seed Serum 80ml
; 01 Thanh lăn dưỡng ẩm dành cho mắt và da mặt trà xanh innisfree Green Tea Seed Eye & Face Ball 10ml; 02 Kem dưỡng ẩm vùng da quanh mắt trà xanh innisfree Green Tea Seed Eye Cream 5ml; 02 Nước tẩy trang trà xanh innisfree Green Tea Cleansing Water 25ml', 1, N'skincare/cham soc da.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-656a9d50aaaf', N'Tinh chất dưỡng ẩm', N'Tinh chất Green Tea Seed Serum 4.0 với công thức trà xanh cải tiến, tăng cường củng cố hàng rào bảo vệ và dưỡng ẩm chuyên sâu, cho làn da mọng nước chuẩn Hàn.', 2, N'skincare/serum.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-676a9d30aaaf', N'Kem dưỡng ẩm từ blueberry', N'Kem dưỡng ẩm chứa khả năng chống oxi hóa từ blueberry, giúp cân bằng độ pH và thành phần dầu, độ ẩm trên da, mang đến làn da khỏe và mịn màng.', 5, N'skincare/srm blue.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-685a9d50aaaf', N'Gel làm dịu đa năng nha đam', N'Gel đa năng chiết xuất từ nha đam hữu cơ Jeju innisfree Aloe Revital Soothing Gel khôi phục độ ẩm tức thì, giúp làm dịu và mát da nhanh chóng.', 5, N'skincare/gel lam diu.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a4d50aaaf', N'Dầu tẩy trang mắt và môi', N'Dầu tẩy trang hạt táo xanh innisfree Apple Seed Lip & Eye Makeup Remover dành riêng cho mắt & môi, nhẹ nhàng làm sạch bụi bẩn và cặn trang điểm lâu trôi.', 6, N'skincare/dau tay trang.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a5d50aaaf', N'Mặt nạ', N'Mặt nạ giúp làm sạch sâu lớp bã nhờn trên da, se khít lỗ chân lông, cải thiện kết cấu bề mặt da.', 15, N'skincare/mat na super.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a6d50aaaf', N'Mặt nạ ngủ dạng hủ từ gạo', N'Mặt nạ ngủ dạng hũ innisfree Capsule Recipe Pack Rice chiết xuất từ gạo giàu dưỡng chất giúp nuôi dưỡng làn da sáng trong và mềm mượt. Thiết kế dạng hũ nhỏ thuận tiện mang theo đi du lịch hoặc trải nghiệm sản phẩm', 20, N'skincare/mat na dang hu.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a7d50aaaf', N'Nước cân bằng dưỡng ẩm', N'Nước cân bằng innisfree Cherry Blossom Skin dưỡng ẩm và dưỡng sáng da tự nhiên với chiết xuất cánh hoa anh đào Jeju và Betaine có trong củ dền.', 3, N'skincare/can bang cherry.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a8d50aaaf', N'Sữa rửa mặt dành cho da mụn', N'Sữa rửa mặt chiết xuất từ dầu Bija Jeju giúp làm sạch hoàn hảo bụi bẩn từ sâu bên trong lỗ chân lông, đặc biệt phù hợp cho làn da đang gặp vấn đề về mụn.', 5, N'skincare/srm bija.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a9d30aaaf', N'Siêu mặt nạ', N'Siêu mặt nạ núi lửa innisfree Jeju Super Volcanic Mousse Mask là một trong những sản phẩm “át chủ bài” của Innisfree với chức năng 6 trong 1: thu nhỏ lỗ chân long, loại bỏ bã nhờn, tẩy tế bào chết. làm sạch sâu, làm sáng da, làm mát lạnh da mặt. Mặt nạ dạng mouse dễ dàng apply dưỡng chất thấm thẩu vào da tốt.', 15, N'skincare/mat na 1.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a9d40aaaf', N'Sữa rửa mặt sạch sâu', N'Sữa rửa mặt sạch sâu đá tro núi lửa Super Volcanic Pore Micellar Cleansing Foam 2X được cải tiến, giúp làm sạch bã nhờn và bụi bẩn từ sâu trong lỗ chân lông mà không làm da khô căng, khó chịu.
', 2, N'skincare/srm sach sau.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-686a9d50aaaf', N'Kem dưỡng da quanh mắt', N'Kem dưỡng mắt chống lão hóa hoa lan innisfree Jeju Orchid Eye Cream giúp làm mờ nếp nhăn, cải thiện độ săn chắc, giảm bọng mắt và cải thiện quầng thâm để đẩy lùi dấu hiệu lão hóa.', 2, N'skincare/kem duong da mat.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'c868f1bc-102d-4bed-9a41-786a9d30aaaf', N'Sữa rửa mặt dưỡng sáng', N'Sữa rửa mặt innisfree Jeju Cherry Blossom Jam Cleanser chiết xuất từ hoa anh đào Jeju, có độ pH cân bằng. Với kết cấu trong veo như mứt hoa, sữa rửa mặt giúp nhẹ nhàng làm sạch bụi bẩn trên da và dưỡng da sáng trong, chuẩn glass skin.', 10, N'skincare/srm hoa anh dao.jpg', N'c868f1bc-102d-4bed-9a41-686a9d50aaaf')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0aa4ac0e2', N'Kem nền BB trang điểm', N'Kem nền trang điểm innisfree Eco Natural Green Tea BB Cream SPF29 PA++ chiết xuất từ trà xanh, có độ che phủ hoàn hảo, đồng thời cung cấp độ ẩm cho da luôn tươi mới và mịn màng.', 7, N'makeup/kem nen 1.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2', N'Kem nâng tông chống nắng', N'Kem dưỡng nâng tông tự nhiên từ hoa anh đào và Betaine innisfree Cherry Blossom Tone Up Cream Cream  SPF30 PA++ 50ml, cho làn da tinh khiết, trắng sáng rạng rỡ tức thì. Bổ sung chỉ số chống nắng để bảo vệ da
', 20, N'makeup/nang tong cherry.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e9', N'Mascara làm dài mi tự nhiên', N'Super Longlashcara đảm bảo độ căng tối đa với bàn chải dày và cong phủ từng lông mi của bạn loại kem Air Fiber có trọng lượng nhẹ.', 10, N'makeup/mascara super.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0ae4ac1e2', N'Kem lót trang điểm', N'Kem lót trang điểm innisfree Mineral Make Up Base SPF30 PA++ hiệu chỉnh tông màu da, giữ lớp nền lâu trôi, đồng thời cân bằng độ ẩm và bảo vệ da khỏi tia UV.', 15, N'makeup/kem lot.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae0ae4bc0e2', N'Son thỏi lâu trôi', N'Son môi với kết cấu nhẹ nhàng, giúp tạo màu trang điểm cho môi với sắc màu tươi sáng, sống động. Chất cotton lướt nhẹ, phủ mượt bờ môi. Son ẩm mượt và lâu trôi tựa son tint, lên màu chuẩn và, lì mịn tựa son thỏi. 10 tone đất tôn da, cho đôi môi thỏa sức biến hóa đa dạng phong cách mỗi ngày.', 20, N'makeup/sonn.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-aae1ae4ac0e2', N'Phấn nén trang điểm', N'Phấn phủ mỏng nhẹ Light Cotton Cover Pact với độ che phủ cao, giúp kiềm dầu và giữ cho lớp nền mịn màng và lâu trôi.
', 2, N'makeup/phan phu mong nhe.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
INSERT [dbo].[SanPham] ([id_sp], [tensp], [mota], [soluong], [anh], [id_loai]) VALUES (N'002c84ef-0aa5-4d79-8747-bae0ae4ac0e2', N'Son kem lì lâu trôi', N'Son kem thế hệ mới innisfree Vivid Cotton Ink Blur lấy cảm hứng từ những cánh hoa tuplip giúp môi mịn như nhung, có hiệu ứng mờ nhẹ không gây bóng môi  mà lại không quá lì, đem đến cảm giác ẩm mịn cho đôi môi', 20, N'makeup/son 2.jpg', N'002c84ef-0aa5-4d79-8747-aae0ae4ac0e2')
GO
ALTER TABLE [dbo].[ChiTietHoaDonB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonB_HoaDonB] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[HoaDonB] ([id_hoadon])
GO
ALTER TABLE [dbo].[ChiTietHoaDonB] CHECK CONSTRAINT [FK_ChiTietHoaDonB_HoaDonB]
GO
ALTER TABLE [dbo].[ChiTietHoaDonB]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonB_SanPham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[SanPham] ([id_sp])
GO
ALTER TABLE [dbo].[ChiTietHoaDonB] CHECK CONSTRAINT [FK_ChiTietHoaDonB_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDonN]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonN_HoaDonN] FOREIGN KEY([id_hoadonn])
REFERENCES [dbo].[HoaDonN] ([id_hoadonn])
GO
ALTER TABLE [dbo].[ChiTietHoaDonN] CHECK CONSTRAINT [FK_ChiTietHoaDonN_HoaDonN]
GO
ALTER TABLE [dbo].[ChiTietHoaDonN]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDonN_SanPham] FOREIGN KEY([id_sanpham])
REFERENCES [dbo].[SanPham] ([id_sp])
GO
ALTER TABLE [dbo].[ChiTietHoaDonN] CHECK CONSTRAINT [FK_ChiTietHoaDonN_SanPham]
GO
ALTER TABLE [dbo].[GiaBan]  WITH CHECK ADD  CONSTRAINT [FK_GiaBan_SanPham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[SanPham] ([id_sp])
GO
ALTER TABLE [dbo].[GiaBan] CHECK CONSTRAINT [FK_GiaBan_SanPham]
GO
ALTER TABLE [dbo].[HoaDonN]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonN_NhaCungCap] FOREIGN KEY([id_ncc])
REFERENCES [dbo].[NhaCungCap] ([id_nhacungcap])
GO
ALTER TABLE [dbo].[HoaDonN] CHECK CONSTRAINT [FK_HoaDonN_NhaCungCap]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_PhanQuyen] FOREIGN KEY([id_quyen])
REFERENCES [dbo].[PhanQuyen] ([id_quyen])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_PhanQuyen]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([id_loai])
REFERENCES [dbo].[LoaiSP] ([id_loai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---sửa chi tiết hóa đơn
CREATE PROC [dbo].[SuaChiTietHD] (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
UPDATE ChiTietHoaDon SET id_hoadon=@mahoadon,id_sp=@masp,soluong=@soluong,thanhtien=@thanhtien
WHERE id_chitiethd=@mact
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaGia]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaGia] (@magia uniqueidentifier, @dongia float, @ngaycohieuluc datetime, @ngayhethieuluc datetime, @masp uniqueidentifier)
As
BEGIN
UPDATE GiaBan SET dongia=@dongia,ngaycohieuluc=@ngaycohieuluc,ngayhethieuluc=@ngayhethieuluc,id_sp=@masp
WHERE id_gia=@magia
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaHoaDon]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaHoaDon] (@mahd uniqueidentifier, @ngaydat datetime, @tongtientt float, @diachigiaohang nvarchar(max),@sdt nchar(10))
As
BEGIN
UPDATE HoaDon SET ngaydat=@ngaydat,tongtientt=@tongtientt,diachigiaohang=@diachigiaohang,sdt=@sdt
WHERE id_hoadon=@mahd
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaLoaiSanPham]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaLoaiSanPham] (@maloai uniqueidentifier, @tenloai nvarchar(100))
As
BEGIN
UPDATE LoaiSP SET ten_loai=@tenloai
WHERE id_loai=@maloai
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaNguoiDung]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaNguoiDung] (@mand uniqueidentifier, @hoten nvarchar(100), @email nvarchar(100), @matkhau char(32),@sdt nchar(10),@diachi nvarchar(255), @maquyen int)
As
BEGIN
UPDATE NguoiDung SET hoten=@hoten,email=@email,matkhau=@matkhau,sdt=@sdt,diachi=@diachi,id_quyen=@maquyen
WHERE id_nguoidung=@mand
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaNhaCungCap]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaNhaCungCap] (@mancc uniqueidentifier, @tenncc nvarchar(100), @sdt nchar(10),@diachi nvarchar(255))
As
BEGIN
UPDATE NhaCungCap SET tenncc=@tenncc,sdt=@sdt,diachi=@diachi
WHERE id_nhacungcap=@mancc
END;
GO
/****** Object:  StoredProcedure [dbo].[SuaSanPham]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaSanPham] (@masp uniqueidentifier, @tensp nvarchar(max), @mota nvarchar(max), @soluong int, @anh nvarchar(50), @maloai uniqueidentifier)
As
BEGIN
UPDATE SanPham SET tensp=@tensp,mota=@mota,soluong=@soluong,anh=@anh,@maloai=@maloai
WHERE id_sp=@masp
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemChiTietHD]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemChiTietHD] (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
INSERT INTO ChiTietHoaDon(id_chitiethd,id_hoadon,id_sp,soluong,thanhtien)
VALUES (@mact,@mahoadon,@masp,@soluong,@thanhtien)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemChiTietHDB]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemChiTietHDB] (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
INSERT INTO ChiTietHoaDonB(id_chitiethd,id_hoadon,id_sp,soluong,thanhtien)
VALUES (@mact,@mahoadon,@masp,@soluong,@thanhtien)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemChiTietHDN]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemChiTietHDN] (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
INSERT INTO ChiTietHoaDonN(id_chitiethdnhap,id_hoadonn,id_sanpham,soluong,thanhtien)
VALUES (@mact,@mahoadon,@masp,@soluong,@thanhtien)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemGia]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemGia] (@magia uniqueidentifier, @dongia float, @ngaycohieuluc datetime, @ngayhethieuluc datetime, @masp uniqueidentifier)
As
BEGIN
INSERT INTO GiaBan(id_gia,dongia,ngaycohieuluc,ngayhethieuluc,id_sp)
VALUES (@magia,@dongia,@ngaycohieuluc,@ngayhethieuluc,@masp)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemHoaDon]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemHoaDon] (@mahd uniqueidentifier, @ngaydat datetime, @tongtientt float, @diachigiaohang nvarchar(max),@sdt nchar(10))
As
BEGIN
INSERT INTO HoaDon(id_hoadon,ngaydat,tongtientt,diachigiaohang,sdt)
VALUES (@mahd,@ngaydat,@tongtientt,@diachigiaohang,@sdt)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemHoaDonBan]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemHoaDonBan] (@mahd uniqueidentifier, @ngaydat datetime, @tongtientt float, @diachigiaohang nvarchar(max),@sdt nchar(10))
As
BEGIN
INSERT INTO HoaDonB(id_hoadon,ngaydat,tongtientt,diachigiaohang,sdt)
VALUES (@mahd,@ngaydat,@tongtientt,@diachigiaohang,@sdt)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemHoaDonNhap]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemHoaDonNhap] (@mahd uniqueidentifier,@mancc uniqueidentifier, @ngaynhap datetime, @tongtientt float)
As
BEGIN
INSERT INTO HoaDonN(id_hoadonn,id_ncc,ngaynhap,tongtientt)
VALUES (@mahd,@mancc,@ngaynhap,@tongtientt)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemLoaiSP]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemLoaiSP] (@maloai uniqueidentifier, @tenloai nvarchar(100))
As
BEGIN
INSERT INTO LoaiSP(id_loai,ten_loai)
VALUES (@maloai,@tenloai)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemNguoiDung]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemNguoiDung] (@mand uniqueidentifier, @hoten nvarchar(100), @email nvarchar(100), @matkhau char(32),@sdt nchar(10),@diachi nvarchar(255), @maquyen int)
As
BEGIN
INSERT INTO NguoiDung(id_nguoidung,hoten,email,matkhau,sdt,diachi,id_quyen)
VALUES (@mand,@hoten,@email,@matkhau,@sdt,@diachi,@maquyen)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemNhaCungCap]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemNhaCungCap] (@mancc uniqueidentifier, @tenncc nvarchar(100), @sdt nchar(10),@diachi nvarchar(255))
As
BEGIN
INSERT INTO NhaCungCap(id_nhacungcap,tenncc,sdt,diachi)
VALUES (@mancc,@tenncc,@sdt,@diachi)
END;
GO
/****** Object:  StoredProcedure [dbo].[ThemSanPham]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[ThemSanPham] (@masp uniqueidentifier, @tensp nvarchar(max), @mota nvarchar(max), @soluong int, @anh nvarchar(50), @maloai uniqueidentifier)
As
BEGIN
INSERT INTO SanPham(id_sp,tensp,mota,soluong,anh,id_loai)
VALUES (@masp,@tensp,@mota,@soluong,@anh,@maloai)
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaChiTietHD]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaChiTietHD] (@mact uniqueidentifier )
As
BEGIN
DELETE FROM ChiTietHoaDon
WHERE id_chitiethd=@mact
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaHoaDon]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaHoaDon] (@mahd uniqueidentifier )
As
BEGIN
DELETE FROM HoaDon
WHERE id_hoadon=@mahd
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaNhaCungCap]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaNhaCungCap] (@mancc uniqueidentifier )
As
BEGIN
DELETE FROM NhaCungCap
WHERE id_nhacungcap=@mancc
END;
GO
/****** Object:  StoredProcedure [dbo].[XoaSanPham]    Script Date: 4/20/2022 10:35:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[XoaSanPham] (@masp uniqueidentifier )
As
BEGIN
DELETE FROM SanPham
WHERE id_sp=@masp
END;
GO

create table UserFunction(
function_id int not null primary key,
function_name nvarchar(30),
function_api nvarchar(30)
)

create table Permission(
permisssion_id int not null primary key,
function_id int not null,
id_quyen int not null
)