<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

<!-- 111111 -->
<div class="row">
   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
      <div class="card">
         <h2 class="card-header">상세보기</h2>

         <div class="card-body">
            <div class="row">
               <table class="table table-bordered">

                  <tbody>
                     <tr>
                        <th style="width:10%">제목</th>
                        <td colspan="3" class="table-title">${scNotice.title }</td>
                        <th style="width:10%">첨부파일</th>
                        <td class="table-title"></td>
                     </tr>

                     <tr>
                        <th style="width:10%">작성자</th>
                        <td style="width:20%" class="table-title">${scNotice.staffId}</td>
                        <th style="width:10%">날짜</th>
                        <td style="width:20%" class="table-title"><fmt:formatDate value="${scNotice.cdate }" pattern="yyyy-MM-dd" /></td>
                        <th style="width:10%">조회</th>
                        <td style="width:20%" class="table-title">${scNotice.viewCnt }</td>
                     </tr>
                     
                     
                     <tr>
                        <td colspan="6" class="table-title">${scNotice.content }
                           <p class="m-3">
                  
                        </td>
                     </tr>
                     
                  </tbody>
               </table>
            </div>
            
            
            <!-- ================================================= -->
            <!-- 버튼 시작 -->
            <!-- ================================================= -->
            <div class="row justify-content-end mt-3">
<!--                <button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
<!--                <button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
<!--                <button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
<!--                <br> -->
				<sec:authorize access="hasAnyRole('staff')">	
	               <button class="btn btn-outline-primary" type="button" onclick="pageMove('<%=request.getContextPath()%>/common/notice/modifyForm?scNno=${scNotice.scNno}')">수정</button>&nbsp;&nbsp;
	               <button class="btn btn-outline-danger" type="button"  onclick="remove_go('${scNotice.scNno}');" >삭제</button>&nbsp;&nbsp;
               	</sec:authorize>
               	<button class="btn btn-primary" type="button" onclick="pageMove('<%=request.getContextPath()%>/common/notice/list')">목록</button>&nbsp;&nbsp;
            </div>
            <!-- ================================================= -->
            <!-- 버튼 끝 -->
            <!-- ================================================= -->
         </div>
      </div>
   </div>
</div>

<!-- 11111끝 -->

</div>


<script>
	function remove_go(scNno){
		if (confirm("정말 삭제하시겠습니까?") == true){
			alert("삭제되었습니다.");
			
		}else {
			return false;
		} 
		
		location.href="remove.do?scNno="+scNno;
	}	 
	
	
	<c:if test="${from eq 'modify' }">
		alert("수정되었습니다.");
	</c:if>
	<c:if test="${from eq 'remove'}">
	 	alert("삭제되었습니다.");
		window.close();
		window.opener.location.reload();
	</c:if>
	
	$(function(){
		var memClass = '<%=request.getAttribute("memClassCd")%>';
		console.log("멤버클래스" , memClass);
	});
	
</script>

<script language="JavaScript">
document.onkeydown = function() {
if (event.keyCode == 116) {
event.keyCode = 505;
}
if (event.keyCode == 505) {
location.reload();
return false;
}
}
</script>