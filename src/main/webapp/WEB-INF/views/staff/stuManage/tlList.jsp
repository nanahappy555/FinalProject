<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--<c:set var="tlApplyList1" value="${tlApplyDataMap.tlApplyList1 }"/>
<c:set var="tlApplyList2" value="${tlApplyDataMap.tlApplyList2 }"/> -->
<%-- 
<c:set var="pageMaker" value="${dataDualMap.pageMaker }" />
<c:set var="bokhakList" value="${dataDualMap.selectDualList }" />
<c:set var="criDual" value="${pageMakerDual.cri }" />
 --%>



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
tr>th{
background-color: #cce5ff;
}
</style>

<div class="pills-regular">
    <ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active show" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="home" aria-selected="true">휴학</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="profile" aria-selected="false">복학</a>
        </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
        <div class="tab-pane fade active show" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
            <div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
	
	<!-- ================================================= -->
	<!-- 카드바디 시작 -->
	<!-- ================================================= -->
			<div class="card-body" >
			<!-- ================================================= -->
			<!-- 검색바 시작 -->
			<!-- ================================================= -->
			
			  	
			<div id="huhakKeyword">
				<%-- <div class="input-group mb-3 justify-content-end">
					<select class="form-control col-md-1" name="perPageNum"
						id="perPageNum" onchange="list_go(1);">
						<option value="10">정렬개수</option>
						<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
						<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
						<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
						<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>

					</select>
					
					<select class="form-control col-md-2" name="searchType"
						id="searchType">
						<option value="" ${cri.searchType eq '' ? 'selected':'' }>정렬조건</option>
						<option value="date" ${cri.searchType eq 'date' ? 'selected':'' }>신청일</option>
						<option value="status" ${cri.searchType eq 'status' ? 'selected':'' }>처리상태</option>
					</select> 
					<input class="form-control col-md-2" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
						class="input-group-append">
						<button class="btn btn-primary btn-sm" type="button"
							onclick="list_go(1);" id="searchBtn">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div> --%>
			</div>
				
			
		
			<!-- ================================================= -->
			<!-- 검색바 끝 -->
			<!-- ================================================= -->
		
			<!-- ================================================= -->
			<!-- 게시판 시작 -->
			<!-- ================================================= -->
			</div>
		</div>	
	</div>
</div>			
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<form id="tl_Form" action="<%=request.getContextPath() %>/staff/stuManage/tl/apply" method="post">
			<table class="table table-hover">
				<thead>
					<tr>	
						<th scope="col"></th>
						<th scope="col">학번</th>
						<th scope="col">학년</th>
						<th scope="col">학기</th>
						<th scope="col">이름</th>
						<th scope="col">분과대학</th>
						<th scope="col">학과</th>
						<th scope="col">신청일자</th>
						<th scope="col">휴학시작학기</th>
						<th scope="col">복학예정학기</th>
						<th scope="col">휴학사유</th>
						<th scope="col">진행상태</th>
					</tr>
				</thead>
				<tbody id="huhak" >
<%-- 					<c:forEach items="${tlList}" var="staffTlApply"> --%>
<!-- 					<tr> -->
<%-- 						<td><input type="checkbox" name="checkTlApply" value="${staffTlApply.tlApplySeq}"></td> --%>
<%-- 						<td>${staffTlApply.stuCd}</td> --%>
<%-- 						<td>${staffTlApply.grade}</td> --%>
<%-- 						<td>${staffTlApply.stuSemester}</td> --%>
<%-- 						<td>${staffTlApply.name}</td> --%>
<%-- 						<td>${staffTlApply.colName}</td> --%>
<%-- 						<td>${staffTlApply.majorName}</td> --%>
<%-- 						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${staffTlApply.applyDate}"/></td> --%>
<%-- 						<td>${staffTlApply.tlAppSeme}</td> --%>
<%-- 						<td>${staffTlApply.backSeme}</td> --%>
<%-- 						<td>${staffTlApply.tlClassCd}</td> --%>
<%-- 						<td>${staffTlApply.applyStatusCd}</td> --%>
<!-- 					</tr> -->
<%-- 					</c:forEach> --%>
				</tbody>
			</table>
			
			
					<div class="Chk" align="right" style="margin:15px 20px ">
						<button class="btn btn-primary" type="button" onclick="tlApprove('ok')">승인</button>
						<button class="btn btn-danger" type="button" onclick="tlApprove('nok')">반려</button>
					</div>
			
			
			</form>
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
		
			
		<nav aria-label="Navigation">
			<ul class="pagination justify-content-center m-0" id="huhakPage">
			
			</ul>
	   </nav>
		
		
		
		
		<!-- <div class="row justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination" id="huhakPage">
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
		
		
		
		
		<!-- ================================================= -->
		<!-- 페이지네이션 끝 -->
		<!-- ================================================= -->
		
	
	<!-- ================================================= -->
	<!-- 카드바디 끝 -->
	<!-- ================================================= -->
	
	
	
	<!-- ================================================= -->
	<!-- 카드 끝 -->
	<!-- ================================================= -->








<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
        </div>
        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
            <div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
	
	<!-- ================================================= -->
	<!-- 카드바디 시작 -->
	<!-- ================================================= -->
			<div class="card-body" >
			<!-- ================================================= -->
			<!-- 검색바 시작 -->
			<!-- ================================================= -->
			<%-- 	<div class="input-group mb-3 justify-content-center" >
				&nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">분과대학</div>&nbsp;&nbsp;
					<select class="form-control col-md-2" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
				  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >전체</option>
				  		<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>인문대학</option>
				  		<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>사범대학</option>
				  		<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>이공대학</option>
				  	</select>
				  	
				&nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">소속학과</div>&nbsp;&nbsp;
				 	<select class="form-control col-md-2" name="searchType" id="searchType">
				 		<option value=""  >전체</option>
						<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
						<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
						<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>	
										 									
					</select>
				&nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">검색</div>&nbsp;&nbsp;
				 	<!--  <input id="inputText3" type="text" class="form-control" style="width:30px;height:20	px;font-size:10px;">-->
				 	<input class="form-control col-md-2" type="text" name="keyword" style="width:30px; height:40px; font-size:14px;" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
					<span class="input-group-append" >
						<button class="btn btn-primary btn-xs" style="width:45px; height:40px; type="button" 
								id="searchBtn" onclick="list_go(1);">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
					<div class="row justify-content-end" style="padding-left:50px; height:40px;">
						<button class="btn btn-outline-primary btn-md" type="button"onclick="backApprove()">승인</button>&nbsp;&nbsp;
						<button class="btn btn-outline-danger btn-md" type="button"onclick="backReject()">반려</button>
					</div>
				</div>
				 --%>
				
				
			<div id="bokhakKeyword">
<!-- 				<div class="input-group mb-3 justify-content-end"> -->
<!-- 					<select class="form-control col-md-1" name="perPageNum" -->
<!-- 						id="perPageNum" onchange="list_go(1);"> -->
<!-- 						<option value="10">정렬개수</option> -->
<%-- 						<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option> --%>
<%-- 						<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option> --%>
<%-- 						<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option> --%>
<%-- 						<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option> --%>

<!-- 					</select> -->
					
<!-- 					<select class="form-control col-md-2" name="searchType" -->
<!-- 						id="searchType"> -->
<%-- 						<option value="" ${cri.searchType eq '' ? 'selected':'' }>정렬조건</option> --%>
<%-- 						<option value="date" ${cri.searchType eq 'date' ? 'selected':'' }>신청일</option> --%>
<%-- 						<option value="status" ${cri.searchType eq 'status' ? 'selected':'' }>처리상태</option> --%>
<!-- 					</select>  -->
<!-- 					<input class="form-control col-md-2" type="text" name="keyword" -->
<%-- 						placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span --%>
<!-- 						class="input-group-append"> -->
<!-- 						<button class="btn btn-primary btn-sm" type="button" -->
<!-- 							onclick="list_go(1);" id="searchBtn"> -->
<!-- 							<i class="fa fa-fw fa-search"></i> -->
<!-- 						</button> -->
<!-- 					</span> -->
					
<!-- 				</div> -->
			</div>
				
			<!-- ================================================= -->
			<!-- 검색바 끝 -->
			<!-- ================================================= -->
		
			<!-- ================================================= -->
			<!-- 게시판 시작 -->
			<!-- ================================================= -->
			</div>
		</div>	
	</div>
</div>			
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
		<form id="back_Form" action="<%=request.getContextPath() %>/staff/stuManage/back/apply" method="post">
			<table class="table table-hover">
				<thead>
					<tr>
					
						<th scope="col"></th>
						<th scope="col">학번</th>
						<th scope="col">학년</th>
						<th scope="col">학기</th>
						<th scope="col">이름</th>
						<th scope="col">분과대학</th>
						<th scope="col">학과</th>
						<th scope="col">신청일자</th>
						<th scope="col">휴학시작학기</th>
						<th scope="col">복학예정학기</th>
						<th scope="col">휴학사유</th>
						<th scope="col">진행상태</th>
		
					</tr>
				</thead>
				<tbody id="bokhak">
<%-- 				<c:forEach items="${backList}" var="staffTlApply"> --%>
<!-- 					<tr> -->
<%-- 						<td><input type="checkbox" name="checkBackApply" value="${staffTlApply.acaChangeSeq}"></td> --%>
<%-- 						<td>${staffTlApply.stuId}</td> --%>
<%-- 						<td>${staffTlApply.grade}</td> --%>
<%-- 						<td>${staffTlApply.stuSemester}</td> --%>
<%-- 						<td>${staffTlApply.name}</td> --%>
<%-- 						<td>${staffTlApply.colName}</td> --%>
<%-- 						<td>${staffTlApply.majorName}</td> --%>
<%-- 						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${staffTlApply.applyDate}"/></td>						 --%>
<%-- 						<td>${staffTlApply.tlAppSeme}</td> --%>
<%-- 						<td>${staffTlApply.backSeme}</td> --%>
<%-- 						<td>${staffTlApply.tlReason}</td> --%>
<%-- 						<td>${staffTlApply.acaClassCd}</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
				</tbody>
			</table>
			
			
					<div class="Chk" align="right" style="margin:15px 20px ">
						<button class="btn btn-primary" type="button" onclick="backApprove('ok')">승인</button>
						<button class="btn btn-danger" type="button" onclick="backApprove('nok')">반려</button>
					</div>
			
			
			</form>
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
		
		
		<nav aria-label="Navigation">
			<ul class="pagination justify-content-center m-0" id="bokhakPage">
			
			</ul>
	   </nav>
		
		
		
		
		
		
	
		
		
        </div>
    </div>
</div>





<!-- 휴학  승인/반려 아작스  -->

<script>
	function tlApprove(status) {

	
    var checkArr = [];     // 배열 초기화
    var idx = 0;
    
    var sta = event.target.innerHTML;
    
    var chkStatus = $("input:checkbox[name='tlApplySeq']:checked").each(function(){
    	checkArr[idx] = $(this).val();
		 idx = idx + 1;
	});
	
	console.log(checkArr);
	console.log(chkStatus);

    
		var param = {

				checkArr : checkArr,
			applyStatusCd : status
		};

    console.log(param);
    
	
    Swal.fire({
        title: sta+'하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
    
 
    
		$.ajax({
			method : "post",
			url : "<%=request.getContextPath()%>/staff/stuManage/tlapplyStatus",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(param),
			success : function(data) {

				console.log("콘솔" + data);
				console.log("콘솔2" + param);
			   
				
				
				Swal.fire(
						  '성공적으로 '+sta+"했습니다.",
						  '',
						  'success'
						).then(function(){
							
					
							
				
				location.replace(location.href);

			
				
						});			    
				

			},
			error : function() {
				Swal.fire({
					  icon: 'error',
					  title: '오류가 발생하였습니다.',
					})
			}
			
			
		});
		
} else if (result.isDenied) {
            
            Swal.fire('저장되지 않았습니다.', '', 'info')
            
          }
        });
		
		
	}
 </script>





<!-- 복학 승인/반려 아작스  -->
<script>
	function backApprove(status) {

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
			   
	
			  
			  
    var checkArr = [];     // 배열 초기화
    var idx = 0;
    
    var sta = event.target.innerHTML;
    
    var chkStatus = $("input:checkbox[name='acaChangeSeq']:checked").each(function(){
    	checkArr[idx] = $(this).val();
		 idx = idx + 1;
	});
	
	console.log(checkArr);
	console.log(chkStatus);

    
		var param = {

				checkArr : checkArr,
			applyStatusCd : status
		};

		
		
    console.log(param);
    
    

    Swal.fire({
        title: sta+'하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
    
    
    
		$.ajax({
			method : "post",
			url : "<%=request.getContextPath()%>/staff/stuManage/backapplyStatus",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(param),
			success : function(data) {

				console.log("콘솔" + data);
				console.log("콘솔2" + param);
				
				

				Swal.fire(
						  '성공적으로 '+sta+"했습니다.",
						  '',
						  'success'
						).then(function(){
							
					
				
				location.replace(location.href);
			

			
				
						});			    
				

			},
			error : function() {
				Swal.fire({
					  icon: 'error',
					  title: '오류가 발생하였습니다.',
					})
			}
			
			
		});
		
} else if (result.isDenied) {
            
            Swal.fire('저장되지 않았습니다.', '', 'info')
            
          }
        });
		
		
	}	
 </script>

<c:if test="${from eq 'approve' }">
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

	


<!-- 휴학리스트 화면 아작 -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
$(function(){

$.ajax({
	method:"get",
	url:"<%=request.getContextPath()%>/staff/stuManage/tl/huList",
	dataType:"json",
	success:(data)=>{
// 		console.log("kkk:",data);
		let cri = data.pageMaker.cri;
		console.log("cri:", cri);
		let pageMaker = data.pageMaker;
		console.log("pageMaker:",pageMaker);
		let list = data.selectHuhakList;

		/* 검색바 */
		
		 v_pageStr = "";
		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="huhakperPageNum" onchange="huhaklist_go(1);">`;
		 v_pageStr += `<option value="10">정렬개수</option>`;
		 v_pageStr += `<option value="2" \${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>`;
		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="huhaksearchType">`;
		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
		 v_pageStr += `<option value="as" \${cri.searchType == 'as' ? 'selected':'' }>진행상태</option>`;
		 v_pageStr += `<option value="c" \${cri.searchType == 'c' ? 'selected':'' }>분과대학</option>`;
		 v_pageStr += `<option value="m" \${cri.searchType == 'm' ? 'selected':'' }>학과</option>`;
		 v_pageStr += `<option value="cm" \${cri.searchType == 'cm' ? 'selected':'' }>분과대학+학과</option></select>`;
		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="huhaklist_go(1);" id="huhaksearchBtn">`;
		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

		 
// 		console.log(v_pageStr);
		document.querySelector("#huhakKeyword").innerHTML = v_pageStr;
	
		
		/* 테이블리스트 */
		
 	    var v_tblStr = "";
 		for (var i = 0; i < list.length; i++) {            
			v_tblStr += `<tr>`;
			
 			v_tblStr += `<td><input type="checkbox" name="tlApplySeq" value="\${list[i].tlApplySeq}"></td>`; 
  		    v_tblStr += "<td>"+ list[i].stuCd +"</td>";
  			v_tblStr += "<td>"+ list[i].grade +"</td>";
  			v_tblStr += "<td>"+ list[i].stuSemester + "</td>";
  		    v_tblStr += "<td>"+ list[i].name +"</td>";
  			v_tblStr += "<td>"+ list[i].colName +"</td>";
  			v_tblStr += "<td>"+ list[i].majorName +"</td>";
  			v_tblStr += "<td>"+ moment(list[i].applyDate).format('YYYY/MM/DD'); +"</td>";
  			v_tblStr += "<td>"+ list[i].tlAppSeme +"</td>";
  			v_tblStr += "<td>"+ list[i].backSeme +"</td>";
  			v_tblStr += "<td>"+	list[i].tlClassCd+"</td>";
  			if(list[i].applyStatusCd == '승인') {
  				v_tblStr += "<td style='color:#64CD3C'>" + list[i].applyStatusCd +"</td>";
  			} else if(list[i].applyStatusCd == '반려') {
					v_tblStr += "<td style='color:#FF6464'>"+ list[i].applyStatusCd +"</td>";	
			} else if(list[i].applyStatusCd == '진행중') { 
						v_tblStr += "<td>"+ list[i].applyStatusCd +"</td>";
					}	
  			
  			v_tblStr += "</tr>";
  			
 		}
            
 		//  	    console.log(v_tblStr);
		document.querySelector("#huhak").innerHTML = v_tblStr;
  					
		/* 페이지네이션  */
	
		
		var v_pageStr = "";
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:huhaklist_go(1);">`;
			v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
			
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
			v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
			
				
					
				for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
					
					if(i== cri.page){
						v_pageStr += `<li class="page-item active">`;						
						v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('`+i+`');" >`+i+`</a></li>`;
					}else {
						v_pageStr += `<li class="page-item ">`;						
						v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('`+i+`');" >`+i+`</a></li>`;
					}
				}
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('\${pageMaker.realEndPage}');">`;
				
				v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
				
			/* 	var page1 = document.querySelector("#huhakPage");
				console.log("페이지",page1);
				 */
// 				.innerHTML = v_pageStr;
				 
				document.querySelector("#huhakPage").innerHTML = v_pageStr;
				
				
				
	},
	
	error:(request,status,error)=>{
// 		console.log("에러임?");
		alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});
});
</script>

<!-- 복학리스트 화면 아작 -->

<script>
$(function(){

	$.ajax({
		method:"get",
		url:"<%=request.getContextPath()%>/staff/stuManage/tl/bokList",
		dataType:"json",
		success:(data)=>{
	 		console.log("kkk:",data);
			let cri = data.pageMaker.cri;
			console.log("cri:", cri);
			let pageMaker = data.pageMaker;
			console.log("pageMaker:",pageMaker);
			let list = data.selectBokhakList;
			
			
			console.log("복학리스트 "  , list);
			/* 검색바 */
			
			 v_pageStr = "";
			 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
			 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="bokhakperPageNum" onchange="bokhaklist_go(1);">`;
			 v_pageStr += `<option value="10">정렬개수</option>`;
			 v_pageStr += `<option value="2" \${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>`;
			 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
			 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
			 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
			 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
			 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="bokhaksearchType">`;
			 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
			 v_pageStr += `<option value="aca" \${cri.searchType == 'aca' ? 'selected':'' }>진행상태</option>`;
			 v_pageStr += `<option value="c" \${cri.searchType == 'c' ? 'selected':'' }>분과대학</option>`;
			 v_pageStr += `<option value="m" \${cri.searchType == 'm' ? 'selected':'' }>학과</option>`;
			 v_pageStr += `<option value="cm" \${cri.searchType == 'cm' ? 'selected':'' }>분과대학+학과</option></select>`;
			 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
			 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="bokhaklist_go(1);" id="bokhaksearchBtn">`;
			 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

			 
//	 		console.log(v_pageStr);
			document.querySelector("#bokhakKeyword").innerHTML = v_pageStr;
		
			
			/* 테이블리스트 */
			
	 	    var v_tblStr = "";
	 		for (var i = 0; i < list.length; i++) {            
				v_tblStr += "<tr>";
				
	 			v_tblStr += `<td><input type="checkbox" name="acaChangeSeq" value="\${list[i].acaChangeSeq}"></td>`; 
	  		    v_tblStr += "<td>"+ list[i].stuId +"</td>";
	  			v_tblStr += "<td>"+ list[i].grade +"</td>";
	  			v_tblStr += "<td>"+ list[i].stuSemester + "</td>";
	  		    v_tblStr += "<td>"+ list[i].name +"</td>";
	  			v_tblStr += "<td>"+ list[i].colName +"</td>";
	  			v_tblStr += "<td>"+ list[i].majorName +"</td>";
	  			v_tblStr += "<td>"+ moment(list[i].applyDate).format('YYYY-MM-DD'); +"</td>";
	  			v_tblStr += "<td>"+ list[i].tlAppSeme +"</td>";
	  			v_tblStr += "<td>"+ list[i].backSeme +"</td>";
	  			v_tblStr += "<td>"+ list[i].tlReason +"</td>";
	  			v_tblStr += "<td>"+ list[i].acaClassCd +"</td>";
	  			
	  			v_tblStr += "</tr>";
	  			
	 		}
	 		
	            
	 		
//	  	    console.log(v_tblStr);
			document.querySelector("#bokhak").innerHTML = v_tblStr;
	  					
			/* 페이지네이션  */
		
			
			var v_pageStr = "";
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go(1);">`;
				v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
				
					
						
					for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
						
						if(i== cri.page){
							v_pageStr += `<li class="page-item active">`;						
							v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('`+i+`');" >`+i+`</a></li>`;
						}else {
							v_pageStr += `<li class="page-item ">`;						
							v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('`+i+`');" >`+i+`</a></li>`;
						}
					}
					
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
					v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('\${pageMaker.realEndPage}');">`;
					
					v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
					
					document.querySelector("#bokhakPage").innerHTML = v_pageStr;
					
					
		},
		
		error:(request,status,error)=>{
//	 		console.log("에러임?");
			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	});
</script>




<!-- 검색조건이 있을떄 휴학 리스트  -->


<script>


function huhaklist_go(page){
	  var perPageNum = $('select[name="perPageNum"]').eq(0).val();
	  var searchType = $('select[name="searchType"]').eq(0).val();
	  var keyword = $('div.input-group>input[name="keyword"]').eq(0).val();
	  
	  console.log(perPageNum);
	  console.log(searchType);
	  console.log(keyword);

	  var paramUrl = "<%=request.getContextPath()%>/staff/stuManage/tl/huList?page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	  console.log(paramUrl);
	   

	  $.ajax({
	      method:'get',
	      url:paramUrl,
	      success: (data) => {
	    	  
	    	  let cri = data.pageMaker.cri;
		  		let pageMaker = data.pageMaker;
		  		let list = data.selectHuhakList;

		  		/* 검색바 */
		  		
		  		 v_pageStr = "";
		  		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
		  		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="huhakperPageNum" onchange="huhaklist_go(1);">`;
		  		 v_pageStr += `<option value="10">정렬개수</option>`;
		  		 v_pageStr += `<option value="2" \${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>`;
		  		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
		  		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
		  		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
		  		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
		  		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="huhaksearchType">`;
		  		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
		  		 v_pageStr += `<option value="as" \${cri.searchType == 'as' ? 'selected':'' }>진행상태</option>`;
				 v_pageStr += `<option value="c" \${cri.searchType == 'c' ? 'selected':'' }>분과대학</option>`;
				 v_pageStr += `<option value="m" \${cri.searchType == 'm' ? 'selected':'' }>학과</option>`;
				 v_pageStr += `<option value="cm" \${cri.searchType == 'cm' ? 'selected':'' }>분과대학+학과</option></select>`;
		  		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
		  		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="huhaklist_go(1);" id="huhaksearchBtn">`;
		  		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

		  		 
//		  		console.log(v_pageStr);
		  		document.querySelector("#huhakKeyword").innerHTML = v_pageStr;
		  	
		  		
		  		/* 테이블리스트 */
		  		
				   	     var v_tblStr = "";
		 		for (var i = 0; i < list.length; i++) {            
					v_tblStr += "<tr>";
					
		 			v_tblStr += `<td><input type="checkbox" name="tlApplySeq" value="\${list[i].tlApplySeq}"></td>`; 
		  		    v_tblStr += "<td>"+ list[i].stuCd +"</td>";
		  			v_tblStr += "<td>"+ list[i].grade +"</td>";
		  			v_tblStr += "<td>"+ list[i].stuSemester + "</td>";
		  		    v_tblStr += "<td>"+ list[i].name +"</td>";
		  			v_tblStr += "<td>"+ list[i].colName +"</td>";
		  			v_tblStr += "<td>"+ list[i].majorName +"</td>";
		  			v_tblStr += "<td>"+ moment(list[i].applyDate).format('YYYY-MM-DD'); +"</td>";
		  			v_tblStr += "<td>"+ list[i].tlAppSeme +"</td>";
		  			v_tblStr += "<td>"+ list[i].backSeme +"</td>";
		  			v_tblStr += "<td>"+	list[i].tlClassCd+"</td>";
		  			v_tblStr += "<td>"+ list[i].applyStatusCd +"</td>";
		  			
		  			v_tblStr += "</tr>";
		  			
		 		}
		              
		   		
//		   	    console.log(v_tblStr);
		  		document.querySelector("#huhak").innerHTML = v_tblStr;
		    					
		  		/* 페이지네이션  */
		  		
		  		
		  		var v_pageStr = "";
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:huhaklist_go(1);">`;
				v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
				
					
						
					for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
						
						if(i== cri.page){
							v_pageStr += `<li class="page-item active">`;						
							v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('`+i+`');" >`+i+`</a></li>`;
						}else {
							v_pageStr += `<li class="page-item ">`;						
							v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('`+i+`');" >`+i+`</a></li>`;
						}
					}
					
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
					v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:huhaklist_go('\${pageMaker.realEndPage}');">`;
					
					v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
		  				
		  				document.querySelector("#huhakPage").innerHTML = v_pageStr;
		         
		      
		      },
		      error: () => {
		         AjaxErrorSecurityRedirectHandler(error.status);
		      }
		   });
		   
	}  
	      

</script>

<!-- 검색조건이 있을때 복학 리스트 -->


<script>


function bokhaklist_go(page){
	  var perPageNum = $('select[name="perPageNum"]').eq(1).val();
	  var searchType = $('select[name="searchType"]').eq(1).val();
	  var keyword = $('div.input-group>input[name="keyword"]').eq(1).val();
	  
	  console.log(perPageNum);
	  console.log(searchType);
	  console.log(keyword);

	  var paramUrl = "<%=request.getContextPath()%>/staff/stuManage/tl/bokList?page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	  console.log(paramUrl);
	   

	  $.ajax({
	      method:'get',
	      url:paramUrl,
	      success: (data) => {
	    	  
	    	  let cri = data.pageMaker.cri;
		  		let pageMaker = data.pageMaker;
		  		let list = data.selectBokhakList;

		  		/* 검색바 */
		  		
		  		 v_pageStr = "";
		  		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
		  		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="bokhakPageNum" onchange="bokhaklist_go(1);">`;
		  		 v_pageStr += `<option value="10">정렬개수</option>`;
		  		 v_pageStr += `<option value="2" \${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>`;
		  		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
		  		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
		  		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
		  		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
		  		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="bokhaksearchType">`;
		  		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
		  		 v_pageStr += `<option value="aca" \${cri.searchType == 'aca' ? 'selected':'' }>진행상태</option>`;
				 v_pageStr += `<option value="c" \${cri.searchType == 'c' ? 'selected':'' }>분과대학</option>`;
				 v_pageStr += `<option value="m" \${cri.searchType == 'm' ? 'selected':'' }>학과</option>`;
				 v_pageStr += `<option value="cm" \${cri.searchType == 'cm' ? 'selected':'' }>분과대학+학과</option></select>`;
		  		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
		  		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="bokhaklist_go(1);" id="bokhaksearchBtn">`;
		  		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

		  		 
//		  		console.log(v_pageStr);
		  		document.querySelector("#bokhakKeyword").innerHTML = v_pageStr;
		  	
		  		
		  		/* 테이블리스트 */
		  		
		   	    var v_tblStr = "";
		 		for (var i = 0; i < list.length; i++) {            
					v_tblStr += "<tr>";
					
		 			v_tblStr += `<td><input type="checkbox" name="acaChangeSeq" value="\${list[i].acaChangeSeq}"></td>`; 
		  		    v_tblStr += "<td>"+ list[i].stuId +"</td>";
		  			v_tblStr += "<td>"+ list[i].grade +"</td>";
		  			v_tblStr += "<td>"+ list[i].stuSemester + "</td>";
		  		    v_tblStr += "<td>"+ list[i].name +"</td>";
		  			v_tblStr += "<td>"+ list[i].colName +"</td>";
		  			v_tblStr += "<td>"+ list[i].majorName +"</td>";
		  			v_tblStr += "<td>"+ moment(list[i].applyDate).format('YYYY-MM-DD'); +"</td>";
		  			v_tblStr += "<td>"+ list[i].tlAppSeme +"</td>";
		  			v_tblStr += "<td>"+ list[i].backSeme +"</td>";
		  			v_tblStr += "<td>"+ list[i].tlReason +"</td>";
		  			v_tblStr += "<td>"+ list[i].acaClassCd +"</td>";
		  			
		  			v_tblStr += "</tr>";
		  			
		 		}
		              
		   		
//		   	    console.log(v_tblStr);
		  		document.querySelector("#bokhak").innerHTML = v_tblStr;
		    					
		  		/* 페이지네이션  */
		  		
		  		
		  		var v_pageStr = "";
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go(1);">`;
				v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
				
					
						
					for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
						
						if(i== cri.page){
							v_pageStr += `<li class="page-item active">`;						
							v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('`+i+`');" >`+i+`</a></li>`;
						}else {
							v_pageStr += `<li class="page-item ">`;						
							v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('`+i+`');" >`+i+`</a></li>`;
						}
					}
					
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
					v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:bokhaklist_go('\${pageMaker.realEndPage}');">`;
					
					v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
		  				
		  				document.querySelector("#bokhakPage").innerHTML = v_pageStr;
		         
		      
		      },
		      error: () => {
		         AjaxErrorSecurityRedirectHandler(error.status);
		      }
		   });
		   
	}  
	      

</script>



