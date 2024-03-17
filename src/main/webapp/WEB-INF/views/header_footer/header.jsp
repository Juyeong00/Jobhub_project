<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="/css/header.css">
</head>
<body>
	<header>
		<div class="header_menu">
			<div class="header_menu1">
				<div class="header_title">
					<div class="company_title" onclick="location.href='/'">
						<img src="/admin/img/logo_250x35.png" class="header_img">
					</div>
				</div>
				<div class="header_menu1_list">
					<div class="header_menu1_list_item white_font ${page eq 'people' ? 'active' : ''}"
						onclick="location.href='/people'">People</div>
					<div class="header_menu1_list_item white_font">Culture</div>
					<div class="header_menu1_list_item white_font ${page eq 'jobs' ? 'active' : ''}"
						onclick="location.href='/jobs'">Jobs</div>
					<div class="header_menu1_list_item white_font ${page eq 'faqs' ? 'active' : ''}"
						onclick="location.href='/faqs'">FAQs</div>
				</div>
			</div>
			<div class="header_menu2">
				<i class="fa-solid fa-globe header_menu2_list1_item white_font"></i>
				<select class="header_menu2_list1_item select_country">
					<option>KR</option>
					<option>EN</option>
				</select>
				<div class="line_bar header_menu2_list1_item"></div>
				<div class="search_text header_menu2_list1_item">
					<i class="fa-solid fa-magnifying-glass white_font"></i>
				</div>
				<div class="header_menu2_list2">
					<div class="member_scrap header_menu2_list2_item white_font">
						<c:if test="${sessionScope.loginId == null}">
							<i class="fa-regular fa-heart white_font" onclick="login()"></i>
						</c:if>
						<c:if test="${sessionScope.loginId != null}">
							<i class="fa-regular fa-heart white_font red" onclick="location.href='/scrap_page'"></i>
						</c:if>

					</div>
					<c:if test="${sessionScope.loginId == null}">
						<i class="fa-solid fa-user header_menu2_list2_item white_font"
						onclick="login()"></i>
					</c:if>
					<c:if test="${sessionScope.loginId != null}">
						<i class="fa-solid fa-user header_menu2_list2_item white_font"
						onclick="location.href='/mypage'"></i>
						<i class="fa-solid fa-right-from-bracket header_menu2_list2_item white_font"
							onclick="logout()"></i>
						<form id="user_logout" method="post" action="/logout">
							<input type="hidden">
						</form>
					</c:if>
				</div>
			</div>
		</div>
	</header>

	<script>
		function login() {
			if (confirm('로그인 하셔야 이용 가능합니다. 로그인 하시겠습니까?')) {
				location.href = '/login';
			}
		}

		function logout() {
			if (confirm('로그아웃 하시겠습니까?')) {
				document.getElementById("user_logout").submit();
			}
		}

		const underline = document.querySelector('.header_menu1_list_item.active');

		if (underline) {
			underline.addEventListener('mouseenter', function() {
				underline.style.pointerEvents = 'none';
			});
		}
	</script>

</body>
</html>