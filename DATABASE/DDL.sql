create table book_tbl_06(
book_no number primary key, --������ȣ
book_name varchar2(50) not null, --������
book_coverimg varchar2(20), --ǥ��
book_date date, --��������
book_price number, --�ݾ�
book_publisher varchar2(50), --���ǻ�
book_info varchar2(2000)  --�����Ұ�
);

insert into book_tbl_06(
                        book_no, --������ȣ
                        book_name, --������
                        book_coverimg, --ǥ��
                        book_date, --��������
                        book_price, --�ݾ�
                        book_publisher, --���ǻ�
                        book_info)  --�����Ұ�
values(
           100,'������','100.jpg','2015-09-02',24000,'���轺','�ü��, DB����, ��Ʈ��ũ����, ����ȯ�汸��');
           
insert into book_tbl_06(
                        book_no, --������ȣ
                        book_name, --������
                        book_coverimg, --ǥ��
                        book_date, --��������
                        book_price, --�ݾ�
                        book_publisher, --���ǻ�
                        book_info)  --�����Ұ�
values(
           101,'�ڹ�','101.jpg','2016-01-10',20000,'���ڹ�','���α׷��� ���');
           
           insert into book_tbl_06(
                        book_no, --������ȣ
                        book_name, --������
                        book_coverimg, --ǥ��
                        book_date, --��������
                        book_price, --�ݾ�
                        book_publisher, --���ǻ�
                        book_info)  --�����Ұ�
values(
           102,'�ڹ������α׷���','102.jpg','2016-10-30',25000,'������','����ȯ��/�������α׷�/��ġ���α׷�');
           
           insert into book_tbl_06(
                        book_no, --������ȣ
                        book_name, --������
                        book_coverimg, --ǥ��
                        book_date, --��������
                        book_price, --�ݾ�
                        book_publisher, --���ǻ�
                        book_info)  --�����Ұ�
values(
           103,'���¼ҽ�Ȱ���ϱ�','103.jpg','2017-09-01',30000,'�ڿ���','�������, ����, ����');
           
           insert into book_tbl_06(
                        book_no, --������ȣ
                        book_name, --������
                        book_coverimg, --ǥ��
                        book_date, --��������
                        book_price, --�ݾ�
                        book_publisher, --���ǻ�
                        book_info)  --�����Ұ�
values(
           104,'HTML','104.jpg','2018-04-04',10000,'ȫ�浿','HTML/CSS/JAVASCRIPT/JQUERY');
           
select * from book_tbl_06;

create table rent_tbl_06(
rent_no number primary key, --�뿩��ȣ
book_no number not null, --������ȣ
rent_price number  not null, --�뿩�ݾ�
rent_date date  not null, --�뿩����
rent_status char(1)  default 0 not null  --�ݳ�����
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

