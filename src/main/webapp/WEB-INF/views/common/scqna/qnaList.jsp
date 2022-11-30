<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="scqnaList" value="${dataMap.scqnaList }" />

<style>
td {
	text-align: left;
}
</style>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">


	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			
			<!-- ================================================= -->
			<!-- 카드 시작 -->
			<!-- ================================================= -->
			<div class="card">

				<!-- ================================================= -->
				<!-- 카드바디 시작 -->
				<!-- ================================================= -->
				<div class="card-body">
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->

					<div id="keyword">
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-1" name="perPageNum" id="perPageNum"
					  		onchange="list_go(1);">
					  		<option value="10" >정렬개수</option>
					  		<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
					  		<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
					  		<option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
					  		
					  	</select>						
						<select class="form-control col-md-2" name="searchType" id="searchType">
							<option value="tcw"  ${cri.searchType eq 'tcw' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>작성자+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>작성자+제목+내용</option>
						</select>					
						<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary btn-sm" type="button" onclick="list_go(1);" 
							id="searchBtn">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>	



					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 게시판 시작 -->
					<!-- ================================================= -->


					<table class="table table-hover">
						<thead>
							<tr style="background-color:rgba(102,178,255,0.2)">
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일자</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${scqnaList}" var="list" varStatus="status">
								<tr style="cursor: pointer;" class="ckId" secretchk="${list.secretCd }"  >
									<td style="display:none">${list.scqBno }</td>
									<th>${pageMaker.totalCount - (status.index + ((cri.page-1)*cri.perPageNum)) }</th>
										<c:choose>
											<c:when test="${list.secretCd eq 'sec' }">								
												<td class="table-title">
												<c:if test="${!empty list.scRcontent }">		
													<span class="nav-item">			
														<i class="fas fa-lock"></i>&nbsp;											
														<span class="text-success">[답변완료]</span>&nbsp;
													</span>
												</c:if>
												<c:if test="${empty list.scRcontent }">		
													<span class="nav-item">			
														<i class="fas fa-lock"></i>&nbsp;											
														<span class="text-warning">[답변대기중]</span>&nbsp;
													</span>
												</c:if>
												${list.scTitle}</td>
											</c:when>
											
											
											<c:otherwise>
											
												<td class="table-title">
												<c:if test="${!empty list.scRcontent }">		
													<span class="nav-item">			
														<span class="text-success">[답변완료]</span>&nbsp;
													</span>
												</c:if>
												<c:if test="${empty list.scRcontent }">		
													<span class="nav-item">			
														<span class="text-warning">[답변대기중]</span>&nbsp;
													</span>
												</c:if>
												${list.scTitle}</td>
											</c:otherwise>
											
										</c:choose>
												
												
												
											
									<td>${list.writer}</td>
									<td><fmt:formatDate value="${list.cdate }"
											pattern="yyyy/MM/dd" /></td>
									<td>${list.viewCnt}</td>

								</tr>
							</c:forEach>


						</tbody>
					</table>

					<!-- ================================================= -->
					<!-- 게시판 끝 -->
					<!-- ================================================= -->

					<!-- ================================================= -->
					<!-- 등록 버튼 시작 -->
					<!-- ================================================= -->


					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->

				</div>
				<!-- ================================================= -->
				<!-- 카드바디 끝 -->
				<!-- ================================================= -->

				<div class="row justify-content-end mr-2"
					style="padding-right: 12px;" >		
						<button type="button" class="btn btn-md btn-primary"
							onclick="pageMove('<%=request.getContextPath()%>/common/scqna/registForm.do')"
							data-toggle="popover">글쓰기</button>
				
				</div>

				<div class="card-footer">
						<%@ include file="/WEB-INF/views/include/pagination.jsp" %>

				</div>
				<!-- ================================================= -->
				<!-- 카드 끝 -->
				<!-- ================================================= -->
			</div>


		</div>
	</div>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT 끝 -->
	<!-- ================================================= -->
</div>

<script>
var memId = '${loginUser.memId}';

	$(".ckId").click(function(event){
		var availFlag=true;
		console.log(event);
		var staffChk='${loginUser.memClassCd}';
		var secChk = event.currentTarget.getAttribute("secretchk");
		if(memId != event.currentTarget.childNodes[5].innerHTML && secChk=="sec"){
			availFlag=false;
	 	}
		if(staffChk=='staff'){
			availFlag=true;
		}
		if(availFlag){
			pageMove('<%=request.getContextPath() %>/common/scqna/detail?scqBno='+event.currentTarget.children[0].innerText);
		}else{
			alert("작성자만 접근할 수 있습니다.")
		}
		
	});

</script>
