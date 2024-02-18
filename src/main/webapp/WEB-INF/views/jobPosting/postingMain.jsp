<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Jobhub</title>
<link rel="stylesheet" href="css/admin/admin.css">
<link rel="shortcut icon" href="common/icon/jobhub_favicon.ico"
	type="image/x-icon">
<script src="common/js/jquery-1.8.3.min.js"></script>
<script src="common/js/jquery-ui-1.10.3.custom.js"></script>
<script src="common/js/common.js"></script>
<script src="common/js/categorylist.js"></script>
<script src="https://kit.fontawesome.com/b158a20f5c.js"
	crossorigin="anonymous"></script>
	
</head>
<body>

 <header id="hd">
        <div id="hd_wrap">
            <h1>Jobhub 관리자 페이지</h1>
            <div id="logo"><a href="/"><img src="/img/admin/logo_wh_250x35.png"
                        alt="Jobhub logo"></a></div>
            <div id="tnb">
                <ul>
                    <li>${loginId}님</li>
                    <li><a href="/" target="_blank">Jobhub바로가기</a></li>
                    <li><a href="/admin/mypage">마이페이지</a></li>
                    <li id="tnb_logout"><a href="#">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </header>
    
     <div id="snb">
        <dl>
            <dt class="g10"><i class="fa-solid fa-people-group"></i>회원관리</dt>
            <dd class="g10"><a href="#">회원정보 조회<em>2</em></a></dd>
            <dd class="g10"><a href="#">신규회원 등록</a></dd>
            <dd class="g10"><a href="#">탈퇴자 조회</a></dd>
            <dt class="g10"><i class="fa-solid fa-people-roof"></i>직원관리</dt>
            <dd class="g10"><a href="#">직원정보 조회<em>2</em></a></dd>
            <dd class="g10"><a href="#">신규직원 등록</a></dd>
            <dt class="g10"><i class="fa-solid fa-file-lines"></i>이력서관리</dt>
            <dd class="g10"><a href="#">이력서 조회</a></dd>
            <dd class="g10"><a href="#">면접지원자 관리</a></dd>
            <dt class="g10"><i class="fa-solid fa-pen-to-square"></i>채용공고 관리</dt>
            <dd class="g10 "><a href="../jobposting">신규공고 등록</a></dd>
            <dd class="g10 active"><a href="../jobpostingMain">채용공고 조회</a></dd>
            <dt class="g10"><i class="fa-regular fa-circle-question"></i>FAQs 관리</dt>
            <dd class="g10 "><a href="../faqs">FAQs 조회</a></dd>
            <dt class="g10"><i class="fa-solid fa-gears"></i>관리자설정</dt>
            <dd class="g10"><a href="#">관리자 조회</a></dd>
            <dd class="g10"><a href="#">신규계정 생성</a></dd>
            <dd class="g10"><a href="#">계정승인요청 조회</a></dd>
        </dl>
    </div>
    
    
    <div id="wrapper">
        <div id="content">
            <div class="s_wrap">
                <h1>채용공고 조회</h1>

                <!-- 검색 -->
                <h2>검색</h2>
                <form id="fsearch" action ="">
                    <!-- <input type="hidden" name="code" value="list"> -->
                   <%--  <input type="hidden" name="postingId" value="${jobpostingItem.postingId}"> --%>
                    <div class="tbl_frm01">
                        <table class="tablef">
                            <colgroup>
                                <col class="w100">
                                <col>
                                <col class="w100">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td colspan="3">
                                       <!--  <select name="sfl" class="w120">
                                            <option value="title">제목</option>
                                            <option value="job_name">직무</option>
                                            <option >고용형태</option>
                                            
                                        </select> -->
                                        <input type="text" name="keyword" value="" class="frm_input" size="100">
                                    </td>
                                </tr>
                              <!--   <tr>
                                    <th scope="row">작성일</th>
                                    <td colspan="3">
                                        
                                        <label for="fr_date" class="sound_only">시작일</label>
                                        <input type="date" name="fr_date" value="" id="fr_date" class="frm_input w100"
                                            maxlength="10" >
                                       
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">노출상태</th>
                                    
                                    <td colspan="3">
                                        <select name="permission_code" class="w120" maxlength="10">
                                            <option value="1">O</option>
                                            <option value="2">X</option>
                                            <option value="3">S</option>
                                        </select>
                                    </td> 
                                    

                                </tr>-->
                            </tbody>
                        </table>
                    </div>
                    <div class="btn_confirm">
                        <input type="submit" value="검색" class="btn_medium">
                        <input type="button" value="초기화" id="frmRest" class="btn_medium grey"  onclick="reset()">
                    </div>
                </form>
                <!-- //검색 -->
                
                
	
<!-- 검색결과 리스트 -->
 <div class="local_ov mart30">
    총 공고 수 : <b class="fc_red">${postingCount}</b>개

    <a href="../jobposting" class="fr btn_lsmall green">신규공고 등록</a>
    
</div>
<div class="tbl_head01">
    <table>
        <colgroup>
            <col class="w100">
            <col class="w2000">
            <col class="w100">
            <col class="w100">
            <col class="w120">
            <col class="w70">
        </colgroup>
        <thead>
            <tr>
               
                <th scope="col"></th>
                <th scope="col">제목</th>
                <th scope="col">고용형태</th>
                <th scope="col">작성일</th>
                <th scope="col">노출상태</th>
                <th scope="col">수정</th>
            </tr>
        </thead>
        <tbody class="list">
            <tr class="list0">

               <c:forEach var="jobpostingItem" items="${jobpostingList}">

					<tr class="list0">
						<td>${jobpostingItem.postingId}</td>
						<td><a href="../modifyJobposting?postingId=${jobpostingItem.postingId}">${jobpostingItem.title}</a></td>
						<td>${jobpostingItem.employmentType}</td>
						<td>${jobpostingItem.postWrittenDate}</td>
						<td>${jobpostingItem.postStatus}</td>
						<td> <a href="../modifyJobposting?postingId=${jobpostingItem.postingId}" class="fr btn_lsmall green">수정</a></td>
					</tr>
	</c:forEach> 
            </tr>
        </tbody>
    </table>
</div>

</div>
</div>
</div>
    
    
    
    
	
	<!-- footer -->
    <div id="ft">
        <p>Copyright &copy; Jobhub. All rights reserved.</p>
    </div>
    <div id="ajax-loading"><img src="./sources/common/img/ajax-loader.gif"></div>
    <div id="anc_header"><a href="#anc_hd"><span></span>TOP</a></div>
    <script src="./sources/admin/js/admin.js"></script>
    <script src="./sources/common/js/wrest.js"></script>
    
    
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var chkAll = document.querySelector('input[name="chkall"]');
            chkAll.addEventListener('change', function () {
                var checkboxes = document.querySelectorAll('input[name="chk[]"]');
                checkboxes.forEach(function (checkbox) {
                    checkbox.checked = chkAll.checked;
                });
            });
        });
        
        
        function reset() {
            document.getElementById("frmRest").value = "";
        }
        
        
    </script>


</body>
</html>