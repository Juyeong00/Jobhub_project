<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jobhub</title>
<link rel="shortcut icon" href="common/icon/jobhub_favicon.ico"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/notice_by_career.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">


<style>
.description-container {
	padding: 30px;
	padding-top: 10px;
}

.notice_list_item, .notice_info_title {
	padding-top: 10px;
	font-size: 17px;
	font-weight: bold;
}

.notice_info_title {
	font-size: 27px;
	font-weight: bold;
}

#submitBtn {
	text-align: center;
	align-items: center;
	height: 50px;
	width: 200px;
	color: white;
	background-color: green;
	margin-left: 500px;
}

.descriptionLabel {
	font-weight: bold;
}
</style>
</head>

<body>
	<%@ include file="../header_footer/header.jsp"%>

	<!--부서별 공고페이지 메인-->
	<div class="container">
		<input type="hidden" id="loginId" value="${loginId}">
		<div class="notice_box_container">
			<div class="notice_info_header">
				<span class="notice_title">Find Your Next Career</span>
				<div class="company_advertising_slide"></div>

				<div class="career_category">

					<span class="category_item"><a href="/jobs">ALL</a></span>

					<c:forEach var="jobItem" items="${jobList}">
						<c:choose>
							<c:when test="${jobItem.jobsLevel == 1}">

								<span class="category_item"><a
									href="../list?jobsCateName=${jobItem.jobsName}">${jobItem.jobsName}</a></span>

							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="dividing_line"></div>
			<div class="description-container">
				<div class="notice_list_item">
					<div class="notice_info_title">
						${jobpostingById.title}
						<div class="notice_filter">
							<span class="notice_filter_text">${jobpostingById.employmentType}
								|</span> <span class="notice_filter_text">${jobpostingById.jobsCateName}
								|</span> <span class="notice_filter_text">${jobpostingById.jobsItemName}
								|</span> <span class="notice_filter_text">${jobpostingById.careerCondition}</span>
						</div>
					</div>
					<br>
				</div>
				<form method="get" action="/jobsDescription" id="form">
					<input type="hidden" name="postingId" value="${postingId}">
					<label class="descriptionLabel">-담당업무</label>
					<div>${descriptionById.assignedTask}</div>
					<br> <label class="descriptionLabel">-자격요건</label>
					<div>${descriptionById.requirements}</div>
					<br> <label class="descriptionLabel">-우대사항</label>
					<div>${descriptionById.preferentialTreatment}</div>
					<br> <label class="descriptionLabel">-전형안내</label>
					<div>${descriptionById.screeningGuide}</div>
					<br> <label class="descriptionLabel">-근무형태</label>
					<div>${descriptionById.workForm}</div>
					<br> <label class="descriptionLabel">-근무지</label>
					<div>${descriptionById.workPlace}</div>
					<br> <label class="descriptionLabel">-근무시간</label>
					<div>${descriptionById.workingHours}</div>
					<br> <label class="descriptionLabel">-기타</label>
					<div>${descriptionById.etc}</div>
					<br> <label class="descriptionLabel">-보훈 취업지원 대상 및 장애인
						서류 제출안내</label>
					<div>${descriptionById.submissionGuide}</div>
					<br>
					<div class="btn_confirm">
						<input type="submit" value="지원하기" id="submitBtn">
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
		let loginId = document.getElementById('loginId');
		let form = document.getElementById('form');
		document.getElementById("submitBtn").addEventListener("click", function (event) {
			var confirmation = confirm("지원하겠습니까?");

			// 확인을 눌렀을 경우
			if (confirmation) {
				if (loginId.value == '') {
					alert('로그인 후 이용가능합니다');
					event.preventDefault();
				} else {

					form.action = "/apply";
					// 폼 제출
					return true;
				}
			} else {
				// 취소를 눌렀을 경우
				// 폼 제출 취소
				event.preventDefault();
				return false;
			}
		});
	</script>

	<%@ include file="../header_footer/footer.jsp"%>
</body>
</html>