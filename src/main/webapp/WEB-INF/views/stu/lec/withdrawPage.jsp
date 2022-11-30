<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
<div class="card">
	<div class="card-body">
	
   
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
        
	
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
			<div class="row">
        		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        		
	        		<div class="card">
						<h3 class="card-header"><i class="fas fa-exclamation"></i>&nbsp;&nbsp;수강 철회 주의사항</h3>
						<div class="card-body">
							<ul>
								<li>수강 철회 기간에만 강의 취소가 가능합니다.</li>
					        </ul>
						</div>
					</div>
        	
				</div>
			</div> 
	<!-- ================================================= -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<div class="card-body">
							<table class="table table-hover">		
							    <thead>
							        <tr>
							            <th style="width: 10%">학년</th>
							            <th style="width: 20%">교과목명</th>
							            <th style="width: 10%">학점</th>
							            <th style="width: 20%">이수구분</th>
							            <th style="width: 15%">교수명</th>
							            <th style="width: 20%">신청취소</th>
							        </tr>
							    </thead>
							    <tbody>
								    <c:if test="${empty withdraw }" >
										<tr>
											<td colspan="5">
												<strong>수강 철회 가능한 내역이 없습니다.</strong>
											</td>
										</tr>
									</c:if>	
									<c:forEach items="${withdraw}" var="withdraw" varStatus="status">
									<input type="hidden" name="scholCd" value="${withdraw.lecCd}">	
							        <tr>
							            <td>${withdraw.grade}</td>
							            <td>${withdraw.subjName}</td>
							            <td>${withdraw.credit}</td>
							            <td>${withdraw.lecCategoryCd}</td>
							            <td>${withdraw.name}</td>
							            <td>
							            	<button type="button" class="btn btn-secondary" data-toggle="popover" onclick="updateDetail('<%=request.getContextPath()%>/stu/schol/update?lecCd=${withdraw.lecCd }');">철회</button>
							            </td>
							        </tr>

							        </c:forEach>
							    </tbody>
							</table>
						</div>
					</div>
				</div>
			</div> 
		</div>
	</div>
</div> 
<script>

function updateDetail(){
	
	alert("선택하신 강의의 수강을 철회하시겠습니까?");

}
</script>