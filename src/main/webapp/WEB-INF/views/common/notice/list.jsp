<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="scNoticeList" value="${dataMap.scNoticeList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />



<body>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">



<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	
	<!-- ================================================= -->
	<!-- 카드 시작 -->
	<!-- ================================================= -->
	<div class="card" style=positon:relative;top:-30px;>
	
	<!-- ================================================= -->
	<!-- 카드바디시작 -->
	<!-- ================================================= -->
		<div class="card-body" style=position:relative;top:25px;>
			
		<!-- ================================================= -->
		<!-- 검색바 시작 -->
		<!-- ================================================= -->
			<div id="keyword">
				<!-- <h2 class="d-flex align-items-center" style=position:relative;top:60px;>&nbsp;<i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;공지사항</h2> -->
					<div class="input-group mb-3 justify-content-end" style=position:relative;top:10px;>
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
							<%-- <option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
							<option value="tw" ${cri.searchType eq 'tw' ? 'selected':'' }>제목+작성자</option> --%>							
			
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
					<tr style="background-color:rgba(102,178,255,0.2)">	
						<th scope="col" style=width:200px;></th>
						<th scope="col" style="width:600px; text-align:center">제목</th>
						<th scope="col" style=width:200px;>작성일자</th>
						<th scope="col" style=width:200px;>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty scNoticeList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${scNoticeList }" var="list" varStatus="status">
						<c:choose>
						<c:when test ="${list.markCd eq 'mark'}">
						<tr style='font-size: 0.95em; cursor:pointer; color:#5969FF;' class="ckId" markChk="${list.markCd}" onclick="pageMove('<%=request.getContextPath()%>/common/notice/detail.do?scNno=${list.scNno}')">
							<td style="font-weight:900;"><span class="badge badge-primary">중요</span><div class="hiddenscNno" style="display:none;">${list.scNno }</div></td>	
							<th style="color:#5969FF; text-align:left;">${list.title}</th>
							<th style="color:#5969FF;"><fmt:formatDate value="${list.cdate }" pattern="yyyy/MM/dd"/></th>
							<th style="color:#5969FF;">${list.viewCnt }</th>
						</tr>
						</c:when>
						<c:otherwise>
							
						<tr style='font-size: 0.95em; cursor:pointer;'  class="ckId" markChk="${list.markCd}" onclick="pageMove('<%=request.getContextPath()%>/common/notice/detail.do?scNno=${list.scNno}')">
							<%-- <td text-align="center">${list.scNno }</td> --%>
							<th>${pageMaker.totalCount - (status.index + ((cri.page-1)*cri.perPageNum)) }</th>	
							<td style="text-align:left;">${list.title}</td>
							<td><fmt:formatDate value="${list.cdate }" pattern="yyyy/MM/dd"/></td>
							<td>${list.viewCnt }</td>
						</tr>
							
						</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		<!-- ================================================= -->
		<!-- 게시판 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->
		<div class="row justify-content-end mt-2 mr-2">
			<sec:authorize access="hasAnyRole('staff')">
			<button class="btn btn-primary" type="button" style=margin-bottom:10px;
				onclick="pageMove('<%=request.getContextPath()%>/common/notice/registForm');">글쓰기</button>
			</sec:authorize>
		</div>
		<!-- ================================================= -->
		<!-- 등록 버튼 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 페이지네이션 시작 -->
		<!-- ================================================= -->
		<div class="card-footer">
		<%@ include file="/WEB-INF/views/include/pagination.jsp" %>
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
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->

<script>
$(function(){

var memClass = '<%=request.getAttribute("memClassCd")%>';
console.log("멤버클래스" , memClass);
});







</script>


<c:if test="${from eq 'regist' }">
<script>
$(function(){
	
Swal.fire('등록하였습니다.', '', 'success');
});

</script>
</c:if>	


</body>
</html>