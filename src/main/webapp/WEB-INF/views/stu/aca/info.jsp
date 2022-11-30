<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style>
.thead{
	background-color :rgba(192,192,192,0.3)
}

.cardHead{
	background-color :rgba(102,178,255,0.2)
}

</style>
</head>


<div class="container-fluid">
	<div class="card col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card-body" style="padding-left:0px; padding-right:0px;">
          	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
              <div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="margin-right : 0px; margin-left:0px;">
				<div class="card col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="position:relative">
					<h3 class="card-header cardHead" ><i class="fas fa-id-card"></i>&nbsp;&nbsp;${student.name }님의  개인 정보
					 <button type="button" style="position:absolute; top :3px; right:-10px;" class="btn btn-outline-dark mr-5" onclick="modify()" >변경 내용 저장하기</button>
					</h3>
					<div class="card-body row"  style="padding-left:50px;">
						<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 text-center" style="padding-left:0px;  position:relative;">
						<p style="font-weight : bolder; margin-bottom:0px; font-size : 30px; text-align: center;" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">${member.name}
	            		  	 <span style="font-weight : bolder; color:#6464FF; font-size : 20px; text-align: center;">${student.acaStateCd}</span>
	            		  	 </p>
	            		  	 
	                         <span id="memImg" class="manPicture" data-anoCd="${student.anoCd}"
	            		  	   		      style="display:block;width:200px;height:250px;margin:0 0px; border-radius: 20px;"></span>
	            		  	 <label for="uploadFile" class="mt-4 p-2"
	            		  	 style="background-color: #F4B6D9; border-radius: 5px; cursor:pointer;
	            		  	 padding : 5px; font-size: 15px; font-weight: bold; color:rgb(255,255,255);text-shadow: 0.5px 0.5px 0.5px #b1b1b1;
	            		  	 postion:absolute; top : 500px; right : 10px;">사진변경</label>  		      
	            		  	 <input id="uploadFile" style="display:none" name="uploadFile" type="file">
		                 </div>
		                 <div style="margin-left : 20px;" class="col-xl-7 col-lg-7 col-md-7 col-sm-7 col-7">
		                 	<form id="form">
		                 	<input type="hidden" name="anoCd" value="${student.anoCd}"/>
		                 	<table class="table table-hover">
									<tr>
							        	<th scope="col">연락처</th>
							        	<td ><input name="phone" class="form-control" value="${student.phone }"/></td>
							        </tr>		                 	
							    	<tr>
							        	<th scope="col">이메일</th>
							            <td ><input name="email" class="form-control" value="${student.email }"/></td>
							            
							        </tr>
							        <tr>
							        	<th scope="col">주소</th>
							        	<td>
							        	<input name="add1" class="form-control" value="${student.add1}"/>
							        	<input name="add2" class="form-control" value="${student.add2}"/>
							        	</td>
							        </tr>
							       
							        <tr>
							        	<th scope="col">예금주</th>
							        	<td ><input name="accHolder" class="form-control" value="${student.accHolder}"/></td>
							        </tr>
							         <tr>
							        	<th scope="col">은행명</th>
							        	<td ><input name="bankName" class="form-control" value="${student.bankName}"/></td>
							        </tr>
							        <tr>
							        	<th scope="col">계좌번호</th>
							        	<td ><input name="accNum" class="form-control" value="${student.accNum}"/></td>
							        </tr>
							        <tr>
							        	<th scope="col">메인 동아리</th>
							        	<td ><select name="clubCd" class="form-control">
							        		<c:forEach items="${clubList}" var="clubVO">
							        			<option ${clubVO.clubName eq clubNAME ? 'selected' : ''} value="${clubVO.clubCd}">${clubVO.clubName}</option>
							        		</c:forEach>
							        		</select></td>
							        </tr>
		                 	</table>
		                 	</form>
		                 </div>
					</div>
				</div>
				<div class="card col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
					<h3 class="card-header cardHead"><i class="fas fa-id-card"></i>&nbsp;&nbsp;학사 정보</h3>
					<div class="card-body"  style="padding-left:0px;">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="padding-left:0px;">
							<table class="table table-hover">
							  <thead>
							        <tr>
							            <th class="thead" scope="col">학번</th>
							            <th class="thead" scope="col">학년</th>
							            <th class="thead" scope="col">학기</th>
							        </tr>
							    </thead>
							    <tbody>
							    	<tr>
							            <td>${student.stuCd }</td>
							            <td>${student.grade }</td>
							            <td>${student.stuSemester }</td>
							        </tr>
							    </tbody>
							    <thead>
							        <tr>
							            <th class="thead" scope="col">입학일</th>
							            <th class="thead" scope="col">국적</th>
							            <th class="thead" scope="col">학부</th>
							        </tr>
							    </thead>
							    <tbody>
							        <tr>
							            <td>
										<fmt:formatDate value="${student.admDate }" pattern="yyyy-MM-dd"/>
							            </td>
							            <td>${student.nation }</td>
							            <td>${colName}</td>
							        </tr>
							    </tbody>
							    <thead>
							         <tr>
							            <th class="thead" scope="col">전공</th>
							            <th class="thead" scope="col">제2전공</th>
							            <th class="thead" scope="col">제3전공</th>
							         </tr>
							     </thead>
							     <tbody>
									<tr>
							          	<td>${stuMajor[0].majorCd}</td>
							            <td>${stuMajor[1].majorCd}</td>
							            <td>${stuMajor[2].majorCd}</td>
							         </tr>
							     </tbody>
							     <thead>
							         <tr>
							            <th class="thead" scope="col">부전공</th>
							            <th class="thead" scope="col">휴학잔여횟수</th>
							            <th class="thead" scope="col">메인 동아리</th>
							        </tr>
							    </thead>
							    <tbody>
							        <tr>
							            <td>${stuMajor[4].majorCd}</td>
							            <td>${4-student.tlTryCount }</td>
							            <td>${clubNAME}</td>
							        </tr>
							    </tbody>
		                 	</table>
		                 </div>
					</div>
				</div>
			</div>
				<div class="card col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<h3 class="card-header cardHead"><i class="fas fa-id-card"></i>&nbsp;&nbsp;학적 변동 사항 이력</h3>
					<div class="card-body"  style="padding-left:0px;">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="padding-left:0px;">
	                     	<table class="table table-hover">
	                     		<thead>
	                     			<tr>
										<th class="thead">구분</th>	                     			
										<th class="thead">신청학기</th>	                     			
										<th class="thead">신청날짜</th>	                     			
										<th class="thead">신청상태</th>	                     			
	                     			</tr>
	                     		</thead>
	                     		<tbody>
	                     		<c:forEach items="${acaList }" var="aca">
	                     			
	                     			<c:choose>
	                     		   <c:when test="${fn:contains(aca.acaClass,'휴학')}">
	                     		  		 <tr style="cursor:pointer;" onclick="pageMove('${webPath}/stu/aca/tl/applyPage')">
	                     			</c:when>
	                     			<c:when test="${fn:contains(aca.acaClass,'복학')}">
	                     				<tr style="cursor:pointer;" onclick="pageMove('${webPath}/stu/aca/tl/applyPage')">
	                     			</c:when>
	 								<c:when test="${aca.acaClass eq '제1전공'}">
	 									<tr style="cursor:pointer;" onclick="pageMove('${webPath}/stu/aca/changeMajor/main')">
	                     			</c:when>
	                     			<c:otherwise>
		                     			<tr style="cursor:pointer;">
	                     			</c:otherwise>
	 	                    		</c:choose>
	                     				<td>${aca.acaClass}</td>
	                     				<td>${fn:substring(aca.semeCd,0,4)}년도 ${fn:substring(aca.semeCd,4,6)}학기</td>
	                     				<td><fmt:formatDate value="${aca.applyDate}" pattern="yyyy/MM/dd"/></td>
	                     				
									<c:if test="${aca.applyStatusCd eq '반려'}">
	                     				<td style="color:#FF6464">${aca.applyStatusCd}</td>
									</c:if>	                     				
	                     				
									<c:if test="${aca.applyStatusCd eq '승인'}">
	                     				<td style="color:#64CD3C">${aca.applyStatusCd}</td>
									</c:if>
									<c:if test="${aca.applyStatusCd eq '진행중'}">
										<td>${aca.applyStatusCd}</td>
									</c:if>	                     				
	                     				
	                     			</tr>
	                     		</c:forEach>
	                     		</tbody>
	                     	</table>
		                 </div>
					</div>
				</div>
			  <div class="row justify-content-end">
				
			 </div>
          </div>
		</div>
   </div>
</div>
<c:if test="${from eq 'modify'}" >
	<script>
		alert("${student.name}님의 정보가 수정되었습니다.");	
		window.close();
		window.opener.location.reload();			
	</script>
</c:if>


<script>

MemberPictureThumb("<%=request.getContextPath()%>");

let inputPhone = $("input[name=phone]");
inputPhone.change(function(){
	inputPhoneChange();
});
let inputAccNum = $("input[name=accNum]");
inputAccNum.change(function(){
	inputAccountChange();
})



function inputPhoneChange(){
	let inputPhone = $("input[name=phone]");
	let phone = inputPhone.val();
	phone = phone.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	inputPhone.val(phone);
}

function inputAccountChange(){
	let inputAccNum = $("input[name=accNum]");
	let accNum = inputAccNum.val();
	accNum = accNum.replace(/[^0-9]/g, '');
	inputAccNum.val(accNum);
}
inputPhoneChange();
inputAccountChange();
</script>

<script>

var cfile = document.querySelector('#uploadFile');
var memImg = document.querySelector('#memImg');
//만약 쪼메 IE11등 쪼메 약간 이전 브라우져를 지원하려면 
function fileRead(p_file,p_target){
    var fileReader = new FileReader(); // 파일 읽어주는 아저씨 생성
    fileReader.readAsDataURL(p_file);
    fileReader.onload = function(){
        //console.log(fileReader.result); // 읽은 내용이 result 속성에 담겨있음
        var  yumi = document.createElement("img"); // 이미지 태그 생성
        yumi.style.borderRadius="20px";
        yumi.width = 200;
        yumi.height = 250;
        yumi.src = fileReader.result;  // src에 이미지 읽은 내용 전달
        p_target.innerHTML="";
        p_target.appendChild(yumi); // 화면에 보이겡
    }
}

cfile.onchange = function(){
    console.log(cfile.files);    // 제일 중요한 속성 files, 오직 사용자가 선택해준 파일만 읽을 수 있음
    // 아작스에 심부름꾼이 필요한 것처럼, 파일 읽어주는 목소리 좋은 알아 아저씨 필요
  //  let oneFile = cfile.files[0];
    for(let i=0; i< cfile.files.length; i++){  // 기본적으로 let으로 해야 정상 동작, 변수 범위의 문제
        fileRead(cfile.files[i],memImg); // 파일 익는 부분을 1개씩 별도 처링  
	}
}



function modify(){
	var flag = confirm("정보를 수정하시겠습니까?");
	if(flag){
		var form = $('#form');
		var formData = new FormData($('#form')[0]);
		for(var i=0;i<cfile.files.length;i++){
			let file = cfile.files[i]
			formData.append("uploadFile",file);
		}
		$.ajax({
			url:'<%=request.getContextPath()%>/stu/aca/modify',
			data : formData,
			method : "post",
			contentType:false,
			processData:false,
			dataType:"json",
			success:function(data){
				alert("정보 수정에 성공하였습니다.");
				$('input[name=phone]').val(data.phone);
				$('input[name=email]').val(data.email);
				$('input[name=add1]').val(data.add1);
				$('input[name=add2]').val(data.add2);
				$('input[name=accHolder]').val(data.accHolder);
				$('input[name=bankName]').val(data.bankName);
				$('input[name=accNum]').val(data.accNum);
			},
			error:function(){
				alert("정보 수정에 실패하였습니다. 관리자에게 문의하세요.");
			}
			
		})
		
	}
	
}


</script>
<!-- </div> -->

	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
<!-- </div> -->
<!-- </div> -->

<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
