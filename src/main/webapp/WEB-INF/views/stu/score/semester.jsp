<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>


<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<div class="card-body">
		<div class="main-content-jsp">
					
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3" style="margin-bottom:10px">
		 					<select onchange="selectGradeSeme(event)" class="form-control" id="gradeSemeSelect">
							
							</select>
					</div>
   					<div class="row">
   						
								<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
								   <div class="card" style="text-align:center">
										<h3 class="card-header">학기별 성적 그래프</h3>
										
							     		<div style="width: 100%; height: 370px;">
											<!--차트가 그려질 부분-->
											<canvas id="totalScoreBarChart" style="width:500px; height:350px;"></canvas>
										</div>
										
								   </div>
								</div>
							
								<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12" style="height : 370px;">
								   <div class="card" style="text-align:center">
										<h3 class="card-header">과목별 성적 그래프</h3>
										
							     		<div style="width: 100%; height : 370px;">
											<!--차트가 그려질 부분-->
											<canvas id="subGradeChart" style="width:500px; height:350px; background-color:#FAFAD2"></canvas>
										</div>
										
								   </div>
								</div>
								
								<div class="col-xl-4 col-lg-4 col-md-4 col-sm-12 col-12">
								  <div class="tab-regular">
									<ul class="nav nav-tabs" id="myTab" role="tablist">
										<li class="nav-item" style="width : 32%;">
										<a class="nav-link active" id="std-tab" style="height:50px; padding: 5px; margin-left:0px;text-align: center;line-height:40px; margin-right: 10px;" data-toggle="tab" href="#std" role="tab" aria-controls="std" aria-selected="true">평가 기준</a>
										</li>
										<li class="nav-item" style="width : 32%;">
										<a class="nav-link" id="home-tab" style="height:50px; padding: 5px; margin-left: auto;text-align: center;line-height:40px; margin-right: 10px;"  data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">출결 점수</a>
										</li>
										<li class="nav-item" style="width : 32%;">
										<a class="nav-link" id="profile-tab" style="height:50px; padding: 5px; margin-left: auto;text-align: center;line-height:40px; margin-right:;"  data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">과제 점수</a>
										</li>
									</ul>
										<div class="tab-content" id="myTabContent" style="height : 370px;">
											<div class="tab-pane fade show active" id="std" role="tabpanel" aria-labelledby="std-tab">
												<table class="table table-hover" >
														<thead>
															<h3>
																<strong style="color : #32AAFF" class="selectedSubjName">${subjStd.subjName}</strong>
															</h3>
															<h4>
															<strong> 평가 기준</strong>
															</h4>
														</thead>
														<tbody id="subStd">
															<tr>
																<th>중간고사 비율</th>
																<th>기말고사 비율</th>
																<th>과제 비율</th>
																<th>출석 비율</th>
															</tr>
															<tr>
																<td style="font-size: 30px;">${subjStd.midRatio}%</td>
																<td style="font-size: 30px;">${subjStd.finalRatio}%</td>
																<td style="font-size: 30px;">${subjStd.assignRatio}%</td>
																<td style="font-size: 30px;">${subjStd.attendRatio}%</td>
															</tr>
															<tr>
																<th>중간고사 성적</th>
																<th>기말고사 성적</th>
																<th>과제 성적</th>
																<th>출석 성적</th>
															</tr>
															
															
															<tr>
																<td style="font-size: 30px;"><fmt:formatNumber value="${lecture.midScore }" pattern=".00"/></td>
																<td style="font-size: 30px;"><fmt:formatNumber value="${lecture.finScore }" pattern=".00"/></td>
																<td style="font-size: 30px;"><fmt:formatNumber value="${lecture.assScore }" pattern=".00"/></td>
																<td style="font-size: 30px;"><fmt:formatNumber value="${lecture.attendScore }" pattern=".00"/></td>
															</tr>
	
														</tbody>
													</table>
											</div>
											
											<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
												<table class="table table-hover">
													<thead>
														<h3>
															<strong style="color : #32AAFF" class="selectedSubjName">${subjStd.subjName}</strong>
														</h3>
														<h4>
														<strong> 나의 출결현황</strong>
														</h4>
													</thead>
													<tbody>
														<tr>
															<td>출석</td>
															<td>지각</td>
															<td>조퇴</td>
															<td>결석</td>
														</tr>
														<tr id="attend">
															<td style="font-size: 30px;">${attend.attendCnt}</td>
															<td style="font-size: 30px;">${attend.lateCnt}</td>
															<td style="font-size: 30px;">${attend.leCnt}</td>
															<td style="font-size: 30px;">${attend.absentCnt}</td>
														</tr>

													</tbody>
												</table>
											</div>
											<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab" style="overflow : auto; height:300px">
												<table class="table table-hover">
													<thead>
														<h3>
															<strong style="color : #32AAFF; text-align: center" class="selectedSubjName">${subjStd.subjName}</strong>
														</h3>
														<h4>
														<strong>과제 제출 현황</strong>
														</h4>
													</thead>
													<tbody id="assList">
														<tr>
															<th>과제 게시 날짜</th>
															<th>과제 제출 여부</th>
															<th>과제 점수</th>
														</tr>
														<c:forEach items = "${assList}" var="ass">	
															<tr data-toggle="tooltip" data-placement="top" title="과제명 : ${ass.title}">
																	<td><fmt:formatDate value="${ass.createDate}" pattern="yyyy/MM/dd" /></td>
																	<td>${ass.subEvalStatusCd }</td>
																	<td>${ass.score }</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
		
					
   			
   		</div>
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->

             <div class="row">
            	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                	<div class="user-avatar-info">
						<div class="card">
							
								<table class="table table-hover">
								    <thead>
								        <tr>
								            <th style="width : 10%">과목코드</th>
								            <th style="width : 30%">과목명</th>
								            <th style="width : 10%">이수구분</th>
								            <th style="width : 10%">학점</th>
								            <th style="width : 10%">담당교수</th>
								            <th style="width : 10%">총점수</th>
								            <th style="width : 10%">평점</th>
								            <th style="width : 10%">등급</th>
								            <th class="postBtnCl" style="display : none">글쓰기 버튼</th>
								        </tr>
								    </thead>
								    <tbody id="subScoreList">
								    	<c:forEach items="${scoreList}" var = "score">
									        <tr onclick="selectSubjDetail('${score.lecCd}')">
									            <td>${score.subjCd }</td>
									            <td>${score.subjName }</td>
									            <td>${score.lecCategoryCd }</td>
									            <td>${score.credit}학점</td>
									            <td>${score.name}</td>
									            <td>${score.finalScore }</td>
									            <td class="gradeNum" data-lecCd="${score.lecCd}">${score.finalMarks}</td>
									            <td>${score.finalMarks }</td>
									            <td class="postBtnCl postBtnTd" id="${score.lecCd}td" style="display:none"></td>
									        </tr>
								    	</c:forEach>
								    </tbody>
								</table>	
						</div>
<%-- 						<c:if test=""> --%>
					<%-- 	<div class="row justify-content-end mr-3" >
							<div class="input-group-append">
								<button type="button" onclick="OpenWindow('${webPath}/stu/support/share/registForm?lecCd=SYL0000','학습법 공유 게시글 작성',800,550)" class="btn btn-primary">학습법공유</button>
							</div>
						</div> --%>
<%-- 						</c:if> --%>
						
                    </div>
                </div>
            </div>
        </div>
	</div> 
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	<!-- ================================================= -->
	<div class="row">

	</div> 
	<!-- ================================================= -->
		
		
		</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<!-- chart chartist js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="<%=request.getContextPath() %>/resources/bootstrap/assets/libs/js/dashboard-ecommerce.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
    
    <!-- ================================================= -->
    <!-- 차트 코드 -->
    <!-- ================================================= -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    
    
    <script>
    var semeLabel =[] 
    </script>
    
    <c:forEach items = "${semeScoreMap.label}" var="semeLabel">
    <script>
   	 semeLabel.push('${semeLabel}');
    </script>
    </c:forEach>
    
    <script>
    var subjLabel=[]
    </script>
     <c:forEach items = "${subScoreDist.label}" var="subjName">
    <script>
    subjLabel.push('${subjName}');
    </script>
    </c:forEach>
    
    <script type="text/javascript">
            var context = document
                .getElementById('totalScoreBarChart')
                .getContext('2d');
            var totalScoreChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: semeLabel
                    	/* [
                        //x 축
                        '1-1','1-2','2-1','2-2','3-1','3-2','4-1','4-2'
                    ] */,
                    datasets: [
                        { //데이터
                            label: '학기별 성적', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data:${semeScoreMap.data}
                            	/* [
                                21,19,25,20,23,26,25,60	 //x축 label에 대응되는 데이터 값
                            ] */,
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
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>

    
   

	<script type="text/javascript">
            var context = document
                .getElementById('subGradeChart')
                .getContext('2d');
            var subjScoreChart = new Chart(context, {
                type: 'radar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: subjLabel,
                    datasets: [{
                        label: '과목별 성적',
                        data: ${subScoreDist.data},
                        fill: true,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgb(54, 162, 235)',
                        pointBackgroundColor: 'rgb(54, 162, 235)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgb(54, 162, 235)'
                      }]
                },
                options: {
                	scale: {
                	    gridLines: {
                	      color: "gray",
                	      lineWidth: 1
                	    },
                	    angleLines: {
                	      display: true
                	    },
                	    ticks: {
                	      beginAtZero: true,
                	      min: 0,
                	      max: 100,
                	      stepSize: 20,
                	      backdropColor : 'rgba(250, 245, 140,0.2)'
                	    },
                	    pointLabels: {
                	      fontSize: 10,
                	      fontColor: "#FF69B4"
                	    },
                	  },
                	 
                }
            });
        </script>
 <script>
 var score4point5Num = [4.5, 4.0, 3.5,3.0, 2.5,2.0, 1.5, 1.0, 0]
 var score4point5Marks=['A+','A','B+','B','C+','C','D+','D','F']
 var score4point3Num = [4.3,4.0,3.7,3.3,3.0,2.7,2.3,2.0,1.7,1.3,1.0,0.7,0]
 var score4point3Marks=['A+','A0','A-','B+','B0','B-','C+','C0','C-','D+','D0','D-','F']
 function transformMarksToNum(marks,std){
	 grade = 0;
	 if(std==4.5){
		 grade = score4point5Num[score4point5Marks.indexOf(marks)]
		 
	 }else if(std==4.3){
		 grade = score4point3Num[score4point3Marks.indexOf(marks)]
	 }
	 return grade;
 }

 function transformTo4point5(){
	 var gradeNumList = document.querySelectorAll(".gradeNum");
	 for(var i=0;i<gradeNumList.length;i++){
	 	var subjMark = gradeNumList[i].innerText;
	 	var gradeNum = transformMarksToNum(subjMark,4.5);
	 	gradeNumList[i].innerText=gradeNum;
	 }
 }
 transformTo4point5()
 </script>
 

 <script>
 var gradeSemeArray=[];
 </script>
 <c:forEach items="${gradeSemesterList}" var="grade">
 <script>
 gradeSemeArray.push('${grade}');
 </script>
 </c:forEach>
 
 <script>
 var gradeSemeSelect = $('#gradeSemeSelect');
 var optionStr = "";
 for(var i=0;i<gradeSemeArray.length;i++){
 	var grade = gradeSemeArray[i].substring(1,2);
 	var seme = gradeSemeArray[i].substring(3,4);
 	if(seme == '3'){
 		seme = "여름 계절";
 	}
 	else if(seme=='4'){
 		seme="겨울 계절";
 	}
 	if(i==gradeSemeArray.length-1){
 		optionStr+="<option selected value="+gradeSemeArray[i]+">"+grade+"학년 "+seme+"학기</option>";
 	}else{
 		optionStr+="<option value="+gradeSemeArray[i]+">"+grade+"학년 "+seme+"학기</option>";
 	}
 }

 gradeSemeSelect.html(optionStr);
 </script>
 <script>
 function updateChartData(chart, label, data) {
	    chart.data.labels=label;
	    chart.data.datasets.forEach((dataset) => {
	        dataset.data=data;
	    });
	    chart.update();
}
 
 </script>
 
 
 <script>
 var lectureCd = "";
 function selectGradeSeme(e){
	 var selectedGradeSeme = e.currentTarget.value;
	 deleteButton();
	 renderSubjScoreGraph(selectedGradeSeme);
	 modifySubjScoreList(selectedGradeSeme);
 }
 
 
 
 function renderSubjScoreGraph(selectedGradeSeme){
	 $.ajax({
		 url : '<%=request.getContextPath()%>/stu/score/subjectGraphdata',
		 data : {"gradeSemeCd":selectedGradeSeme},
		 dataType:"json",
		 success:function(dataMap){
			 updateChartData(subjScoreChart,dataMap.label,dataMap.data);
		 },
		 error:function(){
			 alert("실패");
		 }
		 
	 })
 }
 
 function modifySubjScoreList(selectedGradeSeme){
	 $.ajax({
		 url : '<%=request.getContextPath()%>/stu/score/subjectInfoList',
		 data : {"gradeSemeCd":selectedGradeSeme},
		 dataType:"json",
		 success:function(dataArr){
			printData(dataArr,$('#subScoreList'),$('#subScoreList-template'));
			$(".selectedSubjName").text(dataArr[0].subjName);
			lectureCd = dataArr[0].lecCd;
			transformTo4point5();
			changeSubStd(selectedGradeSeme,lectureCd);
			changeAttend(selectedGradeSeme,lectureCd);
			changeAssList(selectedGradeSeme,lectureCd);
			createStudyShareBtn();
		 },
		 error:function(){
			 alert("실패");
		 }
		 
	 })
 }
 
 function changeSubStd(selectedGradeSeme,lecCd){
	 $.ajax({
		 url : '<%=request.getContextPath()%>/stu/score/subStd',
		 data : {"gradeSemeCd":selectedGradeSeme,
				"lecCd":lecCd	   
		 },
		 dataType:"json",
		 success:function(dataArr){
			printData(dataArr,$('#subStd'),$('#subStd-template'));
		 },
		 error:function(){
			 alert("실패");
		 }
		 
	 })
 }
 
 function changeAttend(selectedGradeSeme,lecCd){
	 $.ajax({
		 url : '<%=request.getContextPath()%>/stu/score/changeAttend',
		 data : {"gradeSemeCd":selectedGradeSeme,
				"lecCd":lecCd	   
		 },
		 dataType:"json",
		 success:function(dataArr){
			printData(dataArr,$('#attend'),$('#attend-template'));
		 },
		 error:function(){
			 alert("실패");
		 }
		 
	 })
 }
 
 
 function changeAssList(selectedGradeSeme,lecCd){
	 $.ajax({
		 url : '<%=request.getContextPath()%>/stu/score/changeAssList',
		 data : {"gradeSemeCd":selectedGradeSeme,
				"lecCd":lecCd	   
		 },
		 dataType:"json",
		 success:function(dataArr){
			printData(dataArr,$('#assList'),$('#assList-template'));
		 },
		 error:function(){
			 alert("실패");
		 }
		 
	 })
 }
 
 </script>
 <script>
 function selectedSubjInfo(lecCd){
	 $.ajax({
		 url:'<%=request.getContextPath()%>/stu/score/subjectInfo',
		 data : {"lecCd" : lecCd},
		 dataType : "json",
		 success : function(data){
			 console.log("과목 정보 ",data);
			$(".selectedSubjName").text(data.subjName);
		 },
		 error : function(){
			 alert("실패");
		 }
	 })
 }
 
 function selectSubjDetail(lecCd){
	 var selectedGradeSeme = $('#gradeSemeSelect').val();
	 selectedSubjInfo(lecCd);
	 changeSubStd(selectedGradeSeme,lecCd);
	 changeAttend(selectedGradeSeme,lecCd);
	 changeAssList(selectedGradeSeme,lecCd);
 }
 </script>
 
<!-- 학습법 공유 -->
<script>
function createStudyShareBtn(){
	var gradeNumTd = $(".gradeNum");
	console.log(gradeNumTd);
	for(var i=0;i<gradeNumTd.length;i++){
		var gradeNum = gradeNumTd.eq(i).text();
		if(gradeNum>=4.0){
			$(".postBtnCl").css("display","block");
			var lecCd =gradeNumTd.eq(i).attr("data-lecCd");
			var postButton = '<button type="button" class="btn btn-primary" onclick="post(\''+lecCd+'\')">학습법 공유 글쓰기</button>';
			console.log("ghkrdls : ",$('td[id='+lecCd+'td]'))
			$('td[id='+lecCd+'td]').html(postButton);
		}
	}
	
}
function deleteButton(){
	$(".postBtnCl").css("display","none");
	$(".postBtnTd").html('');
}

function post(lecCd){
	
	OpenWindow('<%=request.getContextPath()%>/stu/support/share/registForm?lecCd='+lecCd);
}
</script>
 
 <!--  핸들바스 -->
 

 
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
 
<script>
Handlebars.registerHelper('decimalConversion', function (stringNum) {
     score = (parseFloat(stringNum)).toFixed(2);
     scoreArr = score.split(".");
     if(scoreArr[1]=="00"){
    	 score = scoreArr[0] 
     }
     return score
})



Handlebars.registerHelper('dateFormat', function (milliseconds) {
	 var newDate = new Date(milliseconds);
	 var year = newDate.getFullYear();
	 var month = newDate.getMonth()+1;
	 var date = newDate.getDate();
	 var dateFormatStr = year+"/"+('00'+month).slice(-2)+"/"+('00'+date).slice(-2);
     return dateFormatStr;
})
</script>
<script  type="text/x-handlebars-template"  id="subScoreList-template">
{{#each .}}
<tr onclick="selectSubjDetail('{{lecCd}}')">
	<td>{{subjCd }}</td>
	<td>{{subjName }}</td>
	<td>{{lecCategoryCd }}</td>
	<td>{{credit}}학점</td>
	<td>{{name}}</td>
	<td>{{finalScore }}</td>
	<td class="gradeNum" data-lecCd="{{lecCd}}">{{finalMarks}}</td>
	<td>{{finalMarks }}</td>
	 <td class="postBtnCl postBtnTd" id="{{lecCd}}td" style="display:none"></td>
 </tr>

{{/each}}
</script>

<script  type="text/x-handlebars-template"  id="subStd-template">
	<tr>
		<th>중간고사 비율</th>
		<th>기말고사 비율</th>
		<th>과제 비율</th>
		<th>출석 비율</th>
	</tr>
	<tr>
		<td style="font-size: 30px;">{{subjStd.midRatio}}%</td>
		<td style="font-size: 30px;">{{subjStd.finalRatio}}%</td>
		<td style="font-size: 30px;">{{subjStd.assignRatio}}%</td>
		<td style="font-size: 30px;">{{subjStd.attendRatio}}%</td>
	</tr>
	<tr>
		<th>중간고사 성적</th>
		<th>기말고사 성적</th>
		<th>과제 성적</th>
		<th>출석 성적</th>
	</tr>
	
	<tr>
		<td style="font-size: 30px;">{{decimalConversion lecture.midScore}}</td>
		<td style="font-size: 30px;">{{decimalConversion lecture.finScore}}</td>
		<td style="font-size: 30px;">{{decimalConversion lecture.assScore}}</td>
		<td style="font-size: 30px;">{{decimalConversion lecture.attendScore}}</td>
	</tr>

</script>

<script  type="text/x-handlebars-template"  id="attend-template">
<td style="font-size: 30px;">{{attendCnt}}</td>
<td style="font-size: 30px;">{{lateCnt}}</td>
<td style="font-size: 30px;">{{leCnt}}</td>
<td style="font-size: 30px;">{{absentCnt}}</td>
</script>



<script  type="text/x-handlebars-template"  id="assList-template">
<tr>
	<th>과제 게시 날짜</th>
	<th>과제 제출 여부</th>
	<th>과제 점수</th>
</tr>
{{#each .}}
<tr data-toggle="tooltip" data-placement="top" title="과제명 : {{title}}">
		<td>{{dateFormat createDate}}</td>
		<td>{{subEvalStatusCd }}</td>
		<td>{{score }}</td>
</tr>
{{/each}}
</script>


<script>


function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);
	target.html(html);
}
</script>
