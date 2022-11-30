<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<style>
    #myModal {   /* 모달창 기본 css*/
        position:fixed; 
        width:100%;
        height:100%;  /* 화면을 꽉 채움  fixed인 경우 % 작동됨 */
        background-color: rgba(0,0, 0, 0.3);
    }
    #content {    /* 내용 담을 영역 */
        margin: 2% auto;
        width:30%;
        height:60%;
        background-color: white;
        border-radius: 10px;
        
    }
    textarea {
    font-size: 15px;
        width: 75%;
        height: 250px;
        border: none;
        outline-color: white;
      }
	</style>
</head>

<div class="tab-regular">
	<ul class="nav nav-tabs " id="myTab" role="tablist">
		<li class="nav-item">
			<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">상담 신청</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">신청 이력</a>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			
	<h3 class="card-header" style="color: #0086cc; font-weight: bold;">지도교수</h3>
	<div class="card-body">
		<div class="main-content-jsp">
		    <div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 col12">
		<!-- <div class="pl-xl-3"> -->
		<!-- <div class="m-b-0"> -->
		<!-- <div class="user-avatar-name d-inline-block"> -->
					<c:forEach items="${ profList}" var="prof">
						<div class="card">
							<div class="card-body">
								<div class="row align-items-center">
									<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="user-avatar float-xl-left pr-4 float-none">
											<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
												<span id="memImg" class="manPicture" data-anoCd="${prof.anoCd}"
			            		  	   		      style="display:block;width: 150px; height: 150px; border-radius: 70%; overflow: hidden;"></span>
											</div>
										</div>
									</div>
										
									<div class="col-xl-7 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="user-avatar-name d-inline-block">
											<h2 class="font-24 m-b-10" style="font-weight: bold;">${prof.name }&nbsp;교수</h2>
										</div>
										<table>
									        <tr>
									            <th>학과/전공&nbsp;&nbsp;</th>
									            <td>${prof.majorName }</td>
									        </tr>
									        <tr>
									            <th>연락처</th>
									            <td>${prof.phone }</td>
									        </tr>
									        <tr>
									            <th>이메일</th>
									            <td>${prof.emailAddr }</td>
									        </tr>
										</table>
									</div>
									<div class="col-xl-2 col-lg-12 col-md-12 col-sm-12 col-12">
										<div class="float-xl-right float-none mt-xl-0 mt-4">
											<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/counsel/registForm?profCd=${prof.profCd }','글쓰기',650,750);" >신청하기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>		
			</div>
		</div>
	</div>

			
		</div>
		<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
				
			<div class="main-content-jsp">
			    <div class="row justify-content-center">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col12">
				
					<div class="card-body">
						<h4 style="font-style: italic; color: #555555">* 진행상황이 '반려'인 글을 클릭하면 '반려사유'를 확인 하실 수 있습니다.</h4>
						<table class="table table-hover">
						    <thead>
						        <tr>
						            <th scope="col">글번호</th>
						            <th scope="col">상담시간</th>
						            <th scope="col">장소</th>
						            <th scope="col">담당교수</th>
						            <th scope="col">진행상황</th>
						        </tr>
						    </thead>
						    <tbody>
						    	<c:if test="${empty applyList }" >
									<tr>
										<td colspan="5">
											<strong>상담 신청 내역이 없습니다.</strong>
										</td>
									</tr>
								</c:if>	
						    	<c:forEach items="${applyList }" var="apply" varStatus="status">
						    		<c:choose>
						    			<c:when test="${apply.appStatusCd eq '반려'}"> 
						    				<tr onclick="f_modal('${apply.rejReason}')">
									            <th scope="row">${((cri.page+1)*0)+status.count}</th>
									            <td>
									            	<fmt:formatDate value="${apply.applyDate }" pattern="yyyy-MM-dd HH:mm"/>
									            </td>
									            <td>${apply.csLocation }</td>
									            <td>${apply.profId }</td>
									            <td style="color: #ed6335;">${apply.appStatusCd }</td>
									        </tr>
						    			</c:when>
						    			
						    			<c:when test="${apply.appStatusCd eq '승인'}"> 
						    				<tr>
									            <th scope="row">${((cri.page+1)*0)+status.count}</th>
									            <td>
									            	<fmt:formatDate value="${apply.applyDate }" pattern="yyyy-MM-dd HH:mm"/>
									            </td>
									            <td>${apply.csLocation }</td>
									            <td>${apply.profId }</td>
									            <td style="color: #064c78;">${apply.appStatusCd }</td>
									        </tr>
						    			</c:when>
						    			
									    <c:otherwise>
									    	<tr>
									            <th scope="row">${((cri.page+1)*0)+status.count}</th>
									            <td>
									            	<fmt:formatDate value="${apply.applyDate }" pattern="yyyy-MM-dd HH:mm"/>
									            </td>
									            <td>${apply.csLocation }</td>
									            <td>${apply.profId }</td>
									            <td style="color: 2d383a;">${apply.appStatusCd }</td>
									        </tr>
									    </c:otherwise>  
									      
						        	</c:choose>
						        </c:forEach>
						    </tbody>
						</table>
					</div>
							
				
						<!--
	 					<div class="row justify-content-end mr-3">
						<input type="button" value="반려사유" onclick="f_modal()">
						</div> 
						-->
			</div>
					
								<!-- 모달 달달달달하다-->
					<div class="card" id="myModal" style="display:none">
						
				        <div class="card-body" id="content" class="modal-content">
				        <h3 class="card-header row justify-content-center" style="font-weight: bold;">반려사유</h3>
							<div class="row justify-content-center">
								<textarea style="margin: 5%" id="rejReason" readonly="readonly"></textarea>
							</div>		    
					        <div class="row justify-content-end mr-3">
				         		<input type="button" class="btn btn-sm btn-primary" style="font-size: 1em;" name="" value="close" onclick="f_close()">
				         	</div>
						</div>  
					</div>
				
				</div>
			</div>
	
		</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->

<script>
	var v_myModal = document.querySelector("#myModal");
	function f_close(){
	  v_myModal.style.display = "none";   //   있어도 누네 안보이겡
	}
	function f_modal(reason){
	     v_myModal.style.display = "block";   //  눈에 보이겡
	     
	     $('#rejReason').val(reason)
	     
	}
</script>
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