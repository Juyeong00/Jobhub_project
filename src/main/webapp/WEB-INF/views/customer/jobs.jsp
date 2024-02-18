<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="en">
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

</head>
<body>
	<!--헤더 -->
	<%@ include file="../header_footer/header.jsp"%>


	<!--부서별 공고페이지 메인-->
	<div class="container">
		<div class="notice_box_container">
			<div class="notice_info_header">
				<span class="notice_title">Find Your Next Career</span>
				<div class="company_advertising_slide">
					<img src=""> <img src=""> <img>
				</div>

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
			<div class="notice_info_main"></div>

			<div class="notice_list_box">
				<!-- notice_by_career.jsp -->
				<form action="/jobs" method="get">
					<div class="search_jobs_box">
						<i class="fa-solid fa-magnifying-glass search_icon"></i> <input
							type="text" placeholder="Search Jobs" class="search_jobs"
							name="keyword">

						<button type="submit">검색</button>
					</div>
				</form>
				<span class="notice_guide_text">${postingCount}개의 채용공고가 있습니다</span>

				<c:forEach var="jobpostingNameItem" items="${jobpostingNameList}">
					<%--  <c:if test="${jobpostingNameItem.postStatus = 'O'} " > --%>
					<div class="notice_list_item">
						<div class="notice_info_title">
							<a
								href="../jobsDescription?postingId=${jobpostingNameItem.postingId}">${jobpostingNameItem.title}</a>
							<div class="notice_filter">
								<span class="notice_filter_text">${jobpostingNameItem.employmentType}
									|</span> <span class="notice_filter_text">${jobpostingNameItem.jobsCateName}
									|</span> <span class="notice_filter_text">${jobpostingNameItem.jobsItemName}
									|</span> <span class="notice_filter_text">${jobpostingNameItem.careerCondition}</span>
							</div>
						</div>
						<div class="">
							<c:choose>
								<c:when test="${sessionScope.loginId != null}">
									<input type="hidden" value="${jobpostingNameItem.postingId}"
										name="postingId">
									<input type="hidden" value="${sessionScope.loginId}"
										name="userId">

									<c:choose>
										<c:when test="${empty scrapList}">
											<!-- 사용자의 스크랩 목록이 비어있는 경우 -->
											<i class="fa-regular fa-heart notice_filter_text scrap"
												onclick="scrap('${jobpostingNameItem.postingId}','${sessionScope.loginId}')"></i>
										</c:when>
										<c:otherwise>
											<!-- 사용자의 스크랩 목록에 있는 경우 -->
											<c:set var="isScrapped" value="false" />
											<c:forEach var="scrapItem" items="${scrapList}">
												<c:if
													test="${scrapItem.postingId eq jobpostingNameItem.postingId}">
													<!-- 해당 공고가 스크랩되어 있는 경우 -->
													<i class="fa-solid fa-heart notice_filter_text scrap"
														onclick="scrapCancle('${jobpostingNameItem.postingId}', '${scrapItem.scrapId}')"></i>
													<c:set var="isScrapped" value="true" />
												</c:if>
											</c:forEach>
											<!-- 해당 공고가 스크랩되어 있지 않은 경우 -->
											<c:if test="${not isScrapped}">
												<i class="fa-regular fa-heart notice_filter_text scrap"
													onclick="scrap('${jobpostingNameItem.postingId}','${sessionScope.loginId}')"></i>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<i class="fa-regular fa-heart notice_filter_text scrap"
										onclick="notLoginScrap()"></i>
								</c:otherwise>
							</c:choose>
							<span class="notice_deadline">${jobpostingNameItem.applicationStart}
								~ ${jobpostingNameItem.applicationDeadline}</span>
						</div>
					</div>
					<%--  </c:if> --%>
				</c:forEach>

			</div>
		</div>
	</div>

	<script>
        
        function scrap(postingId, userId){
        	if(confirm('스크랩 하시겠습니까?')){
        		window.location.href='/scrapNotice?postingId=' + postingId
        				+ '&userId=' + userId;
        	}
        }
        
        function notLoginScrap(){
        	if(alert('로그인 하셔야 스크랩이 가능합니다.')){
        		window.location.href='/login';
        	}
        }
        
        function scrapCancle(postingId,scrapId){
    		if(confirm('공고를 삭제하시겠습니까?')){
    			
    			window.location.href='/deleteScrapItem?scrapId=' + scrapId
    					+ '&postingId=' + postingId;
    		}
    		
    	}
        
        
    </script>


	<!--footer-->
	<%@ include file="../header_footer/footer.jsp"%>
</body>
</html>