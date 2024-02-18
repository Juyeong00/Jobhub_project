<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>JobHub</title>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
    integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="css/apply.css" rel="stylesheet">
</head>

<body>

    <%@ include file="../header_footer/header.jsp"%>
    
        <div class="apply_title">지원서 작성하기</div>
        <div class="container">
            <div class="apply_header">
                <div class="apply_header_title">${title}</div>
                <div class="apply_header_button">
                    <button type="button" class="apply_header_btn" id="hd_save">임시저장</button>
                    <button type="button" class="apply_header_btn">미리보기</button>
                    <button type="button" class="apply_header_submit" id="hd_submit">지원하기</button>
                </div>
            </div>
            <div class="apply_main">
                <form action="" id="apply_form" method="post"
                    enctype="multipart/form-data">
                    <input type="hidden" id="status" name="submissionStatus" value="">
                    <div class="apply_content">
                        <p>기본 인적사항</p>
                        <div>
                            <div class="ap_mydetail">
                                <input type="text" name="name" value="${name}"
                                    class="ap_inpt apply_name margin5px" readonly> <input
                                    type="text" name="birth" value="${birth}"
                                    class="ap_inpt apply_birth margin5px" readonly> <input
                                    type="text" name="email" value="${email}"
                                    class="ap_inpt apply_email" readonly>
                            </div>
                            <div class="ap_mydetail">
                                <input type="text" name="gender" value="${gender}"
                                    class="ap_inpt apply_gender margin5px" readonly> <input
                                    type="text" name="phone" value="${phone}"
                                    class="ap_inpt apply_tel margin5px" readonly> <select
                                    name="supportPath" class="ap_inpt apply_howfound"
                                    id="supportPath">
                                    <option value="" disabled selected hidden>지원경로(공고를 처음
                                        알게 된 경로)</option>
                                    <option value="사람인">사람인</option>
                                    <option value="원티드">원티드</option>
                                    <option value="링크드인">링크드인</option>
                                    <option value="잡코리아">잡코리아</option>
                                    <option value="SNS광고">SNS광고</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="apply_content">
                        <p>학력사항</p>
                        <div class="eduinput"></div>
                        <div class="ap_mydetail ap_grade">
                            <select id="eduSortation" class="ap_inpt apply_edu">
                                <option value="" disabled selected hidden>구분</option>
                                <option value="고등학교">고등학교</option>
                                <option value="전문대학">전문대학</option>
                                <option value="대학교">대학교</option>
                                <option value="대학원(석사)">대학원(석사)</option>
                                <option value="대학원(박사)">대학원(박사)</option>
                            </select>
                            <div class="apply_edu_highschool">
                                <input type="text" placeholder="학교명"
                                    class="ap_inpt apply_shcname" id="highName"> <input
                                    type="text" placeholder="입학년월" class="ap_inpt apply_date2"
                                    id="high_admis" oninput="inputAdmis(this)"> <span
                                    class="from_to">~</span> <input type="text" placeholder="졸업년월"
                                    class="ap_inpt apply_date2" id="high_grad"
                                    oninput="inputGrad(this)">
                                <button type="button" class="ap_inpt2 apply_careerbtn"
                                    name="edu">완료</button>
                            </div>
                            <div class="apply_edu_university">
                                <input type="text" placeholder="학교명"
                                    class="apply_shcname2 ap_inpt" id="uniName"> <input
                                    type="text" placeholder="전공" class="apply_major ap_inpt"
                                    id="uni_major"> <input type="text" placeholder="(세)부전공"
                                    class="apply_major ap_inpt" id="uni_minor"> <input
                                    type="text" placeholder="평점" class="apply_grade ap_inpt"
                                    id="uni_grade"> <input type="text" placeholder="총점"
                                    class="apply_grade apply_total ap_inpt" id="uni_total">
                                <input type="text" placeholder="입학년월"
                                    class="ap_inpt apply_date3" id="uni_admis"
                                    oninput="inputAdmis(this)"> <span class="from_to">~</span>
                                <input type="text" placeholder="졸업년월"
                                    class="ap_inpt apply_date3" id="uni_grad"
                                    oninput="inputGrad(this)"> <select
                                    id="graduationStatus" name="graduationStatus"
                                    class="ap_inpt apply_grade_status">
                                    <option value="졸업">졸업</option>
                                    <option value="졸업예정">졸업예정</option>
                                    <option value="휴학">휴학</option>
                                    <option value="재학">재학</option>
                                    <option value="수료">수료</option>
                                    <option value="중퇴/자퇴">중퇴/자퇴</option>
                                </select>
                                <button type="button" class="ap_inpt2 apply_careerbtn"
                                    name="edu">완료</button>
                            </div>
                        </div>
                        <div class="cr_noti">
                            <ul>
                                <li>학력은 최종학력에서부터 고등학교 순으로, 역순으로 기재해주시기 바랍니다.</li>
                                <li><strong>해당 항목을 모두 기입한 후, 완료버튼을 누르면 다음 항목이
                                        활성화됩니다.</strong></li>
                                <li>입학년월/졸업년월은 YYYY.MM 순서로 입력해 주세요. (예: 1999.01)</li>
                                <li>복수전공 및 이중전공을 이수하신 분들은 부전공란에 입력해주세요.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="apply_content">
                        <p>경력사항</p>
                        <div class="careerinput"></div>
                        <div class="ap_mydetail">
                            <input type="text" id="companyName" placeholder="회사명"
                                class="ap_inpt apply_cname"> <input type="text"
                                id="departmentName" placeholder="부서명"
                                class="ap_inpt apply_dname"> <input type="text"
                                id="joinDate" placeholder="입사일" class="ap_inpt apply_date"
                                oninput="inputjoin(this)"> <span class="from_to">~</span>
                            <input type="text" id="resignationDate" placeholder="퇴사일"
                                oninput="inputresign(this)" class="ap_inpt apply_date">
                            <input type="text" id="duty" placeholder="담당업무"
                                class="ap_inpt apply_duty"> <select id="position"
                                class="ap_inpt apply_position">
                                <option value="" disabled selected hidden>고용형태</option>
                                <option value="정규">정규</option>
                                <option value="계약">계약</option>
                                <option value="무기계약">무기계약</option>
                                <option value="인턴">인턴</option>
                            </select>
                            <button type="button" class="ap_inpt2 apply_careerbtn"
                                name="career">완료</button>
                        </div>
                        <div>
                            <textarea id="careerdetail" cols="100" rows="14"
                                placeholder="상세업무내용" class="text_area"></textarea>
                        </div>
                        <div class="cr_noti">
                            <ul>
                                <li>경력은 최종경력에서부터 최초경력 순으로 기재해주시기 바랍니다.</li>
                                <li><strong>해당 항목을 모두 기입한 후, 완료버튼을 누르면 다음 항목이
                                        활성화됩니다.</strong></li>
                                <li>입사일/퇴사일은 "YYYY.MM.DD" 순서로 입력해 주세요. (예 : 1999.01.01)</li>
                                <li>아르바이트 경력은 기재하지 않습니다.</li>
                                <li>최종 회사에 재직중이면, 퇴사일은 비워 두셔도 됩니다.</li>
                            </ul>
                        </div>
                    </div>
                    <div class="apply_content">
                        <p>자격/어학 사항</p>
                        <div class="certinput"></div>
                        <div class="ap_mydetail ap_certi">
                            <select id="certSortation" class="ap_inpt apply_certi">
                                <option value="" disabled selected hidden>구분</option>
                                <option value="자격">자격</option>
                                <option value="어학">어학</option>
                            </select>
                            <div class="apply_qualification">
                                <input type="text" id="certType" placeholder="자격/면허종류"
                                    class="ap_inpt apply_type"> <input type="text"
                                    id="qual_certLevel" placeholder="등급"
                                    class="ap_inpt apply_level"> <input type="text"
                                    id="qual_acquisition" placeholder="취득/응시일"
                                    oninput="inputjoin(this)" class="ap_inpt apply_cdate">
                                <input type="text" id="qual_lssuingAuthority" placeholder="발급기관"
                                    class="ap_inpt apply_auth">
                                <button type="button" class="ap_inpt2 apply_careerbtn"
                                    name="cert">완료</button>
                            </div>
                            <div class="apply_language_skill">
                                <input type="text" id="language" placeholder="언어"
                                    class="ap_inpt apply_language"> <input type="text"
                                    id="test" placeholder="시험" class="ap_inpt apply_language">
                                <input type="text" id="lang_certLevel" placeholder="등급"
                                    class="ap_inpt apply_level"> <input type="text"
                                    id="languageGrade" placeholder="점수"
                                    class="ap_inpt apply_langGrade"> <input type="text"
                                    id="lang_acquisition" placeholder="취득/응시일"
                                    class="ap_inpt apply_cdate"> <input type="text"
                                    id="lang_lssuingAuthority" placeholder="발급기관"
                                    class="ap_inpt apply_auth">
                                <button type="button" class="ap_inpt2 apply_careerbtn"
                                    name="cert">완료</button>
                            </div>
                        </div>
                    </div>
                    <div class="apply_content">
                        <p>직무질문</p>
                        <div class="ap_mydetail">
                            <label class="apply_label">${question1}</label>
                            <div>
                                <textarea name="content1" cols="100" rows="14" class="text_area"
                                    id="content1"></textarea>
                            </div>
                            <input type="hidden" name="content2" value="null"> <input
                                type="hidden" name="content3" value="null">

                        </div>
                    </div>
                    <div class="apply_content">
                        <p>첨부자료</p>
                        <label class="apply_label warning_label">* 타사의 영업비밀에
                            해당하거나, 이에 해당될 수 있는 것으로 오해할 수 있는 자료는 경력기술서 또는 포트폴리오에 포함하여서는 안됩니다.</label>
                        <div class="ap_mydetail ap_profile">
                            <label class="apply_label apply_profile">포트폴리오 혹은 경력기술서</label>
                            <div class="filebox">
                                <input class="upload-name" value="" placeholder="첨부파일" readonly>
                                <label for="file">파일찾기</label> <input type="file" name="data"
                                    id="file" onchange="handleFileSelect(event)" multiple>
                                <ul id="fileList"></ul>
                            </div>
                        </div>
                    </div>
                    <div class="apply_content" id="apply_inquire">
                        <div class="ap_div3">
                            <p>
                                병역사항 <span class="span">필수</span>
                            </p>
                            <select name="militaryServiceMatters" id="military"
                                class="ap_inpt apply_mili">
                                <option value="" disabled selected hidden>병역구분</option>
                                <option value="ED">만기제대</option>
                                <option value="제대 기타">제대 기타</option>
                                <option value="IS">복무중</option>
                                <option value="EM">병역특례복무완료</option>
                                <option value="SM">병역특례 복무 중</option>
                                <option value="UM">군미필</option>
                                <option value="ME">면제</option>
                                <option value="NONE">해당없음</option>
                            </select>
                        </div>
                        <div class="ap_div3">
                            <p>
                                보훈대상 여부 <span class="span">필수</span>
                            </p>
                            <div class="chk_status">
                                <label class="form_gender"> <input type="radio"
                                    name="veteransTargetStatus" value="대상"> <span>대상</span>
                                </label> <label class="form_gender"> <input type="radio"
                                    name="veteransTargetStatus" value="비대상" checked> <span>비대상</span>
                                </label>
                            </div>
                        </div>
                        <div class="ap_div3">
                            <p>
                                장애사항 <span class="span">필수</span>
                            </p>
                            <select name="disorderStatus" class="ap_inpt apply_disorder">
                                <option value="해당없음" selected>해당없음</option>
                                <option value="일반">일반</option>
                                <option value="산재">산재</option>
                                <option value="보훈">보훈</option>
                            </select>
                        </div>
                    </div>
                    <div class="apply_footer_button">
                        <button type="button" id="ap_save"
                            class="apply_header_btn btn_size">임시저장</button>
                        <button type="button" class="apply_header_btn btn_size">미리보기</button>
                        <button type="button" id="ap_submit"
                            class="apply_header_submit btn_size">지원하기</button>
                    </div>
                </form>
            </div>
        </div>
    
    <%@ include file="../header_footer/footer.jsp"%>

    <script src="js/apply.js"></script>
    <script>
        function handleFileSelect(event) {
            var files = event.target.files;

            var fileList = document.getElementById('fileList');

            for (var i = 0; i < files.length; i++) {
                var file = files[i];

                var listItem = document.createElement('li');
                listItem.textContent = file.name;
                fileList.appendChild(listItem);
            }

        }
    </script>
</body>

</html>