<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<title>jsp 페이지 제목입니다</title>
</head>
<body>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="main-content-jsp">
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">
		
		
		<!-- ================================================= -->
		<!-- 탭 -->
		<!-- ================================================= -->
		<div class="pills-regular col-xl-12">
		
			<!-- ================================================= -->
			<!-- 탭LIST 시작 -->
			<!-- ================================================= -->
			<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active show" id="pills-lecnotice-tab" data-toggle="pill" href="#pills-lecnotice" role="tab" aria-controls="home" aria-selected="true">공지사항</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-lecqna-tab" data-toggle="pill" href="#pills-lecqna" role="tab" aria-controls="profile" aria-selected="false">질문게시판</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-lecassignment-tab" data-toggle="pill" href="#pills-lecassignment" role="tab" aria-controls="contact" aria-selected="false">과제/시험</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-lecmarks-tab" data-toggle="pill" href="#pills-lecmarks" role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-lecattend-tab" data-toggle="pill" href="#pills-lecattend" role="tab" aria-controls="contact" aria-selected="false">출결관리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-stumanage-tab" data-toggle="pill" href="#pills-stumanage" role="tab" aria-controls="contact" aria-selected="false">수강생관리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-materials-tab" data-toggle="pill" href="#pills-materials" role="tab" aria-controls="contact" aria-selected="false">학습자료</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="pills-reviews-tab" data-toggle="pill" href="#pills-reviews" role="tab" aria-controls="contact" aria-selected="false">강의평가</a>
				</li>
			</ul>
			<!-- ================================================= -->
			<!-- 탭 LIST 끝 -->
			<!-- ================================================= -->
			
			<!-- ================================================= -->
			<!-- 탭 CONTENT 시작 -->
			<!-- ================================================= -->
			<div class="tab-content" id="pills-tabContent">
				<!-- 탭 1 시작 -->
				<div class="tab-pane fade active show" id="pills-lecnotice" role="tabpanel" aria-labelledby="pills-lecnotice-tab">
					<div class="row justify-content-end" style="margin-bottom:10px;">
						<div id="custom-search" class="top-search-bar">
						<input class="form-control" type="text" placeholder="Search..">
						</div>
					</div>
					<!-- 게시판 -->
					<div class="row">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">First</th>
									<th scope="col">Last</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Otto</td>
									<td>@mdo</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Jacob</td>
									<td>Thornton</td>
									<td>@fat</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td colspan="2">Larry the Bird</td>
									<td>@twitter</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row justify-content-end">
						<button class="btn btn-outline-primary" type="button"onclick="">과제등록</button>
					</div>
					<!-- 페이지네이션 -->
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
					<!-- 버튼 -->
				</div>
				<!-- 탭 1 끝 -->
				<!-- 탭 2 시작 -->
				<div class="tab-pane fade" id="pills-lecqna" role="tabpanel" aria-labelledby="pills-lecqna-tab">
					<p>텍스트2</p>
				</div>
				<!-- 탭 2 끝 -->
				<!-- 탭 3 시작 -->
				<div class="tab-pane fade" id="pills-lecassignment" role="tabpanel" aria-labelledby="pills-lecassignment-tab">
					<p>텍스트3</p>
				</div>
				<div class="tab-pane fade" id="pills-lecmarks" role="tabpanel" aria-labelledby="pills-lecmarks-tab">
					<p>텍스트4</p>
				</div>
				<div class="tab-pane fade" id="pills-lecattend" role="tabpanel" aria-labelledby="pills-lecattend-tab">
					<p>텍스트5</p>
				</div>
				<div class="tab-pane fade" id="pills-stumanage" role="tabpanel" aria-labelledby="pills-stumanage-tab">
					<p>텍스트6</p>
				</div>
				<div class="tab-pane fade" id="pills-materials" role="tabpanel" aria-labelledby="pills-materials-tab">
					<p>텍스트7</p>
				</div>
				<div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">
					<p>텍스트8</p>
				</div>
			</div>
			<!-- ================================================= -->
			<!-- 탭 CONTENT 끝 -->
			<!-- ================================================= -->
									
		</div>
		<!-- ================================================= -->
		<!-- 탭 끝 -->
		<!-- ================================================= -->
	</div> 
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->
		
		
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
</body>
</html>