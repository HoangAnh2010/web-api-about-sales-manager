
---thêm loại sản phẩm
create PROC ThemLoaiSP (@maloai nvarchar(10), @tenloai nvarchar(100))
As
BEGIN
INSERT INTO LoaiSP(maloai,tenloai)
VALUES (@maloai,@tenloai)
END;
GO
--thuc thi
--exec ThemLoaiSP 'a868f1bc-102d-4bed-9a41-686a9d50aaaf',N'Thuc pham chuc nang'
--go
---thêm sản phẩm
create PROC ThemSanPham (@masp nvarchar(10), @tensp nvarchar(max), @mota nvarchar(max), @soluong int, @dongia float, @anh nvarchar(50), @maloai nvarchar(10))
As
BEGIN
INSERT INTO SanPham(masp,tensp,mota,soluong,dongia,anh,maloai)
VALUES (@masp,@tensp,@mota,@soluong,@dongia,@anh,@maloai)
END;
GO

---thêm người dùng
alter PROC ThemNguoiDung (@mand uniqueidentifier, @hoten nvarchar(100), @email nvarchar(100), @matkhau char(32),@sdt nchar(10),@diachi nvarchar(255), @maquyen int)
As
BEGIN
INSERT INTO NguoiDung(id_nguoidung,hoten,email,matkhau,sdt,diachi,id_quyen)
VALUES (@mand,@hoten,@email,@matkhau,@sdt,@diachi,@maquyen)
END;
GO
---thêm hóa đơn bán 

alter PROC ThemHoaDonBan (@mahd uniqueidentifier, @ngaydat datetime, @tongtientt float, @diachigiaohang nvarchar(max),@sdt nchar(10))
As
BEGIN
INSERT INTO HoaDonB(id_hoadon,ngaydat,tongtientt,diachinhanhang,sdt)
VALUES (@mahd,@ngaydat,@tongtientt,@diachigiaohang,@sdt)
END;
GO
---thêm chi tiết hóa đơn
alter PROC ThemChiTietHDB (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
INSERT INTO ChiTietHoaDonB(id_chitiethd,id_hoadon,id_sp,soluong,thanhtien)
VALUES (@mact,@mahoadon,@masp,@soluong,@thanhtien)
END;
GO
---thêm hóa đơn nhập
alter PROC ThemHoaDonNhap (@mahd uniqueidentifier,@mancc uniqueidentifier, @ngaynhap datetime, @tongtientt float)
As
BEGIN
INSERT INTO HoaDonN(id_hoadonn,id_ncc,ngaynhap,tongtientt)
VALUES (@mahd,@mancc,@ngaynhap,@tongtientt)
END;
GO
---thêm chi tiết hóa đơn nhập
alter PROC ThemChiTietHDN (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
INSERT INTO ChiTietHoaDonN(id_chitiethdnhap,id_hoadonn,id_sanpham,soluong,thanhtien)
VALUES (@mact,@mahoadon,@masp,@soluong,@thanhtien)
END;
GO
---thêm nhà cung cấp
alter PROC ThemNhaCungCap (@mancc uniqueidentifier, @tenncc nvarchar(100), @sdt nchar(10),@diachi nvarchar(255))
As
BEGIN
INSERT INTO NhaCungCap(id_nhacungcap,tenncc,sdt,diachi)
VALUES (@mancc,@tenncc,@sdt,@diachi)
END;
GO
---sửa loại sản phẩm
alter PROC SuaLoaiSanPham (@maloai uniqueidentifier, @tenloai nvarchar(100))
As
BEGIN
UPDATE LoaiSP SET ten_loai=@tenloai
WHERE id_loai=@maloai
END;
GO
---sửa sản phẩm
alter PROC SuaSanPham (@masp uniqueidentifier, @tensp nvarchar(max), @mota nvarchar(max), @soluong int, @anh nvarchar(50), @maloai uniqueidentifier)
As
BEGIN
UPDATE SanPham SET tensp=@tensp,mota=@mota,soluong=@soluong,anh=@anh,@maloai=@maloai
WHERE id_sp=@masp
END;
GO
---sửa giá
alter PROC SuaGia (@magia uniqueidentifier, @dongia float, @ngaycohieuluc datetime, @ngayhethieuluc datetime, @masp uniqueidentifier)
As
BEGIN
UPDATE GiaBan SET dongia=@dongia,ngaycohieuluc=@ngaycohieuluc,ngayhethieuluc=@ngayhethieuluc,id_sp=@masp
WHERE id_gia=@magia
END;
GO
---sửa người dùng
alter PROC SuaNguoiDung (@mand uniqueidentifier, @hoten nvarchar(100), @email nvarchar(100), @matkhau char(32),@sdt nchar(10),@diachi nvarchar(255), @maquyen int)
As
BEGIN
UPDATE NguoiDung SET hoten=@hoten,email=@email,matkhau=@matkhau,sdt=@sdt,diachi=@diachi,id_quyen=@maquyen
WHERE id_nguoidung=@mand
END;
GO
---sửa hóa đơn
create PROC SuaHoaDonBan (@mahd uniqueidentifier, @ngaydat datetime, @tongtientt float, @diachinhanhang nvarchar(max),@sdt nchar(10))
As
BEGIN
UPDATE HoaDon SET ngaydat=@ngaydat,tongtientt=@tongtientt,@diachinhanhang=@diachinhanhang,sdt=@sdt
WHERE id_hoadon=@mahd
END;
GO
---sửa chi tiết hóa đơn
create PROC SuaChiTietHDB (@mact uniqueidentifier, @mahoadon uniqueidentifier, @masp uniqueidentifier, @soluong int, @thanhtien float)
As
BEGIN
UPDATE ChiTietHoaDonB SET id_hoadon=@mahoadon,id_sp=@masp,soluong=@soluong,thanhtien=@thanhtien
WHERE id_chitiethd=@mact
END;
GO
---sửa tt nhà cung cấp
alter PROC SuaNhaCungCap (@mancc uniqueidentifier, @tenncc nvarchar(100), @sdt nchar(10),@diachi nvarchar(255))
As
BEGIN
UPDATE NhaCungCap SET tenncc=@tenncc,sdt=@sdt,diachi=@diachi
WHERE id_nhacungcap=@mancc
END;
GO
---xóa sản phẩm
alter PROC XoaSanPham (@masp uniqueidentifier )
As
BEGIN
DELETE FROM SanPham
WHERE id_sp=@masp
END;
---xóa hóa đơn
create PROC XoaHoaDonB (@mahd uniqueidentifier )
As
BEGIN
DELETE FROM HoaDonB
WHERE id_hoadon=@mahd
END;

create PROC XoaChiTietHDBan (@mact uniqueidentifier )
As
BEGIN
DELETE FROM ChiTietHoaDonB
WHERE id_chitiethd=@mact
END;
---xóa nhà cung cấp
alter PROC XoaNhaCungCap (@mancc uniqueidentifier )
As
BEGIN
DELETE FROM NhaCungCap
WHERE id_nhacungcap=@mancc
END;
---Lấy về ds tất cả loại sp
alter FUNCTION F_GetAllLoaiSP( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM LoaiSP )
----Lấy về ds tất cả sp
alter FUNCTION F_GetAllSP( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham )
---Lấy về ds tất cả hóa đơn bán
alter FUNCTION F_GetAllHoaDonB( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM HoaDonB )
----Lấy về tất cả sản phẩm theo mã loại
alter FUNCTION F_GetSPTheoMaLoai(@maloai uniqueidentifier)
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE id_loai=@maloai)
---Lấy về thông tin người dùng theo mã
alter FUNCTION F_GetTKTheoMa(@manguoidung uniqueidentifier)
RETURNS TABLE
AS
  RETURN (SELECT * FROM NguoiDung WHERE id_nguoidung=@manguoidung)
----Tìm kiếm sp theo tên gần đúng
alter FUNCTION F_GetSPTheoTen(@ten nvarchar(max))
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE tensp like '%'+@ten+'%')
---lấy về ds sp trong khoảng giá
alter FUNCTION F_GetSPTheoKhoangGia(@giamin float, @giamax float)
RETURNS TABLE
AS
  RETURN (SELECT tensp,mota,dongia,soluong FROM SanPham s inner join GiaBan g on s.id_sp=g.id_sp WHERE dongia>=@giamin and dongia<=@giamax)
---Thống kê 5 sp bán chạy
ALTER FUNCTION F_GetSPBanChay()
RETURNS TABLE
AS
  RETURN (SELECT top(5) tensp,mota FROM SanPham s inner join ChiTietHoaDonB ct on ct.id_sp=s.id_sp WHERE ct.soluong>2 order by tensp desc)
---Thống kê sp tồn kho
create FUNCTION F_GetSPTonKho()
RETURNS TABLE
AS
  RETURN (SELECT top(3) tensp,mota FROM SanPham s inner join ChiTietHoaDonB ct on ct.id_sp=s.id_sp WHERE ct.soluong<2 and s.soluong>2 order by tensp desc)
---Thống kê doanh thu trong thời gian tùy chọn
alter FUNCTION F_GetDoanhThu(@thoigianbd datetime, @thoigiankt datetime)
RETURNS TABLE
AS
  RETURN (SELECT id_hoadon,ngaydat,tongtientt FROM HoaDonB WHERE @thoigianbd<=ngaydat and @thoigiankt>=ngaydat)
---
