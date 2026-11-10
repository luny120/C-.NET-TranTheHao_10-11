IF DB_ID(N'ProjectTaskDB') IS NULL CREATE DATABASE ProjectTaskDB;
GO
USE ProjectTaskDB;
GO
IF OBJECT_ID('dbo.PhanCong','U') IS NULL CREATE TABLE dbo.PhanCong(MaTask INT NOT NULL,MaThanhVien INT NOT NULL,NgayGiao DATETIME NOT NULL CONSTRAINT DF_PhanCong_NgayGiao DEFAULT(GETDATE()),CONSTRAINT PK_PhanCong PRIMARY KEY(MaTask,MaThanhVien));
IF OBJECT_ID('dbo.CongViec','U') IS NULL CREATE TABLE dbo.CongViec(MaTask INT IDENTITY(1,1) PRIMARY KEY,MaDuAn INT NOT NULL,TenTask NVARCHAR(200) NOT NULL,MoTa NVARCHAR(MAX) NULL,HanNop DATETIME NULL,DoUuTien NVARCHAR(20) NOT NULL CONSTRAINT DF_CongViec_UuTien DEFAULT(N'Trung bình'),TrangThai NVARCHAR(50) NOT NULL CONSTRAINT DF_CongViec_TrangThai DEFAULT(N'To Do'));
IF OBJECT_ID('dbo.ThanhVien','U') IS NULL CREATE TABLE dbo.ThanhVien(MaThanhVien INT IDENTITY(1,1) PRIMARY KEY,HoTen NVARCHAR(100) NOT NULL,Email VARCHAR(100) NULL UNIQUE,ChuyenMon NVARCHAR(100) NULL);
IF OBJECT_ID('dbo.DuAn','U') IS NULL CREATE TABLE dbo.DuAn(MaDuAn INT IDENTITY(1,1) PRIMARY KEY,TenDuAn NVARCHAR(150) NOT NULL,NgayBatDau DATETIME NULL,NgayKetThuc DATETIME NULL,TrangThai NVARCHAR(50) NULL);
IF NOT EXISTS(SELECT 1 FROM sys.foreign_keys WHERE name='FK_CongViec_DuAn') ALTER TABLE dbo.CongViec ADD CONSTRAINT FK_CongViec_DuAn FOREIGN KEY(MaDuAn) REFERENCES dbo.DuAn(MaDuAn);
IF NOT EXISTS(SELECT 1 FROM sys.foreign_keys WHERE name='FK_PhanCong_CongViec') ALTER TABLE dbo.PhanCong ADD CONSTRAINT FK_PhanCong_CongViec FOREIGN KEY(MaTask) REFERENCES dbo.CongViec(MaTask) ON DELETE CASCADE;
IF NOT EXISTS(SELECT 1 FROM sys.foreign_keys WHERE name='FK_PhanCong_ThanhVien') ALTER TABLE dbo.PhanCong ADD CONSTRAINT FK_PhanCong_ThanhVien FOREIGN KEY(MaThanhVien) REFERENCES dbo.ThanhVien(MaThanhVien);
IF NOT EXISTS(SELECT 1 FROM dbo.DuAn) INSERT dbo.DuAn(TenDuAn,NgayBatDau,NgayKetThuc,TrangThai) VALUES(N'Xây dựng website bán hàng',GETDATE()-10,GETDATE()+30,N'Đang chạy'),(N'Ứng dụng quản lý nội bộ',GETDATE()-5,GETDATE()+45,N'Đang chạy');
IF NOT EXISTS(SELECT 1 FROM dbo.ThanhVien) INSERT dbo.ThanhVien(HoTen,Email,ChuyenMon) VALUES(N'Nguyễn Minh Anh','minhanh@example.com',N'Backend'),(N'Trần Hải Yến','haiyen@example.com',N'Frontend'),(N'Lê Quốc Bảo','quocbao@example.com',N'Testing');
IF NOT EXISTS(SELECT 1 FROM dbo.CongViec) BEGIN INSERT dbo.CongViec(MaDuAn,TenTask,MoTa,HanNop,DoUuTien,TrangThai) SELECT TOP 1 MaDuAn,N'Thiết kế cơ sở dữ liệu',N'Phân tích và thiết kế các bảng dữ liệu',GETDATE()-1,N'Cao',N'In Progress' FROM dbo.DuAn ORDER BY MaDuAn; INSERT dbo.CongViec(MaDuAn,TenTask,MoTa,HanNop,DoUuTien,TrangThai) SELECT TOP 1 MaDuAn,N'Xây dựng giao diện đăng nhập',N'Tạo giao diện đăng nhập và kiểm tra dữ liệu',GETDATE()+7,N'Trung bình',N'To Do' FROM dbo.DuAn ORDER BY MaDuAn; END;
IF NOT EXISTS(SELECT 1 FROM dbo.PhanCong) INSERT dbo.PhanCong(MaTask,MaThanhVien) SELECT TOP 1 t.MaTask,m.MaThanhVien FROM dbo.CongViec t CROSS JOIN dbo.ThanhVien m ORDER BY t.MaTask,m.MaThanhVien;
GO
