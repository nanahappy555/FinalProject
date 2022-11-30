<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<style>
li{list-style:none;}


.flex{
  display:flex;
  padding-left: 30px;
  margin-top:0px;
  
}

.slide_wrapper{
  position:relative;
  width:1350px;
  margin:0 auto;
  height:400px;
  overflow:hidden
}

.slides{
  position:absolute;
  transition:left 0.7s ease-out;
}

.slides li:not(:last-child){
  margin-right:30px;
}


.controls{
  width:100%;
  display:inline-block;
  height:400px;
  text-align:center;
  
}

.controls div{
  line-height:400px;
  z-index:2;
  position:absolute;
  top:50%;
  width:30px;
  height:400px;
  background-color : rgba(0,0,0,0.1 );
  display:inline-block;
  transform:translateY(-50%);
}

.controls>.prev{
  right:calc(100% - 30px);
}

.controls>.next{
  left:calc(100% - 30px);
}


</style>

</head>

<div class="container-fluid">
	<div class="card">
	<div class="card-body">
		<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"
			style="margin-right: 0px; margin-left: 0px;">
			<div class="card col-xl-5 col-lg-5 col-md-5 col-sm-5 col-5"
				style="position: relative">
				<h3 class="card-header cardHead">
					<i class="fas fa-id-card"></i>&nbsp;&nbsp;<span class="stuName"></span>님의 개인 정보
				</h3>
				<div class="card-body row" style="padding-left: 50px; padding-right:0px;">
					<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 text-center"
						style="padding-left: 0px; position: relative;">
						<p
							style="font-weight: bolder; margin-bottom: 0px; margin-left:18px; font-size: 30px; text-align: center;"
							class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 stuName">
						</p>

						<span id="memImg" class="manPicture" data-anoCd="0"
							style="display: block; width: 200px; height: 250px; margin: 0 0px; border-radius: 20px;"></span>
						<p id="acaStatus" style="font-weight: bolder; margin-bottom: 0px;margin-left:18px; font-size: 20px; text-align: center;"
							class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						</p>
						<button id="sendSimpleNote" data-stucd="" class="btn btn-secondary float-center" style="margin-left:30px; margin-top:20px;" onclick=" sendSimpleNote()">쪽지보내기</button>

					</div>
					<div style="margin-left: 20px;"
						class="col-xl-7 col-lg-7 col-md-7 col-sm-7 col-7">
						<table class="table table-hover">
							<tr>
								<th scope="col">학번</th>
								<td><input name="nation" id="stuCd" readonly class="form-control"
									value="" /></td>
							</tr>
							<tr>
								<th scope="col">학년 학기</th>
								<td><input name="gradeSeme" id="gradeSeme" readonly class="form-control"
									value="" /></td>
							</tr>
							<tr>
								<th scope="col">연락처</th>
								<td><input name="phone" id="phone" readonly class="form-control"
									value="" /></td>
							</tr>
							<tr>
								<th scope="col">이메일</th>
								<td><input name="email" id="email" title="" readonly class="form-control"
									value="" /></td>

							</tr>
							<tr>
								<th scope="col">주소</th>
								<td><input name="add1" id="add1" readonly title="" class="form-control"
									value="" /> <input name="add2" title="" id="add2" readonly class="form-control"
									value="" /></td>
							</tr>
							<tr>
								<th scope="col">국적</th>
								<td><input name="nation" id="nation" readonly class="form-control"
									value="" /></td>
							</tr>
							<tr>
								<th scope="col">휴학횟수</th>
								<td><input name="tlCount" id="tlCount" readonly class="form-control"
									value="" /></td>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
			<div class="card col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3">
				<h3 class="card-header">학기별 성적차트</h3>
				<div class="card-body">
					<div style="width: 100%; height: 370px;">
						<!--차트가 그려질 부분-->
						<canvas id="totalScoreBarChart" style="width:300px; height:430px;"></canvas>
					</div>
				</div>
			
			</div>
			
			<div id="stuCouncelDiv" class="card col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4" style="display:none;">
				<div style="width:100%; height:50%;">
					<h3 class="card-header">개인 상담 이력</h3>
					<div class="card-body" style="overflow-y: scroll;height:230px;" >
						<table class="table table-hover">
							<tr>
								<th style="width:25%">일시</th>
								<th style="width:25%">장소</th>
								<th style="width:25%">처리상태</th>
								<th style="width:25%">일지작성</th>
							</tr>
							<tr onclick="showCouncelDetail()">
								<td style="width:25%">2022/02/01</td>
								<td style="width:25%">상담관</td>
								<td style="width:25%">진행중</td>
								<td style="width:25%">미작성</td>
							</tr>
							<tr>
								<td style="width:25%">2022/02/01</td>
								<td style="width:25%">상담관</td>
								<td style="width:25%">진행중</td>
								<td style="width:25%">미작성</td>
							</tr>
							<tr>
								<td style="width:25%">2022/02/01</td>
								<td style="width:25%">상담관</td>
								<td style="width:25%">진행중</td>
								<td style="width:25%">미작성</td>
							</tr>
							<tr>
								<td style="width:25%">2022/02/01</td>
								<td style="width:25%">상담관</td>
								<td style="width:25%">진행중</td>
								<td style="width:25%">미작성</td>
							</tr>
							<tr>
								<td style="width:25%">2022/02/01</td>
								<td style="width:25%">상담관</td>
								<td style="width:25%">진행중</td>
								<td style="width:25%">미작성</td>
							</tr>					
						</table>
					</div>
				</div>
				
					<div id="stuCouncelNote" style="display:none">
						<h3 class="card-header"><span>2022/04/02 한태훈 </span>상담 일지 기록</h3>
						<div class="card-body" style="padding-bottom:0px;">
							<textarea class="form-control" rows="5" cols=""></textarea>
							<button class="btn btn-primary float-right" style="margin-top:10px;">저장</button>
							<button class="btn btn-primary float-right" onclick="showSpeNoteDiv()" style="margin-top:10px; border:1px transparent solid; background-color:rgb(255, 159, 64)">특이사항 기록</button>
						</div>
					</div>
				</div>
			
		
				
				<div id="stuSpecialDiv"  style="display:block;" class="card col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
				<div style="width:100%; height:50%;">
					<h3 class="card-header">특이 사항 기록 이력</h3>
					<div class="card-body" style="overflow-y: scroll; height:230px; margin-bottom:10px;">
						<table id="stuSpecialTable" class="table table-hover">
						
						</table>
					</div>
				</div>
				
				
					<div style="width:100%; height:50%; border-top: 1px solid gray">
					   <div id="stuSpecialNote" style="display:block;">
						   <h3 class="card-header">특이 사항 <span id="specialNoticeDate"></span></h3>
							<div class="card-body" style="padding-bottom:0px;">
								<textarea id="speNoticeContent" class="form-control" rows="5" cols=""></textarea>
								<button id="specialSave" class="btn btn-primary float-right" data-specialSeq="" style="margin-top:10px;" onclick="saveSpecial()" >저장</button>
								<%-- <button class="btn btn-primary float-right" onclick="showCouncelDiv()" style="margin-top:10px; border:1px transparent solid; background-color:rgb(255, 159, 64)">개인상담 기록</button>--%>
							</div>
						</div>
					</div>
				</div>
		</div>
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="slide_wrapper ">
			  <ul class="slides flex">
				  <c:forEach items="${classAttitudeList}" var="classAttitude">
				    <li style="margin-left:15px;padding-right:15px;">
						<div style="width:300px;background-color:rgba(201, 203, 207, 0.2);  height:400px;" class="row">
							<div>
								<canvas id="chart${classAttitude.student.stuCd}" style="width:300px; height:336px;"></canvas>
							</div>
								<div onclick="stuDetail('${classAttitude.student.stuCd}')" style="cursor:pointer;margin:0 auto; font-size: 18px; color:#42715a; font-weight:bold;">${classAttitude.student.name}</div>
						</div>	    
				    </li>
				   </c:forEach>
			  </ul>
			  <div class="controls">
			    <div class="prev"><</div>
			    <div class="next">></div>
			  </div>
			</div>
		</div>
	</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>




<%--슬라이드 --%>
<script>
var slides = document.querySelector('.slides'),
slide = document.querySelectorAll('.slides li'),
currentIdx = 0,
slideCount = slide.length,
slideWidth = 300,
slideMargin = 30,
prevBtn = document.querySelector('.prev'),
nextBtn = document.querySelector('.next');

slides.style.width =(slideWidth + slideMargin)*slideCount - slideMargin + 'px';

function moveSlide(num) {
slides.style.left = -num * 1320 + 'px';
currentIdx = num;
}

nextBtn.addEventListener('click', function () {
if( currentIdx < Math.ceil(slideCount/4)-1){
  moveSlide(currentIdx + 1);
}else{
  moveSlide(0);
}   
});

prevBtn.addEventListener('click', function () {
if( currentIdx > 0){
  moveSlide(currentIdx - 1);
}else{
  moveSlide(Math.ceil(slideCount/4)-1);
}   
});

</script>
<%--multiYaxis --%>

<script type="text/javascript">

function makeMultiYChart(id,attend,assign,midScore,finScore){
	let context = document
    .getElementById(id)
    .getContext('2d');
let totalScoreChart = new Chart(context, {
    type: 'bar', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: 
        	[
            '수업 참여 현황'
        ],
        datasets: [
            { //데이터
                label:'미출석', //차트 제목
                fill: false,
                yAxisID:'A',
                data:[
                	attend	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	 'rgba(255, 99, 132, 0.2)',
                ],
                borderColor: [
                	'rgb(255, 99, 132)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            { //데이터
                label:'과제미제출', //차트 제목
                fill: false,
                yAxisID:'A',
                data:[
                	assign	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	 'rgba(255, 159, 64, 0.2)',
                ],
                borderColor: [
                	'rgb(255, 159, 64)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            { //데이터
                label:'중간고사', //차트 제목
                fill: false,
                yAxisID:'B',
                data:[
                	midScore	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	'rgba(75, 192, 192, 0.2)',
                ],
                borderColor: [
                	 'rgb(75, 192, 192)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            { //데이터
                label:'기말고사', //차트 제목
                fill: false,
                yAxisID:'B',
                data:[
                	finScore	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	 'rgba(54, 162, 235, 0.2)',
                ],
                borderColor: [
                	'rgb(54, 162, 235)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            
        ]
    },
    options: {
    	 layout: {
    	        padding: {
    	          top: 10,
    	          left:10,
    	          right:10,
    	          bottom: 10,
    	        },
    	      },
    	plugins: {
            title: {
                display: true,
                text: '수업 참여 현황',
                padding: {
                    top: 10,
                    bottom: 30
                },
                position:'bottom'
            }
        },
        scales: {
        	 xAxes: [
                 {
                  gridLines: {
                 		   display:false,
                 	        color: "black"
                 	      },
                 }
             ],
            yAxes: [
                {
                 id:'A',
                 gridLines: {
                		   display:false,
                	        color: "black"
                	      },
                     scaleLabel: {
                       display: true,
                       labelString: "횟 수",
                       fontColor: 'rgb(66,135,245)'
                     
                     },
                	
                    ticks: {
                        beginAtZero: true,
                        min:0,
                        max:30,
                        stepSize : 5,
                        
                    },
                    position:'left'
                },
                {
                    id:'B',
                    gridLines: {
                   		   display:false,
                   	        color: "black"
                   	      },
                        scaleLabel: {
                          display: true,
                          labelString: "시 험 점 수",
                          fontColor: 'rgb(66,135,245)'
                        },
                   	
                       ticks: {
                           beginAtZero: true,
                           min:0,
                           max:100,
                           stepSize : 10,
                           
                       },
                       position:'right'
                   }
            ],
        }
    }
});
}

<%--Chart그리기--%>
</script>
<c:forEach items="${classAttitudeList}" var="classAttitude">
	<script>	
	var stuCd='${classAttitude.student.stuCd}';
	var chartId = 'chart'+stuCd;
	makeMultiYChart(chartId,parseInt(${classAttitude.missAttend}),parseInt(${classAttitude.missAss}),parseInt(${classAttitude.midScore}),parseInt(${classAttitude.finScore}));
	</script>
</c:forEach>

<script>

makeMultiYChart('test1',3,15,70,80);
makeMultiYChart('test2',3,15,70,80);
makeMultiYChart('test3',3,15,70,80);
makeMultiYChart('test4',3,15,70,80);
makeMultiYChart('test5',3,15,70,80);


var context = document
    .getElementById('mutilYaxisChart')
    .getContext('2d');
var totalScoreChart = new Chart(context, {
    type: 'bar', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: 
        	[
            '수업 참여 현황'
        ],
        datasets: [
            { //데이터
                label:'미출석', //차트 제목
                fill: false,
                yAxisID:'A',
                data:[
                    2	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	 'rgba(255, 99, 132, 0.2)',
                ],
                borderColor: [
                	'rgb(255, 99, 132)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            { //데이터
                label:'과제미재출', //차트 제목
                fill: false,
                yAxisID:'A',
                data:[
                    10	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	 'rgba(255, 159, 64, 0.2)',
                ],
                borderColor: [
                	'rgb(255, 159, 64)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            { //데이터
                label:'중간고사', //차트 제목
                fill: false,
                yAxisID:'B',
                data:[
                    80	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	'rgba(75, 192, 192, 0.2)',
                ],
                borderColor: [
                	 'rgb(75, 192, 192)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            { //데이터
                label:'기말고사', //차트 제목
                fill: false,
                yAxisID:'B',
                data:[
                    50	 //x축 label에 대응되는 데이터 값
                ] ,
                backgroundColor: [
                	 'rgba(54, 162, 235, 0.2)',
                ],
                borderColor: [
                	'rgb(54, 162, 235)',
                ],
                borderWidth: 1 //경계선 굵기
            },
            
        ]
    },
    options: {
    	 layout: {
    	        padding: {
    	          left: 10,
    	          top: 10,
    	          right: 10,
    	          bottom: 10,
    	        },
    	      },
    	plugins: {
            title: {
                display: true,
                text: '수업 참여 현황',
                padding: {
                    top: 10,
                    bottom: 30
                },
                position:'bottom'
            }
        },
        scales: {
        	 xAxes: [
                 {
                  gridLines: {
                 		   display:false,
                 	        color: "black"
                 	      },
                 }
             ],
            yAxes: [
                {
                 id:'A',
                 gridLines: {
                		   display:false,
                	        color: "black"
                	      },
                     scaleLabel: {
                       display: true,
                       labelString: "횟 수",
                       padding:3,
                       fontColor: 'rgb(66,135,245)'
                     
                     },
                	
                    ticks: {
                        beginAtZero: true,
                        min:0,
                        max:30,
                        stepSize : 5,
                        
                    },
                    position:'left'
                },
                {
                    id:'B',
                    gridLines: {
                   		   display:false,
                   	        color: "black"
                   	      },
                        scaleLabel: {
                          display: true,
                          labelString: "시 험 점 수",
                          padding:3,
                          fontColor: 'rgb(66,135,245)'
                        },
                   	
                       ticks: {
                           beginAtZero: true,
                           min:0,
                           max:100,
                           stepSize : 10,
                           
                       },
                       position:'right'
                   }
            ],
        }
    }
});

</script>

<script>
	var semeLabel =[] 
</script>

<c:forEach items = "${dataMap.label}" var="semeLabel">
<script>
 semeLabel.push('${semeLabel}');
</script>
</c:forEach>
<%--학기별 성적 차트 --%> 
<script>


var context = document
.getElementById('totalScoreBarChart')
.getContext('2d');
var totalScoreChart = new Chart(context, {
type: 'line', // 차트의 형태
data: { // 차트에 들어갈 데이터
    labels: 
    	[
        //x 축
    ],
    datasets: [
        { //데이터
            label: '학기별 성적', //차트 제목
            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data:[
            ] ,
            backgroundColor: [
                //색상
                'rgba(255, 99, 132, 0.2)',
            ],
            borderColor: [
                //경계선 색상
                'rgba(255, 99, 132, 1)',
            ],
            borderWidth: 1 //경계선 굵기
        }/* ,
        {
            label: 'test2',
            fill: false,
            data: [
                8, 34, 12, 24
            ],
            backgroundColor: 'rgb(157, 109, 12)',
            borderColor: 'rgb(157, 109, 12)'
        } */
    ]
},
options: {
    scales: {
        yAxes: [
            {
                ticks: {
                    beginAtZero: true,
                    min: 0,
                    max:100,
					stepSize : 10,
					fontSize : 14
                }
            }
        ]
    }
}
});

</script>
<%--차트 수정 --%>
<script>
function addData(chart, label, data) {
    chart.data.labels.push(label);
    chart.data.datasets.forEach((dataset) => {
        dataset.data.push(data);
    });
    chart.update();
}

function removeData(chart) {
		console.log(chart.data.labels.length);
	for(let i=0;i<chart.data.labels.length;i++){
		console.log(i)
    	chart.data.labels.pop();
	}
   /*  chart.data.datasets.forEach((dataset) => {
        dataset.data.pop();
    }); */
    chart.update();
}

</script>

<%--학생 Detail --%>
<script>
function stuDetail(stuCd){
	showSpeNoteDiv();
	<%--학생 정보 가져오기--%>
	$.ajax({
		url:'${webPath}/prof/counsel/stu/detail',
		data:{
			stuCd:stuCd
		},
		dataType:"json",
		success:function(dataMap){
			
			var stuName = dataMap.student.name;
			var stuNameCls = document.querySelectorAll('.stuName');
			for(var i=0;i<stuNameCls.length;i++){
				stuNameCls[i].innerText=stuName;
			}
			$('#memImg').attr("data-anoCd",dataMap.student.anoCd);
			MemberPictureThumb("<%=request.getContextPath()%>");
			$('#stuCd').val(dataMap.student.stuCd);
			$('#gradeSeme').val(dataMap.student.grade+"학기 "+dataMap.student.stuSemester+"학기");
			$('#phone').val(dataMap.student.phone);
			$('#email').val(dataMap.student.email);
			$('#add1').val(dataMap.student.add1);
			$('#add2').val(dataMap.student.add2);
			$('#nation').val(dataMap.student.nation);
			$('#tlCount').val(dataMap.student.tlTryCount);
			$('#acaStatus').text(dataMap.student.acaStateCd);
			$("#sendSimpleNote").attr("data-stucd",dataMap.student.stuCd);
			totalScoreChart.data.labels=dataMap.label
			totalScoreChart.data.datasets[0].data=dataMap.data;
			totalScoreChart.update();
			
			
			<%--학생 Special 정보--%>
			console.log(dataMap.speicalNoteList[0]);
			
			
			
			
			let tableStr =  `<tr><th style="width:25%">일시</th><th style="width:25%">작성자</th><th style="width:50%">간략내용</th></tr>`;
			for(let i=0;i<dataMap.speicalNoteList.length;i++){
				tableStr+=`<tr onclick="showSpeNoteDetail('\${dataMap.speicalNoteList[i].specialSeq}')" style="cursor:pointer;"><td style="width:25%">`
				var v_getDate = new Date(dataMap.speicalNoteList[i].createDate);
                var v_attendDate = f_transFormatToDate(v_getDate);
                tableStr+=`\${v_attendDate}</td>
		             <td style="width:25%">\${dataMap.speicalNoteList[i].writer}</td>`
		             
			    var sp_content_origin= dataMap.speicalNoteList[i].content;
		        var sp_content = sp_content_origin;
	            if(sp_content_origin.length>12){
	            	 sp_content = sp_content_origin.substring(0,12);
	            }
		        tableStr+=`<td style="width:50%">\${sp_content}</td></tr>`
			}
		
			$("#stuSpecialTable").html(tableStr);
			//addData(totalScoreChart,dataMap.label,dataMap.data);
		},
		error:function(){
			
		}
	})
}


</script>

<script>

function sendSimpleNote(){
	if(!$('#stuCd').val()){
		return;
	}
	var stuCd = $("#sendSimpleNote").attr("data-stucd");
	OpenWindow('${webPath}/common/noteSend?receiverId='+stuCd,'쪽지보내기',700,730);
}


function showSpeNoteDiv(){
	$('#stuSpecialDiv').css('display','block');
	$('#stuCouncelDiv').css('display','none');
	$('#stuCoucelNote').css('display','none');
	$('#stuSpecialNote').css('display','block');
}

function showSpeNoteDetail(specialSeq){
	
	$.ajax({
		url : '${webPath}/prof/counsel/stu/speDetail',
		data : {
			specialSeq : specialSeq
		},
		dataType:"json",
		success : function(data){
			console.log("글 : ",data);
			$('#speNoticeContent').text(data.content);
			var specialSaveBtn =$('#specialSave');
			specialSaveBtn.attr("data-specialSeq",data.specialSeq);
			var specialNoticeDate=$("#specialNoticeDate");
			var speCreateDate = new Date(data.createDate);
			var v_speCreateDate = f_transFormatToDate(speCreateDate);
			specialNoticeDate.text(v_speCreateDate);
		},
		error: function(){
			
		}
	})
}


</script>


<script>
function saveSpecial(){
	var thisObj = event.target;
	var specialSeq = event.target.getAttribute("data-specialSeq");
	var data = null;
	var content = $('#speNoticeContent').val();
	var stuCd = $('#stuCd').val();
	if(!stuCd){
		return;
	}
	if(!content){
		alert("내용을 입력하세요");
		return;
	}
	if(specialSeq){
		data = {
				specialSeq:specialSeq,
				content:content,
				stuCd:stuCd
			};
	}else{
		data={
				content:content,
				stuCd:stuCd	
		}
	}

	$.ajax({
		url : '${webPath}/prof/counsel/stu/speRegist',
		data:data,
		dataType:"text",
		success : function(data){
			alert("성공적으로 저장되었습니다.");
			thisObj.setAttribute("data-specialSeq",'');
			$('#speNoticeContent').val('');
			$("#specialNoticeDate").text('');
			$.ajax({
				url:'${webPath}/prof/counsel/stu/speList',
				data:{
					stuCd:stuCd
				},
				dataType:"json",
				success:function(dataMap){
					
					let tableStr =  `<tr><th style="width:25%">일시</th><th style="width:25%">작성자</th><th style="width:50%">간략내용</th></tr>`;
					for(let i=0;i<dataMap.speicalNoteList.length;i++){
						tableStr+=`<tr onclick="showSpeNoteDetail('\${dataMap.speicalNoteList[i].specialSeq}')" style="cursor:pointer;"><td style="width:25%">`
						var v_getDate = new Date(dataMap.speicalNoteList[i].createDate);
		                var v_attendDate = f_transFormatToDate(v_getDate);
		                tableStr+=`\${v_attendDate}</td>
				             <td style="width:25%">\${dataMap.speicalNoteList[i].writer}</td>`
				             
					    var sp_content_origin= dataMap.speicalNoteList[i].content;
				        var sp_content = sp_content_origin;
			            if(sp_content_origin.length>12){
			            	 sp_content = sp_content_origin.substring(0,13);
			            }
				        tableStr+=`<td style="width:50%">\${sp_content}</td></tr>`
					}
				
					$("#stuSpecialTable").html(tableStr);
				}
			})
		}
		,error: function(){
			alert("저장을 실패하였습니다.");
		}
	})
}
</script>

<script>
<%--상담 Detail --%>
function showCouncelDiv(){
	$('#stuSpecialDiv').css('display','none');
	$('#stuCouncelDiv').css('display','block');
	$('#stuCouncelNote').css('display','block');
	$('#stuSpecialNote').css('display','none');
}

function showCouncelDetail(){
	
}
</script>



<script>
MemberPictureThumb("<%=request.getContextPath()%>");
</script>