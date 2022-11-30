<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="container-fluid">
<div class="tab-outline">
	<ul class="nav nav-tabs" id="myTab2" role="tablist">
		<li class="nav-item">
			<a class="nav-link active show" id="tab-outline-one" data-toggle="tab" href="#outline-one" role="tab" aria-controls="home" aria-selected="false">졸업 신청</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" id="tab-outline-two" data-toggle="tab" href="#outline-two" role="tab" aria-controls="profile" aria-selected="true">조기졸업/유예 신청</a>
		</li>

	</ul>
	<div class="tab-content" id="myTabContent2">
		<div class="tab-pane fade" id="outline-one" role="tabpanel" aria-labelledby="tab-outline-one">
			<div class="card">
		<div class="card-body">
<div class="container-fluid">
    <div class="row">
        <div class="card-body">
             <div class="row">
                 <div class="col-xl-2 col-lg-4 col-md-4 col-sm-4 col-12">
                     <div class="text-center">
<!--                          <img src="ddit/resources/img/jj.jpg" alt="사용자이미지" class="rounded-circle user-avatar-xxl"> -->
                         <img src="ddit/resources/img/jj.jpg" class="img-thumbnail mr-3" alt="사용자이미지">
                     </div>
                 </div>
            	<div class="col-xl-10 col-lg-8 col-md-8 col-sm-8 col-12">
                <div class="user-avatar-info">
                    <!--  <div class="float-right"><a href="#" class="user-avatar-email text-secondary">www.henrybarbara.com</a></div> -->
                    <div class="user-avatar-address">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="card">
								<h3 class="card-header"><i class="fas fa-user"></i>&nbsp;&nbsp;학생기본정보</h3>
								<div class="card-body">
										<table class="table table-hover">
										    <thead>
										        <tr>
										            <th style="width:10%">학번</th>
										            <th style="width:10%">이름</th>
										            <th style="width:15%">학년</th>
										            <th style="width:15%">분과대학</th>
										            <th style="width:15%">학과</th>
										            <th style="width:25%">입학일자</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>학번</td>
										            <td>학년</td>
										            <td>학기</td>
										            <td>입학일</td>
										            <td>국적</td>
										            <td>${member.phone }</td>
										        </tr>
										    </tbody>
										   
										    <thead>
										         <tr>
										            <th >전공</th>
										            <th >제2전공</th>
										            <th >제3전공</th>
										            <th >부전공</th>
										            <th >연락처</th>
										            <th >이메일</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>전공</td>
										            <td>영문학</td>
										            <td>신청가능학점</td>
										            <td>2</td>
										            <td>011-2323-5444</td>
										            <td>${member.email }</td>
										        </tr>
										    </tbody>
										    <thead>
										         <tr>
										            <th >총이수학점</th>
										            <th >졸업이수학점</th>
										            <th >토익 자격증 여부</th>
										            <th >컴활 자격증 여부</th>
										            <th colspan="2">주소</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>학부</td>
										            <td>동아리</td>
										            <td>0</td>
										            <td>부전공</td>
										            <td colspan="2">${member.add1} ${member.add2}</td>
										        </tr>
										    </tbody>
										</table>
									</div>
								</div>
							</div>
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
			<div class="card">
				<h3 class="card-header"><i class="fas fa-clipboard"></i>&nbsp;&nbsp;유의사항</h3>
				
				<div class="card-body">
					<ul>
						<li>조기 졸업의 경우 3학년 2학기 이후 신청이 가능합니다.</li>
						<li>학과별 졸업 요건이 다를 수 있으니 자세한 사항은 과 사무실을 통해 확인해주세요.</li>
			        </ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header"><i class="fas fa-graduation-cap"></i>&nbsp;&nbsp;졸업요건</h3>
				
				<div class="card-body">
					<ul>
						<li>졸업 신청을 위해선 아래의 자격증이 제출되어야 합니다.</li>
						<li>토익 자격증, 컴퓨터활용능력 자격중, 기타 자격증</li>
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
		<h5 class="card-header">제출내역</h5>
		
		<div class="card-body">
			<table class="table table-hover">
			    <thead>
			        <tr>
			            <th>제출자격증</th>
			            <th>제출날짜</th>
			            <th>확인여부</th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td style="width : 25%">토익자격증</td>
			            <td style="width : 25%">2022-07-06</td>
			            <td style="width : 25%">대기</td>
			        </tr>
			        <tr>
			            <td style="width : 25%">토익자격증</td>
			            <td style="width : 25%">2022-07-06</td>
			            <td style="width : 25%">대기</td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>
</div>
	</div>
	
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">
		<h5 class="card-header">자격증 제출</h5>
		
		
			<table class="table table-hover">
			    <thead>
			    	<tr>
			    		<th style="width: 30%">토익자격증</th>
			    		<th style="width: 30%">컴활자격증</th>
			    		<th style="width: 30%">기타자격증</th>
			    	</tr>
			        <tr>
			            <td>
							<div class="form-group">
								
								<div class="input-group mb-3 justify-content-center">
									<div class="form-group">
										<div class="card card-outline card-success" style="width: 354px;">
											<div class="card-header">
												<h5 class="ml-3" style="display:inline;line-height:40px;"><strong>파일첨부 </strong></h5>
													&nbsp;&nbsp;<button class="btn btn-xs btn-light"
													onclick="addFile_go1();"	type="button" id="addFileBtn1">+</button>
											</div>
											<div class="card-footer fileInput1"></div>
										</div>
									</div>
								</div>
							</div>
			            </td>
			            <td>
							<div class="form-group">
								
								<div class="input-group mb-3 justify-content-center">
									<div class="form-group">
										<div class="card card-outline card-success" style="width: 354px;">
											<div class="card-header">
												<h5 class="ml-3" style="display:inline;line-height:40px;"><strong>파일첨부 </strong></h5>
													&nbsp;&nbsp;<button class="btn btn-xs btn-light"
													onclick="addFile_go2();"	type="button" id="addFileBtn2">+</button>
											</div>
											<div class="card-footer fileInput2"></div>
										</div>
									</div>
								</div>
							</div>
			            </td>
			            <td>
							<div class="form-group">
								
								<div class="input-group mb-3 justify-content-center">
									<div class="form-group">
										<div class="card card-outline card-success" style="width: 354px;">
											<div class="card-header">
												<h5 class="ml-3" style="display:inline;line-height:40px;"><strong>파일첨부 </strong></h5>
													&nbsp;&nbsp;<button class="btn btn-xs btn-light"
													onclick="addFile_go3();"	type="button" id="addFileBtn3">+</button>
											</div>
											<div class="card-footer fileInput3"></div>
										</div>
									</div>
								</div>
							</div>
			            </td>
			        </tr>
			    </thead>
			</table>

	</div>
</div>
	</div> 
	<div class="row justify-content-end">
			<button type="button" class="btn-ml btn btn-primary mr-5" onclick="" >신청완료</button>
	</div>
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
	</div>
</div>
		</div>
		<div class="tab-pane fade active show" id="outline-two" role="tabpanel" aria-labelledby="tab-outline-two">
			<div class="card">
		<div class="card-body">
<div class="main-content-jsp">
    <div class="row">
        <div class="card-body">
             <div class="row">
                 <div class="col-xl-2 col-lg-4 col-md-4 col-sm-4 col-12">
                     <div class="text-center">
<!--                          <img src="ddit/resources/img/jj.jpg" alt="사용자이미지" class="rounded-circle user-avatar-xxl"> -->
                         <img src="ddit/resources/img/jj.jpg" class="img-thumbnail mr-3" alt="사용자이미지">
                     </div>
                 </div>
            	<div class="col-xl-10 col-lg-8 col-md-8 col-sm-8 col-12">
                <div class="user-avatar-info">
                    <!--  <div class="float-right"><a href="#" class="user-avatar-email text-secondary">www.henrybarbara.com</a></div> -->
                    <div class="user-avatar-address">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="card">
								<h3 class="card-header"><i class="fas fa-user"></i>&nbsp;&nbsp;학생기본정보</h3>
								<div class="card-body">
										<table class="table table-hover">
										    <thead>
										        <tr>
										            <th style="width:10%">학번</th>
										            <th style="width:10%">이름</th>
										            <th style="width:15%">학년</th>
										            <th style="width:15%">분과대학</th>
										            <th style="width:15%">학과</th>
										            <th style="width:25%">입학일자</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>학번</td>
										            <td>학년</td>
										            <td>학기</td>
										            <td>입학일</td>
										            <td>국적</td>
										            <td>${member.phone }</td>
										        </tr>
										    </tbody>
										   
										    <thead>
										         <tr>
										            <th >전공</th>
										            <th >제2전공</th>
										            <th >제3전공</th>
										            <th >부전공</th>
										            <th >연락처</th>
										            <th >이메일</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>전공</td>
										            <td>영문학</td>
										            <td>신청가능학점</td>
										            <td>2</td>
										            <td>011-2323-5444</td>
										            <td>${member.email }</td>
										        </tr>
										    </tbody>
										    <thead>
										         <tr>
										            <th >총이수학점</th>
										            <th >졸업이수학점</th>
										            <th >토익 자격증 여부</th>
										            <th >컴활 자격증 여부</th>
										            <th colspan="2">주소</th>
										        </tr>
										    </thead>
										    <tbody>
										        <tr>
										            <td>학부</td>
										            <td>동아리</td>
										            <td>0</td>
										            <td>부전공</td>
										            <td colspan="2">${member.add1} ${member.add2}</td>
										        </tr>
										    </tbody>
										</table>
									</div>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->

	<div class="card">
		<h3 class="card-header">조기졸업/ 졸업유예 신청</h3>
		<div class="card-body">
			<h5>신청목록</h5>
			<table class="table table-hover">
			    <thead>
			        <tr>
			            <th style="width: 15%">구분</th>
			            <th style="width: 15%">이름</th>
			            <th style="width: 30%">신청일자</th>
			            <th style="width: 10%">진행여부</th>
			            <th style="width: 20%">신청</th>
			            <th style="width: 10%"></th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td>조기졸업</td>
			            <td>한태훈</td>
			            <td>2022-09-26</td>
			            <td>대기</td>
			            <td>
							<div class="input-group-append">
								<select class="custom-select d-block w-100" id="country" required="">
									<option>선택</option>
									<option>조기졸업</option>
									<option>졸업유예</option>
								</select>
							</div>
			            </td>
			            <td>
			            	<div class="row justify-content-end">
								<a href="#" class="btn btn-outline-danger mr-5">취소</a>
							</div>
			            </td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>
		<div class="row justify-content-end">
			<button type="button" class="btn-ml btn btn-primary mr-5" onclick="" >신청완료</button>
		</div>

	
	
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->
	
	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	
	
	
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
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

	var dataNum1=0;

	function addFile_go1(){
		//alert("click add btn");
		

		if($('.inputRow1').length >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow1").attr("data-no",dataNum1).css("padding-top","20px");
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		
		var button="<button onclick='remove_go1("+dataNum1+");' style='border:0;outline:0;' class='badge-danger' type='button'>X</button>";
		
		div.append(input).append(button);
		$('.fileInput1').append(div);
		
		
		dataNum1++;
	}

	function remove_go1(dataNum1){
		$('.inputRow1[data-no="'+dataNum1+'"]').remove();
	}

</script>
<script>

	var dataNum2=0;

	function addFile_go2(){
		//alert("click add btn");
		

		if($('.inputRow2').length >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow2").attr("data-no",dataNum2).css("padding-top","20px");
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		
		var button="<button onclick='remove_go2("+dataNum2+");' style='border:0;outline:0;' class='badge-danger' type='button'>X</button>";
		
		div.append(input).append(button);
		$('.fileInput2').append(div);
		
		
		dataNum2++;
	}

	function remove_go2(dataNum2){
		$('.inputRow2[data-no="'+dataNum2+'"]').remove();
	}

</script>
<script>

	var dataNum3=0;

	function addFile_go3(){
		//alert("click add btn");
		

		if($('.inputRow3').length >=5){
			alert("파일추가는 5개까지만 가능합니다.");
			return;
		}
		
		var div=$('<div>').addClass("inputRow3").attr("data-no",dataNum3).css("padding-top","20px");
		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
		
		var button="<button onclick='remove_go3("+dataNum3+");' style='border:0;outline:0;' class='badge-danger' type='button'>X</button>";
		
		div.append(input).append(button);
		$('.fileInput3').append(div);
		
		
		dataNum3++;
	}

	function remove_go3(dataNum3){
		$('.inputRow3[data-no="'+dataNum3+'"]').remove();
	}

</script>
