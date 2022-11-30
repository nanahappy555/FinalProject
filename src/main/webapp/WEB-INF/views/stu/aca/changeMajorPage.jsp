<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->


<div class="card">
		<div class="card-body">
<div class="main-content-jsp">
    
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->

	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header"><i class="fas fa-clipboard"></i>&nbsp;&nbsp;유의사항</h3>
				
				<div class="card-body">
					<ul>
						<li>전과를 신청 할 수 있는 대학, 학과, 전공이 맞는지 다시 확인해주세요.</li>
						<li>전과 신청 기준을 자동으로 체크하고 기준에 맞지 않는 경우 신청이 불가능합니다.</li>
			        </ul>
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
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">	
		<div class="card-body">
			<table class="table table-hover">
			    <thead>
			        <tr>
			        	<th>신청학년도</th>
			        	<th>학기</th>
			        	<th>신청일자</th>
			            <th>분과대학</th>
			            <th>학과(부)</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			        	<td id="year" style="width : 10%">${semester.scYear}</td>
			        	<td id="seme" style="width : 5%">${semester.scSemester}</td>
			        	<td id="applyDate" style="width : 20%"><fmt:formatDate pattern="yyyy년 MM월 dd일 " value="<%=new java.util.Date() %>"/></td>
			            <td id="colName" style="width : 15%">${colName}</td>
			            <td id="majorName" style="width : 25%">${majorName}</td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>
		</div>
	</div> 
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->

		<div class="card">	
			<div class="card-body">
				<div class="form-group row">
					<label for="inputText" class="col-3 col-lg-1 col-form-label text-right">연락처</label>
					<div class="col-3">
						<div class="input-group-append">
							<input id="phoneText" type="text" class="form-control form-control-sm" data-phone="${member.phone}" placeholder="">
								<button type="button" class="btn-sm btn btn-primary" onclick="modifyPhone()">수정하기</button>
						</div>
						<h6>*최신 연락처로 변경해주세요.</h6>
					</div>
				</div>
			</div>
		</div>

		
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
		<div class="row justify-content-end mr-3">
			<a href="#" class="btn btn-outline-primary" onclick="apply()">신청</a>&nbsp;&nbsp;
			<a href="#" class="btn btn-outline-danger">취소</a>
		</div>
	</div>
</div>

<script>
var phoneText = $("#phoneText");
var phoneNum = phoneText.attr("data-phone");
function makePhone(phone){
 	var phone = phone.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
 	phoneText.attr("placeholder",phone);
} 

makePhone(phoneNum);

function modifyPhone(){
	var modifyPhone = phoneText.val()
	if(!modifyPhone){
		alert("수정할 전화번호를 입력해주세요.");
		phoneText.focus();
		return;
	}
	
	var modifyPhoneOnlyNum=modifyPhone.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	if(!confirm("수정할 연락처가 "+modifyPhoneOnlyNum+"이 맞습니까?")){
		return;
	};

	$.ajax({
		url : "<%=request.getContextPath()%>/stu/aca/changeMajor/modify",
		data : { "phone" : phoneText.val().replace(/[^0-9]/g, '')},
		type:"post",
		dataType:"text",
		success : function(data){
			alert("정보 변경이 완료되었습니다.");
		},
		error : function(){
			alert("실패 하였습니다.")
		}
	})
}

function apply(){
	var majorName = $("#majorName").text();
	location.href = "<%=request.getContextPath()%>/stu/aca/changeMajor/apply?majorName="+majorName;
}
</script>