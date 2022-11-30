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
         	<form id='form' method="post" action="${webPath}/common/login/resetPwdFormBtn.do">
            	<input type="hidden" name="memId" value="${mem.memId }">
            	<input type="hidden" name="name" value="${mem.name }">
            	<input type="hidden" name="phone" value="${mem.phone }">
            	<div class="form-group">
                	<input type="text" class="form-control" name="pwd1" placeholder="변경할 비밀번호를 입력하세요." required="required">
                </div>
            	<div class="form-group">
                	<input type="text" class="form-control" name="memPwd" placeholder="변경할 비밀번호를 다시 한 번 입력하세요." required="required">
                </div>

               <input type="button" id="sub" onclick="finalChange();" class="btn btn-primary btn-lg btn-block" value="비밀번호 재설정">
            </form>
         </div>
         
      </div>
   </div>


  

 <script>

function finalChange() {
	
	if ( $("input[name='pwd1']").val() != $("input[name='memPwd']").val() ) {
		alert( '변경할 암호가 일치하지 않습니다.' );
		return;
	}
	else {
		var form = document.querySelector('form');
		console.log(form);
		form.submit();
		
	}
}


</script>

