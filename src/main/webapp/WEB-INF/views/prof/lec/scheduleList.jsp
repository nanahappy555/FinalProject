<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-date-picker.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-example-style.css" >

</head>
<body>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT -->
	<!-- ================================================= -->
	<div class="container-fluid">
		<!-- ================================================= -->
		<!-- 본문 1 -->
		<!-- ================================================= -->
		<div class="row">


			<!-- ================================================= -->
			<!-- 탭 -->
			<!-- ================================================= -->
			<div class="pills-regular col-xl-12" id="ifrParentDiv" style="border:1px dotted black; height:90vh;">

				<!-- ================================================= -->
				<!-- 탭LIST 시작 -->
				<!-- ================================================= -->
				<ul class="menuMove nav nav-pills mb-1" id="pills-tab" role="tablist">
					<li class="nav-item"><a class="nav-link"
						id="lecMain-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/main.do')"
						data-toggle="pill" href="#lecMain"
						role="tab" aria-controls="home" aria-selected="false">메인</a></li>
						
					<li class="nav-item"><a class="nav-link show"
						id="lecNotice-tab"
						onclick="pageMove('<%=request.getContextPath() %>/mylecture/notice/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecNotice"
						role="tab" aria-controls="home" aria-selected="false">공지사항</a></li>
						
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecQna-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/qna/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecQna"
						role="tab" aria-controls="profile" aria-selected="false">질문게시판</a>
					</li>
					<li class="menuMove nav-item"><a class="nav-link active show"
						id="lecSchedule-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/schedule/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecSchedule"
						role="tab" aria-controls="contact"	aria-selected="true">일정관리</a></li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecAssignment-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/assignment/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecAssignment"
						role="tab" aria-controls="contact"	aria-selected="false">과제관리</a></li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecAttend-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/attend/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecAttend"
						role="tab" aria-controls="contact" aria-selected="false">출결관리</a>
					</li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMarks-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/marks/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecMarks"
						role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
					</li>
					
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMaterials-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecMaterials"
						role="tab" aria-controls="contact" aria-selected="false">학습자료</a></li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecReviews-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/review/list.do?lecCode=${lecCode}')"
						data-toggle="pill" href="#lecReviews"
						role="tab" aria-controls="contact" aria-selected="false">강의평가</a>
					</li>
				</ul>
				<!-- ================================================= -->
				<!-- 탭 LIST 끝 -->
				<!-- ================================================= -->
				
				<!-- ================================================= -->
				<!-- 탭 CONTENT 시작 -->
				<!-- ================================================= -->
<!-- 				 onload="pageChanged()"  -->
<!-- alert(this.contentWindow.location); -->
<!-- 				<iframe id="innerFrame" -->
<%-- 					src="<%=request.getContextPath()%>/prof/lec/index.do"frameborder="0" --%>
<!-- 					scrolling="no" style="border:1px dotted red; overflow-x:hidden; width:100%;height:93%;"></iframe> -->

				<div class="tab-content" id="pills-tabContent">
					<!-- 탭 1 시작 -->
					<div class="tab-pane fade" id="lecMain" role="tabpanel" aria-labelledby="pills-lecMain-tab">
						<p>텍스트1</p>
					</div> 
					<!-- 탭 1 끝 -->
						
					<!-- 탭 2 시작 -->
					<div class="tab-pane fade" id="lecNotice" role="tabpanel" aria-labelledby="pills-lecNotice-tab">
						<p>텍스트2</p>
					</div>
					<!-- 탭 2 끝 -->
					<!-- 탭 3 시작 -->
					<div class="tab-pane fade" id="lecQna" role="tabpanel" aria-labelledby="pills-lecQna-tab">
						<p>텍스트3</p>
					</div>
					<!-- 탭 3 끝 -->
					<!-- 탭 4 시작 -->
					<div class="tab-pane fade active show" id="lecSchedule" role="tabpanel" aria-labelledby="pills-lecSchedule-tab">
						<!-- ================================================= -->
						<!-- 카드 시작 -->
						<!-- ================================================= -->
<!-- 						<div class="row"> -->
							<div class="card-body">
							<!-- ================================================= -->
							<!-- 등록칸 시작 -->
							<!-- ================================================= -->
								<div class="input-group mb-3 justify-content-center">
								
									<button class="btn btn-rounded btn-primary mb-1">&nbsp;&nbsp;&nbsp;<b>구  분</b>&nbsp;&nbsp;&nbsp; </button>&nbsp;&nbsp;
									<select class="form-control col-md-2" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
										<option value="10">중간고사</option>
										<option value="10">기말고사</option>
										<option value="2">쪽지시험</option>
										<option value="3">과제</option>
										
									</select>
								
									&nbsp;&nbsp;&nbsp;<button class="btn btn-rounded btn-primary mb-1"><p><strong>일  시</strong></p></button>&nbsp;&nbsp;
									<div class="code-html">
										<div class="mt-2 tui-datepicker-input tui-datetime-input tui-has-focus">
											<input type="text" id="datepicker-input" aria-label="Date-Time">
											<span class="tui-ico-date"></span>
										</div>
										<div id="datepicker-div"  style="position: relative; background-color:white; z-index: 1; margin-top: -1px;"></div>
									</div>
									
									&nbsp;&nbsp;&nbsp;<button class="btn btn-rounded btn-primary mb-1"><p><strong>강의실</strong></p></button>&nbsp;&nbsp;
									<input type="text" class="form-control col-md-2" name="searchType" id="searchType">
									&nbsp;&nbsp;&nbsp;<button class="btn btn-outline-primary" type="button" onclick="f_regist(event)">일정등록</button>
								</div>
							</div>
							<!-- ================================================= -->
							<!-- 등록칸 끝 -->
							<!-- ================================================= -->
							



							<div class="card-body border-top">
								<!-- ================================================= -->
								<!-- 검색바 시작 -->
								<!-- ================================================= -->
								<div class="input-group mb-3 justify-content-end">
								
								   <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
										<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >정렬개수</option>
										<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
										<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
										<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
									 </select>
									<select class="form-control col-md-1" name="searchType" id="searchType">
									   <option value=""  >검색구분</option>
									  <option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
									  <option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
									  <option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>   
																			  
								   </select>
								   <!-- keyword -->
									<input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
								   <span class="input-group-append">
									  <button class="btn btn-primary btn-sm" type="button" 
											id="searchBtn" onclick="list_go(1);">
										 <i class="fa fa-fw fa-search"></i>
									  </button>
								   </span>
								</div>
								<!-- ================================================= -->
								<!-- 검색바 끝 -->
								<!-- ================================================= -->

								<!-- ================================================= -->
								<!-- 게시판 시작 -->
								<!-- ================================================= -->
								
									<table class="table table-hover">
										<thead>
											<tr>
												<th>종류</th>
												<th>일시</th>
												<th>강의실명</th>
												<th style="width:12%">수정</th>
												<th style="width:12%">삭제</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>중간고사</td>
												<td>2022-10-15</td>
												<td>BT031</td>
												<td>
													<button class="btn btn-outline-primary btn-sm m-1" type="button" onclick="f_modify()">수정</button>
												</td>
												<td>
													<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="f_alert();">삭제</button>
												</td>
											</tr>
											<tr>
												<td>기말고사</td>
												<td>2022-12-10</td>
												<td>BT031</td>
												<td>
													<button class="btn btn-outline-primary btn-sm m-1" type="button" onclick="f_modify()">수정</button>
												</td>
												<td>
													<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="f_alert();">삭제</button>
												</td>
											</tr>

											
										</tbody>
									</table>
												
												
								<!-- ================================================= -->
								<!-- 게시판 끝 -->
								<!-- ================================================= -->
								

								<!-- ================================================= -->
								<!-- 페이지네이션 시작 -->
								<!-- ================================================= -->
								<div class="row justify-content-center">
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
								</div>
								<!-- ================================================= -->
								<!-- 페이지네이션 끝 -->
								<!-- ================================================= -->
							  
							</div>
						   
						   
<!-- 						</div> -->
							<!-- ================================================= -->
							<!-- 카드 끝 -->
							<!-- ================================================= -->
					</div>
					<!-- 탭 4 끝 -->
					<!-- 탭 5 시작 -->
					<div class="tab-pane fade" id="lecAssignment" role="tabpanel" aria-labelledby="pills-lecAssignment-tab">
						<p>텍스트5</p>
					</div>
					<!-- 탭 5 끝 -->
					<!-- 탭 6 시작 -->
					<div class="tab-pane fade" id="lecAttend" role="tabpanel" aria-labelledby="pills-lecAttend-tab">
						<p>텍스트6</p>
					</div>
					<!-- 탭 6 끝 -->
					<!-- 탭 7 시작 -->
					<div class="tab-pane fade" id="lecMarks" role="tabpanel" aria-labelledby="pills-lecMarks-tab">
						<p>텍스트7</p>
					</div>
					<!-- 탭 7 끝 -->
					<!-- 탭 8 시작 -->
					<div class="tab-pane fade" id="lecMaterials" role="tabpanel" aria-labelledby="pills-lecMaterials-tab">
						<p>텍스트8</p>
					</div>
					<!-- 탭 8 끝 -->
					<!-- 탭 9 시작 -->
					<div class="tab-pane fade" id="lecReviews" role="tabpanel" aria-labelledby="pills-lecReviews-tab">
						<p>텍스트9</p>
					</div>
					<!-- 탭 9 끝 -->
				</div>
				<!-- ================================================= -->
				<!-- 탭 CONTENT 끝 -->
				<!-- ================================================= -->

			</div>
			<!-- ================================================= -->
			<!-- 탭 끝 -->
			<!-- ================================================= -->
		</div>
		<!-- ================================================= -->
		<!-- 본문1 끝 -->
		<!-- ================================================= -->


	</div>
	<!-- ================================================= -->
	<!-- MAIN-CONTENT 끝 -->
	<!-- ================================================= -->


<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/tui-date-picker.js"></script>


<script>
var datepicker = new tui.DatePicker('#datepicker-div', {
    date: new Date(),
    input: {
        element: '#datepicker-input',
        format: 'yyyy-MM-dd'
    },
    language:'ko'
});

//이 아래로 함수쓰면됨.
datepicker.setNull();
// datepicker.open();
</script>
<script>

function f_transFormat(date){
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	
	return year + '-' + month + '-' + day;
}

function f_regist(e){
// 	var date = datepicker.getDate(); //Thu Oct 13 2022 22:01:13 GMT+0900 (한국 표준시) 
// 	var v_date = f_transFormat(date); // 2022-10-13
	
// // 	console.log(e.target);
// 	console.log(date);
// 	console.log(v_date);
	
	alert('콘솔로그에는 날짜가 있다');
	
	//셀렉트칸, 날짜, 강의실 => DB로 insert
	
}
</script>

<script>
function f_modify(){
	datepicker.open();
	datepicker.setDate(new Date('1900-01-01'));
}
</script>

<script>
function f_alert(){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#5969FF',
		  cancelButtonColor: '#EF172C',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
	});
		
}

</script>
