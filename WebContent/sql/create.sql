create table company(
	c_start text,
	c_maintain text,
	c_end text,
	c_name varchar(100),
	c_address varchar(200),
	c_number text,
	c_manager varchar(10),
	c_except varchar(10),
	m_id int
	
);

create table member(
	m_id int,
	m_name varchar(20),
	m_birth date,
	m_number text,
	m_area varchar(20),
	m_age1 int,
	m_age2 int,
	m_sex varchar(10),
	m_option1 varchar(20),
	m_option2 varchar(20),
	m_option3 varchar(20),
	s_id int not null,
	
	primary key(m_id)
);

create table consequence(
	co_result varchar(20),
	co_attend float,
	co_comple text,
	co_employ text,
	co_same text,
	co_insurance text,
	co_option1 text,
	co_option2 text,
	co_option3 text,
	co_option4 text,
	co_option5 text,
	co_option6 text,
	co_asse text,
	co_porf text,
	co_certificate text,
	m_id int
);

create table user(
	u_email varchar(50),
	u_pass varchar(50),
	u_name varchar(50),
	u_admin int DEFAULT 0,
	
	primary key(u_email)
);

create table subject(
	s_id int,
	s_name varchar(50),
	s_code varchar(50),
	s_start date,
	s_end date,
	s_manage date,
	s_professor varchar(20),
	
	primary key(s_id)
);

create table note(
	m_id int,
	n_id int,
	n_note varchar(200) not null,
	n_date date not null default(current_date),
	
	primary key(m_id, n_id)
);

create table employment(
	year varchar(5),
	code varchar(10),
	employment_rate decimal(3,1),
	
	primary key(year, code)
);


alter table subject add s_member varchar(20);
alter table subject add s_empoyee varchar(20);
ALTER TABLE company MODIFY COLUMN c_maintain text;
ALTER TABLE member drop column m_note;
alter table note drop column n_date;
alter table note add n_date date not null default(current_date);
alter table company MODIFY c_start text;
alter table consequence MODIFY co_asse varchar(3);

alter table consequence MODIFY co_asse decimal(4,2);
alter table user add u_admin int DEFAULT 0;
alter table employment modify column code varchar(10);
alter table employment drop column name;
