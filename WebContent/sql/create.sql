create table company(
	c_start date,
	c_maintain date,
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
	m_note varchar(200),
	
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
	
	primary key(u_email)
);