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


</style>


</head>

	<div class="splash-container">
      <div class="card ">
         <div class="card-header text-center">
            <a><img class="logo-img"
               src="<%=request.getContextPath() %>/resources/img/로고.jpg" alt=" logo"></a>
               <span class="splash-description">비밀번호 재설정</span>
         </div>
         <div class="card-body">

            <form id='form' method="post" action="${webPath}/common/login/resetPwdCheck.do">
               <div class="form-group">
                  <input type="text" class="form-control" name="memId" placeholder="아이디를 입력하세요." required="required">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" name="name" placeholder="이름을 입력하세요." required="required">
               </div>
               <div class="form-group">
                  <input type="text" class="form-control" name="phone" placeholder="휴대폰번호를 입력하세요." required="required">
               
               </div>
               <input type="button" id="sub" onclick="pwdCheck();" class="btn btn-primary btn-lg btn-block" value="확 인">
            </form>
            
         </div>
         
      </div>
   </div>
<c:if test = "${from eq 'check'}"> 
  <script>
	
  	alert("입력한 정보와 일치하는 사용자가 존재하지 않습니다.")
	location.replace(locatio.href);

</script>
</c:if>

 <script>
	
  function pwdCheck() {
	
	var form = document.querySelector('form');
	console.log(form);
	form.submit();

	}
</script>

   <script defer=""
      src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194"
      integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
      data-cf-beacon="{&quot;rayId&quot;:&quot;758529c84b4534b1&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2022.8.1&quot;,&quot;si&quot;:100}"
      crossorigin="anonymous"></script>
