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

	<div class="card">
		<h3 class="card-header">조기졸업/ 졸업유예 신청</h3>
		<div class="card-body">
			<h5>신청목록</h5>
			<table class="table table-hover">
			    <thead>
			        <tr>
			            <th scope="col">구분</th>
			            <th scope="col">이름</th>
			            <th scope="col">신청일자</th>
			            <th scope="col">진행여부</th>
			            <th scope="col"></th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			            <td>조기졸업</td>
			            <td>한태훈</td>
			            <td>2022-09-26</td>
			            <td>대기</td>
			            <td>
			            	<div class="row justify-content-end">
								<a href="#" class="btn btn-outline-danger mr-5">취소</a>
							</div>
			            </td>
			        </tr>
			    </tbody>
			</table>
			
			

				<h5>신청</h5>
				<div class="col-3">
					<div class="input-group-append">
						<select class="custom-select d-block w-100" id="country" required="">
							<option>선택</option>
							<option>조기졸업</option>
							<option>졸업유예</option>
						</select>
					</div>
				</div>
			<div class="row justify-content-end">
				<button type="button" class="btn-ml btn btn-primary mr-5" onclick="" >신청완료</button>
			</div>
		</div>
	</div>
	

	
	
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->
	
	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	
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