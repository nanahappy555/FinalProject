<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<title>jsp 페이지 제목입니다</title>
</head>

<<style>
</style>
<body>

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
         <!-- <div class="input-group mb-3 justify-content-end"> -->
           
           
            <!-- keyword -->
            
            
       <!--   <div class=""> -->
         	<!--  <div class="form-group "  >
         	 	<label for="inputName">분과대학</label>
				<select class="form-control">
					<option>공과대학 </option>
				</select>
         	 	<label for="inputName">소속학과</label>
				<select class="form-control">
					<option>전체 </option>
				</select>
         	 	<label for="inputName">재학상태</label>
				<select class="form-control">
					<option>전체 </option>
				</select>
				
			</div> -->
      <!--    </div> -->
            
            
            
               <div class="input-group mb-3" >
              	 <label for="inputName" style=margin-top:10px;>분과대학</label>
                  <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
                       <option value="10"> 전체</option>
                       <option value="10">교직원</option>
                       <option value="2">교수</option>
                       <option value="3">학생</option>
                   </select> 
            
            
              	 <label for="inputName" style=margin-left:30px;margin-top:10px; >소속학과</label>
                  <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
                       <option value="10">전체</option>
                       <option value="10">교직원</option>
                       <option value="2">교수</option>
                       <option value="3">학생</option>
                   </select>
            
            
              	 <label for="inputName" style=margin-left:30px;margin-top:10px;>재학상태</label>
                  <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
                       <option value="10">전체</option>
                       <option value="10">교직원</option>
                       <option value="2">교수</option>
                       <option value="3">학생</option>
                   </select>
            
            
            
            
            
            
            
            	</div>
            
            
            
            
            
            
            
         <div class="input-group mb-3 float:left">
         	<label for="inputName" style=margin-top:15px;>단어검색</label>
             <input  class="form-control col-md-4" type="text" name="keyword" placeholder="내용을 입력하세요." value=""/>
              <span class="input-group-append">
               <button class="btn btn-primary m-1"  type="button" id="" onclick="">검색</button >
               <button class="btn btn-dark m-1"  type="button" id="" onclick="">초기화</button >
                 <!--  <i class="fa fa-fw fa-search"></i> -->
               </button>
            </span>
         </div>
         
         
             
           <div class="row justify-content-end mt-2 mr-2" style=margin-bottom:15px;>
			<button class="btn btn-outline-primary btn-sm" type="button" onclick="">승인</button>&nbsp;&nbsp;
			<button class="btn btn-outline-danger btn-sm" type="button" onclick="">반려</button>
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
                  <th scope="col">신청일</th>
                  <th scope="col">분과대학</th>
                  <th scope="col">소속학과</th>
                  <th scope="col">신청구분</th>
                  <th scope="col">학적상태</th>
                  <th scope="col">이수학점</th>
                  <th scope="col">졸업요구학점</th>
                  <th scope="col">연락처</th>
                  <th scope="col">처리상태</th>
               </tr>
            </thead>
            
            <tbody>
            
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
               <tr>
                  <th scope="row">
                    <form>
                  		 <input type='checkbox' name='schol' value='y' />
                  	</form>
                  </th>
                  <td>777</td>
                  <td>1</td>
                  <td>김미미</td>
                  <td>2022-09-29</td>
                  <td>인문대학</td>
                  <td>국어국문학과</td>
                  <td>조기졸업</td>
                  <td>재학</td>
                  <td>128</td>
                  <td>128</td>
                  <td>010-1234-1234</td>
                  <td>대기</td>
               </tr>
              
              
           
              
          
              
              
            </tbody>
         </table>

      <!-- ================================================= -->
      <!-- 게시판 끝 -->
      <!-- ================================================= -->
   
      <!-- ================================================= -->
      <!-- 등록 버튼 시작 -->
      <!-- ================================================= -->
      
      
     <!--  <div class="row justify-content-end mt-2 mr-2">
         <button class="btn btn-outline-primary btn-sm" type="button"onclick="">과제등록</button>
         </div>
      </div> -->
      
      
      
      <!-- ================================================= -->
      <!-- 등록 버튼 끝 -->
      <!-- ================================================= -->
   
      <!-- ================================================= -->
      <!-- 페이지네이션 시작 -->
      <!-- ================================================= -->
     <!--  <div class="row justify-content-center">
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
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
</body>
<!-- 
<div class="form-row">
	<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
		<label for="validationCustom03">City</label> <input type="text"
			class="form-control" id="validationCustom03" placeholder="City"
			required="">
		<div class="invalid-feedback">Please provide a valid city.</div>
	</div>
	<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
		<label for="validationCustom04">State</label> <input type="text"
			class="form-control" id="validationCustom04" placeholder="State"
			required="">
		<div class="invalid-feedback">Please provide a valid state.</div>
	</div>
	<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 mb-2">
		<label for="validationCustom05">Zip</label> <input type="text"
			class="form-control" id="validationCustom05" placeholder="Zip"
			required="">
		<div class="invalid-feedback">Please provide a valid zip.</div>
	</div>
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="form-group">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value=""
					id="invalidCheck" required=""> <label
					class="form-check-label" for="invalidCheck"> Agree to terms
					and conditions </label>
				<div class="invalid-feedback">You must agree before
					submitting.</div>
			</div>
		</div>
	</div>
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
		<button class="btn btn-primary" type="submit">Submit form</button>
	</div>
</div>
 -->