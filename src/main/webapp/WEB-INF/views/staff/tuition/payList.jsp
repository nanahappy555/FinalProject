<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="main-content-jsp">






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
			
               <div class="input-group mb-3" >
              	 <label for="inputName" style=margin-top:10px; >분과대학</label>
                  <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
                       <option value="" >인문대학</option>
                       <option value="">교육대학</option>
                       <option value="">의과대학 </option>
                   </select> 
            
            
              	 <label for="inputName" style=margin-left:30px;margin-top:10px; >소속학과</label>
                  <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
                       <option value="10" >법학과</option>
                       <option value="10">경영학과</option>
                       <option value="2" >영문학과</option>
                       <option value="3" >의학과</option>
                   </select>
            	</div>
			
			
			     
         <div class="input-group mb-3 float:left">
         	<label for="inputName" style=margin-top:15px;>학생 검색</label>
             <input  class="form-control col-md-4" style=margin-left:10px; type="text" name="keyword" placeholder="홍길동" value=""/>
              <span class="input-group-append">
               <button class="btn btn-primary mb-1"  style=margin-left:10px;  type="button"id="searchBtn" onclick="">검색</button>
               
            </span>
         </div>
         
         
         
          <div class="input-group mb-3 float:right-top">
              <!-- <label for="inputName" style=margin-top:10px;>2022년도 1학기</label> -->
                  <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
                       <option value="" >2022년도 1학기</option>
                       <option value="" >2021년도 2학기</option>
                       <option value="">2021년도 2학기</option>
                   </select> 
          	 <button class="btn btn-primary mb-1"  style=margin-left:10px;  type="button"id="searchBtn" onclick="">등록금 납부 조회</button>
          	 
          	  <button class="btn btn-dark mb-1 "   style=margin-left:1600px   type="button"id="searchBtn" onclick="">등록금 고지서 통지</button>
          	 
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
	                  <th scope="col">
	                  </th>
	                  <th scope="col">학번</th>
	                  <th scope="col">학년</th>
	                  <th scope="col">이름</th>
	                  <th scope="col">분과대학</th>
	                  <th scope="col">소속학과</th>
	                  <th scope="col">등록금액</th>
	                  <th scope="col">연락처</th>
	                  <th scope="col">이메일</th>
	                  <th scope="col">납부날짜</th>
	                  <th scope="col">납부여부</th>
	               </tr>
	            </thead>
	            
	            <tbody>
	            <c:forEach items="${stList}" var="staffTuition" >
	               <tr>
	                  <th scope="row">
	                    <form>
	                  		 <input type='checkbox' name='schol' value='y' />
	                  	</form>
	                  </th>
	                  <td>${staffTuition.stuCd}</td>
	                  <td>${staffTuition.grade}</td>
	                  <td>${staffTuition.name}</td>
	                  <td>${staffTuition.colName}</td>
	                  <td>${staffTuition.majorName}</td>
	                  <td>${staffTuition.amount}</td>
	                  <td>${staffTuition.phone}</td>
	                  <td>${staffTuition.email}</td>
	                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${staffTuition.paymentDate}"/></td>
	                  <td>${staffTuition.payStatusCd}</td>
	               </tr>
	            </c:forEach>  
	              </tbody>
	             </table>
		<!-- ================================================= -->
		<!-- 게시판 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 등록 버튼 시작 -->
		<!-- ================================================= -->
		
		<!-- ================================================= -->
		<!-- 등록 버튼 끝 -->
		<!-- ================================================= -->
	
		<!-- ================================================= -->
		<!-- 페이지네이션 시작 -->
		<!-- ================================================= -->
	<!-- 	<div class="row justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">«</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="page-item active">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">»</span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</nav>
		</div> -->
		<!-- ================================================= -->
		<!-- 페이지네이션 끝 -->
		<!-- ================================================= -->
		
	</div> 
	<!-- ================================================= -->
	<!-- 카드바디 끝 -->
	<!-- ================================================= -->
	
	
	  
   <div class="card-footer">
      <div class="row justify-content-center">
            <nav aria-label="Page navigation example">
               <ul class="pagination">
                  <li class="page-item">
                     <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                        <span class="sr-only">Previous</span>
                     </a>
                  </li>
                  <li class="page-item active">
                     <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                     <a class="page-link" href="#">2</a>
                  </li>
                  <li class="page-item">
                     <a class="page-link" href="#">3</a>
                  </li>
                  <li class="page-item">
                     <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">»</span>
                        <span class="sr-only">Next</span>
                     </a>
                  </li>
               </ul>
            </nav>
      </div>
   
   
	
	
	</div>
	<!-- ================================================= -->
	<!-- 카드 끝 -->
	<!-- ================================================= -->
</div>




</div>
</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->