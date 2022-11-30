<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
		<div class="card-body">
<div class="main-content-jsp">
    
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->

	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header"><i class="fas fa-clipboard"></i>&nbsp;&nbsp;유의사항</h3>
				
				<div class="card-body">
					<ul>
						<li>신청 할 수 있는 대학, 학과, 전공이 맞는지 다시 확인해주세요.</li>
						<li>신청 기준을 자동으로 체크하고 기준에 맞지 않는 경우 신청이 불가능합니다.</li>
			        </ul>
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
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">	
		<div class="card-body">
			<table class="table table-hover">
			    <thead>
			        <tr>
			        	<th>신청학년도</th>
			        	<th>학기</th>
			        	<th>신청일자</th>
			            <th>분과대학</th>
			            <th>학과(부)</th>
			            <th>전공</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			        	<td style="width : 10%">2022</td>
			        	<td style="width : 5%">1</td>
			        	<td style="width : 20%">2022-09-22</td>
			            <td style="width : 15%">인문대학</td>
			            <td style="width : 25%">아시아언어문명학부</td>
			            <td style="width : 25%">인도언어문명전공</td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>
		</div>
	</div> 
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->

		<div class="card">	
			<div class="card-body">
				<div class="form-group row">
					<label for="inputText" class="col-3 col-lg-1 col-form-label text-right">연락처</label>
					<div class="col-3">
						<div class="input-group-append">
							<input type="text" class="form-control form-control-sm" placeholder="000 - 0000 - 0000">
								<button type="button" class="btn-sm btn btn-primary">수정하기</button>
						</div>
						<h6>*최신 연락처로 변경해주세요.</h6>
					</div>
				</div>
			</div>
		</div>

		
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
		<div class="row justify-content-end mr-3">
			<a href="#" class="btn btn-outline-primary">신청</a>&nbsp;&nbsp;
			<a href="#" class="btn btn-outline-danger">취소</a>
		</div>
	</div>
</div>