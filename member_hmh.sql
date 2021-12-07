select user();
use study_member;

select database();

drop table member_table;
create table member_table (
	m_number bigint auto_increment,
    m_id varchar(30),
    m_password varchar(30),
    m_name varchar(20),
    m_email varchar(40),
    m_phone varchar(20),
    m_photo varchar(50),
    constraint primary key(m_number)
);

select * from member_table;

drop table board_table;
create table board_table (
	b_number bigint auto_increment,
    b_title varchar(100),
    b_writer varchar(30),
    b_contents varchar(1000),
    b_hits int,
    b_date timestamp not null default current_timestamp,
    b_filename varchar(100),
    constraint primary key(b_number)
);

select * from board_table;

drop table comment_table;
create table comment_table (
	c_number bigint auto_increment,
    b_number bigint,
    c_writer varchar(50),
    c_contents varchar(200),
    c_date timestamp not null default current_timestamp,
    constraint primary key(c_number)
);

select * from comment_table;
