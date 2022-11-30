<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="stList" value="${dataMap.selectStaffMajorChangeList }" />
<c:set var="cri" value="${pageMaker.cri }" />



<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<style>
.lecInfo {
	width: 90px;
	height: 50px;
	background-color: #5969FF;
	color: white;
	text-align: center;
	font-size: 20px;
	font-weight: bold;
	border-radius: 15px;
	line-height: 50px;
	display: inline-block;
	margin-left: 10px;
	margin-bottom:15px;
}

tr>th{
	background-color: #cce5ff;
}
</style>


<div class="card">
	<div class="card-body">

<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
	
	<!-- ================================================= -->
	<!-- 카드바디 시작 -->
	<!-- ================================================= -->
			<div class="card-body" style=margin-bottom:2px;>
			<!-- ================================================= -->
			<!-- 검색바 시작 -->
			<!-- ================================================= -->
		
			<div id="keyword">
				<div class="input-group mb-3 justify-content-end">
					<select class="form-control col-md-1" name="perPageNum"
						id="perPageNum" onchange="list_go(1);">
						<option value="10">정렬개수</option>
						<option value="2" ${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>
						<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
						<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
						<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
						<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>

					</select> <select class="form-control col-md-2" name="searchType"
						id="searchType">
						<option value="" ${cri.searchType eq '' ? 'selected':'' }>검색조건</option>
						<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>분과대학</option>
						<option value="p" ${cri.searchType eq 'p' ? 'selected':'' }>소속학과</option>
						<option value="h" ${cri.searchType eq 'h' ? 'selected':'' }>희망학과</option>
						<option value="ph" ${cri.searchType eq 'ph' ? 'selected':'' }>소속학과+희망학과</option>
					</select> <input class="form-control col-md-2" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value="${cri.keyword }" /> 
						<span class="input-group-append">
						<button class="btn btn-primary btn-sm" type="button"
							onclick="list_go(1);" id="searchBtn">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div>
			</div>
				
		
			
		
		
		
			</div>
			
		</div>	
	</div>
</div>			
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
		<%-- <form id="v_form" action="<%=request.getContextPath() %>/staff/stuManage/majorChange/apply" method="post"> --%>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">학번</th>
						<th scope="col">학년</th>
						<th scope="col">학기</th>
						<th scope="col">이름</th>
						<th scope="col">신청일</th>
						<th scope="col">소속분과대학</th>
						<th scope="col">소속학과</th>
						<th scope="col">희망학과</th>
						<th scope="col">연락처</th>
						<th scope="col">처리상태</th>
		
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stList}" var="majorChange">
						<tr class="majorChangeList">
						
							<td><input type="checkbox" name="checkMajorCha" value="${majorChange.majorChaSeq}" ></td>
							<td>${majorChange.stuCd }</td>
							<td>${majorChange.grade}</td>
							<td>${majorChange.stuSemester}</td>
							<td>${majorChange.name}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${majorChange.applyDate}"/></td>
							<td>${majorChange.colName }</td>
							<td>${majorChange.presentMajorName }</td>
							<td>${majorChange.hopeMajorName}</td>
							<td phone="${majorChange.phone}">${fn:substring(majorChange.phone,0,3)}-${fn:substring(majorChange.phone,3,7)}-${fn:substring(majorChange.phone,7,11)}</td>
							<c:if test="${majorChange.applyStatusCd eq '승인'}">
							<td style="color:#64CD3C">${majorChange.applyStatusCd}</td>
							</c:if>
							<c:if test="${majorChange.applyStatusCd eq '반려'}">
							<td style="color:#FF6464">${majorChange.applyStatusCd}</td>						
							</c:if>
							<c:if test="${majorChange.applyStatusCd eq '진행중'}">
							<td>${majorChange.applyStatusCd}</td>						
							</c:if>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			
			<div class="sub" align="right" style="margin:15px 20px ">

				<button class="btn btn-primary " type="button" id=""
					onclick="changeStatus('ok')" >승인</button>
				<button class="btn btn-danger " type="button" id=""
					onclick="changeStatus('nok')" >반려</button>
			</div>
		
			
			<!-- </form> -->
		</div>
	</div>
</div>		
		<!-- ================================================= -->
		<!-- 게시판 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->



		<!-- ================================================= -->
		<!-- 등록 버튼 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 페이지네이션 시작 -->
		<!-- ================================================= -->
		<!-- <div class="row justify-content-center">
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
		</div> -->
		
					
	<div class="card-footer">
		<%@ include file="/WEB-INF/views/include/pagination.jsp" %>
	</div>
		
		<!-- ================================================= -->
		<!-- 페이지네이션 끝 -->
		<!-- ================================================= -->
		
	
	<!-- ================================================= -->
	<!-- 카드바디 끝 -->
	<!-- ================================================= -->
	
	
	
	<!-- ================================================= -->
	<!-- 카드 끝 -->
	<!-- ================================================= -->



	</div>
</div>
<script>

$("input[type='checkbox']").on('click', function(){
	event.stopPropagation();
});

$('.majorChangeList').on('click',function(e){
	var majorChaSeq = e.currentTarget.children[0].children[0].defaultValue;
});


function changeStatus(st){
	

	var chkList = []
	var status = st;
	var idx = 0;
	
	var status_ok = event.target.innerHTML;
	
	var chkNode = $("input:checkbox[name='checkMajorCha']:checked").each(function(){
		chkList[idx] = $(this).val();
		idx = idx + 1;
	})
	
	console.log(chkList);
	
	var paramss = {
			status:status,
			chkList:chkList
	};
	
	
	Swal.fire({
        title: status_ok+'하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
	
		$.ajax({
			method:'post',
			url:"<%=request.getContextPath()%>/staff/stuManage/majorChange/apply",
			data : JSON.stringify(paramss),
			contentType : 'application/json; charset=utf-8',
			success : function(data) {
				
				Swal.fire(
						  '성공적으로 '+status_ok+"했습니다.",
						  '',
						  'success'
						).then(function(){
							
						
				
				$.each(chkNode, function(){
					$(this).closest('tr').children().eq(10).html(status_ok);
					if(status_ok=='승인'){
						$(this).closest('tr').children().eq(10).css("color","#64CD3C")
					}else if(status_ok=='반려'){
						$(this).closest('tr').children().eq(10).css("color","#FF6464")
					}
					$(this)[0].checked = false;
				});
				
			});
			
			
		},
		error : function(){
			Swal.fire({
				  icon: 'error',
				  title: '오류가 발생하였습니다.',
				})
		}
	});
	
	
        } else if (result.isDenied) {
            
            Swal.fire('저장하지 않았습니다.', '', 'info')
            
          }
        });
	
	
	
}

</script>


<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->