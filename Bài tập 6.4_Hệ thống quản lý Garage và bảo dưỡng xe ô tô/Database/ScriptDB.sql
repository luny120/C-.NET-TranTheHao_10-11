IF DB_ID(N'GarageDB') IS NULL CREATE DATABASE GarageDB;
GO
USE GarageDB;
GO
IF OBJECT_ID('dbo.KhachHang','U') IS NULL CREATE TABLE KhachHang(MaKH int IDENTITY PRIMARY KEY,TenKH nvarchar(100) NOT NULL,DienThoai varchar(15) UNIQUE,DiaChi nvarchar(200));
IF OBJECT_ID('dbo.Xe','U') IS NULL CREATE TABLE Xe(BienSo varchar(20) PRIMARY KEY,MaKH int NOT NULL REFERENCES KhachHang(MaKH),HieuXe nvarchar(50),NamSanXuat int);
IF OBJECT_ID('dbo.PhuTung','U') IS NULL CREATE TABLE PhuTung(MaPhuTung int IDENTITY PRIMARY KEY,TenPhuTung nvarchar(150) NOT NULL,DonGia decimal(18,2) NOT NULL CHECK(DonGia>=0),SoLuongTon int NOT NULL CHECK(SoLuongTon>=0));
IF OBJECT_ID('dbo.PhieuSuaChua','U') IS NULL CREATE TABLE PhieuSuaChua(MaPhieu int IDENTITY PRIMARY KEY,BienSo varchar(20) NOT NULL REFERENCES Xe(BienSo),NgayNhan datetime NOT NULL DEFAULT GETDATE(),NoiDungSua nvarchar(max),TongTien decimal(18,2) NOT NULL DEFAULT 0,TrangThai nvarchar(30) NOT NULL DEFAULT N'Đang sửa');
IF OBJECT_ID('dbo.ChiTietSuaChua','U') IS NULL CREATE TABLE ChiTietSuaChua(MaPhieu int NOT NULL REFERENCES PhieuSuaChua(MaPhieu),MaPhuTung int NOT NULL REFERENCES PhuTung(MaPhuTung),SoLuong int NOT NULL CHECK(SoLuong>0),TienCong decimal(18,2) NOT NULL DEFAULT 0,DonGia decimal(18,2) NOT NULL,PRIMARY KEY(MaPhieu,MaPhuTung));
IF NOT EXISTS(SELECT 1 FROM KhachHang) INSERT KhachHang(TenKH,DienThoai,DiaChi) VALUES(N'Nguyễn Văn An','0901000001',N'Hà Nội'),(N'Trần Minh Bình','0901000002',N'Hải Phòng');
IF NOT EXISTS(SELECT 1 FROM Xe) INSERT Xe(BienSo,MaKH,HieuXe,NamSanXuat) VALUES('30A-12345',1,N'Toyota',2020),('15A-67890',2,N'Honda',2019);
IF NOT EXISTS(SELECT 1 FROM PhuTung) INSERT PhuTung(TenPhuTung,DonGia,SoLuongTon) VALUES(N'Lọc dầu',250000,20),(N'Bugi',180000,30),(N'Dầu động cơ',450000,15);
GO