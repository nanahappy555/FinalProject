<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->






<div class="container-fluid">

 <div class="row">
 	<div class="col-xl-12">
		<div class="card">
			<h5 class="card-header" style=font-size:35px;>강의신청서</h5>
				<div class="card-body">
				
         		<table class="table table-hover" border="1" >
         
            
	               <tr>
	                  <th style=background-color:#F0F0F8>과목코드</th>
	                  <td>${syllaDetail.subjCd }</td>
	                  <th style=background-color:#F0F0F8>이수구분</th>
	                  <td>${syllaDetail.lecCategoryCd }</td>
	                  <th style=background-color:#F0F0F8>대상학년</th>
	                  <td>${syllaDetail.targetGrade }</td>
	                  <th style=background-color:#F0F0F8>학점</th>
	                  <td>${syllaDetail.credit }</td>
	        
	               </tr>
           
          		
        
            
	               <tr>
	                  
	                  <th style=background-color:#F0F0F8>최대수강인원</th>
	                  <td>${syllaDetail.maxStuNum }</td>
	                  <th style=background-color:#F0F0F8>강의 시수</th>
	                  <td>${syllaDetail.lecHour }</td>
	                  <th style=background-color:#F0F0F8>교재 및 참고서</th>
	                  <td>${syllaDetail.materials}</td>
	                  <th style=background-color:#F0F0F8>교양 카테고리</th>
	                  <td>${syllaDetail.geCd }</td>
	                 
	               </tr>
              
              
	               <tr>
	                  
	                  <th style=background-color:#F0F0F8>중간고사비율</th>
	                  <td>${syllaDetail.midRatio }</td>
	                  <th style=background-color:#F0F0F8>기말고사 비율</th>
	                  <td>${syllaDetail.finalRatio }</td>
	                  <th style=background-color:#F0F0F8>과제 비율</th>
	                  <td>${syllaDetail.assignRatio }</td>
	                  <th style=background-color:#F0F0F8>출결비율</th>
	                  <td>${syllaDetail.attendRatio }</td>
	                 
	               </tr>
              
              
	               <tr>
	                  
	                  <th style=background-color:#F0F0F8>평가구분</th>
	                  <td>${syllaDetail.evalClassCd }</td>
	                  <th style=background-color:#F0F0F8>강의시간 1</th>
	                  <td>${syllaDetail.lecDate1 }</td>
	                  <th style=background-color:#F0F0F8>강의시간 2</th>
	                  <td>${syllaDetail.lecDate2 }</td>
	                  
	                 
	               </tr>
               
	               <tr>
	                  
	                  <th style=background-color:#F0F0F8>교과목 개요</th>
	                  <td colspan="7">${syllaDetail.outLine }</td>
	                  
	                </tr>
      
                 
	                <tr>
	                  <th style=background-color:#F0F0F8>주차</th>
	                  <th colspan="3" style=background-color:#F0F0F8>학습목표</th>
	                  <th colspan="4" style=background-color:#F0F0F8>학습내용</th> 
	               </tr>
	             
	             <c:forEach items="${WeekDetail}" var="wList">  
	               <tr>
	                  <td>${wList.weekNo }</td>
	                  <td colspan="3" class="table-title" >${wList.goal }</td>
	                  <td colspan="4" class="table-title" >${wList.content }</td> 
	               </tr>
	             </c:forEach>  
               
              	       
           
         	  </table>
   			<div class="row justify-content-end mt-2 mr-2">
			<button class="btn btn-outline-primary btn-lg" type="button"onclick="approve('ok');">승인</button>&nbsp;&nbsp;
			<a href="#"  data-toggle="modal" data-target="#disapproveModal" class="btn btn-outline-danger btn-lg" >반려</a>

		</div>
 			</div>
		 </div>
 	</div> 
 	
 </div>
     
 </div>
 
 
                                                <!-- Modal -->
                                                <div class="modal fade" id="disapproveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog" role="document">
                                                    
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" >반려사유 입력</h5>
                                                                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </a>
                                                            </div>
                                                            <div class="modal-body">
                                                                
                                                                <textarea class="form-control" id="textArea" rows="5" style="resize:none;"  name="rejReason">${syllaDetail.rejReason }</textarea>
                                                                
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary" onclick="approve('nok')">저장하기</button>
                                                                <a href="#" class="btn btn-secondary" data-dismiss="modal">닫기</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
 
 
<script>

var sylCd = '<%=request.getParameter("sylCd")%>';

var rejReason = $('textarea[name=rejReason]');


function approve(status) {
		
	
		
		var rejReason = $('textarea[name=rejReason]').val();
		
		var payload = {
			sylCd:sylCd,
	    	applyStatusCd:status,
	    	rejReason:rejReason
	    	
			}
		
 	console.log("페이로드"+JSON.stringify(payload));
	
		
		
		
		
		
		
	    $.ajax({
	        method:"post",
	        url:"changeStatus",
	        contentType : "application/json; charset=utf-8",
	        data:JSON.stringify(payload),
	        success:function(data){
	        	
	        	
	        	
	        	Swal.fire('저장했습니다!', '', 'success').then(function(){
	        		location.href="<%=request.getContextPath()%>/staff/lecManage/applyList.do";
	        	});
	        	
	        	
	        	
	        	
// 	            console.log("콘솔"+JSON.stringify(payload));
// 	            console.log("콘솔22"+data);
	            
	        },
	        error:function(){
	        	Swal.fire('실패하였습니다.', '', '닫기')
	        }
	    });
	    
	    
	    
	    
	    
	    
	}
	
</script>
 

