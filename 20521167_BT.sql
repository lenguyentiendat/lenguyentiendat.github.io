﻿---- MSSV: 20521384
---- Họ và tên: Hoàng Đình Hữu
---- Tạo Database
USE QLBH
CREATE TABLE KHACHHANG
(
	MAKH char(4) PRIMARY KEY, --Mã khách hàng
	HOTEN varchar(40), --Họ tên
	DCHI varchar(50), --Địa chỉ
	SODT varchar(20), --Số điện thoại 
	NGSINH smalldatetime, --Ngày sinh
	DOANHSO money, --Tổng trị giá các hóa đơn khách hàng đã mua
	NGDK smalldatetime --Ngày đăng ký thành viên
)
CREATE TABLE NHANVIEN
(
	MANV char(4) PRIMARY KEY, --Mã nhân viên
	HOTEN varchar(40), --Họ tên
	SODT varchar(20), --Số điện thoại
	NGVL smalldatetime --Ngày vào làm
)
CREATE TABLE SANPHAM
(
	MASP char(4) PRIMARY KEY, --Mã sản phẩm
	TENSP varchar(40), --Tên sản phẩm
	DVT varchar(20), --Đơn vị tính
	NUOCSX varchar(40), --Nước sản xuất
	GIA money --Giá bán
)
CREATE TABLE HOADON
(
	SOHD int PRIMARY KEY, --Số hóa đơn
	NGHD smalldatetime, --Ngày mua hàng
	MAKH char(4) FOREIGN KEY REFERENCES KHACHHANG(MAKH), --Mã khách hàng nào mua
	MANV char(4) FOREIGN KEY REFERENCES NHANVIEN(MANV), --Nhân viên bán hàng
	TRIGIA money --Trị giá hóa đơn
)
CREATE TABLE CTHD
(
	SOHD int  FOREIGN KEY REFERENCES HOADON(SOHD), --Số hóa đơn
    MASP char(4)  FOREIGN KEY REFERENCES SANPHAM(MASP), --Mã sản phẩm
	SL int , --Số lượng
	PRIMARY KEY(SOHD,MASP)
)
-- Watch date time
--USE MASTER
--DROP DATABASE QLBH
--SELECT CURRENT_TIMESTAMP
-- FORMAT DATE TIME
SET DATEFORMAT DMY;
SELECT * FROM KHACHHANG
INSERT INTO KHACHHANG VALUES('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960',13060000,'22/07/2006')												
INSERT INTO KHACHHANG VALUES('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','3/4/1974',280000,'30/07/2006')														
INSERT INTO KHACHHANG VALUES('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/6/1980',3860000,'05/08/2006')														
INSERT INTO KHACHHANG VALUES('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','9/3/1965',250000,'02/10/2006')														
INSERT INTO KHACHHANG VALUES('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/3/1950',21000,'28/10/2006')														
INSERT INTO KHACHHANG VALUES('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981',915000,'24/11/2006')														
INSERT INTO KHACHHANG VALUES('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','6/4/1971',12500,'01/12/2006')														
INSERT INTO KHACHHANG VALUES('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/1/1971',365000,'13/12/2006')														
INSERT INTO KHACHHANG VALUES('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','3/9/1979',70000,'14/01/2007')														
INSERT INTO KHACHHANG VALUES('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','2/5/1983',67500,'16/01/2007')														

SELECT * FROM NHANVIEN;
INSERT INTO NHANVIEN VALUES('NV01','Nguyen Nhu Nhut','927345678','13/4/2006')
INSERT INTO NHANVIEN VALUES('NV02','Le Thi Phi Yen','987567390','21/4/2006')
INSERT INTO NHANVIEN VALUES('NV03','Nguyen Van B','997047382','27/4/2006')
INSERT INTO NHANVIEN VALUES('NV04','Ngo Thanh Tuan','913758498','24/6/2006')
INSERT INTO NHANVIEN VALUES('NV05','Nguyen Thi Truc Thanh','918590387','20/7/2006')

SELECT * FROM SANPHAM;
INSERT INTO SANPHAM VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO SANPHAM VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO SANPHAM VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO SANPHAM VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO SANPHAM VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO SANPHAM VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO SANPHAM VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SANPHAM VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SANPHAM VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SANPHAM VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SANPHAM VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SANPHAM VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SANPHAM VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SANPHAM VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO SANPHAM VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SANPHAM VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SANPHAM VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO SANPHAM VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SANPHAM VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO SANPHAM VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO SANPHAM VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO SANPHAM VALUES('ST10','But long','cay','Trung Quoc',7000)

SELECT * FROM HOADON;
INSERT INTO HOADON VALUES(1001,'23/07/2006','KH01','NV01',320000)
INSERT INTO HOADON VALUES(1002,'12/08/2006','KH01','NV02',840000)
INSERT INTO HOADON VALUES(1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO HOADON VALUES(1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO HOADON VALUES(1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO HOADON VALUES(1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO HOADON VALUES(1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO HOADON VALUES(1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO HOADON VALUES(1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO HOADON VALUES(1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO HOADON VALUES(1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO HOADON VALUES(1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO HOADON VALUES(1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO HOADON VALUES(1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO HOADON VALUES(1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO HOADON VALUES(1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO HOADON VALUES(1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO HOADON VALUES(1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO HOADON VALUES(1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO HOADON VALUES(1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO HOADON VALUES(1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO HOADON VALUES(1022,'16/01/2007',Null,'NV03',7000)
INSERT INTO HOADON VALUES(1023,'17/01/2007',Null,'NV01',330000)

SELECT * FROM CTHD;
INSERT INTO CTHD VALUES(1001,'TV02',10)
INSERT INTO CTHD VALUES(1001,'ST01',5)
INSERT INTO CTHD VALUES(1001,'BC01',5)
INSERT INTO CTHD VALUES(1001,'BC02',10)
INSERT INTO CTHD VALUES(1001,'ST08',10)
INSERT INTO CTHD VALUES(1002,'BC04',20)
INSERT INTO CTHD VALUES(1002,'BB01',20)
INSERT INTO CTHD VALUES(1002,'BB02',20)
INSERT INTO CTHD VALUES(1003,'BB03',10)
INSERT INTO CTHD VALUES(1004,'TV01',20)
INSERT INTO CTHD VALUES(1004,'TV02',10)
INSERT INTO CTHD VALUES(1004,'TV03',10)
INSERT INTO CTHD VALUES(1004,'TV04',10)
INSERT INTO CTHD VALUES(1005,'TV05',50)
INSERT INTO CTHD VALUES(1005,'TV06',50)
INSERT INTO CTHD VALUES(1006,'TV07',20)

SELECT * FROM CTHD;
INSERT INTO CTHD VALUES(1006,'ST01',30)
INSERT INTO CTHD VALUES(1006,'ST02',10)
INSERT INTO CTHD VALUES(1007,'ST03',10)
INSERT INTO CTHD VALUES(1008,'ST04',8)
INSERT INTO CTHD VALUES(1009,'ST05',10)
INSERT INTO CTHD VALUES(1010,'TV07',50)
INSERT INTO CTHD VALUES(1010,'ST07',50)
INSERT INTO CTHD VALUES(1010,'ST08',100)
INSERT INTO CTHD VALUES(1010,'ST04',50)
INSERT INTO CTHD VALUES(1010,'TV03',100)
INSERT INTO CTHD VALUES(1011,'ST06',50)
INSERT INTO CTHD VALUES(1012,'ST07',3)
INSERT INTO CTHD VALUES(1013,'ST08',5)
INSERT INTO CTHD VALUES(1014,'BC02',80)
INSERT INTO CTHD VALUES(1014,'BB02',100)
INSERT INTO CTHD VALUES(1014,'BC04',60)

INSERT INTO CTHD VALUES(1014,'BB01',50)
INSERT INTO CTHD VALUES(1015,'BB02',30)
INSERT INTO CTHD VALUES(1015,'BB03',7)
INSERT INTO CTHD VALUES(1016,'TV01',5)
INSERT INTO CTHD VALUES(1017,'TV02',1)
INSERT INTO CTHD VALUES(1017,'TV03',1)
INSERT INTO CTHD VALUES(1017,'TV04',5)
INSERT INTO CTHD VALUES(1018,'ST04',6)
INSERT INTO CTHD VALUES(1019,'ST05',1)
INSERT INTO CTHD VALUES(1019,'ST06',2)
INSERT INTO CTHD VALUES(1020,'ST07',10)
INSERT INTO CTHD VALUES(1021,'ST08',5)
INSERT INTO CTHD VALUES(1021,'TV01',7)
INSERT INTO CTHD VALUES(1021,'TV02',10)
INSERT INTO CTHD VALUES(1022,'ST07',1)
INSERT INTO CTHD VALUES(1023,'ST04',6)
-- 2.	Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM ADD GHICHU varchar(20);
--3.	Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG ADD LOAIKH tinyint;
--4.	Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100);
--5.	Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM DROP COLUMN GHICHU;
--6.	Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH varchar(100)
--7.	Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM
ADD CONSTRAINT CHT_DTV CHECK (DVT IN('cay' , 'hop' , 'cai' , 'quyen', 'chuc'));
--8.	Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM
ADD CONSTRAINT CHT_GIA CHECK (GIA>=500)
--9.	Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
--ALTER TABLE 
--10.	Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG 
ADD CONSTRAINT CHT_NGDK CHECK (NGDK>NGSINH)

-----------------------
--In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX='Trung Quoc'
--In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP,TENSP
FROM SANPHAM
WHERE DVT IN('cay','quyen')
--In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE	MASP LIKE 'B%01'
--In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX='Trung Quoc' AND (GIA BETWEEN 30000 AND 40000)
--In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP, GIA
FROM SANPHAM
WHERE  NUOCSX IN('Trung Quoc','Thai Lan') AND (GIA BETWEEN 30000 AND 40000)
--In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD,TRIGIA,NGHD
FROM HOADON
WHERE NGHD BETWEEN '1/1/2007' AND '2/1/2007' 
--In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD,TRIGIA,NGHD
FROM HOADON
WHERE MONTH(NGHD)= 1 AND YEAR(NGHD)= 2007
ORDER BY NGHD ASC, TRIGIA DESC
--In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT KH.MAKH, KH.HOTEN,HD.NGHD
FROM KHACHHANG KH INNER JOIN HOADON HD ON KH.MAKH=HD.MAKH
WHERE HD.NGHD='1/1/2007'
--In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT HD.SOHD, HD.TRIGIA, NV.HOTEN, HD.NGHD
FROM HOADON HD INNER JOIN NHANVIEN NV ON NV.MANV=HD.MANV
WHERE NV.HOTEN='NGUYEN VAN B' AND HD.NGHD='28/10/2006'
--In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP JOIN CTHD CT ON SP.MASP= CT.MASP
				 JOIN HOADON HD ON CT.SOHD= HD.SOHD
				 JOIN KHACHHANG KH ON KH.MAKH= HD.MAKH
WHERE KH.HOTEN='NGUYEN VAN A' AND (MONTH(NGHD)=10 AND YEAR(NGHD)=2006)
--Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT CT.SOHD,CT.MASP
FROM CTHD CT
WHERE CT.MASP IN('BB01' , 'BB02')
--SPECIAL- UNION PHEP HOP
(SELECT SOHD FROM CTHD WHERE MASP='BB01')
UNION
(SELECT SOHD FROM CTHD WHERE MASP='BB02')
--SPECIAL- INTERSECT PHEP GIAO
(SELECT SOHD FROM CTHD WHERE MASP='BB01')
INTERSECT
(SELECT SOHD FROM CTHD WHERE MASP='BB02')
--SPECIAL- EXCEPT PHEP HIEU
(SELECT SOHD FROM CTHD WHERE MASP='BB01')
EXCEPT
(SELECT SOHD FROM CTHD WHERE MASP='BB02')
--use master 
--DROP DATABASE QLBH
--	DROP TABLE CTHD
--	DROP TABLE HOADON
--	DROP TABLE KHACHHANG
-- DROP TABLE NHANVIEN 
-- ADD
	--INSERT INTO KHACHHANG VALUES('KH01','NGUYEN VAN A','XXX STREET,DISTRICT,PROVINCE','DD/MM/YYYY','012345623')
-- Watch date time
	--SELECT CURRENT_TIMESTAMP
-- FORMAT DATE TIME
	--SET DATEFORMAT DMY;
-- TRUY VAN DU LIEU
	--SELECT * FROM KHACHHANG;
SELECT SOHD, Count(MASP)
FROM CTHD
GROUP BY SOHD
HAVING Count(MASP)>=3
-- 12. Tim so hoa don da mua sp co ma BB01 HOAC BB02, moi sp mua tu so luong 10-20
SELECT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20
--13.Tim so hoa don da mua sp co ma BB01 Va BB02, moi sp mua tu so luong 10-20
SELECT SOHD
FROM CTHD A
WHERE A.MASP = 'BB01' AND SL BETWEEN 10 AND 20
AND EXISTS(SELECT *
FROM CTHD B
WHERE B.MASP = 'BB02' AND SL BETWEEN 10 AND 20 AND A.SOHD = B.SOHD)
-- 14.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
WHERE NUOCSX = 'TRUNG QUOC' AND C.SOHD IN(SELECT DISTINCT C2.SOHD FROM CTHD C2 INNER JOIN HOADON H ON C2.SOHD = H.SOHD WHERE NGHD ='1/1/2007')

--15. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NOT EXISTS(SELECT * 
FROM SANPHAM S2 INNER JOIN CTHD C
ON S2.MASP = C.MASP
AND S2.MASP = S.MASP)
--16.In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)
-- 17.In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)
--17.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE NUOCSX = 'TRUNG QUOC' AND S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)
--18.Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
-- tập hợp các hoá đơn mà không có sản phẩm nào do SGP sản xuất mà hoá đơn đó không mua
SELECT H.SOHD 
FROM HOADON H
WHERE NOT EXISTS(                  --> chọn ra những hóa đơn   nào mà ko chứa  những sản phẩm  không nằm trong tất cả sp được bán dựa trên hóa đơn 
		SELECT * FROM 
		SANPHAM S
		WHERE NUOCSX = 'SINGAPORE' AND NOT EXISTS(--> thêm ĐK singapore là nước sx và chọn ra những hóa đơn không nằm  trong các sản phẩm có trong chi tiết hóa đơn dựa trên hóa đơn
									SELECT *													
									FROM CTHD C		--> Tất cả các sản phẩm có trong chi tiết hóa đơn dựa trên hóa đơn.
									WHERE C.SOHD = H.SOHD AND C.MASP = S.MASP))    


SELECT DISTINCT CT.SOHD 
FROM CTHD CT
WHERE NOT EXISTS(SELECT * 
						FROM SANPHAM S
						WHERE NUOCSX = 'SINGAPORE' AND NOT EXISTS(SELECT * 
																FROM CTHD C
																WHERE C.SOHD = CT.SOHD AND C.MASP = S.MASP))
--19.Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
SELECT H.SOHD 
FROM HOADON H
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(
	SELECT * 
	FROM SANPHAM S
	WHERE NUOCSX = 'SINGAPORE' AND NOT EXISTS(
		SELECT * 
		FROM CTHD C
		WHERE C.SOHD = H.SOHD AND C.MASP = S.MASP))


--Bước 1: TẬP HỢP CÁC SỐ HOÁ ĐƠN MUA TẤT CẢ SẢN PHẨM DO SINGAPORE SẢN XUẤT TRONG NĂM 2006
/*CREATE VIEW HD_MUA_ALL
AS
   SELECT HD.SOHD 
    FROM HOADON HD
    WHERE YEAR(NGHD) = 2006 AND NOT EXISTS
    (
        SELECT *
        FROM SANPHAM SP
        WHERE NUOCSX = 'Singapore' AND NOT EXISTS
        (
            SELECT * 
            FROM CTHD CT
            WHERE CT.SOHD = HD.SOHD AND CT.MASP = SP.MASP
        )
    )
--Bước 2: TỪ KẾT QUẢ TẬP HỢP CÁC SOHD CỦA B1 => COUNT SỐ LƯỢNG MASP CỦA TỪNG SOHD
CREATE VIEW B2 
AS
    SELECT B1.SOHD, COUNT(CT.MASP) AS SL_LOAIMASP
    FROM HD_MUA_ALL B1 JOIN CTHD CT ON B1.SOHD = CT.SOHD
    GROUP BY B1.SOHD
--Bước 3: TÌM SOHD Ở B2 MÀ CÓ COUNT(MASP) ÍT NHẤT (MIN) => IN RA => KẾT QUẢ
SELECT B2.SOHD,SL_LOAIMASP
FROM B2
WHERE SL_LOAIMASP = SELECT SL_LOAIMASP FROM B2   */

--20.Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM HOADON H
WHERE MAKH NOT IN(SELECT MAKH
FROM KHACHHANG K 
WHERE K.MAKH = H.MAKH)

SELECT COUNT(TEMP.SOHD) AS SL_KHACH_VANG_LAI
FROM ( SELECT HD2.SOHD
		FROM HOADON HD2
		WHERE HD2.MAKH IS NULL ) AS TEMP 

--21.Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP) AS SL_SP_BAN_NAM_2006
FROM CTHD C INNER JOIN HOADON HD ON C.SOHD = HD.SOHD
WHERE YEAR(NGHD) = 2006
--22.Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) AS HOA_DON_CAO_NHAT, MIN(TRIGIA) AS HOA_DON_THAP_NHAT
FROM HOADON
--23.Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS TRI_GIA_TRUNG_BINH_2006
FROM HOADON
WHERE YEAR(NGHD)=2006
--24.Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DOANH_THU_2006
FROM HOADON
WHERE YEAR(NGHD)=2006
--25.Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT MAX(TRIGIA) AS HOA_DON_TRI_GIA_CAO_NHAT_2006
FROM HOADON
WHERE  YEAR(NGHD)=2006

SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON) AND YEAR(NGHD)=2006
--26.Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT KH.HOTEN,HD.SOHD,HD.TRIGIA
FROM HOADON HD INNER JOIN KHACHHANG KH ON HD.MAKH=KH.MAKH
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON) AND YEAR(NGHD)=2006
--27.In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC

SELECT *
FROM  KHACHHANG
WHERE DOANHSO IN(SELECT TOP 3 DOANHSO
			FROM   KHACHHANG
    ORDER BY  DOANHSO DESC)
--28.In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.

SELECT MASP, TENSP,GIA
FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA
			  FROM SANPHAM
			  ORDER BY GIA DESC)
--29.In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP, GIA
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT DISTINCT TOP 3 GIA
										FROM SANPHAM
										ORDER BY GIA DESC)
--30.In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP,GIA 
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT DISTINCT TOP 3 GIA
										FROM SANPHAM
										WHERE NUOCSX = 'TRUNG QUOC'
										ORDER BY GIA DESC)

--use master
--DROP database QLBH










