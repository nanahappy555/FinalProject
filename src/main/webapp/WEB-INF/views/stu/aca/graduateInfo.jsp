<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
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

	<div class="row">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
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
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
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
		
		<div class="card-body">
			<table class="table table-hover">
			    <thead>
			        <tr>
			            <th>
							<div class="form-group">
								<label class="col-form-label"><i class="fas fa-address-card"></i>&nbsp;&nbsp;토익 자격증</label>
								
								<div class="input-group-append">
									<input type="file" id="inputFile" onchange="changePicture_go();" name="file" style="display:none" />
									<div class="input-group col-md-12">
										<div class="col-md-12" style="text-align: center;">
											<div class="input-group input-group-sm">
												<label for="inputFile" class="col-3 col-lg-3 col-form-label btn-sm btn btn-secondary">파일선택</label>
												<input id="inputFileName" class="form-control" type="text" name="tempFile" disabled
													value=""/>
												<input id="file" class="form-control" type="hidden" name="uploadFile" />
											</div>						
										</div>										
									</div>
								</div>
								
							</div>
			            </th>
			            <th>
							<div class="form-group">
								<label class="col-form-label"><i class="fas fa-address-card"></i>&nbsp;&nbsp;컴활 자격증</label>
								
								<div class="input-group-append">
									<input type="file" id="inputFile" onchange="changePicture_go();" name="file" style="display:none" />
									<div class="input-group col-md-12">
										<div class="col-md-12" style="text-align: center;">
											<div class="input-group input-group-sm">
												<label for="inputFile" class="col-3 col-lg-3 col-form-label btn-sm btn btn-secondary">파일선택</label>
												<input id="inputFileName" class="form-control" type="text" name="tempFile" disabled
													value=""/>
												<input id="file" class="form-control" type="hidden" name="uploadFile" />
											</div>						
										</div>										
									</div>
								</div>
							</div>
			            </th>
			            <th>
							<div class="form-group">
								<label class="col-form-label"><i class="fas fa-address-card"></i>&nbsp;&nbsp;기타 자격증</label>
								
								<div class="input-group-append">
									<input type="file" id="inputFile" onchange="changePicture_go();" name="file" style="display:none" />
									<div class="input-group col-md-12">
										<div class="col-md-12" style="text-align: center;">
											<div class="input-group input-group-sm">
												<label for="inputFile" class="col-3 col-lg-3 col-form-label btn-sm btn btn-secondary">파일선택</label>
												<input id="inputFileName" class="form-control" type="text" name="tempFile" disabled
													value=""/>
												<input id="file" class="form-control" type="hidden" name="uploadFile" />
											</div>						
										</div>										
									</div>
								</div>
							</div>
			            </th>
			        </tr>
			    </thead>
			</table>
		</div>
	</div>
</div>
	</div>
	<div class="row justify-content-end">
		<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/aca/graduate','글쓰기',1200,800);" >제출하기</button>
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