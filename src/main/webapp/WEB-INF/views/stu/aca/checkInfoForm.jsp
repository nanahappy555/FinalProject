<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content-fluid">

	<div class="card col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	
   <div class="splash-container">
      <div class="card ">
         <div class="card-header text-center">
            <a href="../index.html"><img class="logo-img"
               src="<%=request.getContextPath() %>/resources/img/로고.jpg" alt=" logo"></a><span
               class="splash-description">Please enter your user
               information.</span>
         </div>
         <div class="card-body">
            <form method="post" action = "${webPath}/stu/aca/checkInfo">
               <div class="form-group">
                  <input class="form-control form-control-lg" id="username"
                     type="text" name="memId" value="${loginUser.memId}" readonly autocomplete="off">
               </div>
               <div class="form-group">
                  <input class="form-control form-control-lg" id="password"
                     type="password" name="memPwd" autocomplete="off" placeholder="비밀번호를 입력해주세요." value="">
               </div>
               <div class="form-group">
               </div>
               <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
            </form>
         </div>
      </div>
   </div>
	
	</div>
	
</div>

<c:if test="${check eq false}">
<script>
alert("비밀번호가 틀립니다. 다시 입력해주세요.")

</script>
</c:if>