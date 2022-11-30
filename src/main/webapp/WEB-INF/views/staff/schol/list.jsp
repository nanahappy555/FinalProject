<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="scholList" value="${dataMap.selectList }" />
<c:set var="cri" value="${pageMaker.cri }" />


<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->



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
					<select class="form-control col-md-1" name="perPageNum"
						id="perPageNum" onchange="list_go(1);">
						<option value="10">정렬개수</option>
						<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
						<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
						<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
						<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>

					</select> <select class="form-control col-md-2" name="searchType"
						id="searchType">
						<option value="" ${cri.searchType eq '' ? 'selected':'' }>검색조건</option>
						<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>분과대학</option>
						<option value="m" ${cri.searchType eq 'm' ? 'selected':'' }>소속학과</option>
						<option value="cm" ${cri.searchType eq 'cm' ? 'selected':'' }>분과대학+소속학과</option>
					</select> <input class="form-control col-md-2" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
						class="input-group-append">
						<button class="btn btn-primary btn-sm" type="button"
							onclick="list_go(1);" id="searchBtn">
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

			<form
				action="<%=request.getContextPath()%>/staff/schol/applyScholList"
				id="chkForm" method="post">

				<table class="table table-hover" style="margin-top: 10px;">
					<thead>
						<tr style="background-color:rgba(102,178,255,0.2)">
							<th scope="col"></th>
							<th scope="col">학번</th>
							<th scope="col">학년</th>
							<th scope="col">학기</th>
							<th scope="col">이름</th>
							<th scope="col">분과대학</th>
							<th scope="col">소속학과</th>
							<th scope="col">장학구분</th>
							<th scope="col">연락처</th>
							<th scope="col">이메일</th>
							<th scope="col">신청날짜</th>
							<th scope="col">처리상태</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${scholList}" var="schol">
							<tr style="cursor: pointer;" class="chk">
								<th scope="row"><input type="checkbox" name="scholCd"
									value='${schol.scholAppSeq}'></th>

								<td>${schol.stuCd}</td>
								<td>${schol.grade}</td>
								<td>${schol.stuSemester}</td>
								<td>${schol.name}</td>
								<td>${schol.colName}</td>
								<td>${schol.majorName}</td>
								<td>${schol.scholName}</td>
								<td>${fn:substring(schol.phone,0,3)}-${fn:substring(schol.phone,3,7)}-${fn:substring(schol.phone,7,11) }</td>
								<td>${schol.email}</td>
								<td><fmt:formatDate value="${schol.applyDate}"
										pattern="yyyy/MM/dd" /></td>
								<c:if test="${schol.applyStatusCd eq '승인'}">
								<td style="color:#64CD3C">${schol.applyStatusCd}</td>																	
								</c:if>
								<c:if test="${schol.applyStatusCd eq '반려'}">
								<td style="color:#FF6464">${schol.applyStatusCd}</td>
								</c:if>
								<c:if test="${schol.applyStatusCd eq '진행중'}">
								<td>${schol.applyStatusCd}</td>	
								</c:if>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</form>

			<div class="card-footer">
			
				<div class="sub" align="right">
	
					<button class="btn btn-primary " type="button" id=""
						onclick="approve();">승인</button>
					<button class="btn btn-danger " type="button" id=""
						onclick="reject()">반려</button>
				</div>
					
				
				<%@ include file="/WEB-INF/views/include/pagination.jsp"%>
			</div>

		</div>
		<!-- ================================================= -->
		<!-- 카드 끝 -->
		<!-- ================================================= -->
	</div>

</div>

<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->


<script>
	function approve() {
		
		
		var chkApply = $('[name=scholCd]');
		var nullChkFlag = true;
		for (var i = 0; i < chkApply.length; i++) {
			if (chkApply[i].checked) {
				nullChkFlag = false;
			}
		}
		if (nullChkFlag) {
			Swal.fire({
				  icon: 'error',
				  title: '체크해주세요.',
				})

			return;
		}
		
		
		
		Swal.fire({
			  title: '승인하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니오',
			}).then((result) => {
			  if (result.isConfirmed) {
				  
				var chkForm = $('#chkForm');
				var inputApplyStatus = $('<input type="hidden" name="applyStatus">')
					
				inputApplyStatus.val("ok");
				chkForm.append(inputApplyStatus);
				chkForm.serialize();
				chkForm.submit();
						  
				  
			  
			  }
			})
		
		
	}

	function reject() {
		var chkApply = $('[name=scholCd]');
		var nullChkFlag = true;
		for (var i = 0; i < chkApply.length; i++) {
			if (chkApply[i].checked) {
				nullChkFlag = false;
			}
		}
		if (nullChkFlag) {
			Swal.fire({
				  icon: 'error',
				  title: '체크해주세요.',
				})

			return;
		}
		
		
		Swal.fire({
			  title: '반려하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니오',
			}).then((result) => {
			  if (result.isConfirmed) {
				
		
				var chkForm = $('#chkForm');
				var inputApplyStatus = $('<input type="hidden" name="applyStatus">')
				inputApplyStatus.val("nok");
				chkForm.append(inputApplyStatus);
				chkForm.serialize();
				chkForm.submit();
				
				  
			  }
			})

	}
	
</script>


<c:if test="${from eq 'apply' }">
   <script>
   window.onload = function(){
	   Swal.fire(
			      '완료되었습니다.',
			      '',
			      'success'
			    );
   }
</script>
</c:if>
