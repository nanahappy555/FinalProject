<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
    
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">
        <div class="card-body">
             <div class="row">
                 <div class="col-xl-2 col-lg-4 col-md-4 col-sm-4 col-12">
                     <div class="text-center">
<!--                          <img src="ddit/resources/img/jj.jpg" alt="사용자이미지" class="rounded-circle user-avatar-xxl"> -->
                         <img src="ddit/resources/img/jj.jpg" class="img-thumbnail mr-3" alt="사용자이미지">
                     </div>
                 </div>
            	<div class="col-xl-10 col-lg-8 col-md-8 col-sm-8 col-12">
                <div class="user-avatar-info">
                    <!--  <div class="float-right"><a href="#" class="user-avatar-email text-secondary">www.henrybarbara.com</a></div> -->
                    <div class="user-avatar-address">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="card">
								<div class="card-body">
										<table class="table table-hover">
										    <thead>
										        <tr>
										            <th scope="col">학번</th>
										            <th scope="col">학년</th>
										            <th scope="col">학기</th>
										            <th scope="col">입학일</th>
										            <th scope="col">국적</th>
										            <th scope="col">연락처</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>학번</td>
										            <td>학년</td>
										            <td>학기</td>
										            <td>입학일</td>
										            <td>국적</td>
										            <td>${member.phone }</td>
										        </tr>
										    </tbody>
										   
										    <thead>
										         <tr>
										            <th scope="col">전공</th>
										            <th scope="col">제2전공</th>
										            <th scope="col">신청가능학점</th>
										            <th scope="col">휴학잔여횟수</th>
										            <th scope="col">누적휴학횟수</th>
										            <th scope="col">이메일</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>전공</td>
										            <td>영문학</td>
										            <td>신청가능학점</td>
										            <td>2</td>
										            <td>1</td>
										            <td>${member.email }</td>
										        </tr>
										    </tbody>
										    <thead>
										         <tr>
										            <th scope="col">학부</th>
										            <th scope="col">동아리</th>
										            <th scope="col">제3전공</th>
										            <th scope="col">부전공</th>
										            <th colspan="2">주소</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>학부</td>
										            <td>동아리</td>
										            <td>0</td>
										            <td>부전공</td>
										            <td colspan="2">${member.add1} ${member.add2}</td>
										        </tr>
										    </tbody>
										</table>
									<div class="row justify-content-end">
										
										<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('modify.jsp','글쓰기',800,800);" >수정하기</button>
									</div>
									</div>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	   winleft = (screen.width - WinWidth) / 2;
	   wintop = (screen.height - WinHeight) / 2;
	   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
	                     +"height="+ WinHeight +", top="+ wintop +", left=" 
	                     + winleft +", resizable=yes, status=yes"  );
	   win.focus() ; 
	}
</script>