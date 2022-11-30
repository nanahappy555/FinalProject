<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<div class="card-body">
		<div class="main-content-jsp">
   
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
			<div class="card">
				<h3 class="card-header"><i class="fas fa-graduation-cap"></i>&nbsp;&nbsp;장학금 혜택 및 신청</h3>
				<div class="card-body">
					<ul>
						<li>장학금 혜택 및 신청 내역을 조회할 수 있는 화면입니다.</li>
						<li>학년과 학기를 선택해 신청한 장학금의 진행상태를 조회할 수 있습니다.</li>
						<li>진행상태는 '진행중' / '승인' / '반려' 으로 구분됩니다.</li>
			        </ul>
				</div>
			</div>

						


	
		 
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	 
	<!-- ================================================= -->
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">
		<div class="card-body">
			
			<table class="table table-hover">		
			    <thead>
			        <tr>
			            <th style="width: 10%">신청년도</th>
			            <th style="width: 10%">신청학기</th>
			            <th style="width: 20%">장학금명</th>
			            <th style="width: 20%">수혜금액(원)</th>
			            <th style="width: 20%">신청날짜</th>
			            <th style="width: 10%">진행상태</th>
			            <th style="width: 10%">취소</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:if test="${empty applyInfo }" >
						<tr>
							<td colspan="7">
								<strong>장학금 신청 내역이 없습니다.</strong>
							</td>
						</tr>
					</c:if>	
			    	<c:forEach items="${applyInfo}" var="info" varStatus="status">
			    	<input type="hidden" name="scholAppSeq" value="${info.scholAppSeq}">		
			        <tr>
			            <td>${fn:substring(info.semeCd,0,4)}년도</td>
			            <td>${fn:substring(info.semeCd,4,6)}학기</td>
			            <td>${info.scholName }</td>
			            <td>${info.scholAmount }</td>
			            <td>
			            <fmt:formatDate value="${info.applyDate }" pattern="yyyy년 MM월 dd일"/>
			            </td>
			            <td>${info.applyStatusCd }</td>
			            <c:if test="${info.applyStatusCd eq '진행중'}">
			            <td>
			            	<button type="button" class="btn btn-secondary" data-toggle="popover" 
			            	onclick="deleteDetail();">취소</button>
			            </td>
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
		
		
		</div>
	</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->


<script>
function deleteDetail() {

  alert("신청을 취소하시겠습니까?");
  
  var v_seq = $('input[name=scholAppSeq]').val();
  var v_url = "<%=request.getContextPath()%>/stu/schol/delete?scholAppSeq="+v_seq;

  $.ajax({
	  method: 'get',
	  url: v_url,
	  success: (rslt) => {
		  alert("신청 취소 되었습니다.");
		  location.href = location.href;
	  },
	  error: (error)=> {
		  AjaxErrorSecurityRedirectHandler(error.status);
	  }
		  
  });

}
</script>