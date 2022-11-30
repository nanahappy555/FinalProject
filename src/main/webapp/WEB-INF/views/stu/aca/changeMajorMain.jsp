<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>

var pageHead = parent.document.querySelector("#pageHeaderSpan");
pageHead.setAttribute("murl",'${webPath}/stu/aca/changeMajor/main');
pageHead.innerHTML="전과신청";
</script>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<div class="card">
		<div class="card-body">


			<!-- ================================================= -->
			<!-- 본문 1 -->
			<!-- ================================================= -->

			<div class="row">
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="card" style="height:150px;">
						<h3 class="card-header">
							<i class="fas fa-clipboard"></i>&nbsp;&nbsp;전과 신청 공지 조회
						</h3>

						<div class="card-body">
							<ul>
								<li>전과 가능한 학과(부)전공 정보를 조회할 수 있는 페이지 입니다.</li>
								<li>학과 홈페이지를 클릭하면 해당 학과(부)전공의 페이지로 이동합니다.</li>
								<li>전과 신청 버튼을 클릭하면 전과 신청할 수 있는 화면으로 이동합니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
					<div class="card" style="height:150px;">
						<h3 class="card-header">
							<i class="fas fa-clipboard"></i>&nbsp;&nbsp;유의사항
						</h3>

						<div class="card-body">
							<ul>
								<li>전입 인원이 있는 곳으로만 전과 신청이 가능합니다.</li>
								<li>전출 인원이 없는 학과의 학생은 전과 신청이 불가능합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- ================================================= -->
			<!-- 본문1 끝 -->
			<!-- ================================================= -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-body">

							<div class="row">
								<div class="col-md-3 mb-3">
									<label for="country">분과대학</label> <select id="collegeSelect"
										name="collegeCd" class="custom-select d-block w-100"
										onchange="getMajorListByCollegeCd()" id="country" required="">
										<option value="">선택</option>
										<c:forEach items="${collegeList}" var="college">
											<option value="${college.colCd}">${college.colName}</option>
										</c:forEach>
									</select>
									<div class="invalid-feedback">분과대학을 선택하세요</div>
								</div>
								<div class="col-md-4 mb-3">
									<label for="state">학과(부)</label> <select id="majorSelect"
										name="majorCd" class="custom-select d-block w-100" id="state"
										required="">
										<option value="">선택</option>
									</select>
									<div class="invalid-feedback">학과(부)를 선택하세요</div>
								</div>

								<div class="col-md-1 mb-3">
									<label for="state"></label> <span class="input-group-append">
										<button class="btn btn-primary" type="button" id="searchBtn"
											onclick="searchMajorList();">검색</button>
									</span>
								</div>
							</div>
							<div class="card-body">
							<h4 >[검색결과]</h4>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>분과대학</th>
										<th>학과(부)</th>
										<th>전입인원</th>
										<th>전출인원</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="searchMajorList">
								
								</tbody>
							</table>
						</div>
			<div class="card-body">
				<h4 class="card-header">[전과 신청 내역]</h4>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>신청일자</th>
							<th>희망 전공 학과</th>
							<th>상태</th>
							<th>반려사유</th>
							<th>취소</th>
						</tr>
					</thead>
					<tbody id="MajorChangeApplyList">
						<c:if test="${not empty majorChangeApplyList}">
							<c:forEach items="${majorChangeApplyList}" var="majorChange">
								<tr>
						            <td style="width : 20%"><fmt:formatDate pattern="yyyy-MM-dd" value="${majorChange.applyDate }"/></td>
						            <td style="width : 20%;">${majorChange.majorName }</td>
						            <c:choose>
						            <c:when test="${majorChange.applyStatusCd eq '승인'}">
						         	 	 <td style="width : 20%; color:#64CD3C;" >${majorChange.applyStatusCd }</td>
						            </c:when>
						            <c:when test="${majorChange.applyStatusCd eq '반려'}">
						         	 	 <td style="width : 20%; color:#FF6464;" >${majorChange.applyStatusCd }</td>
						            </c:when>
						            <c:otherwise>
						         	 	 <td style="width : 20%; " >${majorChange.applyStatusCd }</td>
						            </c:otherwise>
						            </c:choose>
						            <td style="width:300px; display:block; white-space:nowrap; overflow:hidden; text-overflow: ellipsis;" title="${majorChange.rejContent}">${majorChange.rejContent}</td>
						            <c:choose>
						            <c:when test="${majorChange.applyStatusCd eq '진행중'}">
							            <td style="width : 20%"><button class="btn btn-rounded btn-danger" onclick="cancel(${majorChange.majorChaSeq})">취소</button></td>
						            </c:when>
						            <c:otherwise>
						            	<td style="width : 20%"> </td>
						            </c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
					    </c:if>
					    <c:if test="${empty majorChangeApplyList}">
					    	<tr>
					    		<td rowspan="4">신청 내역이 없습니다.</td>
					    	</tr>
					    </c:if>
					</tbody>
				</table>
			</div>
							
						</div>
					</div>
				</div>
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						
					</div>
				</div>
			</div>
			<!-- ================================================= -->
		</div>
		<!-- ================================================= -->
		<!-- MAIN-CONTENT 끝 -->
		<!-- ================================================= -->

	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			
		</div>
	</div>
	</div>
</div>



<c:if test="${from eq 'apply' }">
	<script>
		alert("등록되었습니다.");
		window.close();
		window.opener.location.reload();
	</script>
</c:if>
<c:if test="${dupChk eq 'exist' }">
	<script>
		alert("이미 승인된 기록이 있습니다.");
		window.close();
		window.opener.location.reload();
	</script>
</c:if>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="searchMajorListTemplate">
	{{#each .}}
<tr>
     <td style="width : 20%">{{colName}}</td>
     <td style="width : 25%">{{majorName}}</td>
     <td style="width : 10%" data-major={{majorName}} class="inPersonnel">{{inPersonnel}}</td>
     <td style="width : 10%" data-major={{majorName}} class="outPersonnel">{{outPersonnel}}</td>
     <td style="width : 15%"><a href="{{majorWeb}}" class="btn btn-primary btn-sm">홈페이지</a>&nbsp;&nbsp;
	<a href="#" class="btn btn-primary btn-sm" data-major={{majorName}} onclick="applyPage('{{colName}}','{{majorName}}')">전과신청</a></td>
</tr>

	{{/each}}
</script>




<script>

function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}

function getMajorListByCollegeCd(){
	var collegeCd = $("select[name=collegeCd").val();
	$.ajax({
		url : "<%=request.getContextPath()%>/stu/aca/majorList",
		data : {"collegeCd":collegeCd},
		type:"post",
		dataType:"json",
		success:function(data){
			var majorSelect = document.getElementById("majorSelect");
			var result = "";
			result+="<option value='none'>선택</option>"
			for(var i=0;i<data.length;i++){
				result+="<option value="+data[i].majorCd+">"+data[i].majorName+"</option>";
			}
			majorSelect.innerHTML=result; 
		},
		error:function(){
			alert("실패");
		}
			
	})
}

function searchMajorList(){
	var collegeCd = $("select[name=collegeCd").val();
	var majorCd = $("select[name=majorCd]").val();
	if(!collegeCd&&!majorCd){
		alert("검색할 항목을 선택해주세요.");
		return;
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/aca/searchMajorList",
		data:{
			"colCd":collegeCd,
			"majorCd":majorCd	
		},
		type:"post",
		dataType:"json",
		success:function(data){
			printData(data,$('#searchMajorList'),$('#searchMajorListTemplate'))
		},
		error:function(){
			alert("실패");
		}
	})
	
}

function applyPage(colName,majorName){
	var inPersonnel = parseInt($(".inPersonnel[data-major="+majorName+"]").text());
	var outPersonnel = parseInt($(".outPersonnel[data-major="+majorName+"]").text());
	/* if(inPersonnel>=outPersonnel){
		alert("해당학과의 전과 신청 가능 인원이 초과되어 더 이상 전과신청을 할 수 없습니다.");
		return;
	} */
	OpenWindow('<%=request.getContextPath()%>/stu/aca/changeMajor/applyPage?colName='+ colName + '&majorName=' + majorName,'신청페이지',1000,	600);
	}
function cancel(majorChaSeq){
	var confirmFlag = confirm('정말로 취소하시겠습니까? 취소 후에는 수정이 불가합니다.');
	if(confirmFlag){
		pageMove('<%=request.getContextPath()%>/stu/aca/changeMajor/cancel?majorChaSeq='+majorChaSeq);
	}
	
	
}
</script>

