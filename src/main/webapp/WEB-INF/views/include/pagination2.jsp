<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="assignmentPageMaker" value="${assignemtDataMap.assignmentPageMaker }" />
<c:set var="assignmentCri" value="${assignemtDataMap.assignmentPageMaker.cri }" />

<form id="jobForm">	
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>
 
 
 	<!-- pagination -->
			<nav aria-label="Navigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item">
			<a class="page-link" href="javascript:list_go(1);">
				<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go('${assignmentPageMaker.prev ? assignmentPageMaker.startPage-1 : assignmentCri.page}');">
				<i class="fas fa-angle-left"></i>
			</a>						
		</li>
	
	<c:forEach var="pageNum" begin="${assignmentPageMaker.startPage }" end="${assignmentPageMaker.endPage }" >
		<li class="page-item ${assignmentCri.page == pageNum?'active':''}">
			<a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
		</li>
	</c:forEach>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go('${assignmentPageMaker.next ? assignmentPageMaker.endPage+1 :assignmentCri.page}');">
				<i class="fas fa-angle-right" ></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go('${assignmentPageMaker.realEndPage}');">
				<i class="fas fa-angle-double-right"></i>
			</a>
		</li>	
	</ul>
</nav>   