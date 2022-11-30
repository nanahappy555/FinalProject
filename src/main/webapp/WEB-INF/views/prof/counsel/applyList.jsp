<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="counselProfList" value="${dataMap.counselProfList }" />
<c:set var="cri" value="${pageMaker.cri }" />

<div class="container-fluid">
	<!-- ================================================= -->
	<!-- 검색바 시작 -->
	<!-- ================================================= -->


	<div class="card">
		<div class="card-body">
			<div class="input-group mb-3 justify-content-end">
			
				<select class="form-control col-md-1" name="perPageNum"
					id="perPageNum" onchange="list_go(1);">
					<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' }>정렬개수</option>
					<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
					<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
					<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
				</select> 
				<select class="form-control col-md-1" name="orderType"id="orderType" onchange="list_go(1);">
					<option value="">정렬구분</option>
					<option value="s" ${param.orderType=='s' ? "selected":"" }>상태</option>
					<option value="sc" ${param.orderType=='sc' ? "selected":"" }>일시</option>
				</select>
				<select class="form-control col-md-1" name="searchType"id="searchType">
					<option value="">검색구분</option>
					<option value="n" ${param.searchType=='n' ? "selected":"" }>이름</option>
					<option value="p" ${param.searchType=='p' ? "selected":"" }>장소</option>
				</select>
				<!-- keyword -->
				<input class="form-control col-md-2" type="text" name="keyword"
					placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
					class="input-group-append">
					<button class="btn btn-primary btn-sm" type="button" id="searchBtn"
						onclick="list_go(1);">
						<i class="fa fa-fw fa-search"></i>
					</button>
				</span>
			</div>

			<div class="row justify-content-end mt-2 mr-2">
				<button class="btn btn-outline-primary btn-sm" type="button"
					onclick="changeStatus('ok')">승인</button>
				&nbsp;&nbsp;
				<button class="btn btn-outline-danger btn-sm" type="button"
					onclick="changeStatus('nok')">반려</button>
			</div>
			<!-- ================================================= -->
			<!-- 검색바 끝 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- 게시판 시작 -->
			<!-- ================================================= -->

			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">학번</th>
							<th scope="col">이름</th>
							<th scope="col">일시</th>
							<th scope="col">장소</th>
							<th scope="col">상태</th>
							<th scope="col">일지작성</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${counselProfList }" var="list">
							<tr class="counselList">
								<td><input type="checkbox" value="${list.counselNo }"
									name="chk" ></td>
								<td>${list.stuId }</td>
								<td>${list.stuName }</td>
								<td><fmt:formatDate value="${list.applyDate}"
										pattern="yyyy-MM-dd HH:ss" /></td>
								<td>${list.csLocation }</td>
								
								
								
								
								<c:choose>
										<c:when test="${list.appStatusCd eq '승인' }">
										<td style="color:#64CD3C">${list.appStatusCd }</td>
										</c:when>
										<c:when test="${list.appStatusCd eq '반려' }">
										<td style="color:#FF6464">${list.appStatusCd }</td>
										</c:when>
										<c:otherwise>
										<td>${list.appStatusCd }</td>
										</c:otherwise>
									</c:choose>
								
								
								<c:choose>
								  <c:when test="${empty list.counselContent}"><td></td></c:when>
								  <c:otherwise><td>작성완료</td></c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row justify-content-center">
				<%@ include file="/WEB-INF/views/include/pagination.jsp"%>
			</div>
		</div>

	</div>
</div>


	<!-- 버튼 -->
	<!-- ================================================= -->
	<!-- 게시판 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 페이지네이션 시작 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 페이지네이션 끝 -->
	<!-- ================================================= -->



	<!-- ================================================= -->
	<!-- MAIN-CONTENT 끝 -->
	<!-- ================================================= -->

<script>
	
$("input[type='checkbox']").on('click',function(){
	event.stopPropagation();
});

$('.counselList').on('click',function(e){
	
	var counselNo = e.currentTarget.children[0].children[0].defaultValue;
	
	OpenWindow("<%=request.getContextPath()%>/prof/counsel/apply/detail?counselNo="+counselNo, "상세보기", 1250, 500);
});

	
function changeStatus(st){
	
	var chkList = []
	var status = st;
	var idx = 0;
	
	var status_ko = event.target.innerHTML;
	
	var chkNode = $("input:checkbox[name='chk']:checked").each(function(){
		 chkList[idx] = $(this).val();
		 idx = idx + 1;
	});
	
	console.log(chkList);
	
	
	var paramss = {
			status:status,
			chkList:chkList
		};
	
	
	$.ajax({
		method:'post',
		url:"<%=request.getContextPath()%>/prof/counsel/apply/change",
				data : JSON.stringify(paramss),
				contentType : 'application/json; charset=utf-8',
				success : function(data) {

					$.each(chkNode, function() {
						$(this).closest('tr').children().eq(5).html(status_ko);
						$(this)[0].checked = false;
					});
					
				},
				error : function() {
					alert("에러");

				}
			});

		}
	</script>
	
	<script>
	function list_go(page,url){
		var v_orderType = $('select[name="orderType"]').val();
		var v_perPageNum = $('select[name="perPageNum"]').val();
		var v_searchType = $('select[name="searchType"]').val();
		var v_keyword = $('div.input-group>input[name="keyword"]').val();
		
		
		console.log("v_orderType",v_orderType);
		console.log("v_perPageNum",v_perPageNum);
		console.log("v_searchType",v_searchType);
		console.log("v_keyword",v_keyword);
		
		
		if(!url) url=`<%=request.getContextPath()%>/prof/counsel/apply/list?page=\${page}&orderType=\${v_orderType}
		&perPageNum=\${v_perPageNum}
		&searchType=\${v_searchType}
		&keyword=\${v_keyword}`;
		
		console.log(url);
		
		var jobForm=$('#jobForm');
		
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='orderType']").val($('select[name="orderType"]').val());
		jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
		jobForm.attr({
			action:url,
			method:'get'
		}).submit(); 
	}
	
	
	</script>
	
	