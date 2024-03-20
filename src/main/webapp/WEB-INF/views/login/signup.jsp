<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Jobhub : 회원가입</title>
<link rel="shortcut icon" href="common/icon/jobhub_favicon.ico"
	type="image/x-icon">
<link href="css/signup.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>

	<%@ include file="../header_footer/header.jsp"%>

	<div class="signup_title">신규지원자 등록</div>
	<div class="container">
		<div class="signup_main">
			<div class="signup_form">
				<form action="/sign-up" method="post" id="signupForm">
					<div class="form_group">
						<div class="form_line">
							<label for="signup_input_id" class="signup_label">아이디</label>
							<input type="text" name="userId" class="signup_input"
							id="signup_input_id" placeholder="아이디를 입력해 주세요" oninput="onInputId()">
							<span class="warningId">아이디는 필수 입력값입니다.</span>
						</div>
						<div class="id_checkDup">
							<button type="button" id="btn_checkDupId">중복확인</button>
							<div id="idCheckResult"></div>
						</div>
					</div>
					<div class="form_group">
						<div class="form_line">
							<label for="signup_input_pw" class="signup_label">비밀번호</label>
							<input type="password" name="password" class="signup_input"
							id="signup_input_pw" placeholder="비밀번호를 입력해 주세요" oninput="onInputPw()">
							<span class="warningPw">비밀번호는 필수 입력값입니다.</span>
						</div>
						<div class="form_line2">
							<label for="signup_input_pwchk" class="signup_label">비밀번호 확인</label>
							<input type="password" class="signup_input" id="signup_input_pwchk"
							placeholder="비밀번호를 다시 입력해 주세요" oninput="onInputPwchk()">
								<span class="warningPwchk">비밀번호가 일치하지 않습니다. 다시 확인해주세요.</span>
						</div>
					</div>
					<div class="form_group">
						<div class="form_line">
							<label for="signup_input_name" class="signup_label">이름</label>
							<input type="text" name="name" class="signup_input"
							id="signup_input_name" placeholder="이름을 입력해 주세요" oninput="onInputName()">
								<span class="warningName">이름은 필수 입력값입니다.</span>
						</div>
					</div>
					<div class="form_group">
						<div class="form_line">
							<label for="signup_input_birth" class="signup_label">생년월일</label>
							<input type="text" name="birth" class="signup_input" id="signup_input_birth"
							placeholder="YYYY-MM-DD" maxlength="10" oninput="onInputBirth()">
							<span class="warningBirth">생일은 필수 입력값입니다.</span>
							<span class="warning">잘못된 생년월일 형식입니다. 생년월일을 정확하게 입력해주세요.</span>
						</div>
						<div class="form_line3">
							<label class="form_gender">
							<input type="radio" name="gender" value="남" checked> <span>남</span>
							</label>
							<label class="form_gender">
							<input type="radio" name="gender" value="여"> <span>여</span>
							</label>
						</div>
					</div>
					<div class="form_group">
						<div class="form_line">
							<label for="signup_input_email" class="signup_label">이메일</label>
							<input type="email" name="email" class="signup_input"
							id="signup_input_email" placeholder="이메일을 입력해 주세요"
							pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" oninput="onInputEmail()">
								<span class="warningEmail">이메일은 필수 입력값입니다.</span>
						</div>
					</div>
					<div class="form_group">
						<div class="form_line">
							<label for="signup_input_tel" class="signup_label">휴대폰 번호</label>
							<input type="text" name="phone" class="signup_input"
								id="signup_input_phone" placeholder="000-0000-0000"
								oninput="onInputPhone(this)" maxlength="13">
								<span class="warningPhone">휴대전화는 필수 입력값입니다.</span>
						</div>
					</div>
					<div class="signup_submit">
						<label for="signup_check" class="signup_label">
						<input type="checkbox" id="signup_check"> [필수] 개인정보 수집 및 이용 동의</label>
						<div class="signup_rule">
							<div class="form-agree-detail">
								<div>
									<p>(주)JobHub(이하 ‘회사’)은 아래와 같이 개인정보를 수집 및 이용합니다.</p>
								</div>
								<br>
								<div>
									<p>
										<strong>1. 수집 · 이용 항목</strong>
									</p>
									<ul>
										<li>- 이메일주소, 비밀번호, 휴대전화번호, 이름, 생년월일, 성별</li>
									</ul>
								</div>
								<div>
									<p>
										<strong>2. 수집 · 이용 목적</strong>
									</p>
									<p>수집한 개인정보는 아래 목적으로 이용됩니다.</p>
									<ul>
										<li>- 지원자 식별 및 등록, 지원자 관리</li>
										<li>- 지원의사 확인, 채용 진행</li>
										<li>- 지원 결과 조회 및 지원 이력 관리</li>
										<li>- 채용 진행을 위한 안내 및 고지사항 전달, 문의대응</li>
										<li>- 통계 및 분석, 서비스 개선, 신규서비스 개발</li>
									</ul>
								</div>
								<div>
									<p>
										<strong>3. 보유 및 이용기간</strong>
									</p>
									<p>
										<strong>지원자 계정 삭제 시 즉시 파기합니다.</strong>
									</p>
									<ul>
										<li><strong>- 또한 마지막 접속일로부터 5년간 이용하지 않으시면 자동으로
												파기합니다.</strong></li>
									</ul>
								</div>
								<div>
									<p>개인정보 수집 이용에 동의하지 않으실 수 있으며, 동의하지 않는 경우 지원자 등록이 제한됩니다.</p>
								</div>
							</div>
							<button type="button" class="signup_btn" disabled="disabled"
								id="submitBtn">등록하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../header_footer/footer.jsp"%>
	<script type="text/javascript" src="js/signup.js"></script>


</body>

</html>