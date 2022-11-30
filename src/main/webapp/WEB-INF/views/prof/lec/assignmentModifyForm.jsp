<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<style>
.tui-datepicker {
	z-index: 999;
}
</style>

<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />

</head>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="main-content-jsp">

	<!-- 111111 -->
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h2 class="card-header">과제 수정하기</h2>
				<form role="form" method="post" action="<%=request.getContextPath() %>/prof/lec/assignment/remove" name="registForm">
				<div class="card-body">
					<div class="row">

						<table class="table table-bordered">

							<tbody>
								<tr>
									<th style="width: 10%">제목</th>
									<td class="table-title"><input type="text" value="${detail.title }" />
									
									  <input type="hidden" name="assBno" value="${detail.assBno }">
                        			  <input type="hidden" name="lecCd" value="${detail.lecCd }">
									</td>
									
									<th style="width: 10%">시작날짜</th>
									<td class="table-title">


										<div
											class="tui-datepicker-input tui-datetime-input tui-has-focus">
											<input type="text" id="datepicker-input"
												aria-label="Date-Time"> <span class="tui-ico-date"></span>
										</div>
										<div id="wrapper" style="margin-top: -1px;"></div>
									</td>
								</tr>
								<tr>
									<th style="width: 10%">첨부파일</th>
									<td class="table-title"><input type="file" /></td>
									<th style="width: 10%">마감날짜</th>
									<td class="table-title">


										<div
											class="tui-datepicker-input tui-datetime-input tui-has-focus">
											<input type="text" id="datepicker-input-1"
												aria-label="Date-Time"> <span class="tui-ico-date"></span>
										</div>
										<div id="wrapper-1" style="margin-top: -1px;"></div>




									</td>
								</tr>

							</tbody>
						</table>
						<div class="col-xl-12">
							
								<div class="form-group">
									<label for="content"></label>
									<textarea class="textarea" name="content" id="content"
										rows="20" placeholder="1000자 내외로 작성하세요."
										style="display: none;"></textarea>
								</div>
							
						</div>
					</div>



					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					<div class="hii"></div>
					<div class="row justify-content-end mt-3">
						<!--                <button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
						<!--                <button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
						<!--                <button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
						<!--                <br> -->
						<div class="col-xl-8">
							<button class="btn btn-outline-primary" type="button"
								onclick="regist_go()">등록</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-danger" type="button"
								onclick="f_alert();">취소</button>
							&nbsp;&nbsp;
						</div>
					</div>
					<!-- ================================================= -->
					<!-- 버튼 끝 -->
					<!-- ================================================= -->
				</div>
				</form>
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
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="replyModBtn"
						onclick="replyModify_go();">Modify</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>



	</div>
	<!-- Modal End -->
</div>

<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>'); 
}
</script>
<script
	src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
<script
	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>



<script>
var beginHour = 9;
var endHour = 19;
var beginMin = 00;
var endMin = 00;

var begin = { hour: 9, minute: 30 };
var end = { hour: 18, minute: 40 };

var datepicker = new tui.DatePicker('#wrapper', {
    date: new Date(),
    language: 'ko',
    input: {
      element: '#datepicker-input',
      format: 'yyyy-MM-dd HH:mm A'
      
    },

    timePicker: {
    	 initialHour: 9,
         initialMinute: 00,
         inputType: 'selectbox',
         hourStep: 1,
         minuteStep: 15,
         showMeridiem: false,
    	      
    }
  });

  
var datepicker1 = new tui.DatePicker('#wrapper-1', {
    date: new Date(),
    input: {
      element: '#datepicker-input-1',
      format: 'yyyy-MM-dd HH:mm A'
    },
    timePicker: {
   	 initialHour: 9,
        initialMinute: 00,
        inputType: 'selectbox',
        hourStep: 1,
        minuteStep: 15,
        showMeridiem: false,
   	      
   }
  });
  
var toastDate = datepicker.getDate();
console.log("토스트날짜",toastDate);
  
// var createDate = '${detail.createDate}';
// console.log("DB날짜",createDate);
// datepicker.setInput('#wrapper',createDate);''
datepicker.setDate('Tue Nov 10 2022 14:45:43 GMT+0900 (한국 표준시)');
</script>

<script>

function regist_go(){
	alert("hi");
}
</script>