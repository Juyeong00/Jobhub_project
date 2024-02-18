<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jobhub</title>
<link rel="shortcut icon" href="common/icon/jobhub_favicon.ico"
	type="image/x-icon">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/mainpage.css">
</head>

<body>
	<!--헤더 -->
	<%@ include file="../header_footer/header.jsp"%>

	<!--메인페이지-->
	<div class="main_container">
		<div class="main_header">


			<span class="company_title_text">One step closer</span> <span
				class="company_title_text"> to a better future</span>
			<div class="select_filter_box">

				<div class="select_category_box">
					<div>
						<select class="select_region_menu">
							<option selected disabled hidden>Region</option>
							<option>East Asia</option>
							<option>Southeast Asia</option>
							<option>North America</option>
						</select>
					</div>
					<div>
						<select class="select_career_condition">
							<option selected disabled hidden>Career Condition</option>
							<c:forEach var="career_condi" items="">
								<option>Bundang</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<select class="select_jobunit_menu">
							<option selected disabled hidden>Jobs</option>
							<c:forEach var="findJobsName" items="${findJobsName}">
								<option>${findJobsName.jobsName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="go_resume_by_filter">
					<i class="fa-solid fa-arrow-right"></i>
				</div>
			</div>
			<video class="text_area"
				src="/image/1216_1280_Compress_1_4aa78543db.mp4" muted autoplay
				loop="loop">
			</video>
			<div class="scroll_down">
				<span class="scroll_down_text">scroll</span> <span
					class="scroll_down_text"><i class="fa-solid fa-chevron-down"></i></span>
			</div>
		</div>
		<div class="main">
			<div class="company_news_boxs">
				<h2 class="company_news_title">Job Hub's NEWS</h2>
				<div class="company_news_list">
					<div class="company_news_box">
						<div class="news_1_image">
							<img src="/image/뉴스이미지1.jpg"
								style="width: 100%; height: 250px; object-fit: cover;">
						</div>
						<div class="news_box">
							<div class="news_title">인공지능 기술 개발로 혁신</div>
							<div class="news_content">"JOBHUB가 인공지능 기술을 도입하여 새로운 혁신을
								이루고 있습니다. 채용 프로세스의 효율성과 정확성을 높이는데 주력하고 있습니다. 자세한 내용은 더 많은 뉴스에서
								확인하세요."</div>
						</div>
					</div>
					<div class="company_news_box">
						<div class="news_2_image">
							<img src="/image/뉴스이미지2.jpg"
								style="width: 100%; height: 250px; object-fit: cotain;">
						</div>
						<div class="news_box">
							<div class="news_title">글로벌 인재 채용 진행 중</div>
							<div class="news_content">"JOBHUB에서는 글로벌 인재를 모집하고 있습니다. 다양한
								배경과 경험을 가진 인재들을 기다리고 있으며, 우리와 함께 일하고 싶은 분들의 지원을 기다립니다."</div>
						</div>
					</div>
					<div class="company_news_box">
						<div class="news_3_image">뉴스3이미지</div>
						<div class="news_box">
							<div class="news_title">2024년 채용 계획 발표</div>
							<div class="news_content">"2024년 JOBHUB의 채용 계획이 발표되었습니다.
								다양한 부문에서 새로운 인재들을 모집하고 있습니다. 채용에 관심이 있는 분들은 지금 지원하세요!"</div>
						</div>
					</div>
					<div class="company_news_box">
						<div class="news_4_image">뉴스4이미지</div>
						<div class="news_box">
							<div class="news_title">글로벌 사업 확장 소식</div>
							<div class="news_content">"JOBHUB이 글로벌 사업 확장에 성공적으로 나서고
								있습니다. 새로운 도전과 기회가 기다리고 있으니 함께 성장하고 싶은 분들의 지원을 기다립니다."</div>
						</div>
					</div>
				</div>
				<div class="more_about_company_news">
					<span class="more_about_text1">More about our culture ></span>
				</div>
			</div>

			<div class="company_career_boxs">
				<div class="career_image_box">
					<div class="career_image">
						<h2 class="career_title_text">Meet the Global JobHub</h2>
					</div>
				</div>
				<div class="career_category_list">
					<c:forEach var="employeeInfoList" items="${employeeInfoList}">
						<div class="category_item">
							<!--부서별 직원 인터뷰 내용 3번 반복-->
							<span class="category_title">${employeeInfoList.rootName}</span>
							<div class="employee_info">
								<span class="employee_name">${employeeInfoList.name}</span> <span
									class="employee_job">${employeeInfoList.jobsName}</span> <span
									class="employee_interview"> 직원별 인터뷰 내용 </span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="more_about_employee_info">
					<span class="more_about_text2" onclick="location.href='/people'">More
						about our JobHub ></span>
				</div>
			</div>
		</div>
	</div>

	<script>




                </script>

	<!--footer-->
	<%@ include file="../header_footer/footer.jsp"%>

</body>

</html>