<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <c:set var="noticeList" value="${noticeDataMap.noticeList }" /> --%>
<%-- <c:set var="pageMaker" value="${noticeDataMap.pageMaker }" /> --%>
<%-- <c:set var="cri" value="${pageMaker.cri }" /> --%>


<c:set var="assignmentList" value="${assignemtDataMap.assignmentList }" />
<c:set var="assignmentPageMaker" value="${assignemtDataMap.assignmentPageMaker }" />
<c:set var="assignmentCri" value="${assignmentPageMaker.cri }" />
<head>



<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-date-picker.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-example-style.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
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
			<div class="pills-regular col-xl-12">

				<!-- ================================================= -->
				<!-- 탭LIST 시작 -->
				<!-- ================================================= -->
				<ul class="menuMove nav nav-pills mb-1" id="pills-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active show"
						id="lecMain-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/main?lecCd=${lecCd }')"
						data-toggle="pill" href="#"
						role="tab" aria-controls="home" aria-selected="true">메인</a></li>
						
					
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecAttend-tab"
						onclick="pageMove('<%=request.getContextPath() %>/imsi/attend/list?lecCd=${lecCd}')"
						data-toggle="pill" href="#"
						role="tab" aria-controls="contact" aria-selected="false">출결관리</a>
					</li>
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMarks-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/marks/list?lecCd=${lecCd}')"
						data-toggle="pill" href="#"
						role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
					</li>
					
					<li class="menuMove nav-item"><a class="nav-link"
						id="lecMaterials-tab"
						onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list?lecCd=${lecCd}')"
						data-toggle="pill" href="#"
						role="tab" aria-controls="contact" aria-selected="false">학습자료</a></li>
				
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
					<div class="tab-pane fade active show" id="lecMain" role="tabpanel" aria-labelledby="pills-lecMain-tab">
					
						<!-- ================================================= -->
						<!-- 본문 1 -->
						<!-- ================================================= -->
						<div class="row">
						
					        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body" id="noticeCardBody">
									
									</div>
										<div class="card-footer">
										<form id='notjobForm'>
											<input id ='notPage' type='hidden' name='assPage' value='' />
											<input id='notSearchType' type='hidden' name='searchType' value='' />
											<input id='notKeyword' type='hidden' name='keyword' value='' />
											<input id='notLecCd' type='hidden' name='lecCd' value='${lecCd }' />
										</form>
									<ul id="noticeCardFooter" class="pagination justify-content-center m-0" >
									</ul>
									</div>
										
									
								</div>
							</div>
					
					
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body" id="qnaCardBody">
									</div>
										<div class="card-footer">
										<form id='qnajobForm'>
											<input id ='qnaPage' type='hidden' name='qnaPage' value='' />
											<input id='qnaSearchType' type='hidden' name='searchType' value='' />
											<input id='qnaKeyword' type='hidden' name='keyword' value='' />
											<input id='qnaLecCd' type='hidden' name='lecCd' value='${lecCd }' />
										</form>
									<ul id="qnaCardFooter" class="pagination justify-content-center m-0" >
									</ul>
									</div>
										<!-- ================================================= -->
										<!-- 페이지네이션 끝 -->
										<!-- ================================================= -->					
									
									
								</div>
							</div>
					
					
					
							
						</div> 
						<!-- ================================================= -->
						<!-- 본문1 끝 -->
						<!-- ================================================= -->
					
						<!-- ================================================= -->
						<!-- 과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제 -->
						<!-- 과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제 -->
						<!-- 과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제과제 -->
						<!-- ================================================= -->
						<div class="row">
						
					        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body" id="assignmentCardBody">
									
										
									</div>
									<div class="card-footer">
										<form id='assjobForm'>
											<input id ='assPage' type='hidden' name='assPage' value='' />
											<input id='assSearchType' type='hidden' name='searchType' value='' />
											<input id='assKeyword' type='hidden' name='keyword' value='' />
											<input id='assLecCd' type='hidden' name='lecCd' value='${lecCd }' />
										</form>
									<ul id="assignmentCardFooter" class="pagination justify-content-center m-0" >
									</ul>
									</div>
								</div>
							</div>
							
							
							<!-- 일정 시작 -->
					        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
								<div class="card" style="height:489px;">
									<div class="card-body">
										<h2><i class="fas fa-calendar-check"></i>&nbsp;&nbsp;일정</h2>
										<!-- ================================================= -->
										<!-- 등록칸 시작 -->
										<!-- ================================================= -->
										<div class="input-group mt-3 mb-3 justify-content-center align-items-center">
										
											<span style="font-size:1.2em;"><strong>구분</strong></span>&nbsp;&nbsp;
											<select class="form-control col-md-2" name="perPageNum" id="examDiv">					  		  		
										  		<option value="">선택</option>
										  		<option value="mid">중간고사</option>
										  		<option value="fin">기말고사</option>
										  		<option value="mini">쪽지시험</option>
										  		
										  	</select>
											&nbsp;&nbsp;&nbsp;
											<span style="font-size:1.2em;"><strong>일시</strong></span>&nbsp;&nbsp;
											<div class="code-html">
										        <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
										            <input type="text" id="datepicker-input" aria-label="Date-Time">
										            <span class="tui-ico-date"></span>
										        </div>
										        <div id="datepicker-div"  style="position: relative; background-color:white; z-index: 9999; margin-top: -1px;"></div>
										    </div>
										  	
											&nbsp;&nbsp;&nbsp;
											<span style="font-size:1.2em;"><strong>강의실</strong></span>&nbsp;&nbsp;
										 	<input type="text" class="form-control col-md-2" id="classroom" name="classroom" id="searchType" style="height:38px;">
										 	&nbsp;&nbsp;&nbsp;
											<button class="btn btn-sm btn-primary" type="button" onclick="f_regist(event)">등록</button>
										</div>
										<!-- ================================================= -->
										<!-- 등록칸 끝 -->
										<!-- ================================================= -->
										
									
									
									
										<!-- ================================================= -->
										<!-- 게시판 시작 -->
										<!-- ================================================= -->
										
											<table class="table table-hover">
												<thead>
													<tr style="background-color:rgba(102,178,255,0.2)">
														<th>종류</th>
														<th>일시</th>
														<th>강의실명</th>
														<th style="width:12%">수정</th>
														<th style="width:12%">삭제</th>
													</tr>
												</thead>
												<tbody id="examTbody">
													
								
													
												</tbody>
											</table>
														</div>	
														
											<!-- ================================================= -->
											<!-- 게시판 끝 -->
											<!-- ================================================= -->
											
									
											<!-- ================================================= -->
											<!-- 페이지네이션 시작 -->
											<!-- ================================================= -->
											<div class="card-footer">
											      <nav aria-label="Page navigation example">
											         <ul class="pagination justify-content-center m-0" id="examPagenation">
											         </ul>
											            
											      </nav>
											</div>
											<!-- ================================================= -->
											<!-- 페이지네이션 끝 -->
											<!-- ================================================= -->
								      
									   
									   
								
								
								</div>
							</div>
							<!-- 일정 시작 -->
								
						</div>
						<!-- ================================================= -->
						<!-- 본문2 끝 -->
						<!-- ================================================= -->
				
							
							
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

<script src="<%=request.getContextPath()%>/resources/js/tui-date-picker.js"></script>
<script>

$("#pageHeaderSpan", parent.document).html("강의게시판");
$("#pageHeaderSpan", parent.document).attr("murl","<%=request.getContextPath()%>/prof/lec/main.do?lecCd=${lecCd}");


function f_total(){
	
	window.parent.document.getElementById('total').innerHTML = "점수가 없슈";
	
}



</script>

<script>
function f_test(){ 
	alert('박건영의 점수가 저장됐습니다.');
}
</script>




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
function f_regist(e){
	var date = datepicker.getDate(); //Thu Oct 13 2022 22:01:13 GMT+0900 (한국 표준시) 
	var v_date = f_transFormatToDate(date); // 2022-10-13
	
// // 	console.log(e.target);
	console.log(date);
	console.log(v_date);
	
	alert('콘솔로그에는 날짜가 있다');
	
	//셀렉트칸, 날짜, 강의실 => DB로 insert
	
}

function f_modify(e){
	console.log(e.target);
	var dataDate = e.target.getAttribute("data-date");
	var dataClassroom = e.target.getAttribute("data-room");
	
	var dataDivision = e.target.getAttribute("data-division");
	
	alert(dataDivision);
	var v_date = $('td[data-date='+dataDate+']').text(); //날짜
	var v_Classroom = $('td[data-room='+dataClassroom+']').text(); //강의실
	var v_division  = $('td[data-division='+dataDivision+']').text(); 
	alert(v_division);
	
	datepicker.open();
	datepicker.setDate(new Date(v_date));
	
	document.querySelector('#classroom').value = v_Classroom;
	
	var examDivVal = "";
	if (v_division == "중간고사") {
		examDivVal = 'mid';
	}else if (v_division == "기말고사"){
		
		examDivVal = 'fin';
	}else{
		examDivVal = 'mini';
	}
	
	  $("#examDiv").val(examDivVal).prop("selected",true);
	
}
</script>




<!-- 공지게시판공지게시판공지게시판공지게시판공지게시판 -->
<!-- 공지게시판공지게시판공지게시판공지게시판공지게시판 -->
<!-- 공지게시판공지게시판공지게시판공지게시판공지게시판 -->
<script type="text/x-handlebars-template"  id="notList-pagination-template" >

<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{notSignActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	



</script>
<script type="text/x-handlebars-template"  id="notice-list-template" >
	<h2><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;공지사항</h2>
										<!-- ================================================= -->
										<!-- 검색바 시작 -->
										<!-- ================================================= -->
										<div class="input-group mb-3 justify-content-end">
											<select class="form-control col-md-2" name="searchType"
												id="notSelsearchType">
													<option value="">검색옵션</option>
												 {{#if (eq pageMaker.cri.searchType 't')}}
                    							<option value="t" selected>글제목</option>
         										{{else}}
         										<option value="t" >글제목</option>
        											 {{/if}}
         										{{#if (eq pageMaker.cri.searchType 'c')}}
        										 <option value="c" selected>글내용</option>
         										{{else}}
         										<option value="c" >글내용</option>
         										{{/if}}
								
											</select>
											<!-- keyword -->
											<input class="form-control col-md-3" type="text" name="keyword" id="notSelKeyword"
												placeholder="검색어를 입력하세요." value="{{pageMaker.cri.keyword }}" /> <span
												class="input-group-append">
												<button class="btn btn-primary btn-sm" type="button"
													id="searchBtn" onclick="notList_go(1);">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
										<!-- ================================================= -->
										<!-- 검색바 끝 -->
										<!-- ================================================= -->
					
										<table class="table table-hover">
											<thead>
												<tr style="background-color:rgba(102,178,255,0.2)">
													<th scope="col" style="width:470px;">제목</th>
													<th scope="col">날짜</th>
													<th scope="col">조회수</th>
											</thead>
											<tbody>
											{{#each noticeList}}
													<tr style="cursor: pointer;"onclick="OpenWindow('<%=request.getContextPath()%>/prof/lec/notice/detail?from=list&lecCd={{lecCd }}&lecNoticeNo={{lecNoticeNo }}','상세보기',600,600);">
														<td style=text-align:left;"> {{cutLongText title}} </td>
														<td>{{prettifyDate cdate}}</td>
														<td>{{viewCnt}}</td>
													</tr>
 											{{/each}}

											</tbody>
										</table>
<div class="row justify-content-end mt-2 mr-2">
<button class="btn btn-outline-primary" type="button"onclick="OpenWindow('<%=request.getContextPath()%>/prof/lec/notice/registForm?lecCd=${lecCd }','강의 공지사항 작성');">작성하기</button>
</div>


</script>
<script>
$(function(){
	
	$('#noticeCardFooter').on('click','li a',function(e){
		notPage = $(this).attr("href");
		
		notList_go(notPage);
		return false;
	});
	getNoticeList('<%=request.getContextPath()%>/prof/lec/notice/list?lecCd=${lecCd}&notPage=',notPage);
});

</script>
<script>
var notPage=1;
function getNoticeList(paramURL,paramPage){
	
	$.ajax({
		
		method:"get",
		url:paramURL+paramPage,
		dataType:"json",
		success:(data)=>{ 
			console.log("공지 아작스 값",data);
			console.log("공지 url",paramURL+paramPage);

			printData(data,$('#noticeCardBody'),$('#notice-list-template'));
			printPagination(data.pageMaker,$('#noticeCardFooter'),$('#notList-pagination-template'));
			
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

function notList_go(page){
	
	
	var jobForm=$('#notjobForm');
	$('#notPage').val(page);
	$('#notSearchType').val($('#notSelsearchType').val());
	$('#notKeyword').val($('#notSelKeyword').val());
	
	var searchType = $('#notSelsearchType').val();
	var keyword = $('#notSelKeyword').val();
	
	
	var paramUrl= "<%=request.getContextPath()%>/prof/lec/notice/list?lecCd=${lecCd}&notPage=";
	paramUrl += page;
	paramUrl += "&searchType=";
	paramUrl += searchType;
	paramUrl += "&keyword=";
	paramUrl += keyword;
	
	console.log(paramUrl);
	$.ajax({
		method:"get",
		url:paramUrl,
		dataType:"json",
		success:(data)=>{
			printData(data,$('#noticeCardBody'),$('#notice-list-template'));
			printPagination(data.pageMaker,$('#noticeCardFooter'),$('#notList-pagination-template'));
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


</script>
<!-- 공지끝끝끝공지끝끝끝공지끝끝끝공지끝끝끝공지끝끝끝 -->
<!-- 공지끝끝끝공지끝끝끝공지끝끝끝공지끝끝끝공지끝끝끝 -->
<!-- 공지끝끝끝공지끝끝끝공지끝끝끝공지끝끝끝공지끝끝끝 -->




<!-- 질문게시판질문게시판질문게시판질문게시판질문게시판 -->
<!-- 질문게시판질문게시판질문게시판질문게시판질문게시판 -->
<!-- 질문게시판질문게시판질문게시판질문게시판질문게시판 -->


		
<script type="text/x-handlebars-template"  id="qnaList-pagination-template" >

<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{qnaSignActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>
<script type="text/x-handlebars-template"  id="qna-list-template" >
<h2><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;질문게시판</h2>
									<!-- ================================================= -->
									<!-- 검색바 시작 -->
									<!-- ================================================= -->
									<div class="input-group mb-3 justify-content-end">
										<select class="form-control col-md-2" name="searchType"
											id="qnaSelsearchType">
												<option value="">검색옵션</option>
											 {{#if (eq pageMaker.cri.searchType 't')}}
                							<option value="t" selected>글제목</option>
     										{{else}}
     										<option value="t" >글제목</option>
    											 {{/if}}
     										{{#if (eq pageMaker.cri.searchType 'c')}}
    										 <option value="c" selected>글내용</option>
     										{{else}}
     										<option value="c" >글내용</option>
     										{{/if}}
							
										</select>
										<!-- keyword -->
										<input class="form-control col-md-3" type="text" name="keyword" id="qnaSelKeyword"
											placeholder="검색어를 입력하세요." value="{{pageMaker.cri.keyword }}" /> <span
											class="input-group-append">
											<button class="btn btn-primary btn-sm" type="button"
												id="searchBtn" onclick="qnaList_go(1);">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									</div>
									<!-- ================================================= -->
									<!-- 검색바 끝 -->
									<!-- ================================================= -->
				
									<table class="table table-hover">
										<thead>
											<tr style="background-color:rgba(102,178,255,0.2)">
												<th scope="col" style="width:470px;">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">작성일자</th>
										</thead>
										<tbody>
										{{#each lecQnaList}}
												<tr style="cursor: pointer;"onclick="OpenWindow('<%=request.getContextPath()%>/prof/lec/qna/detail?lecCd={{lecCd }}&lecqBno={{lecqBno}}','질문상세보기',800,600);">
													<td style="text-overflow: ellipsis; text-align: left;">  {{#if response}} <span class="text-success">[답변완료]</span>&nbsp; {{else}}<span class="text-warning">[답변대기중]</span>&nbsp;{{/if}}  {{cutLongText title}} </td>
													<td>{{stuName}}</td>
													<td>{{prettifyDate cdate}}</td>
												</tr>
											{{/each}}

										</tbody>
									</table>
<div class="row justify-content-end mt-2 mr-2">
</div>

</script>
<script>
var qnaPage=1;
function getqnaList(paramURL,paramPage){
	$.ajax({
		method:"get",
		url:paramURL+paramPage,
		dataType:"json",
		success:(data)=>{
			console.log("질문 아작스 값",data);
			console.log("질문URL",paramURL+paramPage);
			printData(data,$('#qnaCardBody'),$('#qna-list-template'));
			printPagination(data.pageMaker,$('#qnaCardFooter'),$('#qnaList-pagination-template'));
			
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function qnaList_go(page){
	
	
	var jobForm=$('#qnajobForm');
	$('#qnaPage').val(page);
	$('#qnaSearchType').val($('#qnaSelsearchType').val());
	$('#qnaKeyword').val($('#qnaSelKeyword').val());
	
	var searchType = $('#qnaSelsearchType').val();
	var keyword = $('#qnaSelKeyword').val();
	
	
	var paramUrl= "<%=request.getContextPath()%>/prof/lec/qna/list?lecCd=${lecCd}&qnaPage=";
	paramUrl += page;
	paramUrl += "&searchType=";
	paramUrl += searchType;
	paramUrl += "&keyword=";
	paramUrl += keyword;
	
	console.log(paramUrl);
	$.ajax({
		method:"get",
		url:paramUrl,
		dataType:"json",
		success:(data)=>{
			printData(data,$('#qnaCardBody'),$('#qna-list-template'));
			printPagination(data.pageMaker,$('#qnaCardFooter'),$('#qnaList-pagination-template'));
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


$(function(){
	
	$('#qnaCardFooter').on('click','li a',function(e){
		qnaPage = $(this).attr("href");
		
		qnaList_go(qnaPage);
		return false;
	});
	getqnaList('<%=request.getContextPath()%>/prof/lec/qna/list?lecCd=${lecCd}&qnaPage=',qnaPage);
});

</script>



<!-- 질문끝끝끝질문끝끝끝질문끝끝끝질문끝끝끝질문끝끝끝 -->
<!-- 질문끝끝끝질문끝끝끝질문끝끝끝질문끝끝끝질문끝끝끝 -->
<!-- 질문끝끝끝질문끝끝끝질문끝끝끝질문끝끝끝질문끝끝끝 -->


<!-- 과제게시판과제게시판과제게시판과제게시판과제게시판 -->
<!-- 과제게시판과제게시판과제게시판과제게시판과제게시판 -->
<!-- 과제게시판과제게시판과제게시판과제게시판과제게시판 -->




<script type="text/x-handlebars-template"  id="assList-pagination-template" >

<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{assSignActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{else}}{{cri.page}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>
<script type="text/x-handlebars-template"  id="assignment-list-template" >
	<h2><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;과제관리</h2>
										<!-- ================================================= -->
										<!-- 검색바 시작 -->
										<!-- ================================================= -->
										<div class="input-group mb-3 justify-content-end">
											<select class="form-control col-md-2" name="searchType"
												id="assSelsearchType">
													<option value="">검색옵션</option>
												 {{#if (eq pageMaker.cri.searchType 't')}}
                    							<option value="t" selected>글제목</option>
         										{{else}}
         										<option value="t" >글제목</option>
        											 {{/if}}
         										{{#if (eq pageMaker.cri.searchType 'c')}}
        										 <option value="c" selected>글내용</option>
         										{{else}}
         										<option value="c" >글내용</option>
         										{{/if}}
								
											</select>
											<!-- keyword -->
											<input class="form-control col-md-3" type="text" name="keyword" id="assSelKeyword"
												placeholder="검색어를 입력하세요." value="{{pageMaker.cri.keyword }}" /> <span
												class="input-group-append">
												<button class="btn btn-primary btn-sm" type="button"
													id="searchBtn" onclick="assList_go(1);">
													<i class="fa fa-fw fa-search"></i>
												</button>
											</span>
										</div>
										<!-- ================================================= -->
										<!-- 검색바 끝 -->
										<!-- ================================================= -->
					
										<table class="table table-hover">
											<thead>
												<tr style="background-color:rgba(102,178,255,0.2)">
													<th scope="col">제목</th>
													<th scope="col">마감일</th>
											</thead>
											<tbody>
											{{#each assignmentList}}
													<tr style="cursor: pointer;"onclick="OpenWindow('<%=request.getContextPath()%>/prof/lec/assignment/detail?lecCd={{lecCd }}&assBno={{assBno }}','과제 상세보기',800,400);">
														<td style="text-align: left;"> {{cutLongText title}} </td>
														<td>{{prettifyDate dueDate}}</td>
													</tr>
 											{{/each}}

											</tbody>
										</table>
<div class="row justify-content-end mt-2 mr-2">
<button class="btn btn-outline-primary" type="button"onclick="OpenWindow('<%=request.getContextPath()%>/prof/lec/assignment/registForm?lecCd=${lecCd }','과제 등록하기',1660,630);">과제등록</button>
</div>


</script>
<script>
$(function(){
	
	$('#assignmentCardFooter').on('click','li a',function(e){
		assPage = $(this).attr("href");
		
		assList_go(assPage);
		return false;
	});
	getAssignmentList('<%=request.getContextPath()%>/prof/lec/assignment/list?lecCd=${lecCd}&assPage=',assPage);
});
</script>
<script>

var assPage=1;
function getAssignmentList(paramURL,paramPage){
	$.ajax({
		
		method:"get",
		url:paramURL+paramPage,
		dataType:"json",
		success:(data)=>{
			console.log("과제 아작스 값",data);
			
			printData(data,$('#assignmentCardBody'),$('#assignment-list-template'));
			printPagination(data.pageMaker,$('#assignmentCardFooter'),$('#assList-pagination-template'));
			

			
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


function printData(data,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(data);	
	target.html(html);
}

function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNumArray; 
	
	if (pageMaker.startPage == 1) {
		pageMaker.prev = false;
		pageMaker.prevPageNum=pageMaker.startPage-1;
	}else{
		pageMaker.prev = true;
		pageMaker.prevPageNum=pageMaker.cri.page;
	}
	
	if (pageMaker.endPage >= pageMaker.realEndPage) {
		pageMaker.next = false;
		
	}else{
		pageMaker.next = true;
		
	}
	
	pageMaker.nextPageNum=pageMaker.cri.page+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html(html);
}

Handlebars.registerHelper({
	"assSignActive":function(pageNum){
		if(pageNum == assPage) return 'active';
	},
	"notSignActive":function(pageNum){
		if(pageNum == notPage) return 'active';
	},
	"qnaSignActive":function(pageNum){
		if(pageNum == qnaPage) return 'active';
	},
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"cutLongText":function(text){
		if (text.length>30) {
			return text.substr(0,30) + "...";
		}
		return text;
	}
});

Handlebars.registerHelper('eq', (a, b) => a == b);
</script>
<script>


function assList_go(page){
	
	
	var jobForm=$('#assjobForm');
	$('#assPage').val(page);
	$('#assSearchType').val($('#assSelsearchType').val());
	$('#assKeyword').val($('#assSelKeyword').val());
	
	var searchType = $('#assSelsearchType').val();
	var keyword = $('#assSelKeyword').val();
	
	
	var paramUrl= "<%=request.getContextPath()%>/prof/lec/assignment/list?lecCd=${lecCd}&assPage=";
	paramUrl += page;
	paramUrl += "&searchType=";
	paramUrl += searchType;
	paramUrl += "&keyword=";
	paramUrl += keyword;
	
	console.log(paramUrl);
	$.ajax({
		method:"get",
		url:paramUrl,
		dataType:"json",
		success:(data)=>{
			printData(data,$('#assignmentCardBody'),$('#assignment-list-template'));
			printPagination(data.pageMaker,$('#assignmentCardFooter'),$('#assList-pagination-template'));
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>
<!-- 과제끝끝끝과제끝끝끝과제끝끝끝과제끝끝끝과제끝끝끝 -->
<!-- 과제끝끝끝과제끝끝끝과제끝끝끝과제끝끝끝과제끝끝끝 -->
<!-- 과제끝끝끝과제끝끝끝과제끝끝끝과제끝끝끝과제끝끝끝 -->


<script>
var examPage = 1;
$(function(){
	$.ajax({
		method:'get',
		url:'<%=request.getContextPath()%>/prof/lec/exam/list?lecCd=${lecCd}&examPage='+examPage,
		dataType:"json",
		success:(data)=>{
			let examList = data.examList;
			let pageMaker = data.pageMaker;
			let cri = data.pageMaker.cri;
			
			var v_TbodyStr = "";
			var v_pageStr = "";
			var examTbody = document.querySelector("#examTbody");
			var examPage = document.querySelector("#examPagenation");
			
			
			for (var i = 0; i < examList.length; i++) {
				v_TbodyStr += `<tr>`;
				v_TbodyStr += `<td data-division="v_div`+i+`">\${data.examList[i].examDivName}</td>`;
				v_TbodyStr += `<td data-date="v_date`+i+`">\${data.examList[i].examDate}</td>`;
				v_TbodyStr += `<td data-room="v_classroom`+i+`">\${data.examList[i].examCr}</td>`;
				v_TbodyStr += `<td>
					<button class="btn btn-outline-primary btn-xs m-1 mb-2" type="button" data-division="v_div`+i+`" data-date="v_date`+i+`" data-room="v_classroom`+i+`"
					onclick="f_modify(event)">수정</button></td>`;
				v_TbodyStr += `	<td>
					<button class="btn btn-outline-danger btn-xs m-1 mb-2" type="button" onclick="javascript:alert('삭제...');">삭제</button>
					</td>`;
				v_TbodyStr += `</tr>`;
			}
			
			
			
			
	         v_pageStr += `<li class="page-item">`;
	         v_pageStr += `<a class="page-link" href="javascript:examList_go(1);">`;
	         v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
	         
	         v_pageStr += `<li class="page-item">`;
	         v_pageStr += `<a class="page-link" href="javascript:examList_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
	         v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
	         
	            
	               
	            for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
	               v_pageStr += `<li class="page-item \${cri.page == i?'active':''}">`;
	               v_pageStr += `<a class="page-link" href="javascript:examList_go('`+i+`');" >`+i+`</a></li>`;
	            }
	            
	            v_pageStr += `<li class="page-item">`;
	            v_pageStr += `<a class="page-link" href="javascript:examList_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
	            v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
	            v_pageStr += `<li class="page-item">`;
	            v_pageStr += `<a class="page-link" href="javascript:examList_go('\${pageMaker.realEndPage}');">`;
	            v_pageStr += ``;
	            
	            v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
			
			examTbody.innerHTML = v_TbodyStr;
			examPage.innerHTML = v_pageStr;
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
});

</script>
<script>


function examList_go(page){
	
	var paramUrl= "<%=request.getContextPath()%>/prof/lec/exam/list?lecCd=${lecCd}&page=";
	paramUrl += page;
	console.log(paramUrl);
	$.ajax({
		method:"get",
		url:paramUrl,
		dataType:"json",
		success:(data)=>{
			let examList = data.examList;
			let pageMaker = data.pageMaker;
			let cri = data.pageMaker.cri;
			
			var v_TbodyStr = "";
			var v_pageStr = "";
			var examTbody = document.querySelector("#examTbody");
			var examPage = document.querySelector("#examPagenation");
			
			
			for (var i = 0; i < examList.length; i++) {
				v_TbodyStr += `<tr>`;
				v_TbodyStr += `<td data-division="v_div`+i+`">\${data.examList[i].examDivName}</td>`;
				v_TbodyStr += `<td data-date="v_date`+i+`">\${data.examList[i].examDate}</td>`;
				v_TbodyStr += `<td data-room="v_classroom`+i+`">\${data.examList[i].examCr}</td>`;
				v_TbodyStr += `<td>
					<button class="btn btn-outline-primary btn-xs m-1 mb-2" type="button" data-division="v_div`+i+`" data-date="v_date`+i+`" data-room="v_classroom`+i+`"
					onclick="f_modify(event)">수정</button></td>`;
				v_TbodyStr += `	<td>
					<button class="btn btn-outline-danger btn-xs m-1 mb-2" type="button" onclick="javascript:alert('삭제...');">삭제</button>
					</td>`;
				v_TbodyStr += `</tr>`;
			}
			
			
			
			
	         v_pageStr += `<li class="page-item">`;
	         v_pageStr += `<a class="page-link" href="javascript:examList_go(1);">`;
	         v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
	         
	         v_pageStr += `<li class="page-item">`;
	         v_pageStr += `<a class="page-link" href="javascript:examList_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
	         v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
	         
	            
	               
	            for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
	               v_pageStr += `<li class="page-item \${cri.page == i?'active':''}">`;
	               v_pageStr += `<a class="page-link" href="javascript:examList_go('`+i+`');" >`+i+`</a></li>`;
	            }
	            
	            v_pageStr += `<li class="page-item">`;
	            v_pageStr += `<a class="page-link" href="javascript:examList_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
	            v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
	            v_pageStr += `<li class="page-item">`;
	            v_pageStr += `<a class="page-link" href="javascript:examList_go('\${pageMaker.realEndPage}');">`;
	            v_pageStr += ``;
	            
	            v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
			
			examTbody.innerHTML = v_TbodyStr;
			examPage.innerHTML = v_pageStr;
			
		},
		error:(request,status,error)=>{
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


</script>




<c:if test="${from eq 'regist' }" >
	<script>
		window.close();
		alert("등록되었습니다.");
		window.opener.location.reload();			
	</script>
</c:if>
<c:if test="${from eq 'remove' }" >
	<script>
		window.close();
		alert("삭제되었습니다.");
		window.opener.location.reload();			
	</script>
</c:if>
</body>