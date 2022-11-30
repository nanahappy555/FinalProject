<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="card">
   <div class="card-body">
      <div class="main-content-jsp">
          <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <h4 class="card-header"><i class="fas fa-clipboard"></i>&nbsp;&nbsp;경영학개론</h4>

   <div class="card-body">
      <div class="main-content-jsp">

<div class="row">

   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
      <div class="card" style="text-align:center">
      <div class="card-body">
      <div class="user-avatar text-center d-block">
         <img src="assets/images/avatar-1.jpg" alt="User Avatar" class="rounded-circle user-avatar-xxl">
      </div>
   <div class="text-center" >
      <h2 class="font-24 mb-0">장재훈 교수님</h2>
         <p>abcd@gmail.com</p>
   </div>
      </div>
      </div>
   </div>

      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
         <div class="card">
            
            <div class="card-body" style="text-align:center">
               <table class="table table-hover">
                  <thead>
                  <h3><strong>나의 출결현황</strong></h3>
                  </thead>
                  <tbody>
                     <tr>
                        <td>주차별 현황</td>
                        <td>지각</td>
                        <td>조퇴</td>
                        <td>결석</td>
                     </tr>
                     <tr>
                        <td style="font-size: 20px;">5/16</td>
                        <td style="font-size: 30px;">3</td>
                        <td style="font-size: 30px;">0</td>
                        <td style="font-size: 30px;">0</td>
                     </tr>

                  </tbody>
               </table>
            </div>
         </div>
      </div>
</div>

<div class="row">

      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
         <div class="card">
            
            <div class="card-body" style="text-align:left">
               <table class="table table-hover">
                  <thead>
                  <h3><strong><i class="fas fa-check"></i>&nbsp;공지사항</strong></h3>
                  </thead>
                  <tbody>
                     <tr>
                        <td>강의실 변경 안내</td>
                     </tr>


                  </tbody>
               </table>
            </div>
         </div>
      </div>
      
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
         <div class="card">
            
            <div class="card-body" style="text-align:left">
               <table class="table table-hover">
                  <thead>
                  <h3><strong><i class="fas fa-edit"></i>&nbsp;과제</strong></h3>
                  </thead>
                  <tbody>
                     <tr>
                        <td>레포트 제출 공지</td>
                     </tr>


                  </tbody>
               </table>
            </div>
         </div>
      </div>


</div>

<!-- <div class="row">
<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
   <div class="card">
      
      <div class="card-body">
         <table class="table table-hover">
             <thead>
                
               <h3><strong>1주차 공지 및 수업자료</strong></h3>
               
             </thead>
             <tbody>
                 <tr>
                    <a href="#" class="btn btn-secondary">PDF DOWNLOAD</a>   
                    
                     <td style="text-align:left">학습자료.경영의 이해</td>
               
                 </tr>

             </tbody>
         </table>
      </div>
      <div class="card-body">
         <table class="table table-hover">
             <thead>
               <h3><strong>2주차 공지 및 수업자료</strong></h3>
             </thead>
             <tbody>
                 <tr>
                    
                     <td style="text-align:left">학습자료.글로벌 경영&nbsp;&nbsp;<a href="#" class="btn-xs btn btn-secondary">pdf</a></td>

                 </tr>

             </tbody>
         </table>
      </div>
   </div>
</div>
</div> -->
<div class="container-fluid" style="padding-left:0px;">

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
			 	<select class="form-control col-md-2" name="searchType" id="searchType">
			 		<option value="">주차 선택</option>
					<option value="1">1주차</option>
					<option value="2">2주차</option>
					<option value="3">3주차</option>	
				</select>
			</div>
			<!-- ================================================= -->
			<!-- 검색바 끝 -->
			<!-- ================================================= -->
		
		<!-- ================================================= -->
		<!-- 아코디언 시작 -->
		<!-- ================================================= -->
		
		<div class="accrodion-regular">
			<div id="accordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								1주차 공지 및 수업자료
							</button>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion" style="">
						<div class="card-body">
							<p> 학습자료. 경영의 이해</p>
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-end mt-1">
							
								<button class="btn btn-secondary" type="button" onclick=""><i class="fas fa-file-pdf"></i>&nbsp;PDF</button>&nbsp;&nbsp;
								<!-- <button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp; -->
							</div>
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingTwo">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								2주차 공지 및 수업자료
							</button>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion" style="">
						<div class="card-body">
							<p> 학습자료. 글로벌 경영</p>
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-end mt-1">
								<button class="btn btn-secondary" type="button" onclick=""><i class="fas fa-file-pdf"></i>&nbsp;PDF</button>&nbsp;&nbsp;
								<!-- <button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp; -->
							</div>
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header" id="headingThree">
						<h5 class="mb-0">
							<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								3주차 공지 및 수업자료
							</button>
						</h5>
					</div>
					<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion" style="">
						<div class="card-body">
							<p>
							</p><p> 학습자료. 경영학의 발전과정</p>
							<!-- ================================================= -->
							<!-- 버튼 시작 -->
							<!-- ================================================= -->
							<div class="row justify-content-end mt-1">
								<button class="btn btn-secondary" type="button" onclick=""><i class="fas fa-file-pdf"></i>&nbsp;PDF</button>&nbsp;&nbsp;
								<!-- <button class="btn btn-outline-danger" type="button" onclick="f_alert();">삭제</button>&nbsp;&nbsp; -->
							</div>
							<!-- ================================================= -->
							<!-- 버튼 끝 -->
							<!-- ================================================= -->
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ================================================= -->
		<!-- 아코디언 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->
<!-- 		<div class="row justify-content-end mt-2 mr-2">
			<button class="btn btn-outline-primary" type="button" onclick="">자료등록</button>
		</div> -->
		<!-- ================================================= -->
		<!-- 등록 버튼 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 페이지네이션 시작 -->
		<!-- ================================================= -->
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
</div>
</div>

</div>
</div>
</div>
</div>
</div>

