<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
<!-- ================================================= -->
<div class="card">
		<div class="card-body">
<!-- ================================================= -->
		<div class="main-content-jsp">
		    
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
											<h3 class="card-header"><i class="fas fa-id-card"></i>&nbsp;&nbsp;${student.name }님의 정보</h3>
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
												            <td>${student.stuCd }</td>
												            <td>${student.grade }</td>
												            <td>${student.stuSemester }</td>
												            <td>
															<fmt:formatDate value="${student.admDate }" pattern="yyyy-MM-dd"/>
												            </td>
												            <td>${student.nation }</td>
												            <td>${student.phone }</td>
												        </tr>
												    </tbody>
												   
												    <thead>
												         <tr>
												            <th scope="col">전공</th>
												            <th scope="col">제2전공</th>
												            <th scope="col">제3전공</th>
												            <th scope="col">부전공</th>
												            <th scope="col">휴학잔여횟수</th>
												            <th scope="col">누적휴학횟수</th>
												        </tr>
												    </thead>
												    <tbody>
												        <tr>
												          <td>${stuMajor[0].majorCd}</td>
												            <td>${stuMajor[1].majorCd}</td>
												            <td>${stuMajor[2].majorCd}</td>
												            <td>${stuMajor[4].majorCd}</td>
												            <td>${4-student.tlTryCount }</td>
												            <td>${student.tlTryCount }</td>
												        </tr>
												    </tbody>
												    <thead>
												         <tr>
												            <th scope="col">학부</th>
												            <th scope="col">동아리</th>
												            <th scope="col">이메일</th>
												            <th colspan="3">주소</th>
												        </tr>
												    </thead>
												    <tbody>
												        <tr>
												            <td>${colName}</td>
												            <td>${club}</td>
												            <td>${student.email }</td>
												            <td colspan="3">${student.add1} ${student.add2}</td>
												        </tr>
												    </tbody>
												    <thead>
												         <tr>
												            <th colspan="2">예금주</th>
												            <th colspan="2">은행명</th>
												            <th colspan="2">계좌번호</th>
												        </tr>
												    </thead>
												    <tbody>
												        <tr>
												            <td colspan="2">${student.accHolder}</td>
												            <td colspan="2">${student.bankName}</td>
												            <td colspan="2">${student.accNum}</td>
												        </tr>
												    </tbody>
												</table>
											</div>
										</div>
										<div class="row justify-content-end">
											<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/aca/info/modifyForm.do','글쓰기',500,1000);" >수정하기</button>
										</div>
									</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
			</div>
			 </div>
			

<c:if test="${from eq 'modify'}" >
	<script>
		alert("${student.name}님의 정보가 수정되었습니다.");	
		window.close();
		window.opener.location.reload();			
	</script>
</c:if>
</div>
<!-- </div> -->

	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
<!-- </div> -->
<!-- </div> -->

<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->