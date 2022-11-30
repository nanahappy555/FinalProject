<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style>
#enterCR{

position:fixed;
top:200px;
left:1900px;

}
body{

background-image: linear-gradient( rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1) ),url("${webPath}/resources/img/loginbackground.jpg");
	
}

#loginWindowMain{
	width:700px;
	position:absolute;
	top:25%;
	right:30%;
}
#loginWindow2{
	width:345px;
	height:441.5px;
	background-color: white;
/* 	opacity: 0.8; */
}
#loginWindow{
	width:345px;
	height:441.5px;
}

</style>


</head>



   <div class="splash-container">
   	  <div class="row" id="loginWindowMain">
   	  <div class="card" id="loginWindow2">
   	   
   	   
<!-- 		<div class="card-body"> -->
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"
							class=""></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"
							class=""></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="${webPath }/resources/img/pop1.jpg"
								alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="${webPath }/resources/img/pop2.jpg"
								alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="${webPath }/resources/img/pop3.jpg"
								alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
<!-- 			</div> -->
   	   
   	   
   	   
   	  </div>
   	  
      <div class="card" id="loginWindow">
         <div class="card-header text-center" style="padding-bottom:5px">
            <img class="logo-img"
               src="<%=request.getContextPath() %>/resources/img/로고.jpg" alt=" logo"><span
               class="splash-description"></span>
         </div>
         <div class="card-body">
            <form method="post" action = "login.do">
               <div class="form-group">
                  <input class="form-control form-control-lg" id="username"
                     type="text" name="id" placeholder="아이디" autocomplete="off">
               </div>
               <div class="form-group">
                  <input class="form-control form-control-lg" id="password"
                     type="password" name="pwd" placeholder="비밀번호">
               </div>
               <div class="form-group">
               		<div class="justify-content-center flex row">
	                  <button type="button" class="btn btn-outline-dark" style="margin-left:10px;"  onclick="autoInput('staff')">교직원</button>
	                  <button type="button" class="btn btn-outline-dark" style="margin-left:10px;"  onclick="autoInput('prof')">교수</button>
	                  <button type="button" class="btn btn-outline-dark" style="margin-left:10px;" onclick="autoInput('stu')">학생</button>
               		</div>
               </div>
               <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
            </form>
         </div>
         <div class="card-footer" >
         	<div class="justify-content-center row">
         		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 row">
         		<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
               <button type="button" class="btn btn-outline-dark" onclick="OpenWindow('<%=request.getContextPath()%>/common/login/resetPwd.do','_blank',450,500);">
               <strong>비밀번호 재설정</strong></button>
               </div>
               <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
               <button type="button" class="btn btn-outline-dark" onclick="OpenWindow('${webPath}/common/getCameraLogin','카메라로 인증',1200,800)"><strong>출입 인증하기</strong></button>
    	  		</div>
    	  		</div>
    	  	</div>
    	  </div>
    	  <div>
    	  
    	  </div>
   </div>
   </div>
</div>
	
	<script>
	function autoInput(entity){
		if(entity=='staff'){
			var staffId='staff0001';
			var staffPw='1234';
			$('#username').val(staffId);
			$('#password').val(staffPw);
			
		}else if(entity=='stu'){
			var stuId='stu0001';
			var stuPw='1234';
			$('#username').val(stuId);
			$('#password').val(stuPw);
			
		}else if(entity=='prof'){
			var profId='prof0001';
			var profPw='1234';
			$('#username').val(profId);
			$('#password').val(profPw);
			
		}
	}
	</script>


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
