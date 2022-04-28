
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
create PROC ThemNguoiDung (@mand nvarchar(10), @hoten nvarchar(100), @email nvarchar(100), @matkhau varchar(10),@sdt nchar(10),@diachi nvarchar(max), @maquyen int)
As
BEGIN
INSERT INTO NguoiDung(manguoidung,hoten,email,matkhau,sdt,diachi,maquyen)
VALUES (@mand,@hoten,@email,@matkhau,@sdt,@diachi,@maquyen)
END;
GO
---thêm hóa đơn bán 

create PROC ThemHoaDonBan (@mahd nvarchar(10), @ngaydat datetime, @hoten nvarchar(100) ,@sdt nchar(10) ,@diachinhanhang nvarchar(max),@tongtientt float)
As
BEGIN
INSERT INTO HoaDonBan(mahd,ngaydat,hoten,sdt,diachinhanhang,tongtientt)
VALUES (@mahd,@ngaydat,@hoten,@sdt,@diachinhanhang,@tongtientt)
END;
GO
---thêm chi tiết hóa đơn
create PROC ThemChiTietHDB (@mahoadon nvarchar(10), @masp nvarchar(10), @soluong int, @thanhtien float)
As
BEGIN
INSERT INTO ChiTietHDBan(mahd,masp,soluong,thanhtien)
VALUES (@mahoadon,@masp,@soluong,@thanhtien)
END;
GO

---thêm nhà cung cấp
create PROC ThemNhaCungCap (@mancc nvarchar(10), @tenncc nvarchar(100), @sdt nchar(10),@diachi nvarchar(max))
As
BEGIN
INSERT INTO NhaCungCap(mancc,tenncc,sdt,diachi)
VALUES (@mancc,@tenncc,@sdt,@diachi)
END;
GO
---sửa loại sản phẩm
create PROC SuaLoaiSanPham (@maloai nvarchar(10), @tenloai nvarchar(100))
As
BEGIN
UPDATE LoaiSP SET tenloai=@tenloai
WHERE maloai=@maloai
END;
GO
---sửa sản phẩm
create PROC SuaSanPham (@masp nvarchar(10), @tensp nvarchar(max), @mota nvarchar(max), @soluong int, @dongia float, @anh nvarchar(50), @maloai nvarchar(10))
As
BEGIN
UPDATE SanPham SET tensp=@tensp,mota=@mota,soluong=@soluong,dongia=@dongia,anh=@anh,@maloai=@maloai
WHERE masp=@masp
END;
GO

---sửa người dùng
create PROC SuaNguoiDung (@mand nvarchar(10), @hoten nvarchar(100), @email nvarchar(100), @matkhau varchar(10),@sdt nchar(10),@diachi nvarchar(max), @maquyen int)
As
BEGIN
UPDATE NguoiDung SET hoten=@hoten,email=@email,matkhau=@matkhau,sdt=@sdt,diachi=@diachi,maquyen=@maquyen
WHERE manguoidung=@mand
END;
GO
---sửa hóa đơn
create PROC SuaHoaDonBan (@mahd nvarchar(10), @ngaydat datetime, @hoten nvarchar(100) ,@sdt nchar(10) ,@diachinhanhang nvarchar(max),@tongtientt float)
As
BEGIN
UPDATE HoaDonBan SET ngaydat=@ngaydat,hoten=@hoten,sdt=@sdt,@diachinhanhang=@diachinhanhang,tongtientt=@tongtientt
WHERE mahd=@mahd
END;
GO
---sửa chi tiết hóa đơn
create PROC SuaChiTietHDB (@mahoadon nvarchar(10), @masp nvarchar(10), @soluong int, @thanhtien float)
As
BEGIN
UPDATE ChiTietHDBan SET soluong=@soluong,thanhtien=@thanhtien
WHERE mahd=@mahoadon and masp=@masp
END;
GO
---sửa tt nhà cung cấp
create PROC SuaNhaCungCap (@mancc nvarchar(10), @tenncc nvarchar(100), @sdt nchar(10),@diachi nvarchar(max))
As
BEGIN
UPDATE NhaCungCap SET tenncc=@tenncc,sdt=@sdt,diachi=@diachi
WHERE mancc=@mancc
END;
GO
---xóa sản phẩm
create PROC XoaSanPham (@masp nvarchar(10) )
As
BEGIN
DELETE FROM SanPham
WHERE masp=@masp
END;
---xóa hóa đơn
create PROC XoaHoaDonB (@mahd nvarchar(10) )
As
BEGIN
DELETE FROM HoaDonBan
WHERE mahd=@mahd
END;

create PROC XoaChiTietHDBan (@mahd nvarchar(10),@masp nvarchar(10) )
As
BEGIN
DELETE FROM ChiTietHDBan
WHERE mahd=@mahd and masp=@masp
END;
---xóa nhà cung cấp
create PROC XoaNhaCungCap (@mancc nvarchar(10) )
As
BEGIN
DELETE FROM NhaCungCap
WHERE mancc=@mancc
END;
---Lấy về ds tất cả loại sp
create FUNCTION F_GetAllLoaiSP( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM LoaiSP )
----Lấy về ds tất cả sp
create FUNCTION F_GetAllSP( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham )
---Lấy về ds tất cả hóa đơn bán
create FUNCTION F_GetAllHoaDonB( )
RETURNS TABLE
AS
  RETURN (SELECT * FROM HoaDonBan )
----Lấy về tất cả sản phẩm theo mã loại
create FUNCTION F_GetSPTheoMaLoai(@maloai nvarchar(10))
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE maloai=@maloai)
---Lấy về thông tin người dùng theo mã
create FUNCTION F_GetTKTheoMa(@manguoidung nvarchar(10))
RETURNS TABLE
AS
  RETURN (SELECT * FROM NguoiDung WHERE manguoidung=@manguoidung)
----Tìm kiếm sp theo tên gần đúng
create FUNCTION F_GetSPTheoTen(@ten nvarchar(max))
RETURNS TABLE
AS
  RETURN (SELECT * FROM SanPham WHERE tensp like '%'+@ten+'%')
---lấy về ds sp trong khoảng giá
create FUNCTION F_GetSPTheoKhoangGia(@giamin float, @giamax float)
RETURNS TABLE
AS
  RETURN (SELECT tensp,mota,dongia,soluong FROM SanPham  WHERE dongia>=@giamin and dongia<=@giamax)
---Thống kê 5 sp bán chạy
create FUNCTION F_GetSPBanChay()
RETURNS TABLE
AS
  RETURN (SELECT top(3) tensp,mota FROM SanPham s inner join ChiTietHDBan ct on ct.masp=s.masp WHERE ct.soluong>2 order by tensp desc)
---Thống kê sp tồn kho
create FUNCTION F_GetSPTonKho()
RETURNS TABLE
AS
  RETURN (SELECT top(3) tensp,mota FROM SanPham s inner join ChiTietHDBan ct on ct.masp=s.masp WHERE ct.soluong<2 and s.soluong>2 order by tensp desc)
---Thống kê doanh thu trong thời gian tùy chọn
create FUNCTION F_GetDoanhThu(@thoigianbd datetime, @thoigiankt datetime)
RETURNS TABLE
AS
  RETURN (SELECT mahd,ngaydat,tongtientt FROM HoaDonBan WHERE @thoigianbd<=ngaydat and @thoigiankt>=ngaydat)
---
