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



<div class="pills-regular col-xl-12">

			<!-- ================================================= -->
			<!-- 탭LIST 시작 -->
			<!-- ================================================= -->
			<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="menuMove nav-item"><a class="nav-link active show"
					data-url="<%=request.getContextPath() %>/mylecture/notice/list?lecCd=${lecCd}"
					id="Stulenotice-tab" data-toggle="pill" href="#pills-lecnotice"
					role="tab" aria-controls="home" aria-selected="true">공지사항</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath()%>/stu/lec/mylecture/assign/list?lecCd=${lecCd}"
					id="Stulecassignment-tab" data-toggle="pill" href="#pills-lecqna"
					role="tab" aria-controls="profile" aria-selected="false">과제게시판</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/syllabus.do?lecCd=${lecCd}"
					id="Stureviews-tab" data-toggle="pill" href="#pills-lecassignment"
					role="tab" aria-controls="contact" aria-selected="false">강의계획서</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/pds/list?lecCd=${lecCd}"
					id="StuReference-tab" data-toggle="pill" href="#pills-lecmarks"
					role="tab" aria-controls="contact" aria-selected="false">자료실</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/qna/list?lecCd=${lecCd}"
					id="StuQna-tab" data-toggle="pill" href="#pills-lecattend"
					role="tab" aria-controls="contact" aria-selected="false">Q&A</a></li>

			</ul>
			<!-- ================================================= -->
			<!-- 탭 LIST 끝 -->
			<!-- ================================================= -->



<!-- 111111 -->
<div class="row">
   <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
      <div class="card">
         <h2 class="card-header">강의 공지사항 상세보기</h2>

         <div class="card-body m-3">
            <div class="row">
               <table class="table table-bordered">

                  <tbody>
                     <tr>
                        <th style="width:12%">제목</th>
                        <td colspan="3" class="table-title">${notice.title }</td>
                        
                     </tr>

                     <tr>
                        <th style="width:12%">작성자</th>
                        <td class="table-title" style="width:30%">${member.name}</td>
                        <th style="width:12%">날짜</th>
                        <td class="table-title"><fmt:formatDate value="${notice.cdate }" pattern="yyyy-MM-dd"/></td>
                     </tr>
                  <c:if test="${notice.anoCd }">
                     <tr>
                     	<th style="width:12%">첨부파일</th>
                        <td class="table-title" colspan="3">파일명</td>
                     </tr>
                  </c:if>
                     <tr>
                        <td colspan="4" class="table-title">
                           <p class="m-3">
                            ${notice.content }
                           </p>
                        </td>
                     </tr>
                     
                  </tbody>
               </table>
            </div>
            
            
            <!-- ================================================= -->
            <!-- 버튼 시작 -->
            <!-- ================================================= -->
            
            <div class="row justify-content-end mt-3">
            <sec:authorize access="hasAuthority('prof')">	
               <button class="btn btn-outline-primary" type="button" onclick="pageMove('<%=request.getContextPath()%>/prof/lec/notice/modifyForm?lecNoticeNo=${notice.lecNoticeNo}')">수정</button>&nbsp;&nbsp;
               <button class="btn btn-outline-danger" type="button" onclick="">삭제</button>&nbsp;&nbsp;
             </sec:authorize>
               <button class="btn btn-primary" type="button" onclick="javascript:history.back()">목록</button>&nbsp;&nbsp;
            </div>
            <!-- ================================================= -->
            <!-- 버튼 끝 -->
            <!-- ================================================= -->
         </div>
      </div>
   </div>
</div>
</div>
<!-- 11111끝 -->


<!-- Modal -->
<div id="modifyModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">댓글 수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
        <p><input type="text" id="replytext" class="form-control"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="replyModBtn" onclick="replyModify_go();">Modify</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div><!-- Modal End -->

</div>
<script>
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}

	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}
</script>

