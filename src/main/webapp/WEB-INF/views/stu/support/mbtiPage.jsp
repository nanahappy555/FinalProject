<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style>
#mbti {
	color: blue;
}

#mainContent {
	margin: auto;
}

.mbtiTitle {
	font-size: medium;
	font-weight: bold;
	position: absolute;
	color: black;
	top: 20px;
	left: 15px;
}

.mbtiClass1 {
	width: 150px;
	height: 100px;
	background-color: #FFC6C3;
	border-radius: 30px;
	margin: 5px;
	position: relative;
}

.mbtiClass2 {
	width: 150px;
	height: 100px;
	background-color: #D2D2FF;
	border-radius: 30px;
	margin: 5px;
	position: relative;
}

.mbtiClass3 {
	width: 150px;
	height: 100px;
	background-color: #D2FFD2;
	border-radius: 30px;
	margin: 5px;
	position: relative;
}

.mbtiClass4 {
	width: 150px;
	height: 100px;
	background-color: #FAFAA0;
	border-radius: 30px;
	margin: 5px;
	position: relative;
}

.mbtiContent {
	position: absolute;
	top: 50px;
	left: 10px;
	color: black;
}
#presentMbti{
	color : blue;
	font-size: large;
}
</style>
</head>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<div class="card">
		<div class="card-body">
			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->
			<div class="row flex justify-content-center">

				<div class="col-xl-5 col-lg-5 col-md-5 col-sm-5 col-5">
					<div class="card">
						<div class="card-body">
							<div class="metric-value d-inline-block">
								<h3 style="display: inline">나의 MBTI :</h3>
								<h1 style="display: inline" class="mb-1">
									<span id="mbti">&nbsp;&nbsp;&nbsp;${student.mbtiCd}</span>
								</h1>
							</div>

						</div>
						<div class="card-body bg-light p-t-40 p-b-40">
							<div id="sparkline-1">
								<img src="<%=request.getContextPath()%>/resources/img/mbti.png"
									style="width: 100%; height: 100%"></img>
							</div>
						</div>
						<div class="card-footer text-center bg-white">
							<p>
								본 성향진단을 통해 나의 유형을 파악하고,<br> 유사한 그룹의 학우들이 많이 참여한 <br>
								진로, 취업, 교과, 비교과 관련 내용을 추천받을 수 있습니다.
							</p>
							<a href="#" style="margin-right: 70px;"
								onclick="OpenWindow('https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC', 'MBTI검사', 700, 800)"
								class="btn btn-primary btn-lg">MBTI 검사하기</a> <a href="#"
								class="btn btn-primary btn-lg" data-toggle="modal" data-target="#mbtiModifyFormModal">MBTI 수정하기</a>
						</div>
					</div>
				</div>
				
				<!-- MBTI 수정 모달창. -->
				
				<div class="modal fade" id="mbtiModifyFormModal" tabindex="-1" role="dialog" aria-labelledby="mbtiModifyFormModalLabel" aria-hidden="true" style="display: none;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="mbtiModifyFormModalLabel">MBTI 수정창</h5>
								<a href="#" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
								</a>
							</div>
							<div class="modal-body">
								<span>현재 MBTI</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="presentMbti">${student.mbtiCd}</span><br>
								<span>MBTI 수정</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<select id="mbtiSel" name="mbti" class="form-control" style="width:130px; display:inline;">
									<option value="">선택</option>
									
									<option value="ISTJ">ISTJ</option>
									<option value="ISFJ">ISFJ</option>
									<option value="INFJ">INFJ</option>
									<option value="INTJ">INTJ</option>
									<option value="ISTP">ISTP</option>
									
									<option value="ISFP">ISFP</option>
									<option value="INFP">INFP</option>
									<option value="INTP">INTP</option>
									<option value="ESTP">ESTP</option>
									<option value="ESFP">ESFP</option>
									        
									<option value="ENFP">ENFP</option>
									<option value="ENTP">ENTP</option>
									<option value="ESTJ">ESTJ</option>
									<option value="ESFJ">ESFJ</option>
									<option value="ENFJ">ENFJ</option>
									
									<option value="ENTJ">ENTJ</option>
									
								</select>
								
							</div>
							<div class="modal-footer"> 
								<a href="#" class="btn btn-secondary" data-dismiss="modal">닫기</a>
								<button class="btn btn-primary" onclick="changeMbti()">수정 내용 저장</button>
							</div>
						</div>
					</div>
				</div>
				<!-- MBTI 수정 모달창 끝 -->
				<div class="card">
					<div class="card-header">
						<h1>MBTI 유형별 특징</h1>
					</div>
					<div class="card-body">

						<div class="row">
							<div class="mbtiClass1">
								<span class="mbtiTitle">ISTJ 소금형</span> <span
									class="mbtiContent">한번 시작한 일은 끝까지 해냄</span>
							</div>
							<div class="mbtiClass2">
								<span class="mbtiTitle">ISFJ 권력형</span> <span
									class="mbtiContent">성실하고 온화하며 협조를 잘함</span>
							</div>
							<div class="mbtiClass1">
								<span class="mbtiTitle">INFJ 예언자형</span> <span
									class="mbtiContent">사람에 관한 뛰어난 통찰력을 가짐</span>
							</div>
							<div class="mbtiClass2">
								<span class="mbtiTitle">INTJ 과학자형</span> <span
									class="mbtiContent">전체를 조합하여 비전을 제시함</span>
							</div>
						</div>
						<div class="row">
							<div class="mbtiClass3">
								<span class="mbtiTitle">ISTP 백과사전형</span> <span
									class="mbtiContent">논리적이고 뛰어난 상황 적응력</span>
							</div>
							<div class="mbtiClass4">
								<span class="mbtiTitle">ISFP 성인군자형</span> <span
									class="mbtiContent">따뜻한 감성을 가지고 있으며 겸손함</span>
							</div>
							<div class="mbtiClass3">
								<span class="mbtiTitle">INFP 잔다르크형</span> <span
									class="mbtiContent">이상적인 세상을 만들어가는 사람들</span>
							</div>
							<div class="mbtiClass4">
								<span class="mbtiTitle">INTP 아이디어형</span> <span
									class="mbtiContent">비평적인 관점을 가진 뛰어난 전략가</span>
							</div>
						</div>
						<div class="row">
							<div class="mbtiClass2">
								<span class="mbtiTitle">ESTP 활동가형</span> <span
									class="mbtiContent">친구, 운동, 음식 등 다양함을 선호</span>
							</div>
							<div class="mbtiClass1">
								<span class="mbtiTitle">ESFP 사교형</span> <span
									class="mbtiContent">분위기를 고조시키는 우호적인 성격</span>
							</div>
							<div class="mbtiClass2">
								<span class="mbtiTitle">ENFP 스파크형</span> <span
									class="mbtiContent">열정적으로 새 관계를 만드는 사람</span>
							</div>
							<div class="mbtiClass1">
								<span class="mbtiTitle">ENTP 발명가형</span> <span
									class="mbtiContent">풍부한 상상력으로 새로운 것에 도전</span>
							</div>
						</div>
						<div class="row">
							<div class="mbtiClass4">
								<span class="mbtiTitle">ESTJ 사업가형</span> <span
									class="mbtiContent">사무적, 실용적, 현실적인 스타일</span>
							</div>
							<div class="mbtiClass3">
								<span class="mbtiTitle">ESFJ 친선도모형</span> <span
									class="mbtiContent">친절, 현실감을 바탕으로 타인에게 봉사</span>
							</div>
							<div class="mbtiClass4">
								<span class="mbtiTitle">ENFJ 언변능숙형</span> <span
									class="mbtiContent">타인의 성질을 도모하고 협동하는 사람</span>
							</div>
							<div class="mbtiClass3">
								<span class="mbtiTitle">ENTJ 지도자형</span> <span
									class="mbtiContent">비전을 갖고 타인을 활력적으로 인도</span>
							</div>
						</div>

					</div>
					<hr />
					<div class="card-body">
						<p style="font-size:18px;">mbti 검사 후에 ai 추천 서비스를 이용할 수 있습니다.</p>
						<a href="${webPath}/stu/support/aiRecommend/main" class="btn btn-primary"
							style="position: absolute; bottom: 10px; right: 10px;">ai 서비스
							바로가기</a>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>

<script>
function changeMbti(){
	var mbti = $('#mbtiSel').val();
	
	$.ajax({
		url:"${webPath}/stu/support/mbtiChange",
		data:{"mbtiCd":mbti},
		success:function(data){
			$('#presentMbti').html(mbti);
			$("#mbti").html(mbti);
		},
		error:function(){
			console.log("에러")
		}
	})
}

</script>
