IF DB_ID(N'KaraokeDB') IS NULL CREATE DATABASE KaraokeDB;
GO
USE KaraokeDB;
GO
IF OBJECT_ID('dbo.PhongHat','U') IS NULL CREATE TABLE PhongHat(MaPhong int IDENTITY PRIMARY KEY,TenPhong nvarchar(50) NOT NULL,LoaiPhong nvarchar(30),GiaTheoGio decimal(18,2) NOT NULL CHECK(GiaTheoGio>=0),TrangThai nvarchar(20) NOT NULL DEFAULT N'Trống');
IF OBJECT_ID('dbo.DichVu','U') IS NULL CREATE TABLE DichVu(MaDV int IDENTITY PRIMARY KEY,TenDV nvarchar(100) NOT NULL,DonGia decimal(18,2) NOT NULL CHECK(DonGia>=0),TonKho int NOT NULL CHECK(TonKho>=0));
IF OBJECT_ID('dbo.HoaDon','U') IS NULL CREATE TABLE HoaDon(MaHD int IDENTITY PRIMARY KEY,MaPhong int NOT NULL REFERENCES PhongHat(MaPhong),GioVao datetime NOT NULL,GioRa datetime NULL,TongTienPhong decimal(18,2) NOT NULL DEFAULT 0,TongTienDichVu decimal(18,2) NOT NULL DEFAULT 0,TrangThai bit NOT NULL DEFAULT 0);
IF OBJECT_ID('dbo.ChiTietDichVu','U') IS NULL CREATE TABLE ChiTietDichVu(MaHD int NOT NULL REFERENCES HoaDon(MaHD),MaDV int NOT NULL REFERENCES DichVu(MaDV),SoLuong int NOT NULL CHECK(SoLuong>0),DonGia decimal(18,2) NOT NULL,PRIMARY KEY(MaHD,MaDV));
IF NOT EXISTS(SELECT 1 FROM PhongHat) INSERT PhongHat(TenPhong,LoaiPhong,GiaTheoGio) VALUES(N'Phòng VIP 01',N'VIP',250000),(N'Phòng VIP 02',N'VIP',250000),(N'Phòng Thường 01',N'Thường',150000),(N'Phòng Thường 02',N'Thường',150000),(N'Phòng Thường 03',N'Thường',150000);
IF NOT EXISTS(SELECT 1 FROM DichVu) INSERT DichVu(TenDV,DonGia,TonKho) VALUES(N'Nước suối',10000,100),(N'Coca Cola',15000,80),(N'Trái cây dĩa',80000,20),(N'Bia Heineken',25000,60);
GO