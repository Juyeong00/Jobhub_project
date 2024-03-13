<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스크랩 페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" 
    integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="  
    crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="css/scrap_page.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>
   <!--헤더 -->
	<%@ include file="../header_footer/header.jsp" %>
   
   
        <!--스크랩 페이지 메인-->
        <div class="scrap_main">
            <div class="scrap_notice_title">
                <p class="scrap_notice_title_text">찜한공고</p>
            </div>
            <div class="scrap_notice_box">
                <div class="scrap_notice_left">
                    <div class="show_all_notice">
                        <div class="go_to_all_notice_page"><i class="fa-solid fa-arrow-left-long"></i> </div>
                        <div class="go_to_all_notice_page"> 진행중인 채용 전제보기</div>
                    </div>
                    <hr class="dividing_line">
                    <div class="scrap_notice_left_item_box">
                        <div class="scrap_notice_left_item_box_text">
                            <div class="notice_count">공고 총 ${scrapList.size()}건</div>
                            <input name="userId" type="hidden" value="${userId}">
                            <div class="delete_all_notice" onclick="deleteScrapList('${userId}')">전체삭제</div>
                        </div>
                        <div class="notice_box_list">
                        <c:forEach var="scrapItem" items="${scrapList}">
                        <input name="userId" type="hidden" value="${userId}">
                            <div class="notice_box">
                            	<div class="notice_box_item" onclick="showNotice('${scrapItem.postingId}')">
	                                <div class="notice_box_item_title">${scrapItem.title}</div>
	                                <input name="scrapId" type="hidden" value="${scrapItem.scrapId}" id="scrapId">
	                                <input name="postingId" type="hidden" value="${scrapItem.postingId}" id="postingId">
                                </div>
                                <div class="notice_box_item_heart"> <i class="fa-solid fa-heart scrap_heart" onclick="scrapCancle('${scrapItem.scrapId}','${scrapItem.postingId}')"></i></div>
                            </div>
                         </c:forEach>   
                        </div>
                    </div>
                </div>
                <div class="scrap_notice_right">
                    <div class="notice_list">
                    <c:choose>
	                    <c:when test="${not empty scrapList}">
		                    <c:forEach var="noticeList" items="${noticeList}">
			                    <input name="userId" type="hidden" value="${userId}">
			                    <input name="postingId" type="hidden" value="${noticeList.postingId}" id="postingId">
			                        <div class="notice_detail_box">
			                            <div class="notice_3_menu">
			                                <div class="notice_header_left">
			                                    <span class="notice_career">${noticeList.careerCondition}</span>
			                                </div>
			                                <div class="notice_header_right">
			                                <input name="scrapId" type="hidden" value="${scrapItem.scrapId}" id="scrapId">
			                                    <i class="fa-solid fa-heart notice_heart" onclick="scrapCancle('${noticeList.scrapId}','${noticeList.postingId}')"></i>
			                                    <i class="fa-solid fa-share-nodes"></i>
			                                </div>
			                            </div>
			                            <!--채용공고 제목-->
			                            <h2 class="notice_title">${noticeList.title}</h2>
			                            <div class="notice_hire_type_box">
			                                <span class="notice_hire_type">${noticeList.employmentType}</span>
			                                <span class="notice_dividing_line"> | </span>
			                                <span class="notice_date">${noticeList.postEndDate}</span>
			                            </div>
			                            <div class="use_protac"></div>
			                            <!--채용 공고 상세 내용-->
			                            <div class="notice_main_content">
			                                <div class="assigned_task_box">
			                                    <div class="assigned_task_title">담당 업무</div>
			                                    <div class="assigned_task_content">${noticeList.assignedTask}</div>
			                                </div>
			                                <div class="requiredments_box">
			                                    <div class="requiredments_title">자격 요건</div>
			                                    <div class="requiredments_content">${noticeList.requirements}</div>
			                                </div>
			                                <div class="preferential_treatment_box">
			                                    <div class="preferential_treatment_title">우대 사항</div>
			                                    <div class="preferential_treatment_content">${noticeList.preferentialTreatment}</div>
			                                </div>
			                                <div class="screening_guide_box">
			                                    <div class="screening_guide_title">전형 안내</div>
			                                    <div class="screening_guide_content">${noticeList.screeningGuide}</div>
			                                </div>
			                                <div class="work_form_box">
			                                    <div class="work_form_title">근무형태</div>
			                                    <div class="work_form_content">${noticeList.workForm}</div>
			                                </div>
			                                <div class="work_place_box">
			                                    <div class="work_place_title">근무지</div>
			                                    <div class="work_place_content">${noticeList.workPlace}</div>
			                                </div>
			                                <div class="working_hours_box">
			                                    <div class="working_hours_title">근무시간</div>
			                                    <div class="working_hours_content">${noticeList.workingHours}</div>
			                                </div>
			                                <div class="etc_box">
			                                    <div class="etc_title">기타</div>
			                                    <div class="etc_content">${noticeList.etc}</div>
			                                </div>
			                                <div class="submission_guide_box">
			                                    <div class="submission_guide_title">보훈 취업지원 대상 및 장애인 서류 제출 안내</div>
			                                    <div class="submission_guide_content">${noticeList.submissionGuide}</div>
			                                </div>
			                            </div>
			                            <div class="">
			                            	<button type="button" onclick="apply('${noticeList.postingId}')">지원하기</button>
			                            </div>
			                        </div>
		                        </c:forEach>
	                        </c:when>
	                        
	                        <c:otherwise>
		                        <div class="notice_detail_box">
		                        	찜한 공고가 없습니다.
		                        </div>
	                        </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </div>


        </div>
<script>
	function deleteScrapList(userId){
		
		<c:if test="${not empty scrapList}">
		if((confirm('찜한 모든 공고를 삭제하시겠습니까?'))){
			window.location.href='/deleteAllScrap?userId=' + userId;
			window.location.reload();
		}
		</c:if>
        
		
	}
	
	function scrapCancle(scrapId,postingId){
		console.log('scrapCancle 함수 호출' + postingId);
		if(confirm('공고를 삭제하시겠습니까?')){
			window.location.reload();
			window.location.href='/deleteScrapItem?scrapId=' + scrapId
					+ '&postingId=' + postingId;
			
		}
		
	}
	
	function apply(postingId){
		console.log('showNotice 함수 호출' + postingId);
		console.log('지원하기 버튼 누름')
		if(confirm('지원하시겠습니까?')){
			
			window.location.href='/apply?postingId=' + postingId;
		}
	}
	
	function showNotice(postingId){
		console.log('누름' + postingId);
		
		window.location.href='/showScrapNoticeInfo?postingId=' + postingId;
	}
	
	
		 
</script>		 
      <!--footer-->
        <%@ include file="../header_footer/footer.jsp" %>
</body>
</html>