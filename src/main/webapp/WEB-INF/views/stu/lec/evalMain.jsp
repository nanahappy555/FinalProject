<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="main-content-jsp">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<h3 class="card-header">강의평가 목록</h3>
			<div class="card-body">
				<table class="table table-hover">
					<thead>
						<tr style="background-color:rgba(102,178,255,0.2)">
							<th>교수명</th>
							<th>이수구분</th>
							<th>이수학점</th>
							<th>강의명</th>
							<th>평가상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty evalList }" >
							<tr>
								<td colspan="5">
									<strong>강의 평가 내역이 없습니다.</strong>
								</td>
							</tr>
						</c:if>	
						<c:forEach items="${evalList}" var="eval" varStatus="status">
						<tr class="evalRow" data-lecCd="${eval.lecCd}" data-complete="${eval.evalStatusCd}">
							<td>${eval.name }</td>
							<td>${eval.lecCategoryCd }</td>
							<td>${eval.credit }</td>
							<td>${eval.subjName }</td>
							<c:if test="${eval.evalStatusCd eq '완료'}">
							<td style="color:#64CD3C">${eval.evalStatusCd }</td>
							</c:if>
							<c:if test="${eval.evalStatusCd eq '미완료'}">
							<td style="color:#FF6464">${eval.evalStatusCd }</td>
							</c:if>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script>
//강의 평가 폼으로 넘어가는 url 주소.
//강의평가 코드를 넘겨서 해당 강의평가테이블의 강의코드로 활용.
var evalRow = document.querySelectorAll('.evalRow');
for(var i=0;i<evalRow.length;i++){
	evalRow[i].style.cursor="pointer";
	evalRow[i].addEventListener('click',function(e){
		var evalStatus = e.target.parentNode.getAttribute('data-complete');
		if(evalStatus=='완료'){
			alert("이미 평가가 끝난 과목입니다.")
			return;
		}
		var lecCd = e.target.parentNode.getAttribute("data-lecCd")
		console.log(lecCd)
		location.href = "<%=request.getContextPath()%>/stu/lec/eval/registForm.do?lecCd="+lecCd
	})
}



<%-- function pageMove(url){
	location.href = "<%=request.getContextPath()%>/"+url;
} --%>
</script>