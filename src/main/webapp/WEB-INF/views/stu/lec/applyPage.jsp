<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>
</head>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-8 pr-2 pl-0">


			<div class="card mb-0">
				<div class="card-header tab-regular">
					<ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							id="card-tab-1" data-toggle="tab" href="#card-1" role="tab"
							aria-controls="card-1" aria-selected="true">전체강의</a></li>
						<li class="nav-item"><a class="nav-link" id="card-tab-2"
							data-toggle="tab" href="#card-2" role="tab"
							aria-controls="card-2" aria-selected="false">신청강의</a></li>

					</ul>
				</div>

				<!-- 탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1탭1 -->
				<div class="card-body mb-0" style="height: 675px;">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade active show" id="card-1" role="tabpanel"
							aria-labelledby="card-tab-1">
							<div class="card">
								<div class="card-body">


									<div id="myGrid" class="ag-theme-alpine" style="height: 500px"></div>


								</div>

							</div>
						</div>


						<div class="tab-pane fade" id="card-2" role="tabpanel"
							aria-labelledby="card-tab-2">


							<div class="card">
								<div class="card-header">
									<table>
										<thead>
											<tr>
												<th><h4>신청결과</h4></th>
												<th><span id="curCredit"></span> / <span id="maxCredit"></span> (신청학점/신청가능학점)</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="card-body" id="appliedDIV"></div>
							</div>



						</div>

					</div>
				</div>
			</div>


			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->

			<!-- ================================================= -->
			<!-- ================================================= -->

			<!-- ================================================= -->

			<!-- ================================================= -->


		</div>
		<div class="col-xl-4 pl-2 pr-0 ">
			<div class="card mb-0"
				style="display: inline-block; position: relative;">

				<canvas id="grid" width="510" height="744"
					style="vertical-align: top; z-index: 3"></canvas>
				<canvas id="outline" width="510" height="744"
					style="position: absolute; left: 0; top: 0; z-index: 2;"></canvas>

			</div>
		</div>
		<!-- ================================================= -->
		<!-- MAIN-CONTENT 끝 -->
		<!-- ================================================= -->
	</div>
</div>




<script>
var rowData2 = JSON.parse(localStorage.getItem("ajaxLectureList"));
/////////////////////////////////////////////////////////
// canvas
/////////////////////////////////////////////////////////

var dates = [ "월", "화", "수", "목", "금" ];
var hours = [ " 9", "10", "11", "12", "13", "14", "15", "16", "17" ];

const grid = document.getElementById('grid');
const outline = document.getElementById('outline');
const gridCtx = grid.getContext("2d");
const outlinegridCtx = outline.getContext("2d");

function drawGrid(){
	

for (var i = 50; i < 744; i = i + 70) {

	gridCtx.beginPath();
	gridCtx.moveTo(50, i);
	gridCtx.lineTo(505, i);
	gridCtx.stroke();
}

for (var i = 50; i <= 520; i = i + 91) {
	gridCtx.beginPath();
	gridCtx.moveTo(i, 50);
	gridCtx.lineTo(i, 680);
	gridCtx.stroke();
}
var horiIndex = 85;
for (var i = 0; i < dates.length; i++) {
	gridCtx.font = "20px malgun gothic";
	gridCtx.fillStyle = "rgb(162, 162, 162)";
	gridCtx.fillText(dates[i], horiIndex, 30);
	horiIndex = horiIndex + 91;
}

var vertiIndex = 65;
for (var i = 0; i < hours.length; i++) {
	gridCtx.font = "15px malgun gothic";
	gridCtx.fillStyle = "rgb(162, 162, 162)";
	gridCtx.fillText(hours[i], 30, vertiIndex);
	vertiIndex = vertiIndex + 70;
}
}
/////////////////////////////////////////////////////////
						// ag-grid
/////////////////////////////////////////////////////////
const columnDefs2 = [
    { headerName:"과목명",field: "subjName" ,maxWidth:130},
    { headerName:"단과대",field: "colName" ,maxWidth:100},
    { headerName:"교양코드",field: "geCd" ,maxWidth:130},
    { headerName:"학과코드",field: "majorName" ,maxWidth:120},
    { headerName:"교수명",field: "profName" ,maxWidth:110},
    { headerName:"학점",field: "credit" ,maxWidth:80},
    { headerName:"강의실",field: "classroom",maxWidth:100},
    { headerName:"수강인원",field: "stuNum" ,maxWidth:130},
    { headerName:"최대인원",field: "maxStuNum" ,maxWidth:130},
    { headerName:"대상학년",field: "targetGrade" ,maxWidth:130},
    { headerName:"날짜1",field: "lecDate1",maxWidth:130},
    { headerName:"날짜2",field: "lecDate2" ,maxWidth:130},
];


	const gridOptions = {
	        defaultColDef: {
	            sortable:true,
	            filter:true,
	            resizable:true,
	            editable:false
	    },
	    columnDefs: columnDefs2,
	    rowData: rowData2,
	    animateRows: true,
	    pagination:true,
	    paginationAutoPageSize:true,
	    getRowId: params => params.data.lecCd,
	    
	    
	    //마우스 올렸을때//
	    onCellMouseOver :function(params){
	    	
	    	outlinegridCtx.strokeStyle = "orange";

 			outlinegridCtx.lineWidth = 5;
	    	
	     var firstSchdule = params.data.lecDate1;
	     var secondSchdule = params.data.lecDate2;
	     var schedules = [];
	     schedules.push(firstSchdule);
	     if(secondSchdule){
	    	 schedules.push(secondSchdule);
	     }
	     
	     for (var i = 0; i < schedules.length; i++) {
	    	 
	 			var startTime = parseInt(schedules[i].substring(2, 4));
	 			var endTime = parseInt(schedules[i].substring(10, 12));
	 			var y = 50 + (70 * (startTime - 9));
	 			var verticalSize = endTime - startTime;
	 			var x = 0;
	 			
	 		if (schedules[i].substring(0, 1) == "월") {
	 			x = 50;
	 		}
	 		if (schedules[i].substring(0, 1) == "화") {
				x = 50 + 91;
			}
			if (schedules[i].substring(0, 1) == "수") {
				x = 50 + 91 + 91;
			}

			if (schedules[i].substring(0, 1) == "목") {
				x = 50 + 91 + 91 + 91;
			}
			if (schedules[i].substring(0, 1) == "금") {
				x = 50 + 91 + 91 + 91 + 91;
			}
				outlinegridCtx.strokeRect(x, y, 91, 70 * verticalSize);
	     }
	     
	    },
	    //마우스 in 끝//
	    //마우스 out//
	    onCellMouseOut :function(params){
	    	outlinegridCtx.clearRect(0, 0, 600, 744);
	    },
	  //마우스 out 끝//
	    
	  
	  
	    //마우스 더블클릭시//
	    onCellDoubleClicked : function(params){
	    	
	    	var selectedCredit = parseInt(params.data.credit);
	    	
	    	var maxC = parseInt($('#maxCredit').text());
	    
	    	var curC = -1;
	    	if ($('#curCredit').text() === null) {
	    		curC = 0;
			}else{
				curC = parseInt($('#curCredit').text());
			}
	    	
	    	console.log("선택한",selectedCredit);
	    	console.log("현재",curC);
	    	console.log("최대",maxC);
	    	
	    	
	    	
	    	
	    	 var isExistInAppliedList = false;
		     var lecCd = params.data.lecCd;
		     var hiddenLecCd = document.querySelectorAll("td[style='display:none']");
		     
		     if (hiddenLecCd.length > 0) {
		    	 console.log("0개 이상");
	    	 	for (var q = 0; q < hiddenLecCd.length; q++) {
		     		if (lecCd == hiddenLecCd[q].innerHTML) {
		     			isExistInAppliedList=true;
	     		 	}					
				}
			 }
		     
	    	if (isExistInAppliedList) {
	    		
	    		
	    		
	    		
	    		
	    		
	    		
	    		Swal.fire({
	    	        title: '이미 신청한 강의입니다. 철회하시겠습니까?',
	    	        showDenyButton: true,
	    	        confirmButtonText: '네',
	    	        denyButtonText: '아니오',
	    	      }).then((result) => {
	    	        if (result.isConfirmed) {
	    	        	withdrwalLecture(params.data.lecCd);
	    	               }else{
	    	            	   Swal.fire('철회하지 않았습니다.') 
	    	               }
	    	            });
	    		
	    		
	    		return;
			}
	    	
	    	if (selectedCredit + curC > maxC) {
	    		Swal.fire(
	    				  '신청가능학점초과!',
	    				  '',
	    				  'error'
	    				)
				return;
			}
	    	
	    	
	    	 var firstSchdule = params.data.lecDate1;
		     var secondSchdule = params.data.lecDate2;
		     var schedules = [];
		     schedules.push(firstSchdule);
		     if(secondSchdule){
		    	 schedules.push(secondSchdule);
		     }
		     
 			 
 			 
		     //같은 시간대 중복검사
		     for (var i = 0; i < schedules.length; i++) {
		    	 var startTime = parseInt(schedules[i].substring(2, 4));
	 			 var endTime = parseInt(schedules[i].substring(10, 12));
	 			 var x = 0;
	 			 var y = 50 + (70 * (startTime - 9));
	 			 var verticalSize = endTime - startTime;
	 			 
		 		if (schedules[i].substring(0, 1) == "월") {
		 			x = 50;
		 		}
		 		
		 		if (schedules[i].substring(0, 1) == "화") {
					x = 50 + 91;
				}
				if (schedules[i].substring(0, 1) == "수") {
					x = 50 + 91 + 91;
				}

				if (schedules[i].substring(0, 1) == "목") {
					x = 50 + 91 + 91 + 91;
				}
				if(schedules[i].substring(0, 1) == "금") {
					x = 50 + 91 + 91 + 91 + 91;
	    	 	}
					var colorcode1 = gridCtx.getImageData(x+20,y+20, 1, 1);
					for (var k = 0; k < 4; k++) {if(colorcode1.data[k] != 0){
						Swal.fire(
			    				  '이미 신청한 시간대입니다!',
			    				  '',
			    				  'error'
			    				)
						return;}}
					if (verticalSize == 2) {
					var colorcode2 = gridCtx.getImageData(x+20,y+20 + 70, 1, 1);
					for (var s = 0; s < 4; s++) {if(colorcode2.data[s] != 0){
						Swal.fire(
			    				  '이미 신청한 시간대입니다!',
			    				  '',
			    				  'error'
			    				)
						return;}}
					}			
				
				}//for end
	    	
				//인원수 검사
		     if(params.data.stuNum >= params.data.maxStuNum) {
		    	 Swal.fire(
	    				  '최대 인원수 초과!',
	    				  '',
	    				  'error'
	    				)
					return;
				}
	    	
			 //insert
		     $.ajax({
	             type:"put",  
	             url:"<%=request.getContextPath()%>/stu/lec/apply?lecCd=" + params.data.lecCd,
		          	 contentType : "application/json; charset=utf-8", 
		             success:(rslt)=>{
		            	 
		            	 getAppliedListfn();
		            	 getCredits();
		             },
		             error:(request,status,error)=>{
// 		                alert("insert"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		             }
		          });
	    }//더블클릭 끝
	    
	};
	
	
	
	document.addEventListener('DOMContentLoaded', () => {
        const gridDiv = document.querySelector('#myGrid');
        new agGrid.Grid(gridDiv, gridOptions);
        
        var webSocket = new WebSocket("ws://192.168.141.22/<%=request.getContextPath()%>/ws-lectureApply");
    	
    	webSocket.onmessage = function(e){
    		
    		var splitData = e.data.split(":");
    		var lecId = splitData[0];
    		var applicatns = splitData[1];
    		var rowNode = gridOptions.api.getRowNode(lecId);
    		rowNode.setDataValue('stuNum', applicatns);

    	}

    });                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	
	
</script>


<script>

var appliedDIV = document.querySelector('#appliedDIV');
function getAppliedListfn(){
	$.ajax({
		type:"get",
		url:"<%=request.getContextPath()%>/stu/lec/getAppliedLecList",
		dataType:"json", 
		success:(rslt)=>{
			
			var vtblStr = "<table class='table table-hover'>";
			vtblStr += "<tr><th>과목명</th><th>학점</th><th>교수명</th></tr>";
		    //배열 데이터 반복
			for(var i=0; i<rslt.length; i++){
				vtblStr += "<tr class='appliedLists'>";
				vtblStr += `<td style="display:none">\${rslt[i].lecCd}</td>`;
				vtblStr += `<td>\${rslt[i].subjName}</td>`;					
				vtblStr += `<td>\${rslt[i].credit}</td>`;					
				vtblStr += `<td>\${rslt[i].profName}</td>`;					
				vtblStr += "</tr>";
			}		
		    vtblStr += "</table>";
		    appliedDIV.innerHTML = vtblStr;	
			//시퀀스상 테이블 tr에 이벤트를 주려면 테이블이 만들어진 후에
			
			gridCtx.clearRect(0, 0, 600, 744);
			drawGrid();
			var colorArr = ['#ffafb0','#fcffb0','#aee4ff','#b5c7ed','#fcc6f7','#bee9b4','#ffe4af','#A9A0FC','#8AV481'];
			//시간표 그려줌
			for (var i = 0; i < rslt.length; i++) {
					var subjName = rslt[i].subjName;
					gridCtx.font ="10pt Fira";
		 			gridCtx.fillStyle = colorArr[i];
				
				 var schedules = []
			     schedules.push(rslt[i].lecDate1)
			     if(rslt[i].lecDate2){
			    	 schedules.push(rslt[i].lecDate2)
			     }
				
				for (var j = 0; j < schedules.length; j++) {
					
					var startTime = parseInt(schedules[j].substring(2, 4));
		 			var endTime = parseInt(schedules[j].substring(10, 12));
			 		var y = 50 + (70 * (startTime - 9));
		 			var verticalSize = endTime - startTime;
		 			var x = 0;
					
					if (schedules[j].substring(0, 1) == "월") {
			 			x = 50;
			 		}
			 		if (schedules[j].substring(0, 1) == "화") {
						x = 50 + 91;
					}
					if (schedules[j].substring(0, 1) == "수") {
						x = 50 + 91 + 91;
					}

					if (schedules[j].substring(0, 1) == "목") {
						x = 50 + 91 + 91 + 91;
					}
					if (schedules[j].substring(0, 1) == "금") {
						x = 50 + 91 + 91 + 91 + 91;
					}
					gridCtx.fillRect(x, y, 91, 70 * verticalSize);
		 			gridCtx.strokeText(subjName.substr(0,5), x+20, y+20);
				}
			}
		$(".appliedLists").dblclick(function(e){
		 		if (confirm("취소하시겠습니까?")) {
		 			withdrwalLecture(e.currentTarget.childNodes[0].innerHTML);
		 			getCredits();
				}
			});
		},
		error:(request,status,error)=>{
			
// 			alert("getAppliedListfn"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}


function withdrwalLecture(lecCdOne){
	$.ajax({
	       type:"delete",  
	       url:"<%=request.getContextPath()%>/stu/lec/withdrwal?lecCd=" + lecCdOne,
	           success:(rslt)=>{
	          	 getAppliedListfn();
	          	 getCredits();
	           },
	           error:(request,status,error)=>{
// 	              alert("withdrwalLecture"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
	        });
}

function getCredits(){
	$.ajax({
		type:"get",
        url:"<%=request.getContextPath()%>/stu/lec/getCredits",
     	contentType : "application/json; charset=utf-8", 
     	success:(rlst)=>{
     		var currentCredit = 0;
     		if (rlst.curentCredit == null) {
     			currentCredit = 0;
			}else{
				currentCredit = rlst.curentCredit;
			}
     		
     		$('#maxCredit').text(rlst.MaxCredit);
     		$('#curCredit').text(currentCredit);
     	},
     	error:(request,status,error)=>{
     		
//             alert("getCredits"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
	});
}
$(function(){
	getAppliedListfn();
	getCredits();
});
</script>

