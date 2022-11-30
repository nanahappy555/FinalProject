<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-date-picker.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-example-style.css" >
</head>
<style>
</style>
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
				<li class="nav-item"><a class="nav-link"
					id="lecMain-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/main?lecCd=${lecCd }')"
					data-toggle="pill" href="#lecMain"
					role="tab" aria-controls="home" aria-selected="false">메인</a></li>
					
				<li class="menuMove nav-item"><a class="nav-link active show"
					id="lecAttend-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/attend/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#lecAttend"
					role="tab" aria-controls="contact" aria-selected="true">출결관리</a>
				</li>
				<li class="menuMove nav-item"><a class="nav-link"
					id="lecMarks-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/marks/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#lecMarks"
					role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
				</li>
				
				<li class="menuMove nav-item"><a class="nav-link"
					id="lecMaterials-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#lecMaterials"
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

			<div class="tab-content" id="pills-tabContent" style="padding:10px;">
				<!-- 탭 1 시작 -->
				<div class="tab-pane fade" id="lecMain" role="tabpanel" aria-labelledby="pills-lecMain-tab">
					<p>텍스트1</p>
				</div> 
				<!-- 탭 1 끝 -->
					
				<!-- 탭 2 시작 -->
				
				<!-- 탭 5 끝 -->
				<!-- 탭 6 시작 -->
				<div class="tab-pane fade active show" id="lecAttend" role="tabpanel"
					aria-labelledby="pills-lecAttend-tab" style="overflow:hidden; height:650px;">
					<div class="row">
						<!-- ================================================= -->
						<!-- 좌측달력 시작 -->
						<!-- ================================================= -->
						<div class="card-body col col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
							
							<div class="row">
								<div class="input-group d-flex justify-content-center">
									<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
														<input type="text" id="datepicker-input" aria-label="Date-Time" style=" visibility:none;">
										<span class="tui-ico-date"></span>
									</div>
									<div id="wrapper" style="position:absolute; left:13%; top:100%; margin-top: -1px;">
									</div>
								</div>
							</div>
						
						<!-- ================================================= -->
						<!-- 좌측달력 끝 -->
						<!-- ================================================= -->
							<div class="row">
								<div id="oneAttendDiv" style="position:absolute; top:400px; left:60px; display:block;">
									<div class="card-body d-flex justify-content-center" style="padding-bottom:0px;">
										<h3 class="card-title border-bottom pb-2" style="font-weight:bold">개인별 출석 현황 : <span id="selectName">&nbsp;&nbsp;이름&nbsp;</span></h3>
									</div>
									<div class="card-body d-flex justify-content-end"
										style="overflow-y:scroll; overflow-x:hidden; height:180px; padding-top:0px;">
										<ul class="list-group" id="onAttendUl">
<!-- 											<li class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 											2022/11/1 (1주차) -->
<!-- 											<span class="badge badge-primary badge-pill">출석</span> -->
<!-- 											</li> -->
<!-- 											<li class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 											2022/11/3 (1주차) -->
<!-- 											<span class="badge badge-danger badge-pill">결석</span> -->
<!-- 											</li> -->
<!-- 											<li class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 											2022/11/7 (2주차) -->
<!-- 											<span class="badge badge-warning badge-pill">지각</span> -->
<!-- 											</li> -->
<!-- 											<li class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 											2022/11/10 (2주차) -->
<!-- 											<span class="badge badge-primary badge-pill">출석</span> -->
<!-- 											</li> -->
<!-- 											<li class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 											2022/11/10 (2주차) -->
<!-- 											<span class="badge badge-primary badge-pill">출석</span> -->
<!-- 											</li> -->
										</ul>
<!-- 									<table border="1"> -->
<!-- 										<tr> -->
<!-- 											<th>2022/11/1(월)</th> -->
<!-- 											<td>출석</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th>2022/11/3(수)</th> -->
<!-- 											<td>지각</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th>2022/11/7(금)</th> -->
<!-- 											<td>출석</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
									</div>
								</div>
							</div>
						</div>
	
	
						<!-- ================================================= -->
						<!-- 우측 테이블 시작 -->
						<!-- ================================================= -->
						<div class="card-body col col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12 ml-5"
							style="position:relative; top:-70px; left:20%;">
						<!-- ================================================= -->
						<!-- 상단바 시작 -->
						<!-- ================================================= -->
						<div class="row justify-content-between ml-2 mr-2" style="">
						<h3 class="d-flex align-items-center"><i class="fas fa-calendar-check"></i>
						&nbsp;&nbsp;&nbsp;<span id="selectDate"><fmt:formatDate value="${attendDate }" pattern="yyyy/MM/dd"/></span>
<!-- 						<button type="button" id="insertBtn">초기데이터insert용</button> -->
						</h3>
							<div class="row justify-content-end m-2">
								<button type="button" class="btn btn-md btn-primary"
								onclick="f_modifyList();">일괄 저장</button>
							</div>
							
						</div>
						
						<!-- ================================================= -->
						<!-- 상단바 끝 -->
						<!-- ================================================= -->
						<div id="listDiv" style="overflow-y:scroll; overflow-x:hidden; height:565px;">
								<!-- ajax -->
							</div>
							<!-- ================================================= -->
							<!-- 게시판 끝 -->
							<!-- ================================================= -->
						
						
					
							<!-- ================================================= -->
							<!-- 페이지네이션 시작 -->
							<!-- ================================================= -->
							<!-- ================================================= -->
							<!-- 페이지네이션 끝 -->
							<!-- ================================================= -->
						</div>
					</div>	
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
window.onload = function(){
	
	$.ajax({
		type:'get',
		url:'<%=request.getContextPath()%>/prof/lec/attend/attendList?lecCd=${lecCd}',
		success: (rslt)=>{
// 			alert(rslt);
			//리스트뿌리기;
			if(rslt.length == 0){
				document.querySelector('#listDiv').innerHTML="출석일이 아닙니다";
			}
			printData(rslt);
			
			var v_selectDate = new Date(rslt[0].attendDate);
			var v_date = f_transFormatToDate(v_selectDate);
// 			alert(v_date);
			document.querySelector('#selectDate').innerHTML = v_date;
// 			datepicker.setDate(v_selectDate);

			var datepicker = new tui.DatePicker('#wrapper', {
			    date: v_selectDate,
			    input: {
			        element: '#datepicker-input',
			        format: 'yyyy-MM-dd'
			    },
			    showAlways: true
			});
			
			datepicker.on('change', () => {
//			 	alert('ajax로 오른쪽 테이블이 변경됩니다</br>오늘날짜는 : ' + datepicker.getDate());
				var v_selectDate = datepicker.getDate();
				console.log("날짜서냍ㄱ",v_selectDate);
				var v_date = f_transFormatToDate(v_selectDate);
				console.log("v_selectDateㄱ",v_date);
				
				$.ajax({
					type:'get',
					url:'<%=request.getContextPath()%>/prof/lec/attend/attendList?lecCd=${lecCd}&attendDate='+v_date,
					success: (rslt)=>{
			 			console.log(rslt);
						//리스트뿌리기;
						if(rslt.length == 0){
							alert("출석일이 아닙니다");
							document.querySelector('#selectDate').innerHTML = v_date;
							printData();
							return;
						}
						printData(rslt);
						
						var rslt_selectDate = new Date(rslt[0].attendDate);
						console.log("rslt_selectDate",rslt_selectDate);
						var rslt_date = f_transFormatToDate(rslt_selectDate);
						console.log("rslt_date",rslt_date);
						document.querySelector('#selectDate').innerHTML = rslt_date;
//		 				datepicker.setDate(rslt_selectDate);
// 						alert("바뀜");

					},
					error: ()=>{
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
			});
			
			//insert
			let v_insertBtn = document.querySelector('#insertBtn');
			v_insertBtn.addEventListener('click',function(){
				var v_selectDate = datepicker.getDate();
				var v_lecCode = '${lecCd}';
// 				console.log(v_selectDate);
				
				var sendData = {
						"attendDate":v_selectDate,
						"lecCd":v_lecCode
				}
				
				$.ajax({
					type:'post',
					url:'<%=request.getContextPath()%>/prof/lec/attend/regist',
					data: JSON.stringify(sendData),
					contentType:'application/json',
					success: (rslt) => {
						alert('등록성공');
						location.replace(location.href);
					},
					error: () => {
						AjaxErrorSecurityRedirectHandler(error.status);
					}
							
				});
			});


		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
	
	
// 	var v_setDate = document.querySelector('#selectDate').innerHTML;
	
	
	
	

}

var printData = (attendList) => {
	var v_tableStr =
	`<table class="table table-hover">
		<thead>
			<tr style="position: sticky; top: -1px; background-color: white; z-index: 99;">
				<th>순번</th>
				<th style="width:10%">학번</th>
				<th>이름</th>
				<th style="width:12%">출석</th> 
				<th style="width:12%">결석</th>
				<th style="width:12%">지각</th>
				<th style="width:12%">조퇴</th>
				<th>저장</th>
			</tr>
		</thead>
		<tbody style="overflow-y: scroll;">`;
		if(!attendList){
				v_tableStr += 
				`<tr>
					<td colspan="8">출석 데이터가 없습니다</td>
				</tr>`;
			
		}else{
			for(i=0; i<attendList.length; i++){
				v_tableStr += 
				`<tr class="attendStuList" onclick="f_stuAttendList(event);">
					<td>`+(parseInt(i)+1)+`</td>
					<td class="stuCd" id="\${attendList[i].stuCd}">\${attendList[i].stuCd}</td>
					<td class="stuName" id="\${attendList[i].name}">\${attendList[i].name}</td>
					<td colspan="4" >
						<div class="row justify-content-between ml-4 mr-3">`;
						
							if(attendList[i].attendStatusCd == 'attend'){
								v_tableStr +=
								`<div>
								<label class="custom-control custom-radio custom-control-inline">
									<input type="radio" name="\${attendList[i].attendSeq}" value="attend" 
										style="left:8px" class="attend custom-control-input" checked>
										<span class="custom-control-label">출석</span>
								</label>
								</div>
								<div>
								<label class="custom-control custom-radio custom-control-inline">
									<input type="radio" name="\${attendList[i].attendSeq }" value="absent"
										class="absent custom-control-input">
										<span class="custom-control-label">결석</span>
								</label>
								</div>
								<div>
								<label class="custom-control custom-radio custom-control-inline">
									<input type="radio" name="\${attendList[i].attendSeq }" value="late"
										class="late custom-control-input">
										<span class="custom-control-label">지각</span>
								</label>
								</div>
								<div>
								<label class="custom-control custom-radio custom-control-inline">
									<input type="radio" name="\${attendList[i].attendSeq }" value="le"
										class="le custom-control-input">
										<span class="custom-control-label">조퇴</span>
								</label>
								</div>`;
							}else if(attendList[i].attendStatusCd == 'absent'){
								v_tableStr +=
									`<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq}" value="attend" 
											style="left:8px" class="attend custom-control-input" >
											<span class="custom-control-label">출석</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="absent"
											class="absent custom-control-input" checked>
											<span class="custom-control-label">결석</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="late"
											class="late custom-control-input">
											<span class="custom-control-label">지각</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="le"
											class="le custom-control-input">
											<span class="custom-control-label">조퇴</span>
									</label>
									</div>`;
							}else if(attendList[i].attendStatusCd == 'late'){
								v_tableStr +=
									`<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq}" value="attend" 
											style="left:8px" class="attend custom-control-input" >
											<span class="custom-control-label">출석</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="absent"
											class="absent custom-control-input">
											<span class="custom-control-label">결석</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="late"
											class="late custom-control-input" checked>
											<span class="custom-control-label">지각</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="le"
											class="le custom-control-input">
											<span class="custom-control-label">조퇴</span>
									</label>
									</div>`;
							}else if(attendList[i].attendStatusCd == 'le'){
								v_tableStr +=
									`<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq}" value="attend" 
											style="left:8px" class="attend custom-control-input" >
											<span class="custom-control-label">출석</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="absent"
											class="absent custom-control-input">
											<span class="custom-control-label">결석</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="late"
											class="late custom-control-input">
											<span class="custom-control-label">지각</span>
									</label>
									</div>
									<div>
									<label class="custom-control custom-radio custom-control-inline">
										<input type="radio" name="\${attendList[i].attendSeq }" value="le"
											class="le custom-control-input" checked>
											<span class="custom-control-label">조퇴</span>
									</label>
									</div>`;
							}
					v_tableStr +=
						`</div>
					</td>
					<td>
						<button class="btn btn-primary btn-sm" type="button" id="\${attendList[i].attendSeq }"
						onclick="f_modifyAttend(event);">저장
						</button>
					</td>
				</tr>`;
				
			}
		}
		v_tableStr += `</tbody>
	</table>`;
	
	document.querySelector('#listDiv').innerHTML=v_tableStr;
}






//tr클릭
function f_stuAttendList(e){

	var v_stuName = e.currentTarget.children[2].getAttribute('id');
    var v_stuCd = e.currentTarget.children[1].getAttribute('id');
	
    document.querySelector('#selectName').innerHTML = v_stuName;
    
    $.ajax({
    	type:'get',
    	url:'<%=request.getContextPath()%>/prof/lec/attend/stuAttendList?lecCd=${lecCd}&stuCd='+v_stuCd,
    	success: (rslt)=>{
    		console.log(rslt);
    		var v_ulStr = "";
    		for(i=0; i<rslt.length; i++){
    			var v_getDate = new Date(rslt[i].attendDate);
	    		var v_attendDate = f_transFormatToDate(v_getDate);
// 	    		alert(v_attendDate);
    			if(rslt[i].attendStatusCd == 'attend'){
	    			v_ulStr += 
		    		`<li class="list-group-item d-flex justify-content-between align-items-center">
	    			\${v_attendDate}&nbsp;(\${rslt[i].semeWeek}주차)&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="badge badge-primary badge-pill">출석</span>
					</li>`;
    			}else if(rslt[i].attendStatusCd == 'absent'){
	    			v_ulStr += 
		    		`<li class="list-group-item d-flex justify-content-between align-items-center">
					\${v_attendDate}&nbsp;(\${rslt[i].semeWeek}주차)&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="badge badge-danger badge-pill">결석</span>
					</li>`;
    				
    			}else if(rslt[i].attendStatusCd == 'late'){
	    			v_ulStr += 
		    		`<li class="list-group-item d-flex justify-content-between align-items-center">
					\${v_attendDate}&nbsp;(\${rslt[i].semeWeek}주차)&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="badge badge-warning badge-pill">지각</span>
					</li>`;
    			}else if(rslt[i].attendStatusCd == 'le'){
	    			v_ulStr += 
		    		`<li class="list-group-item d-flex justify-content-between align-items-center">
					\${v_attendDate}&nbsp;(\${rslt[i].semeWeek}주차)&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="badge badge-warning badge-pill">조퇴</span>
					</li>`;
    				
    			}
    			
    			document.querySelector('#onAttendUl').innerHTML = v_ulStr;
    		}
    		
	    },
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
    });
    
}
</script>
<script>

function f_modifyAttend(e){
    e.stopPropagation(); //부모까지 이벤트 번질때
    var v_stuName = e.currentTarget.parentElement.parentElement.children[2].getAttribute('id');
    var v_attendSeq = e.currentTarget.getAttribute('id');
    
	var v_attendStatus = $('input[name='+v_attendSeq+']:checked').val();
	console.log("라디오체크찾기",v_attendStatus);
	
	var sendData = {
			attendSeq:v_attendSeq,
			attendStatusCd:v_attendStatus
	}
	
	$.ajax({
		type:'put',
		url:'<%=request.getContextPath()%>/prof/lec/attend/modify',
		data:JSON.stringify(sendData),
		contentType:'application/json',
		success: (rslt)=> {
			
			Swal.fire(
					  v_stuName+'학생의 출석이 저장됐습니다.',
					  '',
					  'success'
					)
		},
		error: ()=> {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function f_modifyList(){
	
	var v_list = [];
	var v_tr = document.querySelectorAll(".attendStuList");
	//console.log("trs",v_tr)
	for(var i=0; i<v_tr.length; i++){
		//var hakbun = v_tr[i].children[0].innerHTML;
		//console.log("tr",v_tr[i]);
		
		var v_sequence = v_tr[i].querySelector("button").getAttribute("id");
		//console.log("시퀀스:",sequence);
		var v_status = v_tr[i].querySelector("input[type=radio]:checked").value;
		//console.log("스테이터스",status);

		var v_json = {};
		v_json.attendSeq = v_sequence;
		v_json.attendStatusCd = v_status;
		v_list.push(v_json);
	}
	console.log(v_list);
	
	$.ajax({
		type:'put',
		url:'<%=request.getContextPath()%>/prof/lec/attend/modifyList',
		data:JSON.stringify(v_list),
		contentType:'application/json',
		success: (rslt)=>{
			alert('전체 수강생의 출석이 저장됐습니다.');
		},
		error: ()=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>





