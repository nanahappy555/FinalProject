<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="lectureList" value="${dataMap.lectureList }" />



<style>
.card-header {
	background-color: #5969FF;
	height: 60px;
	text-align: center;
	color: white;
	font-size: 30px;
}
</style>


<div class="container-fluid">
	<%--한줄 시작 ---------------------------------------------------------%>
	<div class="row">
		<c:forEach items="${lectureList }" var="list">
			<div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12" >
				<div class="card" style="cursor:pointer;" onclick="pageMoveInIfr('<%=request.getContextPath() %>/prof/lec/main.do?lecCd=${list.lecCd}')">
					<div class="card-header"
						style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${list.subjName }</div>
					<h3>
						<br>강의실 : ${list.classroom }
					</h3>
					<h3>${list.lecDate1 }</h3>
					<h3>${list.lecDate2 }</h3>
					
				</div>
			</div>
		</c:forEach>
	</div>
	<%--한줄 끝 ---------------------------------------------------------%>
	<div class="row">

		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card" style="height: 350px;">
				<div class="card-body" id="noticeCardBody">
					<h2>
						<i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;다가오는 일정
					</h2>
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->

					<table class="table table-hover">
						<thead>
							<tr style="background-color: rgba(102, 178, 255, 0.2)">
								<th scope="col">과목명</th>
								<th scope="col">날짜</th>
								<th scope="col">강의실</th>
								<th scope="col">구분</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${upcomingExamList }" var="list">
								<tr>
									<td>${list.subjName }</td>
									<td><fmt:formatDate value="${list.examDate }" pattern="yyyy-MM-dd"/></td>
									<td>${list.examCr }</td>
									<td>${list.examDivName }</td>
									</tr>
							</c:forEach>

						</tbody>
					</table>


				</div>



			</div>
		</div>


		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card" style="height: 350px;">
				<div class="card-body" id="qnaCardBody">
					<h2>
						<i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;답변 대기중인 질문게시판
					</h2>
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->

					<table class="table table-hover">
						<thead>
							<tr style="background-color: rgba(102, 178, 255, 0.2)">
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${lecQnaList }" var="list">
								<tr style="cursor: pointer;"
									onclick="OpenWindow('${webPath}/prof/lec/qna/detail?lecCd=${list.lecCd }&lecqBno=${list.lecqBno }','질문상세보기',800,600);">
									<td>${list.title }</td>
									<td>${list.stuName }</td>
									<td><fmt:formatDate value="${list.cdate }" pattern="yyyy-MM-dd"/></td>
									</tr>
							</c:forEach>
												

										</tbody>
									</table>
<div class="row justify-content-end mt-2 mr-2">
</div>

</div>
									
									
								</div>
							</div>
					
					
					
							
						</div>
	
</div>	

<script>
	function pageMoveInIfr(url) {
		$('iframe[name="ifr"]', parent.document).attr("src", url);
	}
</script>
