
-- INSERT DATA

-- 쿼리에 '&'포함되어  실행 필요
set define off;

-- 직무 데이터 insert
INSERT INTO jobs VALUES (1, 'Engineering', 'category', 1, null);
INSERT INTO jobs VALUES (2, 'Client-side', 'item', 2, 1);
INSERT INTO jobs VALUES (3, 'Android', 'item', 2, 1);
INSERT INTO jobs VALUES (4, 'iOS', 'item', 2, 1);
INSERT INTO jobs VALUES (5, 'Web Development', 'item', 2, 1);
INSERT INTO jobs VALUES (6, 'Server-side', 'item', 2, 1);
INSERT INTO jobs VALUES (7, 'QA', 'item', 2, 1);
INSERT INTO jobs VALUES (8, 'Data/AI', 'item', 2, 1);
INSERT INTO jobs VALUES (9, 'Security Engineering', 'item', 2, 1);
INSERT INTO jobs VALUES (10, 'Design', 'category', 1, null);
INSERT INTO jobs VALUES (11, 'Multimedia Design', 'item', 2, 10);
INSERT INTO jobs VALUES (12, 'Planning', 'category', 1, null);
INSERT INTO jobs VALUES (13, 'Product Management', 'item', 2, 12);
INSERT INTO jobs VALUES (14, 'Business Strategy', 'item', 2, 12);
INSERT INTO jobs VALUES (15, 'Business Development', 'item', 2, 12);
INSERT INTO jobs VALUES (16, 'Marketing Communication', 'item', 2, 12);
INSERT INTO jobs VALUES (17, 'Corporate Strategy', 'item', 2, 12);
INSERT INTO jobs VALUES (18, 'Business & Sales', 'category', 1, null);
INSERT INTO jobs VALUES (19, 'Product Management', 'item', 2, 18);
INSERT INTO jobs VALUES (20, 'Business Strategy', 'item', 2, 18);
INSERT INTO jobs VALUES (21, 'Business Development', 'item', 2, 18);
INSERT INTO jobs VALUES (22, 'Business Management', 'item', 2, 18);
INSERT INTO jobs VALUES (23, 'Sales', 'item', 2, 18);
INSERT INTO jobs VALUES (24, 'Growth Marketing', 'item', 2, 18);
INSERT INTO jobs VALUES (25, 'Corporate Strategy', 'item', 2, 18);
INSERT INTO jobs VALUES (26, 'Marketing & Comms', 'category', 1, null);
INSERT INTO jobs VALUES (27, 'Marketing Communication', 'item', 2, 26);
INSERT INTO jobs VALUES (28, 'Growth Marketing', 'item', 2, 26);
INSERT INTO jobs VALUES (29, 'Corporate', 'category', 1, null);
INSERT INTO jobs VALUES (30, 'Business Strategy', 'item', 2, 29);
INSERT INTO jobs VALUES (31, 'Business Development', 'item', 2, 29);
INSERT INTO jobs VALUES (32, 'Legal', 'item', 2, 29);
INSERT INTO jobs VALUES (33, 'Finance', 'item', 2, 29);
INSERT INTO jobs VALUES (34, 'Corporate Strategy', 'item', 2, 29);
INSERT INTO jobs VALUES (35, 'Internal Audit', 'item', 2, 29);
INSERT INTO jobs VALUES (36, 'Corporate Affairs', 'item', 2, 29);
INSERT INTO jobs VALUES (37, 'Secretary', 'item', 2, 29);
INSERT INTO jobs VALUES (38, 'Language Support', 'item', 2, 29);




--자주묻는 질문 faqs(24)

--채용 일반 (13)
insert into faqs values
('FAQs1','채용 일반','1:1 문의할 수 있는 채널이 있나요?', 
'한국 법인 공고의 경우, 하단의 1:1 채용문의 혹은 이메일 [ join@linecorp.com ] 로 문의하실 수 있습니다.
단, 이메일의 경우 IPX 법인 채용은 [ dl_ipx_career@linefriends.com ] 로 문의 바랍니다.');

insert into faqs values
('FAQs2','채용 일반','신입사원은 어떤 방식으로 채용하고 있나요?', 
'정기 신입공채는 주로 상/하반기 연중 2회 진행하며, 3월과 9월 경 본 채용사이트에서 내용을 확인하실 수 있습니다. (단, 회사 사정에 따라 시기와 방식은 변경될 수 있으며, 법인에 따라 차이가 있을 수 있습니다) 필요에 따라 수시채용도 진행하고 있으며, 이는 [Jobs]에서 확인하실 수 있습니다.

신입사원 수준의 경력을 보유하셔도, 경력사원 대상 공고에 나온 역량을 보유하셨다고 생각되시는 경우 경력직 채용 공고에 지원하실 수 있습니다.');

insert into faqs values
('FAQs3','채용 일반','경력이 있는 경우 신입 포지션에 지원할 수 있나요?', 
'경력이 있어도 신입 포지션에 지원하실 수 있습니다. 단, 자세한 자격 요건은 각 공고를 확인 부탁드리며, 신입 포지션을 통해 입사 시 이전 경력은 별도로 인정되지 않는 점 참고 부탁드립니다.');

insert into faqs values
('FAQs4','채용 일반','전문연구요원 지원 가능한가요?', 
'현재는 LINE Plus 법인에서 전문연구요원 제도를 운영 중이며, 매년 병무청의 인원 배정 결과에 따라 신규 편입 공고 게시를 통해 채용 진행하고 있습니다. 단, 전직의 경우 병무청 전문연구요원 전직 대상 조건에 부합하신다면 모든 LINE Plus 법인 기술 직군 공고에 지원 가능합니다.');

insert into faqs values
('FAQs5','채용 일반','공고의 자격요건과 무관한 경력을 보유하고 있더라도 지원 가능한가요?','지원 가능합니다. 다만 직무와 무관한 경력을 보유하신 경우, 지원서에 작성하여 주신 경력 사항을 내부 기준에 따라 검토합니다.');

insert into faqs values
('FAQs6','채용 일반','공고 간 중복지원 가능한가요?','같은 기간 내에도 공고 간 중복지원 가능하며, 중복지원에 대한 불이익은 없습니다.
단, 공개채용 등 특정 공고에서는 직무 간 중복지원 불가할 수 있으니 공고의 상세 내용을 참고해주시기 바랍니다.');

insert into faqs values
('FAQs7','채용 일반','불합격 안내 이후 재지원 가능 시점은 언제인가요?','불합격 이후 재지원 가능 시점에는 제한이 없습니다. 재지원 시 불이익 또한 없습니다.');

insert into faqs values
('FAQs8','채용 일반','외부 채용사이트에 게재된 공고를 [Jobs]에서 확인할 수 없는 것은 어떤 경우인가요?','외부 채용사이트 및 플랫폼에서는 라인의 채용 공고를 복사해서 노출하기 때문에 마감된 공고가 업로드되어 있을 수 있습니다. 정확한 정보는 LINE 공식 채용사이트의 [Jobs]에서 확인해 주시기 바랍니다. [Jobs]에서 찾으실 수 없는 공고의 경우, 수시모집으로 채용이 마감된 공고입니다.');

insert into faqs values
('FAQs9','채용 일반','(한국인이) 다른 국가 법인의 공고에 지원 가능한가요?','[Jobs]에서 개별 공고 내용을 확인해 주시기 바랍니다. 한국 이외 국가/법인의 공고들은 해당 법인 주관이며, 한국 법인의 채용과는 무관하게 진행됩니다.');

insert into faqs values
('FAQs10','채용 일반','외국인(외국 국적 소지자)도 지원 가능한가요?','외국인(외국 국적 소지자)도 지원 가능합니다. 단, 근무 가능한 형태의 비자를 취득하실 수 있거나 이미 취득하신 상태이셔야 합니다.');

insert into faqs values
('FAQs11','채용 일반','인턴 공고에 외국인 학생도 지원 가능한가요?','외국인 학생도 지원 가능합니다. 단, ''합격 시'' 예정된 인턴 근무기간 동안 주 5일(평일 8시간씩) 근무 가능한 형태의 비자를 취득하실 수 있거나 이미 취득하신 상태이셔야 합니다.');

insert into faqs values
('FAQs12','채용 일반','보훈 대상자 및 장애인 지원자에 대한 가산점이 있나요?','보훈 대상자 및 장애인 등 취업보호 대상자는 관계법령에 따라 우대합니다.
이에 해당되시는 경우, 입사지원 시 [포트폴리오/이력서] 첨부 란에 반드시 관련 증명원을 첨부해 주시기 바랍니다.

- 보훈 대상자 : ''보훈 취업지원 대상자 증명서'' 첨부
- 장애인 지원자 : ''장애인 증명서 또는 복지카드'' 첨부');

insert into faqs values
('FAQs13','채용 일반','채용 서류 반환 절차는 어떻게 되나요?','채용절차의 공정화에 관한 법률(''15.1.1 적용)에 따른 채용 서류 반환 절차에 대해 아래와 같이 안내드립니다.

﻿1. LINE의 채용에 지원하여 불합격한 지원자는 최종 결과 안내가 있은 날로부터 90일 이내에, 회사에서 오프라인으로 제출을 요구한 서류에 한하여 반환을 청구할 수 있습니다. (온라인으로 제출한 파일 및 지원자가 자발적으로 제출한 서류는 반환 대상 서류에 해당하지 않습니다)﻿

2. LINE은 최종 결과 안내가 있은 날로부터 90일까지만 채용서류를 보관하며, 이후에는 관련법에 의거하여 모든 채용 서류를 파기하므로 반환 청구가 불가능합니다.

3. 채용 서류 반환 청구는 하단의 ''1:1 채용문의 > 채용서류 반환 청구''를 통해 접수받고 있으며, 반환 청구 시 본인확인 및 원활한 서류 반환을 위해 아래의 정보를 기입하여 접수해 주셔야 합니다. (①성명 ②이메일 주소 ③생년월일 ④서류를 반환받을 주소 ⑤반환받고자 하는 서류의 종류 )

4. 반환 청구가 접수된 날로부터 14일 이내에 대상 서류를 등기우편으로 송부해드립니다. (발송 비용은 청구인이 부담)');


--채용 과정(3)
insert into faqs values
('FAQs14','채용 과정','채용 과정은 어떻게 진행되나요?','보통은 ''서류 전형 → 과제(or테스트)전형 → 면접전형 → 레퍼런스 체크 → 처우협의 → 최종합격''의 과정으로 진행합니다.

- 과제(or테스트)전형은 공고에 따라 진행 여부와 방식이 다르니, 개별 공고의 내용을 참고해 주시기 바랍니다.
- 면접전형은 1차, 2차로 진행하는 것이 기본이며, 공고와 상황에 따라 차이가 있을 수 있습니다.');

insert into faqs values
('FAQs15','채용 과정','서류 전형 결과는 언제쯤 안내받을 수 있나요?','지원서는 인입된 순서대로 검토하며, 2주 내로 합격/불합격 여부와 관계없이 지원하신 메일로 결과 안내드릴 예정입니다.');

insert into faqs values
('FAQs16','채용 과정','레퍼런스 체크는 어떤 절차로 진행되나요?','모든 경력직 채용공고에서는 면접전형 합격자를 대상으로 레퍼런스 체크를 진행합니다. 레퍼런스 체크는 지원자의 면접전형 합격 판단 이후, 지원자의 동의를 받아 진행하게 됩니다. 그 이후의 진행에 대해서는 채용담당자가 별도로 안내드립니다.');

--지원서 작성 (4)
insert into faqs values
('FAQs17','지원서 작성','지원서 작성 분량은 어떻게 되나요?','기본 직무질문 필수 문항의 답변에는 분량 제한이 없습니다. 지원자 본인을 잘 드러내실 수 있다고 판단되시는 적정한 길이로 작성해 주시면 됩니다.');

insert into faqs values
('FAQs18','지원서 작성','포트폴리오는 어떤 내용을 작성해야 하나요?','일부 공고 중 포트폴리오가 ''필수''로 분류되어 있는 공고를 제외하고, 포트폴리오 첨부는 지원자의 선택사항입니다. 지원자의 판단을 바탕으로, 본인의 역량을 공유해 주실 수 있는 포트폴리오를 업로드해 주시기 바랍니다. 포트폴리오의 형식은 자율이며, 목적을 충족할 수 있다면 어떤 작업물을 업로드하셔도 무방합니다. 단, 타사의 영업 비밀에 해당하거나, 이에 해당될 수 있는 것으로 오해할 수 있는 자료는 경력기술서 또는 포트폴리오에 포함하여서는 안 됩니다.');

insert into faqs values
('FAQs19','지원서 작성','제출완료한 지원서를 확인할 수 있나요?','https://recruit.linepluscorp.com/lineplus/login/myApplicationLogin 에서 확인하실 수 있습니다.');

insert into faqs values
('FAQs20','지원서 작성','지원서 수정 및 삭제가 가능한가요?','원칙적으로 지원서를 최종제출하신 이후에는, 수정이 불가합니다. 수정을 희망하시는 경우 지원서 삭제를 요청하신 후 재지원하셔야 합니다.
지원서 삭제 요청 시, 아래 양식에 정보를 기입하여 ''1:1문의''를 통해 개별 문의해 주시기 바랍니다.
(단, 지원하시려는 공고의 마감기한을 반드시 확인해 주시어 기한 안에 연락 부탁드리며, 삭제된 지원서는 복구할 수 없음을 안내드립니다)

<지원서 삭제 요청>
1) 요청 사항 : 지원서 삭제
2) 요청 사유 :
3) 지원 공고 :
4) 이름 :
5) 생년월일 :
6) 이메일 :
7) 연락처 :');

--시스템 오류(4)
insert into faqs values
('FAQs21','시스템 오류','지원서 작성 화면에 접속 불가하다는 오류창이 발생하는 경우, 어떻게 오류를 해결할 수 있나요?','시스템 오류 발생 시 다른 브라우저, 컴퓨터 환경 혹은 크롬/크롬 시크릿 모드에서 다시 시도해보시기 바랍니다. 하나의 브라우저에서 여러 번 새로고침하는 등 비정상적인 패턴을 보이면 해당 오류가 발생할 수 있습니다.');

insert into faqs values
('FAQs22','시스템 오류','포트폴리오 첨부 시 오류가 발생하는 경우, 어떻게 오류를 해결할 수 있나요?','크롬/크롬 시크릿 모드로 시도해보시기 바랍니다. 크롬 브라우저에서도 동일한 문제가 발생하신다면, 구글 드라이브 및 드롭박스 등에 포트폴리오를 첨부하신 후 직무질문에 URL을 입력하여 제출해 주시기 바랍니다.');

insert into faqs values
('FAQs23','시스템 오류','고등학교 학력을 작성했음에도 ''고등학교 학력 입력 필수''라는 오류창이 발생하는 경우, 어떻게 오류를 해결할 수 있나요?','고등학교 학력을 작성하지 않으셨거나 여러 개 작성하시는 경우 오류가 발생할 수 있습니다. 고등학교 학력 정보는 최종 졸업하신 고등학교 한 곳에 대한 정보만 입력해 주시기 바랍니다. (국내/해외 두 곳 입력 불가)');

insert into faqs values
('FAQs24','시스템 오류','내 지원서 조회를 위한 비밀번호 입력 시 오류가 발생하는 경우, 어떻게 오류를 해결할 수 있나요?','비밀번호를 잊어버리신 경우, ''비밀번호 초기화''를 통해 비밀번호를 재설정하시기 바랍니다.
https://recruit.linepluscorp.com/lineplus/login/initPwd 을 통해 초기화 및 임시 비밀번호를 지원했던 이메일로 받으신 후 비밀번호를 재설정하시기 바랍니다.');


-- 관리자 생성 쿼리
INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin1', 'password1', 'emp1', 'ADMIN', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin2', 'password2', 'emp2', 'SUPERVISOR', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin3', 'password3', 'emp3', 'MANAGER', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin4', 'password4', 'emp4', 'STAFF', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin5', 'password5', 'emp5', 'ADMIN', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin6', 'password6', 'emp6', 'SUPERVISOR', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin7', 'password7', 'emp7', 'MANAGER', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin8', 'password8', 'emp8', 'STAFF', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin9', 'password9', 'emp9', 'ADMIN', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

INSERT INTO administrator (admin_ID, admin_PW, employee_ID, permission_code, creation_code, deactivation_date, user_status)
VALUES ('admin10', 'password10', 'emp10', 'SUPERVISOR', TO_CHAR(SYSTIMESTAMP, 'YYYY-MM-DD'), NULL, 'JOIN');

--common_code_master insert 공통 분류 코드
INSERT INTO common_code_master VALUES ('PERMANENT', 'employment_type', '정규직', '고용형태');
INSERT INTO common_code_master VALUES ('CONTRACT', 'employment_type', '계약직', '고용형태');
INSERT INTO common_code_master VALUES ('INDEFINITE_CONTRACT', 'employment_type', '무기계약직', '고용형태');
INSERT INTO common_code_master VALUES ('INTERN', 'employment_type', '인턴', '고용형태');
INSERT INTO common_code_master VALUES ('MB', 'military_service_matters', '병역특례(military_benefits)', '병역사항');
INSERT INTO common_code_master VALUES ('ED', 'military_service_matters', '병역만기제대 (Expiration discharge)', '병역사항');
INSERT INTO common_code_master VALUES ('IS', 'military_service_matters', '병역복무중(in service)', '병역사항');
INSERT INTO common_code_master VALUES ('EM', 'military_service_matters', '병역특례복무만료(Exception of military service)', '병역사항');
INSERT INTO common_code_master VALUES ('SM', 'military_service_matters', '병역특례복무중(in the service of special military service)', '병역사항');
INSERT INTO common_code_master VALUES ('UM', 'military_service_matters', '군미필(unfinished military service)', '병역사항');
INSERT INTO common_code_master VALUES ('ME', 'military_service_matters', '병역면제(Military Exemption)', '병역사항');
INSERT INTO common_code_master VALUES ('NONE', 'military_service_matters', '해당없음', '병역사항');
INSERT INTO common_code_master VALUES ('ADMIN', 'permission_code', '최고 권한', '관리자권한');
INSERT INTO common_code_master VALUES ('SUPERVISOR', 'permission_code', '최고 권한', '관리자권한');
INSERT INTO common_code_master VALUES ('MANAGER', 'permission_code', '관리자 설정 외 권한', '관리자권한');
INSERT INTO common_code_master VALUES ('STAFF', 'permission_code', '채용공고, FAQs, 1:1채용문의 접근 권한', '관리자권한');
INSERT INTO common_code_master VALUES ('EXPERIENCED', 'career_condition', '경력', '경력조건');
INSERT INTO common_code_master VALUES ('NEW_ENTRY', 'career_condition', '신입', '경력조건');
INSERT INTO common_code_master VALUES ('NO_EXPERIENCE_REQUIREMENT', 'career_condition', '무관', '경력조건');
INSERT INTO common_code_master VALUES ('JOIN', 'user_status', '가입', '계정상태');
INSERT INTO common_code_master VALUES ('WITHDRAWAL', 'user_status', '탈퇴', '계정상태');
INSERT INTO common_code_master VALUES ('DORMANT', 'user_status', '휴면', '계정상태');
INSERT INTO common_code_master VALUES ('ACCEPTANCE', 'apply_status', '합격', '지원상태');
INSERT INTO common_code_master VALUES ('FAILED', 'apply_status', '불합격', '지원상태');
INSERT INTO common_code_master VALUES ('UNDETERMINED', 'apply_status', '심사중', '지원상태');


-- 직원 data
-- 직원 데이터를 employee 테이블에 맞게 수정
INSERT ALL
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp1', 'd:/fileStorage/ca593e1f-image1.jpg', 1, '김서연', '010-1111-2222', '02-9999-1111', TO_DATE('1991-05-15', 'YYYY-MM-DD'), '여성', '서울시 강남구 역삼동', TO_DATE('2022-08-15', 'YYYY-MM-DD'), NULL, 'user123@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp2', 'd:/fileStorage/ca593e1f-image2.jpg', 2, '이민재', '010-2345-6789', '02-9999-2345', TO_DATE('1990-09-28', 'YYYY-MM-DD'), '남성', '서울시 송파구 잠실동', TO_DATE('2022-11-23', 'YYYY-MM-DD'), NULL, 'john.doe@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp3', 'd:/fileStorage/ca593e1f-image3.jpg', 3, '박하늘', '010-8765-4321', '02-9999-8765', TO_DATE('1994-03-07', 'YYYY-MM-DD'), '여성', '서울시 서초구 서초동', TO_DATE('2023-05-07', 'YYYY-MM-DD'), NULL, 'alice_smith@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp4', 'd:/fileStorage/ca593e1f-image4.jpg', 4, '최우진', '010-9876-5432', '02-9999-9876', TO_DATE('1995-11-19', 'YYYY-MM-DD'), '남성', '서울시 강서구 화곡동', TO_DATE('2023-02-14', 'YYYY-MM-DD'), NULL, 'jenny_lee@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp5', 'd:/fileStorage/ca593e1f-image5.jpg', 5, '정수빈', '010-5432-1098', '02-9999-5432', TO_DATE('1992-08-02', 'YYYY-MM-DD'), '여성', '서울시 강북구 미아동', TO_DATE('2022-10-30', 'YYYY-MM-DD'), NULL, 'mike_jones@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp6', 'd:/fileStorage/ca593e1f-image6.jpg', 6, '강태준', '010-6789-1234', '02-9999-6789', TO_DATE('1998-06-11', 'YYYY-MM-DD'), '남성', '서울시 동작구 사당동', TO_DATE('2022-07-12', 'YYYY-MM-DD'), NULL, 'emily.wang@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp7', 'd:/fileStorage/ca593e1f-image7.jpg', 7, '한미경', '010-3210-9876', '02-9999-3210', TO_DATE('1996-04-23', 'YYYY-MM-DD'), '여성', '서울시 관악구 봉천동', TO_DATE('2023-09-18', 'YYYY-MM-DD'), NULL, 'david_miller@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp8', 'd:/fileStorage/ca593e1f-image8.jpg', 8, '송재우', '010-1111-3333', '02-9999-5555', TO_DATE('1993-12-30', 'YYYY-MM-DD'), '남성', '서울시 중랑구 면목동', TO_DATE('2022-12-05', 'YYYY-MM-DD'), NULL, 'sarah.brown@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp9', 'd:/fileStorage/ca593e1f-image9.jpg', 9, '임하윤', '010-4444-5555', '02-9999-4444', TO_DATE('1999-10-05', 'YYYY-MM-DD'), '여성', '서울시 성북구 석관동', TO_DATE('2022-09-03', 'YYYY-MM-DD'), NULL, 'kevin_clark@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp10', 'd:/fileStorage/ca593e1f-image10.jpg', 10, '오성민', '010-6666-7777', '02-9999-6666', TO_DATE('1997-01-17', 'YYYY-MM-DD'), '남성', '서울시 동대문구 제기동', TO_DATE('2023-04-27', 'YYYY-MM-DD'), NULL, 'anna.jones@jobjub.com')
    INTO employee (employee_id, image_path, jobs_id, name, phone, tel, birth, gender, address, hire_date, resignation_date, email) VALUES ('emp11', 'd:/fileStorage/ca593e1f-image11.jpg', 11, '유수빈', '010-8888-9999', '02-9999-8888', TO_DATE('1991-07-14', 'YYYY-MM-DD'), '여성', '서울시 강동구 천호동', TO_DATE('2023-08-02', 'YYYY-MM-DD'), NULL, 'brian_smith@jobjub.com')
SELECT * FROM dual;

commit;


