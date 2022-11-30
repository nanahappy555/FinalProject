<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>





   <div class="splash-container">
      <div class="card ">
         <div class="card-header text-center">
            <a href="../index.html"><img class="logo-img"
               src="<%=request.getContextPath() %>/resources/img/로고.jpg" alt=" logo"></a><span
               class="splash-description">Please enter your user
               information.</span>
         </div>
         <div class="card-body">
            <form>
            	<div class="form-group">
            	    <select class="form-control col-md-7" style=width:50% >
						<option>사용자 구분 선택</option>
						<option>교직원</option>
						<option>교수</option>
						<option>학생</option>
					</select>
				</div>
               <div class="form-group">
                  <input class="form-control form-control-lg" id="username"
                     type="text" placeholder="아이디" autocomplete="off">
               </div>
               <div class="form-group">
                  <input class="form-control form-control-lg" id="password"
                     type="password" placeholder="비밀번호">
               </div>
               <div class="form-group">
                  <label class="custom-control custom-checkbox"> <input
                     class="custom-control-input" type="checkbox"><span
                     class="custom-control-label">회원정보 저장</span>

                  </label>
               </div>
               <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
            </form>
         </div>
         <div class="card-footer bg-white p-0"  >
            <div class="card-footer-item card-footer-item-bordered" style=width:51%;  >
               <a href="#" class="footer-link" ><br><strong>아이디 찾기</strong></a>
               
               
            </div>
            <div class="card-footer-item card-footer-item-bordered"  >
               <a href="#" class="footer-link"  ><strong>비밀번호 초기화</strong></a>
               
            </div>
         </div>
      </div>
   </div>




   <script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
   <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

   <script async=""
      src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
   <script>
      window.dataLayer = window.dataLayer || [];
      function gtag() {
         dataLayer.push(arguments);
      }
      gtag('js', new Date());

      gtag('config', 'UA-23581568-13');
   </script>
   <script defer=""
      src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194"
      integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
      data-cf-beacon="{&quot;rayId&quot;:&quot;758529c84b4534b1&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2022.8.1&quot;,&quot;si&quot;:100}"
      crossorigin="anonymous"></script>
