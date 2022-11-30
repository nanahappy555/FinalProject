<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/libs/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/chartist-bundle/chartist.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/morris-bundle/morris.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/c3charts/c3.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <title>Intellident</title>
<style>
.dashboard-content{
	padding: 30px 30px 0px 30px;
}
</style>
<script>
// function firstIfrOnload() {
// 	let iframe = document.querySelector("#ifr");
// 	let parentDiv = document.querySelector("#parentDiv");
	
// 	console.log("div 높이",parentDiv.scrollHeight);
// 	console.log("iframe높이",iframe.contentDocument.body.scrollHeight); //공백..
	
// 	iframe.addEventListener('load', function() {
// 		iframe.style.height = (iframe.contentDocument.body.scrollHeight) + 'px';
	
// 	});
// }
// function firstIfrOnload() {
// window.onload = () => {
// 	let iframe = document.querySelector("#ifr");
	
// 	iframe.addEventListener('load', function() {
// 		iframe.style.height = (iframe.contentDocument.body.scrollHeight +50) + 'px';
	 
// 	});
// }
	
</script>

</head>

<body style="overflow: hidden; sc">
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index">Intellident</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                          
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<%=request.getContextPath() %>/resources/img/usericon.png" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">${member.name }</h5>
                                   <!--   <span class="status"></span><span class="ml-2">예쁨학과 1학년</span>-->
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="<%=request.getContextPath()%>/common/logout.do"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="javascript:void(0);" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-fw fa-bell"></i><input type="hidden" value="${loginUser.memId }" id="memIdSpan">
                            <span class="indicator" id="alarmIcon" style="display:none;"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group" id="alarmDiv">
                                        	<div id="uchk"></div>
                                        	<div id="chk"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer" id="totalCount"> 총 알림 갯수 ( 0개 ) </div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" href="<%=request.getContextPath() %>/index?mCode=M180000" id="mailBox" role="button"  > 
                            <i class="m-r-10 mdi mdi-email"></i><span class="indicator" id="mailIcon" style="display:none;"></span> </a>
                        </li>
                    </ul>
                </div>
            </nav>
<!--             <div class="alert alert-danger" role="alert" id="alertDiv" -->
<!--             	style="position:fixed; z-index:9999; bottom:0px; right:10px; width:250px;height:150px;"> -->
<!-- 				<h4 class="alert-heading text-center">어서오세요! -->
<!-- 				<a href="#" class="close" data-dismiss="alert" aria-label="Close">  -->
<!-- 					<span aria-hidden="true">×</span></a> -->
<!-- 				</h4> -->
				
<!-- 				<p class="text-center">새로운 알림이 있습니다.</br>알림을 확인해주세요.</p> -->
<!-- 			</div> -->
<!--             <div class="alert alert-danger alert-dismissible fade show" id="alertDiv" role="alert" -->
<!--                	style="position:fixed; z-index:9999; top:70px; right:10px; display:none;"> -->
<!-- 				<strong>새 알림이 있습니다. 알림창을 확인해주세요</strong> -->
<!-- 				<a href="#" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 					<span aria-hidden="true">×</span> -->
<!-- 				</a> -->
<!-- 			</div> -->
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
         
        <div class="nav-left-sidebar sidebar-dark">
        
            <div class="menu-list">
<!--            		<div class="card" style="background-color: transparent; margin-bottom: 3px;"> -->
<!--                   <div class="card-body" style="background-color:rgba(27,26,89,0.75)"> -->
<!--                      <div class="user-avatar text-center d-block"> -->
<%--                         <img src="<%=request.getContextPath() %>/resources/img/장원영.png" alt="User Avatar" --%>
<!--                            class="rounded-circle user-avatar-xxl" style="box-shadow: 6px 3px 3px #1E3269;"> -->
<!--                      </div> -->
<!--                      <div class="text-center"> -->
<!--                         <h2 class="font-20 mb-0" style="color : white">장원영</h2> -->
<!--                         <span style="color : white">건영대학교 연예대학 예쁨학과</span><br/> -->
<!--                         <span style="color : white">1학년 1학기</span><br> -->
<!--                         <span style="color: white">2022003001</span> -->
<!--                      </div> -->
<!--                   </div> -->
                  <!-- <div class="card-body border-top">
                     <div class="">
                        <ul class="list-unstyled mb-0">
                           <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>michaelchristy@gmail.com</li>
                           <li class="mb-0"><i class="fas fa-fw fa-phone mr-2"></i>(900)
                              123 4567</li>
                        </ul>
                     </div>
                  </div> -->
<!--                </div> -->
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            
                          <c:forEach var="i" begin="0" end="${fn:length(menuList)-1}">
	                          <c:choose>
		                          <c:when test="${menuList[i].memClassCd eq 'common'}">
			                          <li class="nav-item" >
		                                <a class="nav-link active" href="#" onclick="subMenu_go('${menuList[i].mcode}','${i}'); goPage('<%=request.getContextPath() %>/${menuList[i].murl }','${menuList[i].mcode }');" data-mcode="${menuList[i].mcode}" data-toggle="collapse" aria-expanded="false" data-target="#submenu-${i}" aria-controls="submenu-${i}"><i class="${menuList[i].micon}"></i>${menuList[i].mname } <span class="badge badge-success">6</span></a>
		                                <div id="submenu-${i}" class="collapse submenu" data-mcode="${menuList[i].mcode}" style="">
		                                    <ul class="nav flex-column">
		                                        
		                                    </ul>
		                                </div>
		                            </li>
		                          </c:when>
	                         	  <c:otherwise>
			                          <sec:authorize access="hasAnyRole('${menuList[i].memClassCd}')">
			                            <li class="nav-item" >
			                                <a class="nav-link active" href="#" onclick="subMenu_go('${menuList[i].mcode}','${i}'); goPage('<%=request.getContextPath() %>/${menuList[i].murl }','${menuList[i].mcode }');" data-mcode="${menuList[i].mcode}" data-toggle="collapse" aria-expanded="false" data-target="#submenu-${i}" aria-controls="submenu-${i}"><i class="${menuList[i].micon}"></i>${menuList[i].mname } <span class="badge badge-success">6</span></a>
			                                <div id="submenu-${i}" class="collapse submenu" data-mcode="${menuList[i].mcode}" style="">
			                                    <ul class="nav flex-column">
			                                        
			                                    </ul>
			                                </div>
			                            </li>
			                            </sec:authorize>
                         		  </c:otherwise>
                             </c:choose>
                            </c:forEach>
                           
                        </ul>
                    </div>
                     
                </nav>
                 
            </div>
          
        </div>

   
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="dashboard">
                <div class="container-fluid dashboard-content " id="parentDiv" style="border: 0px solid red;">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 id="pageHeader" class="pageheader-title"><span id="pageHeaderSpan">${menu.mname }</span></h2>
                                <input type="hidden" id="currentTap"/>
                                
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
<!--                      style="overflow-x:hidden; width:100%;height:85vh;" -->
                   <iframe name="ifr" id="ifr" src="<%=request.getContextPath() %>/main.do"

                  		frameborder="0" style="height: 80vh; width:100%;overflow-x:hidden"></iframe>

            </div>
           
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                             Copyright © 2022 Intellident. All rights reserved. 대전광역시 중구 계룡로 846 
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">오시는 길</a>
                                <a href="javascript: void(0);">학생 지원 센터</a>
                                <a href="javascript: void(0);">학교 홈페이지</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    
 <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/libs/js/main-js.js"></script>

	<script>
	
	$(function(){
		
	if (localStorage.getItem("ajaxLectureList") != null) {
		return;
	}
	fetch("<%=request.getContextPath()%>/stu/lec/getLecJsonList")
	.then(response => response.json())
	.then(data => { 
		localStorage.setItem("ajaxLectureList",JSON.stringify(data));
	
	});
		
	
	});
	
	</script>

<%@ include file="./main_js.jsp" %>

</body>
</html>

