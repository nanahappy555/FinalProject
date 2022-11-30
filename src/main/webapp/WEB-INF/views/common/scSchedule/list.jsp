<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
.form-group {
	display: flex
}

th {
	background-color: #B4C3FF;
	text-align: center;
}

table {
	background-color: black;
	text-align: left;
	width: 100%;
	height: 100%;
}

input {
	width: 100%;
}
table {
border-collapse: collapse
}

</style>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="main-content-jsp">

	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">

		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">


					<form>



						<!--  -->
						<table class="table">
						<!-- 	<thead> -->
								<tr>
									<th scope="row">시작일</th>

<!-- 
									<td>


										<div class="form-group">
											<select class="form-control">
												<option>연도</option>
											</select> <select class="form-control">
												<option>월</option>
											</select> <select class="form-control">
												<option>일</option>
											</select>

										</div>

									</td> -->
									
									<td>
									<select class="form-control">
												<option>연도</option>
											</select>
									</td>
									<td>
									<select class="form-control">
												<option>월</option>
											</select>
									</td>
									<td>
									<select class="form-control">
												<option>일</option>
											</select>
									</td>
									
								</tr>

						<!-- 	</thead>
							<tbody> -->
								<tr>
									<th scope="row">마감일</th>
									<!-- <td>

										<div class="form-group">
											<select class="form-control">
												<option>연도</option>
											</select> <select class="form-control">
												<option>월</option>
											</select> <select class="form-control">
												<option>일</option>
											</select>

										</div>


									</td> -->
									
									
									<td>
									<select class="form-control">
												<option>연도</option>
											</select>
									</td>
									<td>
									<select class="form-control">
												<option>월</option>
											</select>
									</td>
									<td>
									<select class="form-control">
												<option>일</option>
											</select>
									</td>
									
								</tr>
								
								<tr>
									<th scope="row">일정 내용</th>
									<td colspan="3"><input></td>
									
								</tr>


							<!-- </tbody> -->
						</table>





						<!--  -->








					</form>


					<div class="row justify-content-end mt-2 mr-2">
						<button class="btn btn-primary btn-sm" type="button" onclick="">등록</button>
					</div>



					<div class="input-group mb-3 float:right-top">
						<!-- <label for="inputName" style=margin-top:10px;>2022년도 1학기</label> -->
						<select class="form-control col-md-1" name="perPageNum"
							id="perPageNum" onchange="">
							<option value="">2022년도 1학기</option>
							<option value="">2021년도 2학기</option>
							<option value="">2021년도 2학기</option>
						</select>
						<button class="btn btn-primary mb-1" style="margin-left: 10px;"
							type="button" id="searchBtn" onclick="">검색</button>
					</div>

				</div>


				<div class="card-body border-top">
					<!--  -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">날짜</th>
								<th scope="col">내용</th>
								<th scope="col">비고</th>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td>1.1~18</td>
								<td>학위논문발표</td>
								<td>-</td>
							</tr>
							<tr>
								<td>2.20</td>
								<td>학위수여</td>
								<td>중앙예술관</td>
							</tr>
							<tr>
								<td>3.1</td>
								<td></td>
								<td>중앙예술관</td>
							</tr>
							<tr>
								<td>4.15</td>
								<td>휴일</td>
								<td>-</td>
							</tr>
						</tbody>
					</table>





					<!--  -->
				</div>
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
<div class="row"></div>
<!-- ================================================= -->
<!-- 본문2 끝 -->
<!-- ================================================= -->


</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->