<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->




<div class="row">
	

	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	
	<!-- ================================================= -->
	<!-- 카드 시작 -->
	<!-- ================================================= -->
	 <div class="card"> 
	<div class="page-header" >
	<h1 class="card-header" >경영학개론</h1>   
	<!-- <h1 class="card-header">공지사항</h1>  -->                         
</div>
	<!-- ================================================= -->
	<!-- 카드바디시작 -->
	<!-- ================================================= -->
		<div class="card-body">
		<!-- ================================================= -->
		<!-- 검색바 시작 -->
		<!-- ================================================= -->
			<div class="input-group mb-3 justify-content-end">
<!-- 				<select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
			  		<option value="10"  >정렬개수</option>
			  		<option value="2" >2개씩</option>
			  		<option value="3">3개씩</option>
			  		<option value="5" >5개씩</option>
			  	</select>
			 	<select class="form-control col-md-1" name="searchType" id="searchType">
			 		<option value=""  >검색구분</option>
					<option value="t" >글제목</option>
					<option value="w" >작성자</option>
					<option value="c" >글내용</option>	
									 									
				</select> -->
				<!-- keyword -->
				<span class="input-group-append">
					<button class="btn btn-primary btn-sm" type="button" 
							id="searchBtn" onclick="list_go(1);">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			 	<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" />
			 	<a href="#" class="btn btn-dark">검색</a>
				
			</div>
		
		
		
		</div>
		<!-- ================================================= -->
		<!-- 카드헤더 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 카드바디 시작 -->
		<!-- ================================================= -->	
	
		<div class="card-body">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">첨부파일</th>
						<th scope="col">등록일자</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					
	
					
					
						<tr>
							<td>1</td>
							<td>수업시간 변경 안내</td>
							<td><i class="fas fa-paperclip"></i></td>
							<td>2022-09-15</td>				
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>수업시간 변경 안내</td>
							<td><i class="fas fa-paperclip"></i></td>
							<td>2022-09-15</td>				
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>수업시간 변경 안내</td>
							<td><i class="fas fa-paperclip"></i></td>
							<td>2022-09-15</td>				
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>수업시간 변경 안내</td>
							<td><i class="fas fa-paperclip"></i></td>
							<td>2022-09-15</td>				
							<td>10</td>
						</tr>
						<tr>
							<td>1</td>
							<td>수업시간 변경 안내</td>
							<td><i class="fas fa-paperclip"></i></td>
							<td>2022-09-15</td>				
							<td>10</td>
						</tr>
					
				</tbody>
			</table>
		<!-- ================================================= -->
		<!-- 게시판 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->
<!-- 		<div class="row justify-content-end mt-2 mr-2">
			<button class="btn btn-outline-primary" type="button"onclick="OpenWindow('registForm.do','공지등록',800,700);">글쓰기</button>
			</div>
		</div> -->
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
		
	</div> 
	<!-- ================================================= -->
	<!-- 카드바디 끝 -->
	<!-- ================================================= -->
	
	
	</div>
	<!-- ================================================= -->
	<!-- 카드 끝 -->
	<!-- ================================================= -->
</div>





</div>
</div>
</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->

</body>
</html>