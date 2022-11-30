<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="syllabusList" value="${dataMap.syllabusList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />



<div class="container-fluid">



	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

			<!-- ================================================= -->
			<!-- 카드 시작 -->
			<!-- ================================================= -->
			<div class="card">

				<!-- ================================================= -->
				<!-- 카드바디 시작 -->
				<!-- ================================================= -->
				<div class="card-body">
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-1" name="perPageNum"
							id="perPageNum" onchange="list_go(1);">
							<option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' }>정렬개수</option>
							<option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
							<option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
							<option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
						</select> <select class="form-control col-md-1" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
							<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
							<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>

						</select>
						<!-- keyword -->
						<input class="form-control col-md-2" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
							class="input-group-append">
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
								<th scope="col">#</th>
								<th scope="col">과목코드</th>
								<th scope="col">강의명</th>
								<th scope="col">구분</th>
								<th scope="col">정원</th>
								<th scope="col">학점</th>
								<th scope="col">신청일</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${syllabusList }" var="list">
								<tr class="applyList">
									<td><input type="checkbox" value="${list.sylCd }"
										name="chk"></td>
									<td>${list.subjCd }</td>
									<td>${list.subjName }</td>
									<td>${list.lecCategoryCd }</td>
									<td>${list.maxStuNum }</td>
									<td>${list.credit }</td>

									<td><fmt:formatDate value="${list.applyDate}"
											pattern="yyyy-MM-dd" /></td>
									<c:choose>
										<c:when test="${list.applyStatusCd eq '승인' }">
										<td style="color:#64CD3C">${list.applyStatusCd }</td>
										</c:when>
										<c:when test="${list.applyStatusCd eq '반려' }">
										<td style="color:#FF6464">${list.applyStatusCd }</td>
										</c:when>
										<c:otherwise>
										<td>${list.applyStatusCd }</td>
										</c:otherwise>
									</c:choose>

								</tr>
							</c:forEach>

						</tbody>
					</table>

					<!-- ================================================= -->
					<!-- 게시판 끝 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-2 mr-2">
						<button class="btn btn-outline-primary" type="button" onclick="">강의신청취소</button>
					</div>

					<!-- ================================================= -->
					<!-- 페이지네이션 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">
						<%@ include file="/WEB-INF/views/include/pagination.jsp"%>
					</div>
					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->

				</div>
				<!-- ================================================= -->
				<!-- 카드바디 끝 -->
				<!-- ================================================= -->

			</div>
			<!-- ================================================= -->
			<!-- 카드 끝 -->
			<!-- ================================================= -->
		</div>
	</div>



	<div class="row">
		<div class="col-xl-12">
			<div class="card">
				<div class="card-body">
					<form id="myForm">
						<table class="table table-hover" border="1">




							<tbody>
								<tr>
									<th style="background-color: #F0F0F8">과목코드</th>
									<td><input type="text" id="subjCd" name="subjCd"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">이수구분</th>
									<td><input type="text" id="lecCategoryCd"
										name="lecCategoryCd" style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">대상학년</th>
									<td><input type="text" id="targetGrade" name="targetGrade"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">학점</th>
									<td><input type="text" id="credit" name="credit"
										style="width: 100%; border: none;"></td>

								</tr>




								<tr>

									<th style="background-color: #F0F0F8">최대수강인원</th>
									<td><input type="text" id="maxStuNum" name="maxStuNum"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">강의 시수</th>
									<td><input type="text" id="lecHour" name="lecHour"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">교재 및 참고서</th>
									<td><input type="text" id="materials" name="materials"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">교양 카테고리</th>
									<td><select style="width: 100%; border: none;">
											<option></option>
											<option></option>
											<option></option>
									</select></td>
								</tr>
								<tr>
									<th style="background-color: #F0F0F8">중간고사비율</th>
									<td><input type="text" id="midRatio" name="midRatio"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">기말고사 비율</th>
									<td><input type="text" id="finalRatio" name="finalRatio"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">과제 비율</th>
									<td><input type="text" id="assignRatio" name="assignRatio"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">출결비율</th>
									<td><input type="text" id="attendRatio" name="attendRatio"
										style="width: 100%; border: none;"></td>
								</tr>
								<tr>
									<th style="background-color: #F0F0F8">평가구분</th>
									<td><input type="text" id="evalClassCd" name="evalClassCd"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">강의시간 1</th>
									<td><input type="text" id="lecDate1" name="lecDate1"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">강의시간 2</th>
									<td><input type="text" id="lecDate2" name="lecDate2"
										style="width: 100%; border: none;"></td>
									<th style="background-color: #F0F0F8">강의실</th>
									<td><input type="text" id="classroom" name="classroom"
										style="width: 100%; border: none;"></td>
								</tr>

								<tr>

									<th style="background-color: #F0F0F8">교과목 개요</th>
									<td colspan="7"><input type="text" id="outLine"
										name="outline" style="width: 100%; border: none;"></td>


								</tr>

								<tr>
									<th style="background-color: #F0F0F8">주차</th>
									<th colspan="4" style="background-color: #F0F0F8">학습목표</th>
									<th colspan="3" style="background-color: #F0F0F8">학습내용</th>
								</tr>

							</tbody>
							<tbody id="weekTbody">
							</tbody>





						</table>
					</form>


					<div class="row justify-content-end mt-3" style="float: right;">
						<button class="btn btn-outline-primary" type="button"
							onclick="autoFill();">자동완성</button>
						&nbsp;&nbsp;
						<button class="btn btn-outline-primary" type="button"
							onclick="setTable();">초기화</button>
						&nbsp;&nbsp;
						<button class="btn btn-outline-primary" type="button"
							onclick="apply_go()">신청하기</button>
						&nbsp;&nbsp;
					</div>
				</div>
			</div>
		</div>
	</div>

</div>

<script>
function isEmpty(value){

    if(value == null || value.length === 0) {

           return "";

     } else{

            return value;

     }

}


function setTable(){
	
	$('#assignRatio').val("");
	$('#attendRatio').val("");
	$('#credit').val("");
	$('#evalClassCd').val("");
	$('#finalRatio').val("");
	$('#geCd').val("");
	$('#lecCategoryCd').val("");
	$('#lecDate1').val("");
	$('#lecDate2').val("");
	$('#lecHour').val("");
	$('#materials').val("");
	$('#maxStuNum').val("");
	$('#midRatio').val("");
	$('#outLine').val("");
	$('#subjCd').val("");
	$('#targetGrade').val("");
	
	
	var onLoadTbody = ``;
	
	for (var j = 1; j < 17; j++) {
		onLoadTbody += `<tr>
			<td>`+j+`</td>
			<td colspan='4'><input type='text' id='weekGoal`+j+`' name='weekGoal'
				style="width: 100%; border: none;"></td>
			<td colspan='3'><input type='text' id='weekContent`+j+`' name='weekContent'
				style='width: 100%; border: none;'></td>
		</tr>`;
	}
	$('#weekTbody').html(onLoadTbody);
	}

$(function(){

	setTable();
	
});

</script>

<script>
$("input[type='checkbox']").on('click',function(){
	event.stopPropagation();
});

$('.applyList').on("click",function(e){
	
	var sylCd = e.currentTarget.children[0].childNodes[0].attributes[1].value;
	
	$.ajax({
		method:"get",
		url:"<%=request.getContextPath()%>/prof/syllabus/apply/detail?sylCd="+sylCd,
		success:function(data){
			console.log(data.detailWeek);
			setTable();
			$('#assignRatio').val(data.syllabusDetail.assignRatio);
			$('#attendRatio').val(data.syllabusDetail.attendRatio);
			$('#credit').val(data.syllabusDetail.credit);
			$('#evalClassCd').val(data.syllabusDetail.evalClassCd);
			$('#finalRatio').val(data.syllabusDetail.finalRatio);
			$('#geCd').val(data.syllabusDetail.geCd);
			$('#lecCategoryCd').val(data.syllabusDetail.lecCategoryCd);
			$('#lecDate1').val(data.syllabusDetail.lecDate1);
			$('#lecDate2').val(data.syllabusDetail.lecDate2);
			$('#lecHour').val(data.syllabusDetail.lecHour);
			$('#materials').val(data.syllabusDetail.materials);
			$('#maxStuNum').val(data.syllabusDetail.maxStuNum);
			$('#midRatio').val(data.syllabusDetail.midRatio);
			$('#outLine').val(data.syllabusDetail.outLine);
			$('#subjCd').val(data.syllabusDetail.subjCd);
			$('#targetGrade').val(data.syllabusDetail.targetGrade);
			$('#classroom').val(data.syllabusDetail.classroom);
			
			var tbodyStr = ``;
			for (var i = 0; i < data.detailWeek.length; i++) {
				
				var goal = data.detailWeek[i].goal;
				var content = data.detailWeek[i].content;
				
				
				tbodyStr +=  `<tr>
					<td>`+(i+1)+`</td>
					<td colspan='4'><input type='text' id='weekGoal`+(i+1)+`' name='weekGoal' value='`+isEmpty(goal)+`'
						style="width: 100%; border: none;"></td>
					<td colspan='3'><input type='text' id='weekContent`+(i+1)+`' name='weekContent' value='`+isEmpty(content)+`'
						style='width: 100%; border: none;'></td>
				</tr>`;
			}
			
			
				console.log(typeof tbodyStr);
				$('#weekTbody').html(tbodyStr);
		},
		error:function(){
			
			alert("에러");
		}
	});
});


</script>

<script>


function apply_go(){
	Swal.fire({
        title: '신청하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
           
        	var myForm = document.querySelector('#myForm');
        	console.log(myForm);
        	
        	myForm.action = "${webPath}/prof/syllabus/apply/regist";
        	myForm.method = "post";
        	myForm.submit();
          
        } else if (result.isDenied) {
           
          Swal.fire('저장하지 않았습니다.', '', 'info')
          
        }
      })
	
	
	
	
}
function list_go(page,url){
	//alert(page);
	if(!url) url="${webPath}/prof/syllabus/apply/main";
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	jobForm.attr({
		action:url,
		method:'get'
	}).submit(); 
}


function autoFill(){
	$('#assignRatio').val(20);
	$('#midRatio').val(30);
	$('#finalRatio').val(30);
	$('#attendRatio').val(20);
	$('#credit').val(3);
	$('#evalClassCd').val('시험 평가 과목');
	$('#geCd').val();
	$('#lecCategoryCd').val("전공필수");
	$('#lecDate1').val('수 14:00 - 15:00');
	$('#lecDate2').val('금 09:00 - 11:00');
	$('#lecHour').val(40);
	$('#materials').val('노트북');
	$('#maxStuNum').val(30);
	$('#outLine').val("인공지능 기초");
	$('#subjCd').val("SJB1000");
	$('#targetGrade').val("1,2학년 대상");
	$('#classroom').val("N304");
	
	
	$('#weekGoal1').val("Keras");
	$('#weekContent1').val("Keras에 대해서 알아봅시다");
	
	$('#weekGoal2').val("TensorFlow");
	$('#weekContent2').val("TensorFlow에 대해서 알아봅시다.");
	
	$('#weekGoal3').val("ResNet");
	$('#weekContent3').val("ResNet에 대하여 알아봅시다");
	
	$('#weekGoal4').val("바둑예제");
	$('#weekContent4').val("바둑예제로 알아봅시다.");
	
	$('#weekGoal5').val("Jupyter Notebook");
	$('#weekContent5').val("Jupyter Notebook에 대하여 알아봅시다");
	
	$('#weekGoal6').val("카타고");
	$('#weekContent6').val("바둑 카타고에 대하여 조사해봅시다.");
	
	$('#weekGoal7').val("절예");
	$('#weekContent7').val("절예에 대하여 알아봅시다.");
	
	$('#weekGoal8').val("중간고사");
	$('#weekContent8').val("중간고사");
	
	$('#weekGoal9').val("그림 그려주는 AI의 구조");
	$('#weekContent9').val("그림 그려주는 AI의 구조에 대하여 알아봅시다");
	
	$('#weekGoal10').val("CNN");
	$('#weekContent10').val("CNN에 대하여 알아봅시다");
	
	$('#weekGoal11').val("Cifar");
	$('#weekContent11').val("Cifar에 대하여 알아봅시다.");
	
	$('#weekGoal12').val("딥러닝");
	$('#weekContent12').val("딥러닝에 대하여 알아봅시다");
	
	$('#weekGoal13').val("퍼셉트론");
	$('#weekContent13').val("퍼셉트론에 대하여 알아봅시다");
	
	$('#weekGoal14').val("Chat bot");
	$('#weekContent14').val("Chat bot을 만들어봅시다.");
	
	$('#weekGoal15').val("딥러닝 학습");
	$('#weekContent15').val("딥러닝 학습에 대하여 알아봅시다.");
	
	$('#weekGoal16').val("기말고사");
	$('#weekContent16').val("기말고사");
};


</script>
<c:if test="${from eq 'apply'}">
	<script>
	$(function(){
		Swal.fire(
				  '성공적으로 신청했습니다!',
				  '',
				  'success'
		)
	});
</script>
</c:if>