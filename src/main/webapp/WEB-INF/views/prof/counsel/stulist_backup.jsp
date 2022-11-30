<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-fluid">

	<div class="accrodion-regular">
		<div id="accordion">



<c:forEach items="${stuList }" var="list">
			<div class="card">

				<div class="card-header" id="heading${list.stuCd }">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapse${list.stuCd }" aria-expanded="false"
							aria-controls="collapse${list.stuCd }"><span>${list.stuCd }</span>
						</button>
					</h5>
				</div>
				<div id="collapse${list.stuCd }" class="collapse" aria-labelledby="heading${list.stuCd }"
					data-parent="#accordion" style="">
					<div class="card-body">
					
					<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="margin-right : 0px; margin-left:0px;">
				<div class="card col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6" style="position:relative">
					<h3 class="card-header cardHead" ><i class="fas fa-id-card"></i>&nbsp;&nbsp;${list.name }님의  개인 정보
					</h3>
					<div class="card-body row"  style="padding-left:50px;">
						<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4 text-center" style="padding-left:0px;  position:relative;">
						<p style="font-weight : bolder; margin-bottom:0px; font-size : 30px; text-align: center;" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">${list.name}
	            		  	 </p>
	            		  	 
	                         <span id="memImg" class="manPicture" data-anoCd="${list.anoCd}"
	            		  	   		      style="display:block;width:200px;height:250px;margin:0 0px; border-radius: 20px;"></span>
	            		      
		                 </div>
		                 <div style="margin-left : 20px;" class="col-xl-7 col-lg-7 col-md-7 col-sm-7 col-7">
		                 	<table class="table table-hover">
									<tr>
							        	<th scope="col">연락처</th>
							        	<td ><input name="phone" class="form-control" value="${list.phone }"/></td>
							        </tr>		                 	
							    	<tr>
							        	<th scope="col">이메일</th>
							            <td ><input name="email" class="form-control" value="${list.email }"/></td>
							            
							        </tr>
							        <tr>
							        	<th scope="col">주소</th>
							        	<td>
							        	<input name="add1" class="form-control" value="${list.add1}"/>
							        	<input name="add2" class="form-control" value="${list.add2}"/>
							        	</td>
							        </tr>
		                 	</table>
		                 </div>
					</div>
				</div>
			</div>
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
						<a href="#" class="btn btn-secondary">메일보내기</a>
					</div>
				</div>
			</div>

</c:forEach>
		</div>
	</div>

</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->

<script>
MemberPictureThumb("<%=request.getContextPath()%>");
</script>