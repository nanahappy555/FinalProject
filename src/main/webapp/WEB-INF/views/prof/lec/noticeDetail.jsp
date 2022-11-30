<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">


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
               <button class="btn btn-outline-primary" type="button" onclick="pageMove('<%=request.getContextPath()%>/prof/lec/notice/modifyForm?lecCd=${notice.lecCd }&lecNoticeNo=${notice.lecNoticeNo}')">수정</button>&nbsp;&nbsp;
               <button class="btn btn-outline-danger" type="button" onclick="">삭제</button>&nbsp;&nbsp;
               <button class="btn btn-primary" type="button" onclick="window.close();">닫기</button>&nbsp;&nbsp;
            </div>
            <!-- ================================================= -->
            <!-- 버튼 끝 -->
            <!-- ================================================= -->
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


