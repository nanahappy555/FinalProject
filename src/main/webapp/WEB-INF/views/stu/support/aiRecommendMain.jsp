<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<script>
var parentHeader = parent.document.querySelector('#pageHeaderSpan');
parentHeader.innerText='AI 추천';
</script>

<style>
.stuInfoBox {
	background-color: #AADBFF;
	width: 30%;
	margin: 20px;
	border-radius: 20px;
	height: 130px;
	position: relative;
}

.stuInfoTitle {
	position: absolute;
	font-weight: bold;
	top: 20px;
	left: 20px;
}

.stuInfoIcon {
	width: 10%;
	position: absolute;
	bottom: 20px;
	left: 20px;
}

.stuInfoContent {
	position: absolute;
	bottom: 20px;
	right: 20px;
}

#mbti {
	color: blue;
}

#recommendContent {
	width: 100%
}

table {
	width: 100%;
}

.tableTd {
	position: relative;
	width: 20%;
	height: 150px;
}

.tableTdLecNM {
	position: absolute;
	font-weight: bold;
	font-size: large;
	top: 30px;
	left: 20px;
}

.tableTdLecCD {
	position: absolute;
	top: 10px;
	left: 20px;
}

.tableTdLecCredit {
	position: absolute;
	bottom: 20px;
	left: 20px;
}

.tableTdBtn {
	position: absolute;
	bottom: 20px;
	right: 20px;
}

.clubContent {
	width: 200px;
	height: 130px;
	border-radius: 20px;
	background-color: #FFD9E4;
	margin-right: 30px;
	position: relative;
}

.clubDetail {
	position: absolute;
	bottom: 10px;
	right: 10px;
}

.clubRank {
	position: absolute;
	top: 10px;
	left: 15px;
	font-size: 15px;
}

.clubName {
	position: absolute;
	top: 50px;
	left: 15px;
}

.secContent {
	width: 200px;
	height: 130px;
	border-radius: 20px;
	background-color: #FFD9E4;
	margin-right: 30px;
	position:relative;
	background-color: #cefad0
}
.secDetail{
position:absolute;
bottom:10px;
right:10px;
}
.secRank{
position:absolute;
top:10px;
left:15px;
font-size: 15px;
}
.secName{
position:absolute;
top:50px;
left:15px;
}

.employContentList {
	width: 150px;
	height: 130px;
	border-radius: 20px;
	background-color: #FFD9E4;
	margin-right: 30px;
	position: relative;
}

.employRank {
	position: absolute;
	top: 10px;
	left: 15px;
	font-size: 15px;
}

.employName {
	position: absolute;
	top: 50px;
	left: 15px;
}
</style>
</head>
<div class="pills-regular">
	<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			aria-controls="home" aria-selected="true">MBTI추천</a></li>
			
		<li class="nav-item"><a class="nav-link" id="pills-profile-tab"
			data-toggle="pill" href="#pills-profile" role="tab"
			aria-controls="profile" aria-selected="false">설문조사 추천</a></li>
			
		<li class="nav-item"><a class="nav-link" id="pills-contact-tab"
			data-toggle="pill" href="#pills-contact" role="tab"
			aria-controls="contact" aria-selected="false">수강기록/도서 추천</a></li>
	</ul>
	<div class="tab-content" id="pills-tabContent">
		<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
			aria-labelledby="pills-home-tab">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<div class="card-header">
						<h1>${student.name}님의 학사정보</h1>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">소속 단과 대학</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/school.png" />
								<h2 class="stuInfoContent">${stuAcaInfo.colName}</h2>
							</div>

							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">소속 학과</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/lecture.png">
								<h2 class="stuInfoContent">${stuAcaInfo.firMajName}</h2>
							</div>


							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">학점 / 학기</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/semester.png">
								<h2 class="stuInfoContent">${stuAcaInfo.totalCredit}학점/${stuAcaInfo.totalSeme}학기</h2>
							</div>
						</div>
						<hr />
						<div style="margin-bottom: 30px;">
							<h2 style="display: inline">나의 MBTI :</h2>
							<c:if test="${not empty student.mbtiCd}">
							<h1 style="display: inline" class="mb-1">
								<span id="mbti">&nbsp;&nbsp;&nbsp;${student.mbtiCd }</span>
							</h1>
							</c:if>
							<c:if test="${empty student.mbtiCd}">
							<h1 style="display: inline" class="mb-1">
								<span style="font-size:18px; cursor:pointer; color:#CD5C5C" onclick="pageMove('${webPath}/stu/support/mbtiPage')">&nbsp;&nbsp;&nbsp;MBTI 검사하러가기</span>
							</h1>
							</c:if>
						</div>
						<div id="recommendClubByMbti">
							<h3 style="margin-top: 20px;padding-left:30px;">* 추천 동아리 Top 5</h3>
							<div class="row" id="clubContentList" style="padding-left:30px;">
	
							</div>
						</div>
						<br>
						<br>
						

						<div id="RecommndSecByMBTI">
							<h3 style="margin-top: 20px;padding-left:30px;">* 추천 진로 Top 5</h3>
							<div class="row" id="secContentList" style="padding-left:30px;">
								
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>

		<!-- 설문조사 추천 -->
		<div class="tab-pane fade" id="pills-profile" role="tabpanel"
			aria-labelledby="pills-profile-tab">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<div class="card-header">
						<h1>${student.name}님의 학사정보</h1>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">소속 단과 대학</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/school.png" />
								<h2 class="stuInfoContent">${stuAcaInfo.colName}</h2>
							</div>

							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">소속 학과</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/lecture.png">
								<h2 class="stuInfoContent">${stuAcaInfo.firMajName}</h2>
							</div>


							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">학점 / 학기</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/semester.png">
								<h2 class="stuInfoContent">${stuAcaInfo.totalCredit}학점/${stuAcaInfo.totalSeme}학기</h2>
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card col-xl-5 col-lg-5 col-md-5 col-sm-5 col-5">
					<h4 class="card-header">
						<i class="fas fa-pencil-alt"></i>&nbsp;&nbsp;설문조사
					</h4>
					<div class="card-body" style="position: relative">
						<p class="card-text">본 설문조사를 통해, 응답 내용이 유사한 학우들이 수강한 교과 관련 내용을
							추천받을 수 있습니다.</p><br>
						<a href="#" class="btn btn-primary"
							data-toggle="modal" data-target="#interviewFormModal">설문조사 시작</a>
						<button class="btn btn-primary" onclick="getSurveyRecommend()">추전 결과보기</button>
					</div>
				</div>
			</div>
		
			<div class="recommendContent">
				<h3>* 추천 교과목 TOP 5</h3>
				<table id="recommendTable" border=1>
					<tr id="surveyLectureList">
						<!-- <td class="tableTd"><span class="tableTdLecCD">STA1001</span>
							<span class="tableTdLecNM">통계학입문</span> <span
							class="tableTdLecCredit">3 학점</span> <a href="#"
							class="tableTdBtn btn btn-rounded btn-primary" data-lecCode="">상세보기</a>
						</td> -->
					</tr>
				
				</table>
			</div>


			<!--설문조사 폼 모달창  -->

			<div class="modal fade" id="interviewFormModal" tabindex="-1"
				role="dialog" aria-labelledby="interviewFormModalLabel"
				aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title" id="interviewFormModalLabel">설문조사 폼
								양식</h3>
							<a href="#" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</a>
						</div>
						<div class="modal-body">
							<div class="card-body">
								<div id="surveyFormDiv">
								<form id="surveyForm">
									<table class="form-control">
									<tr>
										<td colspan="5"></td><td>나의 응답</td>								
									</tr>
									<c:forEach items="${surveyList}" var="survey" varStatus="status">
									
									<tr>
										<td colspan="5"><strong>${survey.surveyNo}. ${survey.content }</strong></td>
									</tr>
									<tr>
										<td>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="formRes${survey.surveyNo}"
											class="custom-control-input" value="5">매우 동의함<span
											class="custom-control-label"></span>
										</label>
										</td>
										<td>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="formRes${survey.surveyNo}"
											class="custom-control-input" value="4">동의함 <span
											class="custom-control-label"></span>
										</label>
										</td>
										<td>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="formRes${survey.surveyNo}"
											class="custom-control-input" value="3">보통<span
											class="custom-control-label"></span>
										</label>
										</td>
										<td>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="formRes${survey.surveyNo}"
											class="custom-control-input" value="2">동의하지 않음.<span
											class="custom-control-label"></span>
										</label>
										</td>
										<td>
										<label class="custom-control custom-radio custom-control-inline">
											<input type="radio" name="formRes${survey.surveyNo}"
											class="custom-control-input" value="1">매우
											동의하지 않음.<span class="custom-control-label"></span>
										</label>
										</td>
										<td class="reponseTd" style="text-align: center; color:#64CD3C">${responseList[status.index].response}</td>
									</tr>
		
									</c:forEach>
									</table>
									</form>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<a href="#" class="btn btn-secondary" data-dismiss="modal">닫기</a>
							<button type="button" class="btn btn-primary" onclick="submitSurvey()">설문조사 내용 저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 설문조사 추천 끝 -->
		<!-- 수강기록/도서 추천 -->
		<div class="tab-pane fade" id="pills-contact" role="tabpanel"
			aria-labelledby="pills-contact-tab">

			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<div class="card-header">
						<h1>${student.name}님의 학사정보</h1>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">소속 단과 대학</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/school.png" />
								<h2 class="stuInfoContent">${stuAcaInfo.colName}</h2>
							</div>

							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">소속 학과</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/lecture.png">
								<h2 class="stuInfoContent">${stuAcaInfo.firMajName}</h2>
							</div>


							<div class="stuInfoBox">
								<h3 class="stuInfoTitle">학점 / 학기</h3>
								<img class="stuInfoIcon"
									src="<%=request.getContextPath()%>/resources/img/aiRecommend/semester.png">
								<h2 class="stuInfoContent">${stuAcaInfo.totalCredit}학점/${stuAcaInfo.totalSeme}</h2>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="recommendContent">
				<p>수강기록 기반 다음학기 수강 과목 추천</p>
				<h3>* 추천 교과목 TOP 10</h3>
				<table border=1>
					<tr id=lecContentList1>
						<!--<td class="tableTd"><span class="tableTdLecCD">STA1001</span>

										<span class="tableTdLecNM">통계학입문</span> <span
										class="tableTdLecCredit">3 학점</span> <a href="#"
										class="tableTdBtn btn btn-rounded btn-primary" data-lecCode="">상세보기</a>
									</td>
									 -->
					</tr>
					<tr id="lecContentList2">
						<!-- <td class="tableTd"><span class="tableTdLecCD">STA1001</span>
										<span class="tableTdLecNM">통계학입문</span> <span
										class="tableTdLecCredit">3 학점</span> <a href="#"
										class="tableTdBtn btn btn-rounded btn-primary" data-lecCode="">상세보기</a>

									</td>
									 -->
					</tr>
				</table>
			</div>
			<br>
			<br>
			<p>도서 대출 이력 기반 추천도서</p>
			<div class="recommendContent">
				<h3>* 추천 도서 TOP 5</h3>
				<table border=1>
					<tr id="booksRecoList">
					</tr>
					
				</table>

			</div>
		</div>
	</div>
</div>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script>
	function printData(dataArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataArr);
		target.html(html);
	}
</script>

<script type="text/x-handlebars-template" id="clubHandleBarsTemplate">
{{#each .}}
<div class="clubContent">
	<span class="clubRank">{{i}}순위</span>
	<h3 class="clubName"><strong>{{club}}</strong></h3>
	<a href="#" class="btn btn-rounded btn-primary clubDetail">상세페이지</a>
</div>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="lecHandleBarsTemplate">
{{#each .}}
<td class="tableTd"><span class="tableTdLecCD">{{leccd}}</span>
<span class="tableTdLecNM">{{name}}</span>
<span class="tableTdLecCredit">{{credit}} 학점</span>
<a href="#" class="tableTdBtn btn btn-rounded btn-primary" data-lecCode="">상세보기</a>
</td>
{{/each}}

</script>

<script type="text/x-handlebars-template" id="booksHandleBarsTemplate">
{{#each .}}
<td class="tableTd"><span class="tableTdLecCD">{{isbn}}</span>
<span class="tableTdLecNM">{{book_title}}</span>
<span class="tableTdLecCredit">{{book_writer}}</span>
<a href="#" class="tableTdBtn btn btn-rounded btn-primary" data-lecCode="">상세보기</a>
</td>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="secHandleBarsTemplate">
{{#each .}}
<div class="secContent">
	<span class="secRank">{{i}}순위</span>
	<h3 class="secName"><strong>{{sec}}</strong></h3>
</div>
{{/each}}
</script>


<script type="text/x-handlebars-template" id="surveyHandleBarsTemplate">
{{#each .}}
<td class="tableTd"><span class="tableTdLecCD">{{leccd}}</span>
<span class="tableTdLecNM">{{name}}</span> <span
class="tableTdLecCredit">{{credit}} 학점</span>
<a href="#"
class="tableTdBtn btn btn-rounded btn-primary" data-lecCode="">상세보기</a>
</td>
{{/each}}
</script>

<script>
function submitSurvey(){
	var data = $('#surveyForm').serialize();
	$.ajax({
		url:'${webPath}/stu/support/surveyRegist',
		data:data,
		dataType:"json",
		success:function(data){
			var dataList = data.responseList;
			var reponseTd = document.querySelectorAll('.reponseTd');
			for(var i=0;i<reponseTd.length;i++){
				reponseTd[i].innerText = dataList[i].response;
			}
			Swal.fire(
					  '제출 성공하였습니다!',
					  '',
					  'success'
					)
		},
		error:function(){
// 			alert("제출 실패하였습니다.");
		}
	})
}

</script>

<script>
var gradeseme='0${student.grade}0${student.stuSemester}'

getNextLecRecommend = function() {
	$.ajax({
			type : 'get',
			url : "http://192.168.141.22:5000/oldlecnextlec?stucode=${student.stuCd}&gradeseme="+gradeseme,
			dataType : "text",
			success : function(data) {
				var dataArr = JSON.parse(data)
				var dataArr1 = []
				var dataArr2 = []
				for (var i = 0; i < dataArr.length; i++) {
					if (i < 5) {
						dataArr1.push(dataArr[i])
					} else {
						dataArr2.push(dataArr[i])
					}
				}
				printData(dataArr1, $("#lecContentList1"),$("#lecHandleBarsTemplate"))
				printData(dataArr2, $("#lecContentList2"),$("#lecHandleBarsTemplate"))
			},
			error : function() {
			}
		});
}
getMbtiRecommend = function() {
	$.ajax({
		type : 'get',
		url : "http://192.168.141.22:5000/mbtiClub?mbti=${student.mbtiCd}",
		dataType : "text",
		success : function(data) {
			var dataArr = JSON.parse(data)
			printData(dataArr, $("#clubContentList"),$("#clubHandleBarsTemplate"))
		},
		error : function() {
		}
	});
}


getBooksRecommend = function() {
	$.ajax({
		type : 'get',
		url : "http://192.168.141.22:5000/book?stuid=${student.stuCd}",
		dataType : "text",
		success : function(data) {
			var dataArr = JSON.parse(data)
		/* 	var dataArr1 = []
			for (var i = 0; i < dataArr.length; i++) {
				dataArr1.push(dataArr[i])
			} */

			printData(dataArr, $("#booksRecoList"),$("#booksHandleBarsTemplate"))
		},
		error : function() {
		}
	});
}

getMbtiSecRecommend =function() {
	$.ajax({
        type : 'get',
        url : "http://192.168.141.22:5000/mbtiSec?mbti=${student.mbtiCd}",
        dataType:"text",
        success : function(data){
        	var dataArr = JSON.parse(data)
        	printData(dataArr,$("#secContentList"),$("#secHandleBarsTemplate"))
        },
        error:function(){
s        }
	  });
}


getSurveyRecommend =function() {
	$.ajax({
        type : 'get',
        url : "http://192.168.141.22:5000/survey?stucode=${student.stuCd}",
        dataType:"text",
        success : function(data){
        	var dataArr = JSON.parse(data)
        	printData(dataArr,$("#surveyLectureList"),$("#surveyHandleBarsTemplate"))
        },
        error:function(){
        }
	  });
}
if(${not empty student.mbtiCd}){
	getMbtiRecommend();
	getMbtiSecRecommend();
}

getNextLecRecommend();
getBooksRecommend();
</script>