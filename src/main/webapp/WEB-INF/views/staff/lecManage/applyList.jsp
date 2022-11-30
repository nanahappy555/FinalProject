<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="sList" value="${dataMap.syllabusList }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />


<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->

<style>
.lecInfo {
	width: 100px;
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
	margin-bottom: 15px;
}
</style>

<style>
tr>th {
	background-color: #cce5ff;
}
</style>



<div class="card">
	<div class="card-body">


		<div class="main-content-jsp">

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
										<option value="name"
											${cri.searchType eq 'name' ? 'selected':'' }>강의명</option>
										<option value="prof"
											${cri.searchType eq 'prof' ? 'selected':'' }>담당교수</option>
										<option value="status"
											${cri.searchType eq 'status' ? 'selected':'' }>처리상태</option>
									</select> <input class="form-control col-md-2" type="text"
										name="keyword" placeholder="검색어를 입력하세요."
										value="${cri.keyword }" /> <span class="input-group-append">
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
						</div>
					</div>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<div class="card">
								<form
									action="<%=request.getContextPath()%>/staff/lecManage/applySyllabus"
									id="chkForm" method="post">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">과목코드</th>
												<th scope="col">강의명</th>
												<th scope="col">담당교수</th>
												<th scope="col">구분</th>
												<th scope="col">정원</th>
												<th scope="col">학점</th>
												<th scope="col">처리상태</th>
											</tr>
										</thead>
										<tbody>


											<c:forEach items="${sList}" var="sList">
												<tr class="chk" style="cursor: pointer;" onclick="pageMove('<%=request.getContextPath()%>/staff/lecManage/applyDetail.do?sylCd='+'${sList.sylCd}');">
													<td><input type="checkbox" name="sListCd"
														value='${sList.sylCd}' ></td>
													<td>${sList.subjCd}</td>
													<td >${sList.subjName}</td>
													<td>${sList.name}</td>
													<td>${sList.lecCategoryCd}</td>
													<td>${sList.maxStuNum}</td>
													<td>${sList.credit}</td>
													<c:if test="${sList.applyStatusCd eq '승인'}">
													<td style="color:#64CD3C">${sList.applyStatusCd}</td>
													</c:if>
													<c:if test="${sList.applyStatusCd eq '반려'}">
													<td style="color:#FF6464">${sList.applyStatusCd}</td>
													</c:if>
													<c:if test="${sList.applyStatusCd eq '진행중'}">
													<td>${sList.applyStatusCd}</td>
													</c:if>
												</tr>
											</c:forEach>


										</tbody>

									</table>


								</form>

<!-- 								<div class="sub" align="right" style="margin:15px 20px "> -->

<!-- 									<button class="btn btn-primary " type="button" id="" -->
<!-- 										onclick="approve('ok');">승인</button> -->
<!-- 									<button class="btn btn-danger " type="button" id="" -->
<!-- 										onclick="approve('nok');">반려</button> -->
<!-- 								</div> -->

								<div class="card-footer">
								
								
									<%@ include file="/WEB-INF/views/include/pagination.jsp"%>
									
									
										<div class="sub" align="right" >

											<button class="btn btn-primary " type="button" id=""
												onclick="approve('ok');">승인</button>
											<button class="btn btn-danger " type="button" id=""
												onclick="approve('nok');">반려</button>
										</div>
									
											
									
								</div>

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
$("input[name=sListCd]").click(function( event ) {
	  event.stopPropagation();
	  
	});
	
</script>

<script>

function list_go(page,url){
	//alert(page);
	if(!url) url="<%=request.getContextPath()%>/staff/lecManage/applyList.do?page="
		+ page+ "&perPageNum="+ perPageNum+ "&searchType="+ searchType + "&keyword=" + keyword;

		var jobForm = $('#jobForm');
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val(
				$('select[name="perPageNum"]').val());
		jobForm.find("[name='searchType']").val(
				$('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());
		jobForm.attr({
			action : url,
			method : 'get'
		}).submit();
	}
</script>




<script>
	function approve(status) {

		var chkedList = $("input:checkbox[name='sListCd']:checked");
		var len = $("input:checkbox[name='sListCd']:checked").length;
		var checkboxArr = [];

		var sta = event.target.innerHTML;

		
		if (len > 1) {
			$("input:checkbox[name='sListCd']:checked").each(function(e) {
				var value = $(this).val();
				checkboxArr.push(value);

				console.log("체크박스이벤트", event);
			})
		};

		console.log(checkboxArr);

		var param = {

			checkboxArr : checkboxArr,
			applyStatusCd : status
		};


		Swal.fire({
			  title: '변경사항을 저장하시겠습니까?',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText: '아니오',
			}).then((result) => {
		        if (result.isConfirmed) {
		
		        
		
		$.ajax({
			method : "post",
			url : "syllaListStatus",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(param),
			success : function(data) {

				console.log("콘솔" + data);

				$.each(chkedList, function() {
					console.log($(this).closest('tr').children().eq(7).html(sta));
					
					$(this)[0].checked = false;
					
					
					Swal.fire(
							  '성공적으로 저장했습니다.',
							  '',
							  'success'
							).then(function(){
				});

			},
			error : function() {
				Swal.fire({
					  icon: 'error',
					  title: '오류가 발생하였습니다.',
					})

			}
		});

	}
else if (result.isDenied) {
            
            Swal.fire('저장되지 않았습니다.', '', 'info')
            
          }
        });
		
		
	}
</script>
