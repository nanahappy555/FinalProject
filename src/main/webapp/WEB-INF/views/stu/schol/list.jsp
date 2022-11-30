<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
<div class="card-body">
	
	<div class="row">
	<c:forEach items="${manageList}" var="manage" varStatus="status">
		<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4">
			<div class="card" style="height:330px">
				<h3 class="card-header"><i class="${manage.icon}"></i>&nbsp;&nbsp;${manage.scholName}</h3>
						<table class="table table-hover">
							<tbody>
							    <tr>
							        <th style="width: 20%" scope="row">대상</th>
							        <td>${manage.target }</td>
							    </tr>
							    <tr>
							        <th scope="row">혜택</th>
							        <td>${manage.content }</td>
							    </tr>
							    <tr>
							        <th scope="row">제출서류</th>
									<td>${manage.reqDocContent }
							    </tr>
							  	<tr>
							        <th scope="row">신청기간</th>
							        <td>
							        	<fmt:formatDate value="${manage.startDate}" pattern="yyyy년 MM월 dd일"/>
							        	부터 <fmt:formatDate value="${manage.endDate}" pattern="yyyy년 MM월 dd일"/> 까지
							        </td>
							   	</tr>
								<tr>
							        <th scope="row">신청</th>
									<td>
							       		<div class="row justify-content-center">
											<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/schol/registForm?scholCd=${manage.scholCd }','글쓰기',600,700);" >신청하기</button>
										</div>
						            </td>
						        </tr>
						    </tbody>
						</table>

			         </div>
				</div>
		</c:forEach> 
	</div>
	</div>
</div>