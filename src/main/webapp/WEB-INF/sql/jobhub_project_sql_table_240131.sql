DROP TABLE apply;
DROP TABLE job_customer;
DROP TABLE job_posting;
DROP TABLE jobs;
DROP TABLE administrator;
DROP TABLE employee;
DROP TABLE faqs;
DROP TABLE company;
DROP TABLE resume_info;
DROP TABLE career;
DROP TABLE education;
DROP TABLE certificate;
DROP TABLE attached_data;
DROP TABLE job_question;
DROP TABLE description;
DROP TABLE school;
DROP TABLE common_code_master;
DROP TABLE SCRAP;

drop sequence seq_posting_id;
drop sequence seq_description_id;
drop sequence seq_faqs_id;
drop sequence resume_id_seq;
drop sequence seq_scrap_id;
drop sequence seq_administrator_request_id;

-- 지원
CREATE TABLE apply (
    apply_id VARCHAR2(50) PRIMARY KEY,
    resume_id VARCHAR2(50),
    applied_date VARCHAR2(200),
    status VARCHAR2(50)
);

-- 회원 
CREATE TABLE job_customer (
    user_id VARCHAR2(50) PRIMARY KEY,
    email VARCHAR2(255),
    password VARCHAR2(50),
    name VARCHAR2(100),
    birth VARCHAR2(20),
    phone VARCHAR2(20),
    created_date VARCHAR2(200),
    gender VARCHAR2(10),
		customer_status VARCHAR2(10)
);

-- 채용공고 
-- 채용공고 
CREATE TABLE job_posting (
    posting_id VARCHAR2(50) PRIMARY KEY, --posting1, posting2, posting3
    title VARCHAR2(4000),
    jobs_id NUMBER,
    career_condition VARCHAR2(4000),
    employment_type VARCHAR2(4000),
    post_written_date VARCHAR2(4000),
    post_start_date VARCHAR2(4000),
    post_end_date VARCHAR2(4000),
    application_start VARCHAR2(4000),
    application_deadline VARCHAR2(4000),
    post_status VARCHAR2(4000),
    modify_date VARCHAR2(4000),
    admin_ID VARCHAR2(4000),
    question_1 VARCHAR2(4000),
    question_2 VARCHAR2(4000),
    question_3 VARCHAR2(4000)
);

-- 직무
CREATE TABLE jobs (
    jobs_id NUMBER PRIMARY KEY,
    jobs_name VARCHAR2(100),
    job_type VARCHAR2(50),
    jobs_level NUMBER,
    jobs_pid NUMBER
);

-- 관리자
CREATE TABLE administrator (
    admin_ID VARCHAR2(50) PRIMARY KEY,
    admin_PW VARCHAR2(50),
    employee_ID VARCHAR2(50),
    permission_code VARCHAR2(50),
    creation_code VARCHAR2(200),
    deactivation_date VARCHAR2(200),
    user_status varchar2(100)
);

-- 관리자 가입요청
CREATE TABLE administrator_request (
    id number PRIMARY KEY,
    name VARCHAR2(100),
    birth VARCHAR2(200),
    gender VARCHAR2(6),
		request_date VARCHAR2(100)
);

-- 직원 
CREATE TABLE employee (
    employee_id VARCHAR2(50) PRIMARY KEY,
    image_path VARCHAR2(255),
    jobs_id NUMBER,
    name VARCHAR2(100),
    phone VARCHAR2(20),
    tel VARCHAR2(20),
    birth VARCHAR2(200),
    gender VARCHAR2(6),
    address VARCHAR2(255),
    hire_date VARCHAR2(200),
	resignation_date VARCHAR2(200),
    email VARCHAR2(255)
);

select * from employee;

-- 자주 묻는 질문 
CREATE TABLE faqs (
    faqs_id VARCHAR2(50) PRIMARY KEY,
    category VARCHAR2(50),
    title VARCHAR2(255),
    content VARCHAR2(4000)
);

-- 회사
CREATE TABLE company (
    company_id NUMBER PRIMARY KEY,
    company_name VARCHAR2(255)
);

-- 회원 이력서 
CREATE TABLE resume_info
(
    resume_id VARCHAR2(50) PRIMARY KEY,
    user_id VARCHAR2(50),
    posting_id VARCHAR2(50),
    career_id NUMBER,
    academic_id NUMBER,
    certificate_id NUMBER,
    answer_id NUMBER,
    support_path VARCHAR2(255),
    military_service_matters VARCHAR2(255),
    veterans_target_status VARCHAR2(50),
    disorder_status VARCHAR2(255),
    submission_status VARCHAR2(50),
    revision_date VARCHAR2(200)
);

-- 경력
CREATE TABLE career (
    car_id NUMBER PRIMARY KEY,
    career_id number,
    company_name VARCHAR2(50),
    department_name VARCHAR2(50),
    joined_date_of_company varchar2(50),
    resignation_date_of_company VARCHAR2(50),
    duty VARCHAR2(255),
    position VARCHAR2(100),
    details_of_work VARCHAR2(4000)
);

-- 학력
CREATE TABLE education (
    edu_id NUMBER PRIMARY KEY,
    academic_id NUMBER,
    sortation VARCHAR2(50),
    school_name VARCHAR2(255),
    the_year_of_admission VARCHAR2(255),
    the_year_of_graduation VARCHAR2(255),
    major VARCHAR2(255),
    minor VARCHAR2(255),
    grade VARCHAR2(50),
    total_score VARCHAR2(50),
    graduation_status VARCHAR2(50)
);

-- 자격/어학 테이블 
CREATE TABLE certificate (
    cert_id NUMBER PRIMARY KEY,
    certificate_id NUMBER,
    sortation VARCHAR2(50),
    certificate_type VARCHAR2(255),
    certificate_level VARCHAR2(255),
    date_of_acquisition VARCHAR2(50),
    issuing_authority VARCHAR2(255),
    language VARCHAR2(50),
    test VARCHAR2(50),
    language_grade VARCHAR2(50)
);

-- 첨부자료 테이블 
CREATE TABLE attached_data(
	file_id NUMBER,
	resume_id VARCHAR(50),
	file_name VARCHAR2(255),
	original_file_name VARCHAR2(255),
	file_path VARCHAR2(255),
	file_extension VARCHAR2(50),
	file_size VARCHAR2(255),
	save_datetime VARCHAR2(50)
);

-- 직무질문_대답 테이블 
CREATE TABLE job_question (
    answer_id NUMBER PRIMARY KEY,
    content1 VARCHAR2(4000),
    content2 VARCHAR2(4000),
    content3 VARCHAR2(4000)
);

-- 채용세부내용
CREATE TABLE description (
    description_id VARCHAR2(50) PRIMARY KEY,
      posting_id VARCHAR2(50),
      creation_date VARCHAR2(50),
    assigned_task VARCHAR2(4000),
    requirements VARCHAR2(4000),
    preferential_treatment VARCHAR2(4000),
    screening_guide VARCHAR2(4000),
    work_form VARCHAR2(4000),
    work_place VARCHAR2(4000),
    working_hours VARCHAR2(4000),
    etc VARCHAR2(4000),
    submission_guide VARCHAR2(4000)
);

-- 학교
CREATE TABLE school (
    school_id NUMBER PRIMARY KEY,
    school_name VARCHAR2(255)
);

-- 회원 스크랩
CREATE TABLE scrap(
		scrap_id varchar2(50) PRIMARY KEY,
		user_id varchar2(50),
		posting_id varchar2(50),
		scrap_status varchar2(50)
);

CREATE TABLE customer_faq(
		customer_faq_id varchar2(50) PRIMARY KEY,
		faq_title varchar2(255),
		faq_content varchar2(4000),
		user_id varchar2(50),
		faq_status varchar2(50)
);


-- 공통_분류코드_Master
CREATE TABLE common_code_master (
    code_name VARCHAR2(50) PRIMARY KEY,
    group_code VARCHAR2(50),
    name VARCHAR2(255),
    description VARCHAR2(4000)
);




--채용세부내용 id 시퀀스
create sequence seq_description_id
start with 6
increment by 1
nocycle;

--FAQs id 시퀀스
create sequence seq_faqs_id
start with 25
increment by 1
nocycle;

-- 채용공고 id 시퀀스
create sequence seq_posting_id
start with 6
increment by 1
nocycle;

-- 이력서 id 시퀀스
-- SELECT 'res' || TO_CHAR(resume_id_seq.NEXTVAL) AS next_resume_id FROM dual;
CREATE SEQUENCE resume_id_seq
  START WITH 1
  NOCACHE
  NOCYCLE;


-- 스크랩 id 시퀀스
--SELECT 'scrap' || TO_CHAR(seq_scrap_id.NEXTVAL) AS next_scrap_id FROM dual;
create sequence seq_scrap_id
start with 1
NOCACHE
NOCYCLE;


-- 가입 요청 id 시퀀스
create sequence seq_administrator_request_id
start with 1
NOCACHE
NOCYCLE;



-- 1:1 faq id 시퀀스
--SELECT 'customer_faq' || TO_CHAR(seq_cus_faq_id.NEXTVAL) AS next_cus_faq_id FROM dual;
create sequence seq_cus_faq_id
start with 1
NOCACHE
NOCYCLE;



drop table apply_status;

CREATE TABLE apply_status (
    status_id number PRIMARY KEY,
    resume_id VARCHAR2(50),
    status_name VARCHAR2(200)
);