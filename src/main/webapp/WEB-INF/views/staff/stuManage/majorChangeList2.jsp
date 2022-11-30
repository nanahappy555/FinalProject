<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<style>
.lecInfo {
	width: 90px;
	height: 50px;
	background-color: #5969FF;
	color: white;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	border-radius: 15px;
	line-height: 50px;
	display: inline-block;
	margin-left: 10px;
	margin-bottom:15px;
}
</style>

<!--  <div class="row">
	<select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">	
		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >휴학</option>
		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >복학</option>
	</select>	  		
</div> -->


<div class="card">
	<div class="card-body">

<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
	
	<!-- ================================================= -->
	<!-- 카드바디 시작 -->
	<!-- ================================================= -->
			<div class="card-body" style=margin-bottom:-25px;>
			<!-- ================================================= -->
			<!-- 검색바 시작 -->
			<!-- ================================================= -->
				<div class="input-group mb-3 justify-content-center" >
					
				&nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">분과대학</div>&nbsp;&nbsp;
					<select class="form-control col-md-2" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
				  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >전체</option>
				  		<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>인문대학</option>
				  		<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>사범대학</option>
				  		<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>이공대학</option>
				  	</select>
				  	
				&nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">소속학과</div>&nbsp;&nbsp;
				 	<select class="form-control col-md-2" name="searchType" id="searchType">
				 		<option value=""  >전체</option>
						<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
						<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
						<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>	
										 									
					</select>
				&nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">검색</div>&nbsp;&nbsp;
				 	<!--  <input id="inputText3" type="text" class="form-control" style="width:30px;height:20	px;font-size:10px;">-->
				 	<input class="form-control col-md-2" type="text" name="keyword" style="width:30px; height:40px; font-size:14px;" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
					<span class="input-group-append" >
						<button class="btn btn-primary btn-xs" style="width:45px; height:40px; type="button" 
								id="searchBtn" onclick="list_go(1);">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
					<div class="row justify-content-end" style="padding-left:50px; height:40px;">
						<button class="btn btn-outline-primary btn-md" type="button"onclick="">승인</button>&nbsp;&nbsp;
						<button class="btn btn-outline-danger btn-md" type="button"onclick="">반려</button>
					</div>
				</div>
		
			</div>
		</div>	
	</div>
</div>			
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
		
			<table class="table table-hover">
				<thead>
					<tr>
					<style>
					tr>th{
   					background-color: #cce5ff;
					}
					</style>
						<th scope="col"></th>
						<th scope="col">신청번호</th>
						<th scope="col">학번</th>
						<th scope="col">학년</th>
						<th scope="col">학기</th>
						<th scope="col">이름</th>
						<th scope="col">신청일</th>
						<th scope="col">소속분과대학</th>
						<th scope="col">소속학과</th>
						<th scope="col">희망학과</th>
						<th scope="col">연락처</th>
						<th scope="col">처리상태</th>
		
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stList}" var="majorChange">
						<tr>
							<td><input type="checkbox"></td>
							<td>${majorChange.majorChaSeq}</td>
							<td>${majorChange.stuCd }</td>
							<td>${majorChange.grade}</td>
							<td>${majorChange.stuSemester}</td>
							<td>${majorChange.name}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${majorChange.applyDate}"/></td>
							<td>${majorChange.colName }</td>
							<td>${majorChange.presentMajorName }</td>
							<td>${majorChange.hopeMajorName}</td>
							<td>${majorChange.phone}</td>
							<td>${majorChange.applyStatusCd }</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</div>		
		<!-- ================================================= -->
		<!-- 게시판 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->



		<!-- ================================================= -->
		<!-- 등록 버튼 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 페이지네이션 시작 -->
		<!-- ================================================= -->
		<div class="row justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">«</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">»</span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</nav>
		</div>
		<!-- ================================================= -->
		<!-- 페이지네이션 끝 -->
		<!-- ================================================= -->
		
	
	<!-- ================================================= -->
	<!-- 카드바디 끝 -->
	<!-- ================================================= -->
	
	
	
	<!-- ================================================= -->
	<!-- 카드 끝 -->
	<!-- ================================================= -->



	</div>
</div>





<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->