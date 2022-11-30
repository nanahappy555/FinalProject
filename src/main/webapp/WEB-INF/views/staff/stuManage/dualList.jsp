<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMakerDual" value="${dataDualMap.pageMaker }" />
<c:set var="dualList" value="${dataDualMap.selectDualList }" />
<c:set var="criDual" value="${pageMakerDual.cri }" />

<c:set var="pageMakerSub" value="${dataSubMap.pageMaker }" />
<c:set var="subList" value="${dataSubMap.selectSubList }" />
<c:set var="criSub" value="${pageMakerSub.cri }" />

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
</style>
<style>
tr>th{
	background-color: #cce5ff;
}
</style>

<div class="pills-regular">
    <ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active show" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="home" aria-selected="true">복수전공</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="profile" aria-selected="false">부전공</a>
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
			
			<!-- 	<div class="input-group mb-3 justify-content-center" > -->
					<!--  <button class="btn btn-rounded btn-primary mb-1">&nbsp;&nbsp;&nbsp;<b>구  분</b>&nbsp;&nbsp;&nbsp; </button>&nbsp;&nbsp;
				<span class="mt-2"><h3><strong>구분</strong></h3></span>&nbsp;&nbsp; 
				
						<select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
					  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >전체</option>
					  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >교직원</option>
					  		<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>교수</option>
					  		<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>학생</option>
					  		
					  	</select> --> 
				
				<%-- &nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">분과대학</div>&nbsp;&nbsp;
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
						<!-- <button class="btn btn-dark mb-1" style="margin-left:10px;" type="button" id="searchBtn" onclick="">초기화</button> -->
					</span> --%>
					
			<div id="dualKeyword">
				<%-- <div class="input-group mb-3 justify-content-end">
				
					<select class="form-control col-md-1" name="perPageNum"
						id="perPageNum" onchange="duallist_go();">
						<option value="10">정렬개수</option>
						<option value="5" ${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>
						<option value="10" ${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>
						<option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
						<option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>

					</select>
					
					
					<select class="form-control col-md-2" name="searchType" id="searchType" onchange="duallist_go();">
						<option value="" ${cri.searchType eq '' ? 'selected':'' }>정렬조건</option>
						<option value="date" ${cri.searchType eq 'date' ? 'selected':'' }>신청일</option>
						<option value="status" ${cri.searchType eq 'status' ? 'selected':'' }>처리상태</option>
					</select> 
					
					<input class="form-control col-md-2" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
						class="input-group-append">
						<button class="btn btn-primary btn-sm" type="button"
							onclick="duallist_go();" id="searchBtn">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div> --%>
			</div>
					
					
					
				<!-- 	
					<div class="sub" align="right">
						<button class="btn btn-primary" type="button" onclick="dualApprove()">승인</button>
						<button class="btn btn-danger" type="button" onclick="dualReject()">반려</button>
					</div>
					
					 -->
			<!-- 	</div> -->
				
				
			</div>
			
		</div>	
	</div>
</div>			
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
		<form id="d_form" action="<%=request.getContextPath() %>/staff/stuManage/majorDual/apply" method="post"> 
			<table class="table table-hover">
				<thead>
					<tr>
					
						<th scope="col"></th>
						<th scope="col">구분</th>
						<th scope="col">학번</th>
						<th scope="col">학년</th>
						<th scope="col">이름</th>
						<th scope="col">신청일</th>
						<th scope="col">소속분과대학</th>
						<th scope="col">소속학과</th>
						<th scope="col">희망분과대학</th>
						<th scope="col">희망학과</th>
						<th scope="col">연락처</th>
						<th scope="col">처리상태</th>
					</tr>
				</thead>
				<tbody id="duall">
					<%-- <c:forEach items="${sdList}" var="staffDual">
						<tr>
							<td><input type="checkbox" name="checkMajorCha" value="${staffDual.majorChaSeq}"></td>
							<td>${staffDual.majClassName}</td>
							<td>${staffDual.stuCd}</td>
							<td>${staffDual.grade}</td>
							<td>${staffDual.name}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${staffDual.applyDate}"/></td>
							<td>${staffDual.presentCollegeName}</td>
							<td>${staffDual.presentMajName}</td>
							<td>${staffDual.hopeColName}</td>
							<td>${staffDual.hopeMajorName}</td>
							<td>${staffDual.phone}</td>
							<td>${staffDual.applyStatusCd}</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
			
					<div class="Chk" align="right" style="margin:15px 20px " id=>
						<button class="btn btn-primary" type="button" onclick="dualApprove()">승인</button>
						<button class="btn btn-danger" type="button" onclick="dualReject()">반려</button>
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
			<ul class="pagination justify-content-center m-0" id="dualPage">
		
			</ul>
	    </nav>
	  
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
			<!-- 	<div class="input-group mb-3 justify-content-center" > -->
					<!--  <button class="btn btn-rounded btn-primary mb-1">&nbsp;&nbsp;&nbsp;<b>구  분</b>&nbsp;&nbsp;&nbsp; </button>&nbsp;&nbsp;
				<span class="mt-2"><h3><strong>구분</strong></h3></span>&nbsp;&nbsp; 
				
						<select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
					  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >전체</option>
					  		<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >교직원</option>
					  		<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>교수</option>
					  		<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>학생</option>
					  		
					  	</select> --> 
				
				<%-- &nbsp;&nbsp;&nbsp;<div class="lecInfo" style="width:130px;">분과대학</div>&nbsp;&nbsp;
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
						<!-- <button class="btn btn-dark mb-1" style="margin-left:10px;" type="button" id="searchBtn" onclick="">초기화</button> -->
					</span>
					
					
					
					
					<div class="row justify-content-end" style="padding-left:50px; height:40px;">
						<button class="btn btn-primary" type="button"onclick="subApprove()">승인</button>&nbsp;&nbsp;
						<button class="btn btn-danger" type="button"onclick="subReject()">반려</button>
					</div>
					 --%>
					
					
					
					
					
					
			<div id="subKeyword">
<!-- 				<div class="input-group mb-3 justify-content-end"> -->
<!-- 					<select class="form-control col-md-1" name="perPageNum" -->
<!-- 						id="perPageNum" onchange="sublist_go();"> -->
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
<!-- 							onclick="sublist_go();" id="searchBtn"> -->
<!-- 							<i class="fa fa-fw fa-search"></i> -->
<!-- 						</button> -->
<!-- 					</span> -->
<!-- 				</div> -->
			</div>
					
					
					
					<!-- 
					<div class="sub" align="right">
						<button class="btn btn-primary" type="button" onclick="dualApprove()">승인</button>&nbsp;&nbsp;
						<button class="btn btn-danger" type="button" onclick="dualReject()">반려</button>
					</div>
					 -->
					
				<!-- </div> -->
			</div>
		</div>	
	</div>
</div>			
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<form id="sub_form" action="<%=request.getContextPath() %>/staff/stuManage/majorDual/apply" method="post">	
			<table class="table table-hover" id="">
				<thead>
					<tr>
					
						<th scope="col"></th>
						<th scope="col">구분</th>
						<th scope="col">학번</th>
						<th scope="col">학년</th>
						<th scope="col">이름</th>
						<th scope="col">신청일</th>
						<th scope="col">소속분과대학</th>
						<th scope="col">소속학과</th>
						<th scope="col">희망분과대학</th>
						<th scope="col">희망학과</th>
						<th scope="col">연락처</th>
						<th scope="col">처리상태</th>
					</tr>
				</thead>
				<tbody id="subb">
					<%-- <c:forEach items="${subList}" var="staffDual">
						<tr>
							<td><input type="checkbox" class="sublist" name="checkMajorCha" value="${staffDual.majorChaSeq}"></td>
							<td>${staffDual.majClassName}</td>
							<td>${staffDual.stuCd}</td>
							<td>${staffDual.grade}</td>
							<td>${staffDual.name}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${staffDual.applyDate}"/></td>
							<td>${staffDual.presentCollegeName}</td>
							<td>${staffDual.presentMajName}</td>
							<td>${staffDual.hopeColName}</td>
							<td>${staffDual.hopeMajorName}</td>
							<td>${staffDual.phone}</td>
							<td>${staffDual.applyStatusCd}</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
			
			
					<div class="Chk" align="right" style="margin:15px 20px ">
						<button class="btn btn-primary" type="button" onclick="subApprove()">승인</button>
						<button class="btn btn-danger" type="button" onclick="subReject()">반려</button>
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
	<ul class="pagination justify-content-center m-0" id="subPage">
		
		</ul>
	  </nav>
		
		
		
		
		
        </div>
    </div>
</div>

<!-- <form id="dualForm">	 -->
<!-- 	<input type='text' name="page" value="" /> -->
<!-- 	<input type='text' name="perPageNum" value=""/> -->
<!-- 	<input type='text' name="searchType" value="" /> -->
<!-- 	<input type='text' name="keyword" value="" /> -->
<!-- </form> -->

<script>






</script>

<script>


// function sublist_go(page,url){
// 	if(!url) url="/dual/subMajorList?perPageNum=${perPageNum}&searchType=${searchType}";
	
// 	var jobForm=$('#sub_form');
// 	jobForm.find("[name='page']").val(page);
// 	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
// 	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
// 	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
// 	jobForm.attr({
// 		action:url,
// 		method:'get'
// 	}).submit(); 
// }



</script>

<script>

function dualApprove(){
	
	

	Swal.fire({
        title: '승인하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {

	
	var chkArr = $('[name=checkMajorCha]');
	var nullChkFlag = true;
	for(var i=0;i<chkArr.length;i++){
		if(chkArr[i].checked){
			nullChkFlag=false;
		}
	}
	if(nullChkFlag){
		Swal.fire({
			  icon: 'error',
			  title: '체크해주세요.',
			})

		return;
	}
	
	
	var d_form = $('#d_form');
	var inputApplyStatus = $('<input type="hidden" name="applyStatus">')
	
	
	inputApplyStatus.val("ok");
	d_form.append(inputApplyStatus);
	d_form.serialize();
	d_form.submit();
 

        }
        		
        		  })
        		}

function dualReject(){
	
	

	Swal.fire({
        title: '반려하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {

	
	
	var chkArr = $('[name=checkMajorCha]');
	
	var nullChkFlag = true;
	for(var i=0;i<chkArr.length;i++){
		if(chkArr[i].checked){
			nullChkFlag=false;
		}
	}
	if(nullChkFlag){
		Swal.fire({
			  icon: 'error',
			  title: '체크해주세요.',
			})
		return;
	}
	
	var d_form = $('#d_form');
	var inputApplyStatus = $('<input type="hidden" name="applyStatus">')
	inputApplyStatus.val("nok");
	d_form.append(inputApplyStatus);
	d_form.serialize();
	d_form.submit();

        }
        		
        		  })
        		}

function subApprove(){
	

	Swal.fire({
        title: '승인하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {

	
	
	var chkArr = $('[name=checkMajorCha]');
	var nullChkFlag = true;
	for(var i=0;i<chkArr.length;i++){
		if(chkArr[i].checked){
			nullChkFlag=false;
		}
	}
	if(nullChkFlag){
		Swal.fire({
			  icon: 'error',
			  title: '체크해주세요.',
			})
		return;
	}
	
	
	var sub_form = $('#sub_form');
	var inputApplyStatus = $('<input type="hidden" name="applyStatus">')
	
	
	inputApplyStatus.val("ok");
	sub_form.append(inputApplyStatus);
	sub_form.serialize();
	sub_form.submit();
	
        }
		
	  })
	}

function subReject(){
	

	Swal.fire({
        title: '반려하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {

	
	
	var chkArr = $('[name=checkMajorCha]');
	
	var nullChkFlag = true;
	for(var i=0;i<chkArr.length;i++){
		if(chkArr[i].checked){
			nullChkFlag=false;
		}
	}
	if(nullChkFlag){
		Swal.fire({
			  icon: 'error',
			  title: '체크해주세요.',
			})
		return;
	}
	
	var sub_form = $('#sub_form');
	var inputApplyStatus = $('<input type="hidden" name="applyStatus">')
	inputApplyStatus.val("nok");
	sub_form.append(inputApplyStatus);
	sub_form.serialize();
	sub_form.submit();
	
      }
		
	  })
	}


</script>



<!-- 듀얼리스트 아작  -->


<script>
$(function(){

$.ajax({
	method:"get",
	url:"<%=request.getContextPath()%>/staff/stuManage/dual/dualMajorList",
	dataType:"json",
	success:(data)=>{
// 		console.log("kkk:",data);
		let cri = data.pageMaker.cri;
		console.log("cri:", cri);
		let pageMaker = data.pageMaker;
		console.log("pageMaker:",pageMaker);
		let list = data.selectDualList;
		
		console.log("날짜 확인 ",typeof(list[0].applyDate))
		/* 검색바 */
		
		 v_pageStr = "";
		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="dualperPageNum" onchange="duallist_go(1);">`;
		 v_pageStr += `<option value="10">정렬개수</option>`;
		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="dualsearchType">`;
		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
		 v_pageStr += `<option value="date" \${cri.searchType == 'date' ? 'selected':'' }>신청일</option>`;
		 v_pageStr += `<option value="status" \${cri.searchType == 'status' ? 'selected':'' }>처리상태</option></select>`;
		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="duallist_go(1);" id="dualsearchBtn">`;
		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

		 
// 		console.log(v_pageStr);
		document.querySelector("#dualKeyword").innerHTML = v_pageStr;
	
		
		/* 테이블리스트 */
		
 	    var v_tblStr = "";
 		for (var i = 0; i < list.length; i++) {            
			v_tblStr += "<tr>";
			
 			v_tblStr += `<td><input type="checkbox" name="checkMajorCha" value="\${list[i].majorChaSeq}"></td>`; 
  			v_tblStr += "<td>"+ list[i].majClassName +"</td>";
  		    v_tblStr += "<td>"+ list[i].stuCd +"</td>";
  			v_tblStr += "<td>"+ list[i].grade +"</td>";
  			v_tblStr += "<td>"+ list[i].name +"</td>";
  			
  			/* v_tblStr += "<td applyDate="${list[i].applyDate}">"+ ${fn:substring(list[i].applyDate,0,4)}+ "</td>"; */
  			
  			v_tblStr += "<td>"+ list[i].applyDate.replace(/-/gi, "/");+ "</td>";
  		    v_tblStr += "<td>"+ list[i].presentCollegeName +"</td>";
  			v_tblStr += "<td>"+ list[i].presentMajName +"</td>";
  			v_tblStr += "<td>"+ list[i].hopeColName +"</td>";
  			v_tblStr += "<td>"+ list[i].hopeMajorName +"</td>";
  			v_tblStr += "<td>"+ list[i].phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3") +"</td>";
  			
  			/* v_tblStr += "<td>"+ list[i].phone +"</td>"; */
  			if(list[i].applyStatusCd == '승인') {
  				v_tblStr += "<td style='color:#64CD3C'>"+ list[i].applyStatusCd +"</td>";
  			} else if(list[i].applyStatusCd == '반려') {
  					v_tblStr += "<td style='color:#FF6464'>"+ list[i].applyStatusCd +"</td>";	
  			} else if(list[i].applyStatusCd == '진행중') { 
  						v_tblStr += "<td>"+ list[i].applyStatusCd +"</td>";
  					}
  				
  			v_tblStr += "</tr>";
  			
 		}
            
 		
//  	    console.log(v_tblStr);
		document.querySelector("#duall").innerHTML = v_tblStr;
  					
		/* 페이지네이션  */
	
		
		var v_pageStr = "";
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:duallist_go(1);">`;
			v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
			
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:duallist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
			v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
			
				
					
				for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
					
					if(i== cri.page){
						v_pageStr += `<li class="page-item active">`;						
						v_pageStr += `<a class="page-link" href="javascript:duallist_go('`+i+`');" >`+i+`</a></li>`;
					}else {
						v_pageStr += `<li class="page-item ">`;						
						v_pageStr += `<a class="page-link" href="javascript:duallist_go('`+i+`');" >`+i+`</a></li>`;
					}
				}
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:duallist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:duallist_go('\${pageMaker.realEndPage}');">`;
				
				v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
				
				document.querySelector("#dualPage").innerHTML = v_pageStr;
				
				
	},
	
	error:(request,status,error)=>{
// 		console.log("에러임?");
		alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});
});
</script>





<!--  서브리스트  아작-->






<script>
$(function(){

$.ajax({
	method:"get",
	url:"<%=request.getContextPath()%>/staff/stuManage/dual/subMajorList",
	dataType:"json",
	success:(data)=>{
// 		console.log("qqq:",data);
		let cri = data.pageMaker.cri;
		let pageMaker = data.pageMaker;
		let list = data.selectSubList;

		
		/* 검색바 */
		
				v_pageStr = "";
		  		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
		  		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="subperPageNum" onchange="sublist_go(1);">`;
		  		 v_pageStr += `<option value="10">정렬개수</option>`;
		  		 v_pageStr += `<option value="2" \${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>`;
		  		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
		  		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
		  		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
		  		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
		  		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="subsearchType">`;
		  		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
		  		 v_pageStr += `<option value="date" \${cri.searchType == 'date' ? 'selected':'' }>신청일</option>`;
		  		 v_pageStr += `<option value="status" \${cri.searchType == 'status' ? 'selected':'' }>처리상태</option></select>`;
		  		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
		  		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="sublist_go(1);" id="subsearchBtn">`;
		  		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

		  		 
//		  		console.log(v_pageStr);
		  		document.querySelector("#subKeyword").innerHTML = v_pageStr;
		
		
		/* 테이블리스트 */
		
 	    var v_tblStr = "";
 		for (var i = 0; i < list.length; i++) {            
			v_tblStr += "<tr>";
			
 			v_tblStr += `<td><input type="checkbox" name="checkMajorCha" value="\${list[i].majorChaSeq}"></td>`; 
 			v_tblStr += "<td>"+ list[i].majClassName +"</td>";
  		    v_tblStr += "<td>"+ list[i].stuCd +"</td>";
  			v_tblStr += "<td>"+ list[i].grade +"</td>";
  			v_tblStr += "<td>"+ list[i].name +"</td>";
  			v_tblStr += "<td>"+ list[i].applyDate+ "</td>";
  		    v_tblStr += "<td>"+ list[i].presentCollegeName +"</td>";
  			v_tblStr += "<td>"+ list[i].presentMajName +"</td>";
  			v_tblStr += "<td>"+ list[i].hopeColName +"</td>";
  			v_tblStr += "<td>"+ list[i].hopeMajorName +"</td>";
  			v_tblStr += "<td>"+ list[i].phone +"</td>";
  			v_tblStr += "<td>"+ list[i].applyStatusCd +"</td>";
  			
  			v_tblStr += "</tr>";
  			
 		}
            
 		
 	    console.log(v_tblStr);
		document.querySelector("#subb").innerHTML = v_tblStr;
  					
		/* 페이지네이션  */
		
		
		var v_pageStr = "";
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:sublist_go(1);">`;
			v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
			
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:sublist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
			v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
			
				
					
				for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
					
					if(i== cri.page){
						v_pageStr += `<li class="page-item active">`;						
						v_pageStr += `<a class="page-link" href="javascript:sublist_go('`+i+`');" >`+i+`</a></li>`;
					}else {
						v_pageStr += `<li class="page-item ">`;						
						v_pageStr += `<a class="page-link" href="javascript:sublist_go('`+i+`');" >`+i+`</a></li>`;
					}
				}
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:sublist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:sublist_go('\${pageMaker.realEndPage}');">`;
				
				v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
				
			
			
				document.querySelector("#subPage").innerHTML = v_pageStr;
	},
	error:(request,status,error)=>{
		alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});
});


/* 검색조건이 있을떄 듀얼리스트 */

function duallist_go(page){
	  var perPageNum = $('select[name="perPageNum"]').eq(0).val();
	  var searchType = $('select[name="searchType"]').eq(0).val();
	  var keyword = $('div.input-group>input[name="keyword"]').eq(0).val();
	  
	  console.log(perPageNum);
	  console.log(searchType);
	  console.log(keyword);

	  var paramUrl = "<%=request.getContextPath()%>/staff/stuManage/dual/dualMajorList?page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	  console.log(paramUrl);
	   

	  $.ajax({
	      method:'get',
	      url:paramUrl,
	      success: (data) => {
	    	  
	    	  /* 값을 선택했을때 */
	   
//	    	  console.log("kkk:",data);
	  		let cri = data.pageMaker.cri;
	  		let pageMaker = data.pageMaker;
	  		let list = data.selectDualList;

	  		/* 검색바 */
	  		
	  		 v_pageStr = "";
	  		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
	  		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="dualperPageNum" onchange="(1);">`;
	  		 v_pageStr += `<option value="10">정렬개수</option>`;
	  		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
	  		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
	  		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
	  		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
	  		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="dualsearchType">`;
	  		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
	  		 v_pageStr += `<option value="date" \${cri.searchType == 'date' ? 'selected':'' }>신청일</option>`;
	  		 v_pageStr += `<option value="status" \${cri.searchType == 'status' ? 'selected':'' }>처리상태</option></select>`;
	  		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
	  		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="duallist_go(1);" id="dualsearchBtn">`;
	  		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

	  		 
//	  		console.log(v_pageStr);
	  		document.querySelector("#dualKeyword").innerHTML = v_pageStr;
	  	
	  		
	  		/* 테이블리스트 */
	  		
	   	    var v_tblStr = "";
	   		for (var i = 0; i < list.length; i++) {            
	  			v_tblStr += "<tr>";
	  			
	   			v_tblStr += `<td><input type="checkbox" name="checkMajorCha" value="\${list[i].majorChaSeq}"></td>`; 
	    			v_tblStr += "<td>"+ list[i].majClassName +"</td>";
	    		    v_tblStr += "<td>"+ list[i].stuCd +"</td>";
	    			v_tblStr += "<td>"+ list[i].grade +"</td>";
	    			v_tblStr += "<td>"+ list[i].name +"</td>";
	    			v_tblStr += "<td>"+ list[i].applyDate+ "</td>";
	    		    v_tblStr += "<td>"+ list[i].presentCollegeName +"</td>";
	    			v_tblStr += "<td>"+ list[i].presentMajName +"</td>";
	    			v_tblStr += "<td>"+ list[i].hopeColName +"</td>";
	    			v_tblStr += "<td>"+ list[i].hopeMajorName +"</td>";
	    			v_tblStr += "<td>"+ list[i].phone +"</td>";
	    			v_tblStr += "<td>"+ list[i].applyStatusCd +"</td>";
	    			
	    			v_tblStr += "</tr>";
	    			
	   		}
	              
	   		
//	   	    console.log(v_tblStr);
	  		document.querySelector("#duall").innerHTML = v_tblStr;
	    					
	  		/* 페이지네이션  */
	  		
	  		
	  		var v_pageStr = "";
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:duallist_go(1);">`;
			v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
			
			v_pageStr += `<li class="page-item">`;
			v_pageStr += `<a class="page-link" href="javascript:duallist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
			v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
			
				
					
				for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
					
					if(i== cri.page){
						v_pageStr += `<li class="page-item active">`;						
						v_pageStr += `<a class="page-link" href="javascript:duallist_go('`+i+`');" >`+i+`</a></li>`;
					}else {
						v_pageStr += `<li class="page-item ">`;						
						v_pageStr += `<a class="page-link" href="javascript:duallist_go('`+i+`');" >`+i+`</a></li>`;
					}
				}
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:duallist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:duallist_go('\${pageMaker.realEndPage}');">`;
				
				v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
	  				
	  				document.querySelector("#dualPage").innerHTML = v_pageStr;
	         
	      
	      },
	      error: () => {
	         AjaxErrorSecurityRedirectHandler(error.status);
	      }
	   });
	   
}
</script>


<!-- 검색조건이 있을떄  서브리스트-->

<script>


function sublist_go(page){
	  var perPageNum = $('select[name="perPageNum"]').eq(1).val();
	  var searchType = $('select[name="searchType"]').eq(1).val();
	  var keyword = $('div.input-group>input[name="keyword"]').eq(1).val();
	  
	  console.log(perPageNum);
	  console.log(searchType);
	  console.log(keyword);

	  var paramUrl = "<%=request.getContextPath()%>/staff/stuManage/dual/subMajorList?page="+page+"&perPageNum="+perPageNum+"&searchType="+searchType+"&keyword="+keyword;
	  console.log(paramUrl);
	   

	  $.ajax({
	      method:'get',
	      url:paramUrl,
	      success: (data) => {
	    	  
	    	  let cri = data.pageMaker.cri;
		  		let pageMaker = data.pageMaker;
		  		let list = data.selectSubList;

		  		/* 검색바 */
		  		
		  		 v_pageStr = "";
		  		 v_pageStr += `<div class="input-group mb-3 justify-content-end">`;
		  		 v_pageStr += `<select class="form-control col-md-1" name="perPageNum" id="subperPageNum" onchange="sublist_go(1);">`;
		  		 v_pageStr += `<option value="10">정렬개수</option>`;
		  		 v_pageStr += `<option value="2" \${cri.perPageNum == 2 ? 'selected':''}>2개씩</option>`;
		  		 v_pageStr += `<option value="5" \${cri.perPageNum == 5 ? 'selected':''}>5개씩</option>`;
		  		 v_pageStr += `<option value="10" \${cri.perPageNum == 10 ? 'selected':''}>10개씩</option>`;
		  		 v_pageStr += `<option value="20" \${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>`;
		  		 v_pageStr += `<option value="50" \${cri.perPageNum == 50 ? 'selected':''}>50개씩</option></select>`;
		  		 v_pageStr += `<select class="form-control col-md-2" name="searchType" id="subsearchType">`;
		  		 v_pageStr += `<option value="" \${cri.searchType == '' ? 'selected':''}>정렬조건</option>`;
		  		 v_pageStr += `<option value="date" \${cri.searchType == 'date' ? 'selected':'' }>신청일</option>`;
		  		 v_pageStr += `<option value="status" \${cri.searchType == 'status' ? 'selected':'' }>처리상태</option></select>`;
		  		 v_pageStr += `<input class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="\${cri.keyword == null? ' ': cri.keyword }" /> <span class="input-group-append">`;
		  		 v_pageStr += `<button class="btn btn-primary btn-sm" type="button" onclick="sublist_go(1);" id="subsearchBtn">`;
		  		 v_pageStr += `<i class="fa fa-fw fa-search"></i></button></span></div>`;

		  		 
//		  		console.log(v_pageStr);
		  		document.querySelector("#subKeyword").innerHTML = v_pageStr;
		  	
		  		
		  		/* 테이블리스트 */
		  		
		   	    var v_tblStr = "";
		   		for (var i = 0; i < list.length; i++) {            
		  			v_tblStr += "<tr>";
		  			
		   			v_tblStr += `<td><input type="checkbox" name="checkMajorCha" value="\${list[i].majorChaSeq}"></td>`; 
		    			v_tblStr += "<td>"+ list[i].majClassName +"</td>";
		    		    v_tblStr += "<td>"+ list[i].stuCd +"</td>";
		    			v_tblStr += "<td>"+ list[i].grade +"</td>";
		    			v_tblStr += "<td>"+ list[i].name +"</td>";
		    			v_tblStr += "<td>"+ list[i].applyDate+ "</td>";
		    		    v_tblStr += "<td>"+ list[i].presentCollegeName +"</td>";
		    			v_tblStr += "<td>"+ list[i].presentMajName +"</td>";
		    			v_tblStr += "<td>"+ list[i].hopeColName +"</td>";
		    			v_tblStr += "<td>"+ list[i].hopeMajorName +"</td>";
		    			v_tblStr += "<td>"+ list[i].phone +"</td>";
		    			v_tblStr += "<td>"+ list[i].applyStatusCd +"</td>";
		    			
		    			v_tblStr += "</tr>";
		    			
		   		}
		              
		   		
//		   	    console.log(v_tblStr);
		  		document.querySelector("#subb").innerHTML = v_tblStr;
		    					
		  		/* 페이지네이션  */
		  		
		  		
		  		var v_pageStr = "";
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:sublist_go(1);">`;
				v_pageStr += `<i class="fas fa-angle-double-left"></i></a></li>`;
				
				v_pageStr += `<li class="page-item">`;
				v_pageStr += `<a class="page-link" href="javascript:sublist_go('\${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">`;
				v_pageStr += `<i class="fas fa-angle-left"></i></a></li>`;
				
					
						
					for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
						
						if(i== cri.page){
							v_pageStr += `<li class="page-item active">`;						
							v_pageStr += `<a class="page-link" href="javascript:sublist_go('`+i+`');" >`+i+`</a></li>`;
						}else {
							v_pageStr += `<li class="page-item ">`;						
							v_pageStr += `<a class="page-link" href="javascript:sublist_go('`+i+`');" >`+i+`</a></li>`;
						}
					}
					
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:sublist_go('\${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">`;
					v_pageStr += `<i class="fas fa-angle-right" ></i></a></li>`;
					v_pageStr += `<li class="page-item">`;
					v_pageStr += `<a class="page-link" href="javascript:sublist_go('\${pageMaker.realEndPage}');">`;
					
					v_pageStr += `<i class="fas fa-angle-double-right"></i></a></li>`;
		  				
		  				document.querySelector("#subPage").innerHTML = v_pageStr;
		         
		      
		      },
		      error: () => {
		         AjaxErrorSecurityRedirectHandler(error.status);
		      }
		   });
		   
	}  
	      

</script>

