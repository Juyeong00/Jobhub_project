<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="  
    crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/notice_info.css">
</head>
<body>
   <!--헤더 -->
	<%@ include file="../header_footer/header.jsp" %>
	
	
    <!--공고 상세페이지 메인-->
    <div class="notice_info_container">
        <div class="notice_info_header">
            <span class="notice_title">Find Your Next Career</span>
            <div class="career_category">
                <span class="category_item">All</span>
                <span class="category_item">Engineering</span>
                <span class="category_item">Design</span>
                <span class="category_item">Planning</span>
                <span class="category_item">Business & Sales</span>
                <span class="category_item">Marketing & Comms</span>
                <span class="category_item">Corporate</span>
            </div>
        </div>
        <div class="dividing_line"></div>
        <div class="notice_list_item_box">
        <c:forEach var="jobpostingItem" items="${jobpostingList}"> 
            <div class="notice_info_title_box">
                <div class="notice_info_title_left">
                    <span class="notice_title_text">공고제목</span>
                    <div class="notice_filter">
                        <span class="notice_filter_text">공고별 필터</span>
                        <span class="notice_filter_text">|</span>
                        <span class="notice_filter_text">공고별 필터</span>
                        <span class="notice_filter_text">|</span>
                        <span class="notice_filter_text">공고별 필터</span>
                        <span class="notice_filter_text">|</span>
                        <span class="notice_filter_text">공고별 필터</span>
                    </div>
                </div>
                <div class="notice_info_title_right">
                    <i class="fa-brands fa-line notice_icon"></i>
                    <i class="fa-brands fa-facebook notice_icon"></i>
                    <i class="fa-brands fa-x-twitter notice_icon"></i>
                    <i class="fa-brands fa-linkedin round notice_icon"></i>
                    <i class="fa-solid fa-link fa-flip-vertical notice_icon"></i>
                </div>
                
            </div>
            <div class="dividing_line"></div>
            <div class="notice_info_main_box">
                <div class="notice_info_content_box">
                    <div class="notice_info_content_title_list">
                        <span class="notice_info_content_title">담당 업무</span>
                        <!--담당 업무 리스트-->
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="notice_info_content_title_list">
                        <span class="notice_info_content_title">자격 요건</span>
                        <!--자격 요건 리스트-->
                        <ul>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="notice_info_content_title_list">
                        <span class="notice_info_content_title">우대 사항</span>
                        <!--우대사항 리스트-->
                        <ul>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="notice_info_content_title_list">
                        <span class="notice_info_content_title">전형 안내</span>
                        <!--전형 안내 리스트-->
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="notice_info_content_title"> 근무 제도
                        <div class="hire_type_item">
                            <span class="notice_info_content_title_item">근무 형태</span>
                            <!--근무 형태 상세 내용-->
                            <span></span>
                        </div>
                        <div class="hire_type_item">
                            <span class="notice_info_content_title_item">근무지</span>
                            <!--근무지 상세 내용-->
                            <span></span>
                        </div>
                        <div class="hire_type_item">
                            <span class="notice_info_content_title_item">근무 시간</span>
                            <!--근무시간 상세 내용-->
                            <span></span>
                        </div>
                    </div>
                    <div class="notice_info_content_title_list">
                        <span class="notice_info_content_title">기타</span>
                        <!--기타 내용 리스트-->
                        <ul>
                            <li></li>
                        </ul>
                    </div>
                    <div class="notice_info_content_title_list">
                        <span class="notice_info_content_title">보훈 취업지원 대상 및 장애인 서류 제출 안내</span>
                        <!--보훈취업지원 등 상세 내용 -->
                        <span></span>
                    </div>
                </div>
            </div>
            <div class="dividing_line"></div>
            </c:forEach>
        </div>
        <div class="notice_page_btn">
            <button class="go_to_notice_list">목록보기</button>
            <button class="resume_btn">지원하기</button>
        </div>
        <div class="other_notice_list_box">
            <span class="other_notice_list_title">Other Jobs</span>
            <div class="other_notice_list">
                <div class="other_notice_item">
                    <span class="other_notice_title">다른공고제목</span>
                    <div class="other_notice_filter">
                        <span class="other_notice_filter_text">근무형태</span>
                        <span class="other_notice_filter_text">|</span>
                        <span class="other_notice_filter_text">직무</span>
                    </div>
                </div>
                <div class="other_notice_item">
                    <span class="other_notice_title">다른공고제목</span>
                    <div class="other_notice_filter">
                        <span class="other_notice_filter_text">근무형태</span>
                        <span class="other_notice_filter_text">|</span>
                        <span class="other_notice_filter_text">직무</span>
                    </div>
                </div>
                <div class="other_notice_item">
                    <span class="other_notice_title">다른공고제목</span>
                    <div class="other_notice_filter">
                        <span class="other_notice_filter_text">근무형태</span>
                        <span class="other_notice_filter_text">|</span>
                        <span class="other_notice_filter_text">직무</span>
                    </div>
                </div>
                <div class="other_notice_item">
                    <span class="other_notice_title">다른공고제목</span>
                    <div class="other_notice_filter">
                        <span class="other_notice_filter_text">근무형태</span>
                        <span class="other_notice_filter_text">|</span>
                        <span class="other_notice_filter_text">직무</span>
                    </div>
                </div>
                <div class="other_notice_item">
                    <span class="other_notice_title">다른공고제목</span>
                    <div class="other_notice_filter">
                        <span class="other_notice_filter_text">근무형태</span>
                        <span class="other_notice_filter_text">|</span>
                        <span class="other_notice_filter_text">직무</span>
                    </div>
                </div>
            </div>
        </div>
        
    </div>


    <!--footer-->
        <%@ include file="../header_footer/footer.jsp" %>
</body>
</html>