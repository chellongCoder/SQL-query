CREATE TABLE NHANVIEN(
	MANV VARCHAR(10) NOT NULL,
	HoTen NVARCHAR(50),
	GT NVARCHAR(3),
	NS DATE,
	QQ NVARCHAR(50),
	DT VARCHAR(20),
	MAPB VARCHAR(10),
)
DROP TABLE NHANVIEN

ALTER TABLE NHANVIEN
ALTER COLUMN MANV VARCHAR(10)

ALTER TABLE NHANVIEN
ADD CONSTRAINT PRIMARY_KEY_NV 
PRIMARY KEY (MANV)

ALTER TABLE NHANVIEN
DROP CONSTRAINT KHOACHINH_NV

ALTER TABLE NHANVIEN
ADD CONSTRAINT CHECK_GIOITINH
CHECK (GT IN (N'NAM' , N'NU'))

ALTER TABLE NHANVIEN
ADD CONSTRAINT CHECK_NGAYSINH
CHECK (NS<GETDATE())

ALTER TABLE NHANVIEN
ADD CONSTRAINT FOREIGN_KEY 
FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)

CREATE TABLE PHONGBAN (
	MAPB VARCHAR(10) PRIMARY KEY NOT NULL,
	TENPB NVARCHAR(50),
	DienThoai VARCHAR(20)
)
DROP TABLE PHONGBAN

CREATE TABLE CHUCVU (
	MACV VARCHAR(10) NOT NULL PRIMARY KEY,
	TENCV NVARCHAR(50),
	HSPC FLOAT,
	CONSTRAINT CHECK_HSPC CHECK (HSPC BETWEEN 0.4 AND 1.2)
)
ALTER TABLE CHUCVU 
ADD CONSTRAINT CHECK_TENCV 
CHECK (TENCV IN (N'GD', N'PGD', N'TP', N'PP', N'NV')) 

CREATE TABLE BACLUONG(
	MABL VARCHAR(10) NOT NULL PRIMARY KEY,
	HSL FLOAT, 
	HSPC FLOAT,
	CONSTRAINT CHECK_LUONG CHECK((HSPC BETWEEN 0.4 AND 1.2) AND (HSL BETWEEN 2.54 AND 12)),
)

ALTER TABLE BACLUONG 
ADD DEFAULT 2.54 FOR HSL

CREATE TABLE DC_PB (
	MAPB VARCHAR(10) NOT NULL PRIMARY KEY,
	DIACHI NVARCHAR(100),
)

CREATE TABLE NV_CHUCVU (
	MANV VARCHAR(10),
	MACV VARCHAR(10),
	NGAY_QD DATE,
	CONSTRAINT PRIMARY_KEY_MANV_MACV PRIMARY KEY (MANV, MACV),
)