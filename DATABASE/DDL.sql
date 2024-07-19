create table book_tbl_06(
book_no number primary key, --도서번호
book_name varchar2(50) not null, --도서명
book_coverimg varchar2(20), --표지
book_date date, --출판일자
book_price number, --금액
book_publisher varchar2(50), --출판사
book_info varchar2(2000)  --도서소개
);

insert into book_tbl_06(
                        book_no, --도서번호
                        book_name, --도서명
                        book_coverimg, --표지
                        book_date, --출판일자
                        book_price, --금액
                        book_publisher, --출판사
                        book_info)  --도서소개
values(
           100,'리눅스','100.jpg','2015-09-02',24000,'나룩스','운영체제, DB기초, 네트워크기초, 개발환경구축');
           
insert into book_tbl_06(
                        book_no, --도서번호
                        book_name, --도서명
                        book_coverimg, --표지
                        book_date, --출판일자
                        book_price, --금액
                        book_publisher, --출판사
                        book_info)  --도서소개
values(
           101,'자바','101.jpg','2016-01-10',20000,'이자바','프로그래밍 언어');
           
           insert into book_tbl_06(
                        book_no, --도서번호
                        book_name, --도서명
                        book_coverimg, --표지
                        book_date, --출판일자
                        book_price, --금액
                        book_publisher, --출판사
                        book_info)  --도서소개
values(
           102,'자바웹프로그래밍','102.jpg','2016-10-30',25000,'김프로','개발환경/서버프로그램/배치프로그램');
           
           insert into book_tbl_06(
                        book_no, --도서번호
                        book_name, --도서명
                        book_coverimg, --표지
                        book_date, --출판일자
                        book_price, --금액
                        book_publisher, --출판사
                        book_info)  --도서소개
values(
           103,'오픈소스활용하기','103.jpg','2017-09-01',30000,'박오픈','형상관리, 빌드, 배포');
           
           insert into book_tbl_06(
                        book_no, --도서번호
                        book_name, --도서명
                        book_coverimg, --표지
                        book_date, --출판일자
                        book_price, --금액
                        book_publisher, --출판사
                        book_info)  --도서소개
values(
           104,'HTML','104.jpg','2018-04-04',10000,'홍길동','HTML/CSS/JAVASCRIPT/JQUERY');
           
select * from book_tbl_06;

create table rent_tbl_06(
rent_no number primary key, --대여버호
book_no number not null, --도서번호
rent_price number  not null, --대여금액
rent_date date  not null, --대여일자
rent_status char(1)  default 0 not null  --반납여부
);

insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10001,100,2400,'2018-07-02','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10002,101,2000,'2018-07-04','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10003,100,2400,'2018-08-02','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10004,100,2400,'2018-08-12','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10005,102,2500,'2018-08-13','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10006,103,3000,'2018-08-13','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10007,103,3000,'2018-08-20','0');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10008,100,2400,'2018-09-03','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10009,100,2400,'2018-09-08','1');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10010,100,2400,'2018-09-14','0');
insert into rent_tbl_06(rent_no, book_no, rent_price, rent_date, rent_status) 
values(10011,102,2500,'2018-09-14','0');   
           
select * from  rent_tbl_06;
select r.book_no,b.book_name,r.total, r.cnt
from (select book_no, SUM(rent_price) as total, count(book_no) as cnt
            from  rent_tbl_06
            group by book_no) r left join  book_tbl_06 b
            on r.book_no = b.book_no;

select r.book_no, b.book_name, r.rent_price, count(r.book_no)
from rent_tbl_06 r left join   book_tbl_06 b 
            on r.book_no = b.book_no;
            

select b.book_no, b.book_name, sum(r.rent_price) total
from book_tbl_06 b 
                        left join rent_tbl_06 r
on b.book_no = r.book_no
group by b.book_no;

