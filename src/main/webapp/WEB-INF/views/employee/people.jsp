<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="/css/people.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/footer.css">

</head>
<body>
	<!--헤더 -->
	<!-- 이미지출처: https://generated.photos/faces  (ai 이미지) -->
	<%@ include file="../header_footer/header.jsp"%>

	<!--부서별 공고페이지 메인-->
	<div class="container">
		<div class="notice_info_header">
			<span class="notice_title">Meet the Global JobHub</span>
			<div class="career_category">
				<span class="category_item active"><a href="/people" class="p_sub_tab_title">ALL</a></span>
				<c:forEach var="jobItem" items="${jobList}">
					<c:choose>
						<c:when test="${jobItem.jobsLevel == 1}">
							<span class="category_item">
							<a href="people?jobsName=${jobItem.jobsName}" class="p_sub_tab_title">${jobItem.jobsName}</a>
							</span>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<div class="dividing_line"></div>
		<div class="notice_info_main"></div>
	</div>
	
	<div class="p_container">
		<ul class="peopleList">
			<c:forEach var="empList" items="${empList}">
				<li class="itemList">
					<div class="img_area">
						<img class="img" src="${empList.filePath}${empList.originalFileName}">
					</div>
					<div class="text_area">
						<span class="name">${empList.name}</span> <span class="position">${empList.jobsName}</span>
						<span class="email">${empList.email}</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>

	<!--footer-->
	<%@ include file="../header_footer/footer.jsp"%>
	<script src="js/people.js"></script>
</body>
</html>