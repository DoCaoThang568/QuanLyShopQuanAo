create database QuanLyShopQuanAo;

use QuanLyShopQuanAo;

-- Tạo bảng NHANVIEN
create table NHANVIEN
(
	MANV varchar(10) primary key,
    TENNV nvarchar(100) not null,
	MATKHAU varchar(100) not null,
	CHUCVU nvarchar(50) not null,
	SODIENTHOAI varchar(12) not null UNIQUE,
)

insert into NHANVIEN values
	('dct', N'Đỗ Cao Thắng', 'dct', N'Quản lý', '0384139704'),
	('1', N'Nguyễn Thị Lan', 'ntl123', N'Bán hàng', '0987654321'),
	('2', N'Trần Văn Hùng', 'tvh456', N'Bán hàng', '0912345678'),
	('3', N'Lê Thị Mai', 'ltm789', N'Bán hàng', '0978901234'),
	('4', N'Phạm Văn Tuấn', 'pvt012', N'Bán hàng', '0901234567'),
	('5', N'Hồ Thị Thu', 'htt345', N'Bán hàng', '0934567890'),
	('6', N'Vũ Văn An', 'vva678', N'Bán hàng', '0967890123'),
	('7', N'Đặng Thị Linh', 'dtl901', N'Bán hàng', '0990123456'),
	('8', N'Bùi Văn Nam', 'bvn234', N'Bán hàng', '0923456789'),
	('9', N'Ngô Thị Yến', 'nty567', N'Bán hàng', '0956789012'),
	('10', N'Phan Văn Đức', 'pvd890', N'Bán hàng', '0890123456');

-- Tạo bảng KHACHHANG
create table KHACHHANG
(
	MAKH varchar(10) primary key not null,
	TENKH nvarchar(50) not null,
	GIOITINH nvarchar(10) not null CHECK (GIOITINH IN (N'Nam', N'Nữ')),
	SDT varchar(12) not null UNIQUE
);

insert into KHACHHANG values
	('KH01', N'Phạm Đình Tuấn', N'Nam', '0123456789'),
	('KH02', N'Lê Văn Thành', N'Nam', '0987654321'),
	('KH03', N'Nguyễn Thị Hoa', N'Nữ', '0912345678'),
	('KH04', N'Trần Văn Minh', N'Nam', '0978901234'),
	('KH05', N'Phạm Thị Thủy', N'Nữ', '0901234567'),
	('KH06', N'Hồ Văn Đức', N'Nam', '0934567890'),
	('KH07', N'Vũ Thị Lan Anh', N'Nữ', '0967890123'),
	('KH08', N'Đặng Văn Quân', N'Nam', '0990123456'),
	('KH09', N'Bùi Thị Trang', N'Nữ', '0923456789'),
	('KH10', N'Ngô Văn Huy', N'Nam', '0956789012'),
	('KH11', N'Phan Thị Ngọc', N'Nữ', '0890123456');

-- Tạo bảng LOAISANPHAM
create table LOAISANPHAM
(
    MALOAISP varchar(10) primary key,
    TENLOAISP nvarchar(100) not null
);

insert into LOAISANPHAM (MALOAISP, TENLOAISP) values
	('SPa', N'Áo'),
	('SPq', N'Quần'),
	('SPv', N'Váy');
	

-- Tạo bảng SANPHAM
create table SANPHAM
(
    MASP varchar(10) primary key,
    TENSP nvarchar(200) not null,
    MALOAISP varchar(10),
    GIABAN decimal(18,2) not null,
    SOLUONGTON int not null,
    MOTA nvarchar(max),
    HINHANH varchar(200),
    foreign key (MALOAISP) references LOAISANPHAM(MALOAISP),
);

insert into SANPHAM values
	('a01', N'Áo thun cổ tròn', 'SPa', 200000, 100, N'Áo thun chất liệu cotton', 'thuncotron.jpg'),
	('q01', N'Quần jeans xanh', 'SPq', 500000, 50, N'Quần jeans chất liệu denim', 'quanjeanxanh.jpg'),
	('a02', N'Áo khoác mùa đông', 'SPa', 800000, 30, N'Áo khoác giữ ấm tốt', 'aokhoac.jpg'),
	('a03', N'Áo sơ mi nam trắng', 'SPa', 300000, 80, N'Áo sơ mi nam chất liệu cotton', 'aosomitrang.jpg'),
	('q02', N'Quần tây nam đen', 'SPq', 400000, 60, N'Quần tây nam chất liệu kaki', 'quantayden.jpg'),
	('v01', N'Váy hoa nhí', 'SPv', 350000, 70, N'Váy chất liệu voan', 'vayhoanhi.jpg'),
	('v02', N'Chân váy chữ A', 'SPv', 255000, 6, N'Chân váy đẹp thời trang', 'chanvaya.jpg');


-- Tạo bảng KHUYENMAI
create table KHUYENMAI
(
    MAKM varchar(10) primary key,
    TENKM nvarchar(100) not null,
    GIATRIKM float not null CHECK (GIATRIKM >= 0 AND GIATRIKM <= 1)
);

insert into KHUYENMAI (MAKM, TENKM, GIATRIKM) values
	('MHSD' , N'Mùa hè sôi động', 0.15),
	('BF', N'Black Friday', 0.7),
	('SNV', N'Sinh nhật vàng', 0.3),
	('KHONG', N'Không có khuyến mãi', 0);

-- Tạo bảng HOADON
create table HOADON
(
	MAHD int identity(1,1) primary key,
	MANV varchar(10),
	MAKM varchar(10) DEFAULT 'KHONG',
	MAKH varchar(10),
    NGAYLAP datetime not null DEFAULT GETDATE(),
    TONGTIENHD decimal(18,2) not null,
	foreign key (MANV) references NHANVIEN(MANV),
	foreign key (MAKM) references KHUYENMAI(MAKM),
	foreign key (MAKH) references KHACHHANG(MAKH)
);

insert into HOADON (MANV, MAKH, NGAYLAP, TONGTIENHD) values
	('dct', 'KH01', '2024-07-13', 0),
	('1', 'KH02', '2024-07-13', 0);


-- Tạo bảng CHITIETHOADON
create table CHITIETHOADON
(
    MACTHD int identity(1,1) primary key,
    MAHD int,
    MASP varchar(10),
    SOLUONG int not null CHECK (SOLUONG > 0),
    DONGIA decimal(18,2) not null CHECK (DONGIA >= 0),
    foreign key (MAHD) references HOADON(MAHD),
    foreign key (MASP) references SANPHAM(MASP)
);

insert into CHITIETHOADON (MAHD, MASP, SOLUONG, DONGIA) values
	(1, 'a02', 1, 800000),
	(2, 'a01', 1, 200000);


-- Tạo bảng NHACUNGCAP
create table NHACUNGCAP
(
	MANCC int identity(1,1) primary key,
	TENNCC nvarchar(100) not null,
	DIACHI nvarchar(200),
	SODIENTHOAI varchar(20)
);

insert into NHACUNGCAP (TENNCC, DIACHI, SODIENTHOAI) values
	(N'Nhà cung cấp X', N'123 Đường X, Quận 4, TP.HCM', '0902222222'),
	(N'Nhà cung cấp Y', N'456 Đường Y, Quận 5, TP.HCM', '0903333333');

-- Tạo bảng PHIEUNHAP
create table PHIEUNHAP
(
    MAPN int identity(1,1) primary key,
	MANV varchar(10),
	MANCC int,
    NGAYNHAP datetime not null,
    TONGTIENPN decimal(18,2) not null,
	foreign key (MANV) references NHANVIEN(MANV),
	foreign key (MANCC) references NHACUNGCAP(MANCC)
);

insert into PHIEUNHAP (MANV, MANCC, NGAYNHAP, TONGTIENPN) values
	('dct', 1, '2024-07-26', 0);


-- Tạo bảng CHITIETPHIEUNHAP
create table CHITIETPHIEUNHAP
(
    MAPN int,
    MASP varchar(10),
    SOLUONG int not null CHECK (SOLUONG > 0),
    DONGIA decimal(18,2) not null CHECK (DONGIA >= 0),
    foreign key (MAPN) references PHIEUNHAP(MAPN),
    foreign key (MASP) references SANPHAM(MASP),
	primary key (MAPN, MASP)
);

insert into CHITIETPHIEUNHAP (MAPN, MASP, SOLUONG, DONGIA) values
	(1, 'q02', 50, 400000),
	(1, 'v01', 20, 250000);

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-- Trigger tính TONGTIENHD trong HOADON
CREATE TRIGGER trg_TinhTongTienHoaDon
ON CHITIETHOADON
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE HOADON
    SET TONGTIENHD = (SELECT SUM(SOLUONG * DONGIA) FROM CHITIETHOADON WHERE CHITIETHOADON.MAHD = HOADON.MAHD)
    WHERE MAHD IN (SELECT DISTINCT MAHD FROM inserted UNION ALL SELECT DISTINCT MAHD FROM deleted);
END;

-- Trigger tính TONGTIENPN trong PHIEUNHAP
CREATE TRIGGER trg_TinhTongTienPhieuNhap
ON CHITIETPHIEUNHAP
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE PHIEUNHAP
    SET TONGTIENPN = (SELECT SUM(SOLUONG * DONGIA) FROM CHITIETPHIEUNHAP WHERE CHITIETPHIEUNHAP.MAPN = PHIEUNHAP.MAPN)
    WHERE MAPN IN (SELECT DISTINCT MAPN FROM inserted UNION ALL SELECT DISTINCT MAPN FROM deleted);
END;

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

----Phần của Tiền
--Table 3 (LOAISANPHAM)
--procedure
--Xem danh sách loại sản phẩm
create proc ViewLoaiSP
as
begin
    select MALOAISP, TENLOAISP
    from LOAISANPHAM
end

exec ViewLoaiSP

--Thêm loại sản phẩm mới
create proc AddLoaiSP
    @maloaisp varchar(10),
    @tenloaisp nvarchar(100)
as
begin
    if exists (select 1 from LOAISANPHAM where MALOAISP = @maloaisp)
    begin
        print N'Mã loại sản phẩm đã tồn tại!'
        return
    end

    insert into LOAISANPHAM (MALOAISP, TENLOAISP)
    values (@maloaisp, @tenloaisp)
end

exec AddLoaiSP 'SPg', N'Giày'

-- Sửa tên loại sản phẩm
create proc FixLoaiSP
    @maloaisp varchar(10),
    @tenloaisp nvarchar(100)
as
begin
    if not exists(select 1 from LOAISANPHAM where MALOAISP = @maloaisp)
    begin
        print N'Mã loại sản phẩm không tồn tại!'
        return
    end

    update LOAISANPHAM
    set TENLOAISP = @tenloaisp
    where MALOAISP = @maloaisp;
end

exec FixLoaiSP 'SPg', N'Giày dép'

--Xóa loại sản phẩm
create proc DelLoaiSP
    @maloaisp varchar(10)
as
begin
    if not exists (select 1 from LOAISANPHAM where MALOAISP = @maloaisp)
    begin
        print N'Mã loại sản phẩm không tồn tại!'
        return
    end

    if exists(select 1 from SANPHAM where MALOAISP = @maloaisp)
    begin
        print N'Không thể xóa loại sản phẩm này vì nó đang được sử dụng bởi sản phẩm.'
        return
    end

    delete from LOAISANPHAM
    where MALOAISP = @maloaisp
end

exec DelLoaiSP 'SPg'

--function
--Kiểm tra LOAISANPHAM tồn tại
create function CheckLoaiSPTonTai (@maloaisp varchar(10))
returns int
as
begin
    if exists (select 1 from LOAISANPHAM where MALOAISP = @maloaisp)
        return 1
    return 0
end

select dbo.CheckLoaiSPTonTai('SPa')

--Lấy tên loại sản phẩm từ mã loại (dùng để dành cho việc tìm kiếm sản phẩm theo mã loại)
create function LayTenLoaiSP(@maloaisp varchar(10))
returns nvarchar(100)
as
begin
	declare @tenloaisp nvarchar(100)
	select @tenloaisp = TENLOAISP
	from LOAISANPHAM
	where MALOAISP = @maloaisp
	return @tenloaisp
end

select dbo.LayTenLoaiSP('SPq')

--Kiểm tra tên loại sản phẩm đã tồn tại chưa (không phân biệt hoa thường) --Dạng này có thể nói là nâng cao hơn của function ktra loại sp tồn tại nhưng thay vì check mã loại sp thì check tên loại sp
create function CheckTenLoaiSPTonTai(@tenloaisp nvarchar(100))
returns int
as
begin
	if exists (select 1 from LOAISANPHAM where LOWER(TENLOAISP)=LOWER(@tenloaisp))
		return 1
	return 0
end

select dbo.CheckTenLoaiSPTonTai(N'Áo')

--Kiểm tra xem một loại sản phẩm có sản phẩm nào liên quan không(Giá trị của hàm nếu như return về 1 tức là có một hoặc nhiều hơn một sản phẩm liên quan, còn 0 thì ngược lại)
create function LoaiSPCoSPLienQuan(@maloaisp varchar(10))
returns int
as
begin
	if exists (select 1 from SANPHAM where MALOAISP = @maloaisp)
		return 1
	return 0
end

select dbo.LoaiSPCoSPLienQuan('SPv')

--trigger
--Trigger loại SP thay đổi khi thêm, xoá, sửa. (Chạy thử bằng cách thực hiện 3 câu lệnh thêm xoá sửa ở phần procedure, kết quả được ghi vào bảng LOG)
--khúc này con bot chỉ phải có table LOG dự phòng =)))
CREATE TABLE LOG_LOAISANPHAM 
(
    ThoiGian DATETIME,
    ThaoTac VARCHAR(20), --Chỉ nhận 3 loại thao tác: INSERT, UPDATE, DELETE
    MALOAISP_Cu VARCHAR(10),
    TENLOAISP_Cu NVARCHAR(100),
    MALOAISP_Moi VARCHAR(10),
    TENLOAISP_Moi NVARCHAR(100)
)

create trigger LoaiSPThayDoi
on LOAISANPHAM
after insert, update, delete
as
begin
	--trường hợp insert
	insert into LOG_LOAISANPHAM(ThoiGian, ThaoTac, MALOAISP_Moi, TENLOAISP_Moi)
	select GETDATE(), 'INSERT', MALOAISP, TENLOAISP from inserted

	--trường hợp update(chỉ ghi log khi có sự thay đổi tên)
	insert into LOG_LOAISANPHAM (ThoiGian, ThaoTac, MALOAISP_Cu, TENLOAISP_Cu, MALOAISP_Moi, TENLOAISP_Moi)
    select GETDATE(), 'UPDATE', d.MALOAISP, d.TENLOAISP, i.MALOAISP, i.TENLOAISP
    from deleted d
    inner join inserted i on d.MALOAISP = i.MALOAISP
    where d.TENLOAISP <> i.TENLOAISP  -- Chỉ ghi log nếu tên thay đổi

    --trường hợp delete
    insert into LOG_LOAISANPHAM (ThoiGian, ThaoTac, MALOAISP_Cu, TENLOAISP_Cu)
    select GETDATE(), 'DELETE', MALOAISP, TENLOAISP from deleted
end

--Mỗi khi thêm, xoá, sửa thì sự thay đổi sẽ được ghi vào table LOG
select * from LOG_LOAISANPHAM

--cursor
--Duyệt qua tất cả loại sản phẩm
declare LoaiSP cursor
for select MALOAISP, TENLOAISP from LOAISANPHAM

declare @maloaisp varchar(10), @tenloaisp nvarchar(100)

open LoaiSP

fetch next from LoaiSP into @maloaisp, @tenloaisp

while @@FETCH_STATUS = 0
begin
	print N'Mã loại: ' + @maloaisp + N', Tên loại: ' + @tenloaisp
	fetch next from LoaiSP into @maloaisp, @tenloaisp
end

close LoaiSP

deallocate LoaiSP

--Table 4 (SANPHAM)
--procedure
--Xem danh sách sản phẩm (có tìm kiếm, lọc theo từ khoá, mã loại sp, giá tối đa và tối thiểu)
create proc XemSP
	@keyword nvarchar(200) = null,
	@maloaisp varchar(10) = null,
	@giamin float = null,
	@giamax float = null
as
begin
	select MASP, TENSP, TENLOAISP, GIABAN, SOLUONGTON, MOTA, HINHANH
	from SANPHAM sp join LOAISANPHAM lsp on sp.MALOAISP = lsp.MALOAISP
	where (@keyword is null or TENSP like N'%' + @keyword + N'%' or MASP like '%' + @keyword + '%' or TENLOAISP like N'%' + @keyword + N'%')
		and (@maloaisp is null or sp.MALOAISP = @maloaisp)
		and (@giamin is null or GIABAN>=@giamin)
		and (@giamax is null or GIABAN<=@giamax)
end
--Thực thi các trường hợp:
--trường hợp cơ bản: xem tất cả
exec XemSP

--trường hợp 1: lọc theo từ khoá(Tiền ví dụ là tìm kiếm sản phẩm có "Áo" trong tên, mã hoặc loại)
exec XemSP @keyword = N'Áo'

--trường hợp 2: lọc theo giá(Tiền ví dụ là lọc giá từ 100.000 đến 400.000)
exec XemSP @GiaMin = 100000, @GiaMax = 400000

--trường hợp 3: kết hợp lọc (Như trường hợp này Tiền ví dụ là lọc sản phẩm loại 'SPa' và giá từ 200.000 đến 500.000)
exec XemSP @maloaisp = 'SPa', @GiaMin = 200000, @GiaMax = 500000

--Thêm sản phẩm mới
create proc AddSP
	@masp varchar(10),
	@tensp nvarchar(100),
	@maloaisp varchar(10),
	@giaban float,
	@soluongton int,
	@mota nvarchar(max),
	@image varchar(200)
as
begin
	--Check mã sp có tồn tại hay chưa
	if exists(select 1 from SANPHAM where MASP = @masp)
	begin
		print N'Mã sản phẩm đã tồn tại!'
		return
	end

	--Check loại sp có tồn tại không
	if not exists (select 1 from LOAISANPHAM where MALOAISP = @maloaisp)
	begin
		print N'Mã loại sản phẩm không tồn tại.'
		return
	end

	insert into SANPHAM(MASP, TENSP, MALOAISP, GIABAN, SOLUONGTON, MOTA, HINHANH)
	values (@masp, @tensp, @maloaisp, @giaban, @soluongton, @mota, @image)
end

exec AddSP 'q03', N'Quần kaki màu kem', 'SPq', 600000, 100, N'Quần kaki màu kem hợp thời trang nam nữ', 'quankakimaukem.jpg'

--Sửa sản phẩm
create proc FixSP
	@masp varchar(10),
	@tensp nvarchar(100),
	@maloaisp varchar(10),
	@giaban float,
	@soluongton int,
	@mota nvarchar(max) = null, --Cho phép NULL để không cập nhật mô tả nếu không cần
    @image varchar(200) = null --Tương tự như mô tả
as
begin
	--Check mã sp có tồn tại hay chưa
	if not exists(select 1 from SANPHAM where MASP = @masp)
	begin
		print N'Mã sản phẩm không tồn tại!'
		return
	end

	--Check loại sp có tồn tại không
	if not exists (select 1 from LOAISANPHAM where MALOAISP = @maloaisp)
	begin
		print N'Mã loại sản phẩm không tồn tại.'
		return
	end

	update SANPHAM
	set TENSP = @tensp,
		MALOAISP = @maloaisp,
		GIABAN = @giaban,
		SOLUONGTON = @soluongton,
		MOTA = ISNULL(@mota, MOTA), --Chỉ cập nhậtt nếu @mota khác NULL
		HINHANH = ISNULL(@image, HINHANH) --Chỉ cập nhaajtt nếu @image khác NULL
	where MASP = @masp
end
--Thực thi:
--Sửa giá và số lượng tồn
exec FixSP 'q03', N'Quần kaki màu kem', 'SPq', 700000, 50
--Sửa tất cả thông tin
exec FixSP 'q03', N'Quần kaki màu kem', 'SPq', 650000, 15, N'Quần kaki màu kem hợp thời trang nam nữ phối đồ mùa hè', 'quankakimaukem.jpg'

--Xoá sản phẩm
create proc DelSP
	@masp varchar(10)
as
begin
	--Check sp có trong hoá đơn hoặc phiếu nhập không
	if exists (select 1 from CHITIETHOADON where MASP = @masp) or exists (select 1 from CHITIETPHIEUNHAP where MASP = @masp)
	begin
		print N'Không thể xoá sản phẩm vì đang được sử dụng trong hoá đơn hoặc phiếu nhập.'
		return
	end

	delete from SANPHAM where MASP = @masp
end

exec DelSP 'q03'

--Nhập hàng (Cập nhật số lượng tồn)
create proc InputSP(
	@masp varchar(10), 
	@soluonginput int)
as
begin
	--Check sp có tồn tại không
	if not exists (select 1 from SANPHAM where MASP = @masp)
	begin
		print N'Mã sản phẩm không tồn tại!'
		return
	end

	--Check số lượng nhập phải more than zero
	if @soluonginput <= 0
	begin
		print N'Số lượng nhập phải lớn hơn 0!'
		return 0
	end

	--Tăng số lượng tồn
	update SANPHAM
	set SOLUONGTON = SOLUONGTON + @soluonginput
	where MASP = @masp

	print N'Đã nhập ' + convert(nvarchar(10), @soluonginput) + N' sản phẩm ' + @MASP + N' thành công.';
end

exec InputSP 'a01', 50

--function
create function SanPhamTonTai(@masp varchar(10))
returns int
as
begin
    if exists(select 1 from SANPHAM where MASP = @masp)
        return 1
    return 0
end

select dbo.SanPhamTonTai('a01')

--trigger
--Cập nhật số lượng tồn trong bảng SANPHAM mỗi khi CHITIETPHIEUNHAP thay đổi
create trigger updateSoLuongTon
on CHITIETPHIEUNHAP
after insert, update, delete
as
begin
	-- Giảm số lượng tồn cho các sản phẩm bị xóa hoặc sửa
	update SANPHAM
	set SOLUONGTON = SOLUONGTON + d.SOLUONG
	from deleted d
	where SANPHAM.MASP = d.MASP

	-- Tăng số lượng tồn cho các sản phẩm được thêm hoặc sửa
	update SANPHAM
	set SOLUONGTON = SOLUONGTON - i.SOLUONG
	from inserted i
	where SANPHAM.MASP = i.MASP
end

-- Thêm chi tiết phiếu nhập, trigger sẽ tự động cập nhật số lượng tồn, Trigger sẽ tự động cập nhật số lượng tồn trong bảng SANPHAM
INSERT INTO CHITIETPHIEUNHAP (MAPN, MASP, SOLUONG, DONGIA) VALUES (1, 'a02', 10, 500000)

--cursor
--Duyệt qua tất cả sản phẩm và in ra thông tin
declare DuyetSP cursor
for select MASP, TENSP from SANPHAM

declare @masp varchar(10), 
		@tensp nvarchar(100)

open DuyetSP

fetch next from DuyetSP into @masp, @tensp

while @@FETCH_STATUS = 0
begin
	print N'Mã sản phẩm: ' + @masp + N', Tên sản phẩm: ' + @tensp
	fetch next from DuyetSP into @masp, @tensp
end

close DuyetSP

deallocate DuyetSP

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------


--bảng chitiethoadon
--Procedure
CREATE PROC XemChiTietHoaDon
    @mahoadon int
AS
BEGIN
    SELECT ct.MASP, sp.TENSP, ct.SOLUONG, ct.DONGIA, (ct.SOLUONG * ct.DONGIA) AS THANHTIEN
    FROM CHITIETHOADON ct
    JOIN SANPHAM sp ON ct.MASP = sp.MASP
    WHERE ct.MAHD = @mahoadon;
END;

EXEC XemChiTietHoaDon 1;


-- Function
--Tính tổng giá trị chi tiết hóa đơn
CREATE FUNCTION TinhTongGiaTriHoaDon(@mahoadon int)
RETURNS FLOAT
AS
BEGIN
    RETURN (
        SELECT SUM(SOLUONG * DONGIA)
        FROM CHITIETHOADON
        WHERE MAHD = @mahoadon
    );
END;

SELECT dbo.TinhTongGiaTriHoaDon(1);


--trigger
--Kiểm tra số lượng tồn khi thêm hoặc sửa chi tiết hóa đơn
CREATE TRIGGER KiemTraSoLuongTon
ON CHITIETHOADON
INSTEAD OF INSERT, UPDATE -- Dùng INSTEAD OF để kiểm tra trước khi thay đổi dữ liệu
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN SANPHAM sp ON i.MASP = sp.MASP
        WHERE i.SOLUONG > sp.SOLUONGTON
    )
    BEGIN
        RAISERROR (N'Số lượng vượt quá số lượng tồn trong kho!', 16, 1);
        ROLLBACK TRANSACTION; -- Rollback transaction nếu số lượng không đủ
    END
    ELSE -- Thêm ELSE để thực hiện INSERT hoặc UPDATE nếu số lượng đủ
	BEGIN
		-- Thực hiện INSERT nếu là thao tác INSERT
		IF (SELECT COUNT(*) FROM inserted) > 0 AND (SELECT COUNT(*) FROM deleted) = 0
		BEGIN
			INSERT INTO CHITIETHOADON (MAHD, MASP, SOLUONG, DONGIA)
			SELECT MAHD, MASP, SOLUONG, DONGIA
			FROM inserted;
		END

		-- Thực hiện UPDATE nếu là thao tác UPDATE
		IF (SELECT COUNT(*) FROM inserted) > 0 AND (SELECT COUNT(*) FROM deleted) > 0
		BEGIN
			UPDATE CHITIETHOADON
			SET SOLUONG = i.SOLUONG, DONGIA = i.DONGIA
			FROM inserted i
			WHERE CHITIETHOADON.MACTHD = i.MACTHD;
		END
	END;
END;


--cursor
--Duyệt qua chi tiết hóa đơn
DECLARE ChiTietHD CURSOR
FOR SELECT MASP, SOLUONG, DONGIA FROM CHITIETHOADON WHERE MAHD = 1;

DECLARE @masp VARCHAR(10), @soluong INT, @dongia FLOAT;

OPEN ChiTietHD;

FETCH NEXT FROM ChiTietHD INTO @masp, @soluong, @dongia;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Mã sản phẩm: ' + @masp + ', Số lượng: ' + CAST(@soluong AS VARCHAR) + ', Đơn giá: ' + CAST(@dongia AS VARCHAR);
    FETCH NEXT FROM ChiTietHD INTO @masp, @soluong, @dongia;
END;

CLOSE ChiTietHD;
DEALLOCATE ChiTietHD;


--bảng NHACUNGCAP

--procedure
--xem
CREATE PROC XemDanhSachNhaCungCap
    @keyword NVARCHAR(100) = NULL
AS
BEGIN
    SELECT MANCC, TENNCC, DIACHI, SODIENTHOAI
    FROM NHACUNGCAP
    WHERE (@keyword IS NULL OR TENNCC LIKE N'%' + @keyword + N'%' OR MANCC LIKE '%' + @keyword + '%');
END;

EXEC XemDanhSachNhaCungCap N'Công ty';

--thêm
CREATE PROC ThemNhaCungCap
    @tenncc NVARCHAR(100),
    @diachi NVARCHAR(200),
    @sdt VARCHAR(15)
AS
BEGIN
    INSERT INTO NHACUNGCAP (TENNCC, DIACHI, SODIENTHOAI)
    VALUES (@tenncc, @diachi, @sdt);
END;

EXEC ThemNhaCungCap N'Công ty A', N'Hà Nội', '0123456789';


--sửa
CREATE PROC SuaThongTinNhaCungCap
    @mancc INT,
    @tenncc NVARCHAR(100),
    @diachi NVARCHAR(200),
    @sdt VARCHAR(15)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM NHACUNGCAP WHERE MANCC = @mancc)
    BEGIN
        PRINT N'Mã nhà cung cấp không tồn tại!';
        RETURN;
    END;

    UPDATE NHACUNGCAP
    SET TENNCC = @tenncc, DIACHI = @diachi, SODIENTHOAI = @sdt
    WHERE MANCC = @mancc;
END;


EXEC SuaThongTinNhaCungCap 1, N'Công ty B', N'Hồ Chí Minh', '0987654321';


--xóa
CREATE PROC XoaNhaCungCap
    @mancc INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM NHACUNGCAP WHERE MANCC = @mancc)
    BEGIN
        PRINT N'Mã nhà cung cấp không tồn tại!';
        RETURN;
    END;

    IF EXISTS (SELECT 1 FROM PHIEUNHAP WHERE MANCC = @mancc)
    BEGIN
        PRINT N'Không thể xóa nhà cung cấp vì đã có phiếu nhập liên quan!';
        RETURN;
    END;

    DELETE FROM NHACUNGCAP WHERE MANCC = @mancc;
END;

EXEC XoaNhaCungCap 1;


--function
--Kiểm tra nhà cung cấp có phiếu nhập liên quan
CREATE FUNCTION KiemTraNCCCoLienQuan(@mancc int)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT CASE 
            WHEN EXISTS (SELECT 1 FROM PHIEUNHAP WHERE MANCC = @mancc) THEN 1
            ELSE 0
        END
    );
END;

SELECT dbo.KiemTraNCCCoLienQuan(1);


--trigger
--Ghi log khi thêm, sửa, xóa nhà cung cấp
CREATE TABLE LOG_NHACUNGCAP (
    ThoiGian DATETIME,
    ThaoTac NVARCHAR(20),
    MANCC_Cu VARCHAR(10),
    TENNCC_Cu NVARCHAR(100),
    MANCC_Moi VARCHAR(10),
    TENNCC_Moi NVARCHAR(100)
);

CREATE TRIGGER LogNhaCungCap
ON NHACUNGCAP
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Insert log
    INSERT INTO LOG_NHACUNGCAP(ThoiGian, ThaoTac, MANCC_Moi, TENNCC_Moi)
    SELECT GETDATE(), 'INSERT', MANCC, TENNCC FROM INSERTED;

    -- Update log
    INSERT INTO LOG_NHACUNGCAP(ThoiGian, ThaoTac, MANCC_Cu, TENNCC_Cu, MANCC_Moi, TENNCC_Moi)
    SELECT GETDATE(), 'UPDATE', d.MANCC, d.TENNCC, i.MANCC, i.TENNCC
    FROM DELETED d INNER JOIN INSERTED i ON d.MANCC = i.MANCC;

    -- Delete log
    INSERT INTO LOG_NHACUNGCAP(ThoiGian, ThaoTac, MANCC_Cu, TENNCC_Cu)
    SELECT GETDATE(), 'DELETE', MANCC, TENNCC FROM DELETED;
END;

--cursor
-- Duyệt qua tất cả nhà cung cấp
DECLARE NhaCungCapCursor CURSOR
FOR 
    SELECT MANCC, TENNCC, DIACHI, SODIENTHOAI 
    FROM NHACUNGCAP

DECLARE @mancc VARCHAR(10), 
        @tenncc NVARCHAR(100), 
        @diachi NVARCHAR(200), 
        @sdt VARCHAR(15)

OPEN NhaCungCapCursor

FETCH NEXT FROM NhaCungCapCursor INTO @mancc, @tenncc, @diachi, @sdt

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT N'Mã NCC: ' + @mancc + N', Tên NCC: ' + @tenncc + N', Địa chỉ: ' + @diachi + N', SĐT: ' + @sdt
    FETCH NEXT FROM NhaCungCapCursor INTO @mancc, @tenncc, @diachi, @sdt
END

CLOSE NhaCungCapCursor
DEALLOCATE NhaCungCapCursor

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

--Tao Procedures, Functions, Triggers, Views tương ứng cho PHIEUNHAP và CHITIETPHIEUNHAP
--PHIEUNHAP
-- Procedures
CREATE PROCEDURE ThemPhieuNhap (@MaNV VARCHAR(10), @MaNCC INT, @NgayNhap DATETIME, @ChiTietPhieuNhap TYPE_CHITIETPHIEUNHAP READONLY)
AS
BEGIN
    BEGIN TRANSACTION
    INSERT INTO PHIEUNHAP (MANV, MANCC, NGAYNHAP, TONGTIENPN)
    VALUES (@MaNV, @MaNCC, @NgayNhap, 0);     
    DECLARE @MaPN INT = SCOPE_IDENTITY(); 
    INSERT INTO CHITIETPHIEUNHAP (MAPN, MASP, SOLUONG, DONGIA)
    SELECT @MaPN, MASP, SOLUONG, DONGIA
    FROM @ChiTietPhieuNhap;
    UPDATE PHIEUNHAP
    SET TONGTIENPN = (SELECT SUM(SOLUONG * DONGIA) FROM CHITIETPHIEUNHAP WHERE MAPN = @MaPN)
    WHERE MAPN = @MaPN;
    UPDATE SANPHAM
    SET SOLUONGTON = SOLUONGTON + (SELECT SOLUONG FROM CHITIETPHIEUNHAP WHERE MAPN = @MaPN AND MASP = SANPHAM.MASP)
    WHERE MASP IN (SELECT MASP FROM CHITIETPHIEUNHAP WHERE MAPN = @MaPN);
    COMMIT TRANSACTION
    IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION
        THROW; 
    END
END;

DECLARE @ChiTiet TABLE (MASP VARCHAR(10), SOLUONG INT, DONGIA DECIMAL(18,2));
INSERT INTO @ChiTiet VALUES ('a01', 5, 220000), ('q01', 3, 550000);
EXEC ThemPhieuNhap @MaNV = 'dct', @MaNCC = 1, @NgayNhap = GETDATE(), @ChiTietPhieuNhap = @ChiTiet;
-- Tạo TYPE TABLE để truyền tham số cho stored procedure
CREATE TYPE TYPE_CHITIETPHIEUNHAP AS TABLE 
(
    MASP VARCHAR(10),
    SOLUONG INT,
    DONGIA DECIMAL(18,2)
);
CREATE PROCEDURE XemPhieuNhap (@MaPN INT = NULL, @MaNCC INT = NULL, @MaNV VARCHAR(10) = NULL, @TuNgay DATETIME = NULL, @DenNgay DATETIME = NULL)
AS
BEGIN
    SELECT pn.MAPN, nv.TENNV, ncc.TENNCC, pn.NGAYNHAP, pn.TONGTIENPN
    FROM PHIEUNHAP pn
    JOIN NHANVIEN nv ON pn.MANV = nv.MANV
    JOIN NHACUNGCAP ncc ON pn.MANCC = ncc.MANCC
    WHERE (@MaPN IS NULL OR pn.MAPN = @MaPN)
      AND (@MaNCC IS NULL OR pn.MANCC = @MaNCC)
      AND (@MaNV IS NULL OR pn.MANV = @MaNV)
      AND (@TuNgay IS NULL OR pn.NGAYNHAP >= @TuNgay)
      AND (@DenNgay IS NULL OR pn.NGAYNHAP <= @DenNgay);
END;
EXEC XemPhieuNhap; 
EXEC XemPhieuNhap @MaPN = 1; 
EXEC XemPhieuNhap @MaNCC = 1, @TuNgay = '2024-07-01', @DenNgay = '2024-07-31'; 
--Functions
GO
CREATE FUNCTION TinhTongTienPhieuNhap (@MaPN INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TongTien DECIMAL(18,2);
    SELECT @TongTien = SUM(SOLUONG * DONGIA)
    FROM CHITIETPHIEUNHAP
    WHERE MAPN = @MaPN;
    RETURN @TongTien;
END;
SELECT dbo.TinhTongTienPhieuNhap(1);
--Triggers
CREATE TRIGGER trg_CapNhatSoLuongTonKho
ON CHITIETPHIEUNHAP
AFTER INSERT
AS
BEGIN
    UPDATE SANPHAM
    SET SOLUONGTON = SOLUONGTON + (SELECT i.SOLUONG FROM inserted i WHERE i.MASP = SANPHAM.MASP)
    WHERE MASP IN (SELECT MASP FROM inserted);
END;
--cursor
DECLARE cursor_chi_tiet CURSOR FOR
SELECT MASP, SOLUONG, DONGIA
FROM CHITIETPHIEUNHAP
WHERE MAPN = @MaPN; 
OPEN cursor_chi_tiet;
FETCH NEXT FROM cursor_chi_tiet INTO @MASP, @SoLuong, @DonGia;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Xử lý dữ liệu của từng chi tiết phiếu nhập
    -- In thông tin chi tiết phiếu nhập
    PRINT N'Mã SP: ' + @MASP + N', Số lượng: ' + CAST(@SoLuong AS NVARCHAR(10)) + N', Đơn giá: ' + CAST(@DonGia AS NVARCHAR(20));
    FETCH NEXT FROM cursor_chi_tiet INTO @MASP, @SoLuong, @DonGia;
END;
CLOSE cursor_chi_tiet;
DEALLOCATE cursor_chi_tiet;
-- View
CREATE VIEW v_PhieuNhap AS
SELECT pn.MAPN, nv.TENNV AS TenNhanVien, ncc.TENNCC AS TenNhaCungCap, pn.NGAYNHAP, pn.TONGTIENPN
FROM PHIEUNHAP pn
JOIN NHANVIEN nv ON pn.MANV = nv.MANV
JOIN NHACUNGCAP ncc ON pn.MANCC = ncc.MANCC;
SELECT * FROM v_PhieuNhap; 
SELECT MAPN, TenNhanVien FROM v_PhieuNhap WHERE NGAYNHAP >= '2024-07-01'; 

--CHITIETPHIEUNHAP
--Procedures
CREATE PROCEDURE XemChiTietPhieuNhap (@MaPN INT)
AS
BEGIN
    SELECT ct.MASP, sp.TENSP, ct.SOLUONG, ct.DONGIA
    FROM CHITIETPHIEUNHAP ct
    JOIN SANPHAM sp ON ct.MASP = sp.MASP
    WHERE ct.MAPN = @MaPN;
END;
EXEC XemChiTietPhieuNhap @MaPN = 1;
-- View
CREATE VIEW v_ChiTietPhieuNhap AS
SELECT ct.MAPN, ct.MASP, sp.TENSP AS TenSanPham, ct.SOLUONG, ct.DONGIA
FROM CHITIETPHIEUNHAP ct
JOIN SANPHAM sp ON ct.MASP = sp.MASP;
SELECT * FROM v_ChiTietPhieuNhap;
SELECT TenSanPham, SOLUONG FROM v_ChiTietPhieuNhap WHERE MAPN = 1;

---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-- Bảng KHACHHANG
-- Procedure: Thêm khách hàng mới
CREATE PROCEDURE ThemKhachHang (@MaKH VARCHAR(10), @TenKH NVARCHAR(50), @GioiTinh NVARCHAR(10), @SDT VARCHAR(12))
AS
BEGIN
    -- Kiểm tra mã khách hàng đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM KHACHHANG WHERE MAKH = @MaKH)
    BEGIN
        PRINT N'Mã khách hàng đã tồn tại!';
        RETURN;
    END

    -- Thêm khách hàng mới
    INSERT INTO KHACHHANG (MAKH, TENKH, GIOITINH, SDT)
    VALUES (@MaKH, @TenKH, @GioiTinh, @SDT);
END;

-- Function: Kiểm tra số điện thoại đã tồn tại chưa
CREATE FUNCTION KiemTraSDTTonTai (@SDT VARCHAR(12))
RETURNS BIT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM KHACHHANG WHERE SDT = @SDT)
        RETURN 1;  -- Số điện thoại đã tồn tại
    RETURN 0;  -- Số điện thoại chưa tồn tại
END;

-- Bảng NHANVIEN
-- Procedure: Cập nhật thông tin nhân viên
CREATE PROCEDURE CapNhatNhanVien (@MaNV VARCHAR(10), @TenNV NVARCHAR(100), @MatKhau VARCHAR(100), @ChucVu NVARCHAR(50), @SoDienThoai VARCHAR(12))
AS
BEGIN
    -- Kiểm tra nhân viên có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM NHANVIEN WHERE MANV = @MaNV)
    BEGIN
        PRINT N'Nhân viên không tồn tại!';
        RETURN;
    END

    UPDATE NHANVIEN
    SET TENNV = @TenNV, MATKHAU = @MatKhau, CHUCVU = @ChucVu, SODIENTHOAI = @SoDienThoai
    WHERE MANV = @MaNV;
END;

-- Function: Lấy chức vụ của nhân viên
CREATE FUNCTION LayChucVuNhanVien (@MaNV VARCHAR(10))
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @ChucVu NVARCHAR(50);
    SELECT @ChucVu = CHUCVU FROM NHANVIEN WHERE MANV = @MaNV;
    RETURN @ChucVu;
END;

-- Bảng KHUYENMAI
-- Procedure: Xóa khuyến mãi
CREATE PROCEDURE XoaKhuyenMai (@MaKM VARCHAR(10))
AS
BEGIN
    -- Kiểm tra khuyến mãi có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM KHUYENMAI WHERE MAKM = @MaKM)
    BEGIN
        PRINT N'Khuyến mãi không tồn tại!';
        RETURN;
    END
	-- Kiểm tra khuyến mãi có trong hoá đơn nào không
	IF EXISTS (SELECT 1 FROM HOADON WHERE MAKM = @MaKM)
    BEGIN
        PRINT N'Không thể xoá khuyến mãi vì đang được sử dụng!';
        RETURN;
    END

    DELETE FROM KHUYENMAI WHERE MAKM = @MaKM;
END;
-- Function: Kiểm tra khuyến mãi còn hiệu lực
CREATE FUNCTION KHUYENMAI_ConHieuLuc (@MaKM VARCHAR(10))
RETURNS BIT
AS
BEGIN
	--Thêm cột NGAYBD và NGAYKT trong bảng KHUYENMAI để so sánh ngày.
    IF EXISTS (SELECT 1 FROM KHUYENMAI WHERE MAKM = @MaKM AND GETDATE() BETWEEN NGAYBD AND NGAYKT)
        RETURN 1;  -- Khuyến mãi còn hiệu lực
    RETURN 0;  -- Khuyến mãi hết hiệu lực
END;

-- Bảng HOADON
-- Procedure: Xem danh sách hoá đơn
CREATE PROCEDURE XemHoaDon
AS
BEGIN
    SELECT * FROM HOADON;
END;
-- Function: Tính tổng tiền của tất cả hoá đơn
CREATE FUNCTION TongTienHoaDon()
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @TongTien DECIMAL(18,2);
    SELECT @TongTien = SUM(TONGTIENHD) FROM HOADON;
    RETURN @TongTien;
END;