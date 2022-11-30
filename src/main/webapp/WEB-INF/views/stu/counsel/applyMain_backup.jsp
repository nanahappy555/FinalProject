<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<h3 class="card-header" style="color: #5969FF; font-weight: bold;">지도교수</h3>
	<div class="card-body">
		<div class="main-content-jsp">
		    <div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 col12">
		<!-- <div class="pl-xl-3"> -->
		<!-- <div class="m-b-0"> -->
		<!-- <div class="user-avatar-name d-inline-block"> -->
					<c:forEach items="${ profList}" var="prof">
						<div class="card">
							<div class="card-body">
								<div class="row align-items-center">
									<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="user-avatar float-xl-left pr-4 float-none">
										<img src="assets/images/avatar-1.jpg" alt="사용자 사진" class="rounded-circle user-avatar-xl">
										</div>
									</div>
										
									<div class="col-xl-6 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="user-avatar-name d-inline-block">
											<h2 class="font-24 m-b-10" style="font-weight: bold;">${prof.name }&nbsp;교수</h2>
										</div>
										<table>
									        <tr>
									            <th>학과/전공&nbsp;&nbsp;</th>
									            <td>${prof.majorName }</td>
									        </tr>
									        <tr>
									            <th>연락처</th>
									            <td>${prof.phone }</td>
									        </tr>
									        <tr>
									            <th>이메일</th>
									            <td>${prof.emailAddr }</td>
									        </tr>
										</table>
									</div>
									<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="float-xl-right float-none mt-xl-0 mt-4">
											<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/counsel/registForm?profCd=${prof.profCd }','글쓰기',650,750);" >신청하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					

			</div>		
			</div>
				<!-- ================================================= -->
<!-- 페이지네이션 시작 -->
<!-- ================================================= -->
<!-- ================================================= -->
<!-- 페이지네이션 끝 -->
<!-- ================================================= -->
		</div>
	</div>
</div>



			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->
			<!-- ================================================= -->
			<!-- 본문1 끝 -->
			<!-- ================================================= -->
		
			<!-- ================================================= -->
			<!-- 본문 2 -->
			<!-- ================================================= -->
		
		<!-- </div> -->
		
			<!-- ================================================= -->
			<!-- 본문2 끝 -->
			<!-- ================================================= -->
		<!-- </div> -->
		<!-- </div> -->
		
		<!-- ================================================= -->
		<!-- MAIN-CONTENT 끝 -->
		<!-- ================================================= -->