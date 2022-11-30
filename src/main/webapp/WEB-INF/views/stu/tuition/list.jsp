<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<div class="card-body">
		<div class="main-content-jsp">
   
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	 
	<!-- ================================================= -->
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">
	<h3 class="card-header">등록금 납부 현황</h3>	
		<div class="card-body">

			
		            	<div class="form-group row row justify-content-left mr-3">
							<div class="col-1">
								<select class="form-control form-control-sm">
									<option>2022</option>
									<option>2021</option>
									<option>2020</option>
									<option>2019</option>
								</select>
							</div>
							<button type="button" class="btn-sm btn btn-primary">검색</button>
						</div>
		        

			<table class="table table-hover">		
			    <thead>
			        <tr>
			            <th style="width: 10%">글번호</th>
			            <th style="width: 25%">구분</th>
			            <th style="width: 25%">납입금</th>
			            <th style="width: 15%">납부기한</th>
			            <th style="width: 10%">납부여부</th>
			            <th style="width: 15%">고지서</th>

			        </tr>
			    </thead>
			    <tbody>
			    <c:forEach items="${tuitionList}" var="tui" varStatus="status">
			        <tr>
			            <th scope="row">${tui.tuitionSeq}</th>
			            <td>
			            	${fn:substring(tui.semeCd,0,4)}년도 ${fn:substring(tui.semeCd,4,6)}학기 등록금
			            	<!--<fmt:formatNumber value="${tui.semeCd}" pattern="##학기"/>-->
			            </td>
			            <td>
			            	<fmt:formatNumber value="${tui.amount}" type="currency"/>
			            </td>
			            <td>
			            	<fmt:formatDate value="${tui.paymentDate}" pattern="yyyy년 MM월 dd일 까지"/>
			            </td>
			            <td>${tui.payStatusCd}</td>
			            <td>
			            	<a href="파일 경로/파일이름.확장자" download><button class="btn-sm btn btn-secondary">pdf</button></a>
			            </td>
			        </tr>
			    </c:forEach>
			    </tbody>
			</table>
		</div>
	</div>
</div>
	</div> 
	<!-- ================================================= -->
		
		
		</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
