create sequence qna_seq minvalue 1 maxvalue 9999999999 increment by 1 start with 1 ;
 
-- 0�̸� ���� 1�̸� ���
 
create table qna_board (
 	id_x number(10,0) not null,
 	id varchar2(20) not null,
 	subject varchar2(50),
 	content varchar2(200),
 	created_date date,
 	hits number(10,0),
 	reply char(1) check(reply in('0','1')),
 	category char(10) default 'signup' check (category in ('signup','savings', 'etc')),
 	filename varchar2(50) default null,
 	filesize number default null,
primary key (id_x) enable
 ) ;
 
 drop table qna_board;
 
 select * from qna_board;

 delete from qna_board where id_x=23;