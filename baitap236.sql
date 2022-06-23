CREATE DATABASE TicketFilm;
create table tblPhim(
PhimID int primary key,
Ten_phim varchar(30),
Loai_Phim varchar(25),
Thoi_gian int(4)
);


create table Phong(
PhongID int primary key,
Tenphong varchar(40),
Trangthai tinyint
);

create table TblGhe(
GheID int primary key,
PhongID int,
foreign key (PhongID) references Phong(PhongID),
So_ghe varchar(20)
);

create table tblVe(
PhimID int,
foreign key (PhimID) references tblPhim(PhimID),
GheID int,
foreign key (GheID) references tblGhe(GheID),
Ngay_chieu date,
Trang_thai varchar(20),
primary key(PhimID,GheID)
);

drop table tblVe;
drop table tblGhe;

-- 2 Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian)
select * from tblphim order by Thoi_gian;

-- 3 Hiển thị Ten_phim có thời gian chiếu dài nhất
select * from tblphim where Thoi_gian=(select Max(thoi_gian) from tblphim);

-- 4 Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select * from tblphim where Thoi_gian=(select Min(thoi_gian) from tblphim);

-- 5 Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select * from tblghe where So_ghe like 'a%';

-- 6 Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)
alter table Phong
change column Trangthai status nvarchar(25); 

-- 7 Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật
select * from phong;
-- 8 Hiển thị danh sách tên phim mà  có độ dài >15 và < 25 ký tự 
select * from tblPhim
where length(tblPhim.Ten_phim) > 15 and length(tblPhim.Ten_phim) <25;

-- 9 Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong  trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
select concat(Tenphong,'/', status) as `Trang thai phong chieu` from Phong ;

-- 10 Tạo bảng mới có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
create table tblRank(
STT int primary key,
tenphim varchar(255),
Thoi_gian time
);

-- 11 
alter table tblPhim add Mota nvarchar(40);
update tblphim set Mota = concat('đây là loại bộ phim thể loại ',tblphim.loai_phim ) where PhimID > 0;

 -- 12Xóa tất cả các khóa ngoại trong các bảng trên.						
ALTER TABLE ghe 
DROP foreign key fk_1;
ALTER TABLE ve 
DROP foreign key fk_2,
DROP foreign key fk_3;

-- 13 Xóa dữ liệu ở bảng tblGhe
delete from ghe; 

#14.Hiển thị ngày giờ hiện tại và ngày giờ hiện tại cộng thêm 5000 phút

select now() from phim where phimID = 1;

select ADDTIME( 50000, now()) from tblphim where phimID = 1;
