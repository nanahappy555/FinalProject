<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<style>
    #myModal {   /* 모달창 기본 css*/
        position:fixed; 
        width:100%;
        height:100%;  /* 화면을 꽉 채움  fixed인 경우 % 작동됨 */
        background-color: rgba(0,0, 0, 0.3);
    }
    #content {    /* 내용 담을 영역 */
        margin: 2% auto;
        width:30%;
        height:60%;
        background-color: white;
        border-radius: 10px;
        
    }
    textarea {
    font-size: 15px;
        width: 75%;
        height: 250px;
        border: none;
        outline-color: white;
      }
	</style>
</head>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->


<div class="card">
	<div class="card-body">
		<div class="main-content-jsp">
		    <div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-12 col-sm-12 col12">
			<div class="card">
				<div class="card-body">
					<h4>* 진행상황이 '반려'인 글을 클릭하면 '반려사유'를 확인 하실 수 있습니다.</h4>
					<table class="table table-hover">
					    <thead>
					        <tr>
					            <th scope="col">글번호</th>
					            <th scope="col">상담시간</th>
					            <th scope="col">장소</th>
					            <th scope="col">담당교수</th>
					            <th scope="col">진행상황</th>
					        </tr>
					    </thead>
					    <tbody>
					    	<c:if test="${empty applyList }" >
								<tr>
									<td colspan="5">
										<strong>상담 신청 내역이 없습니다.</strong>
									</td>
								</tr>
							</c:if>	
					    	<c:forEach items="${applyList }" var="apply" varStatus="status">
					    		<c:choose>
					    			<c:when test="${apply.appStatusCd eq '반려'}"> 
					    				<tr onclick="f_modal('${apply.rejReason}')">
								            <th scope="row">${((cri.page+1)*0)+status.count}</th>
								            <td>
								            	<fmt:formatDate value="${apply.applyDate }" pattern="yyyy-MM-dd HH:mm"/>
								            </td>
								            <td>${apply.csLocation }</td>
								            <td>${apply.profId }</td>
								            <td style="color: red;">${apply.appStatusCd }</td>
								        </tr>
					    			</c:when>
					    			
					    			<c:when test="${apply.appStatusCd eq '승인'}"> 
					    				<tr onclick="f_modal('${apply.rejReason}')">
								            <th scope="row">${((cri.page+1)*0)+status.count}</th>
								            <td>
								            	<fmt:formatDate value="${apply.applyDate }" pattern="yyyy-MM-dd HH:mm"/>
								            </td>
								            <td>${apply.csLocation }</td>
								            <td>${apply.profId }</td>
								            <td style="color: blue;">${apply.appStatusCd }</td>
								        </tr>
					    			</c:when>
					    			
								    <c:otherwise>
								    	<tr>
								            <th scope="row">${((cri.page+1)*0)+status.count}</th>
								            <td>
								            	<fmt:formatDate value="${apply.applyDate }" pattern="yyyy-MM-dd HH:mm"/>
								            </td>
								            <td>${apply.csLocation }</td>
								            <td>${apply.profId }</td>
								            <td style="font-weight:bold; color: black;">${apply.appStatusCd }</td>
								        </tr>
								    </c:otherwise>  
								      
					        	</c:choose>
					        </c:forEach>
					    </tbody>
					</table>
				</div>
						
			</div>
					<!--
 					<div class="row justify-content-end mr-3">
					<input type="button" value="반려사유" onclick="f_modal()">
					</div> 
					-->
		</div>
				
				
				
				
							<!-- 모달 달달달달하다-->
				<div class="card" id="myModal" style="display:none">
					
			        <div class="card-body" id="content" class="modal-content">
			        <h3 class="card-header row justify-content-center" style="font-weight: bold;">반려사유</h3>
						<div class="row justify-content-center">
							<textarea style="margin: 5%" id="rejReason" readonly="readonly"></textarea>
						</div>		    
				        <div class="row justify-content-end mr-3">
			         		<input type="button" class="btn btn-sm btn-primary" style="font-size: 1em;" name="" value="close" onclick="f_close()">
			         	</div>
					</div>  
				</div>
				
				
				
				
			</div>
		</div>
	</div>
</div>


<script>
	var v_myModal = document.querySelector("#myModal");
	function f_close(){
	  v_myModal.style.display = "none";   //   있어도 누네 안보이겡
	}
	function f_modal(reason){
	     v_myModal.style.display = "block";   //  눈에 보이겡
	     
	     $('#rejReason').val(reason)
	     
	}
</script>