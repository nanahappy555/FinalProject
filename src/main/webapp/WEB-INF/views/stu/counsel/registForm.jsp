<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.tui-datepicker {
	z-index: 999;
}
</style>

<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<h3 class="card-header">상담 신청</h3>	
		<div class="card-body">

  <!-- Main content -->
		<div class="card">	
			<div class="card-body">
			
				<div class="row justify-content-center">					
					<div class="user-avatar float-xl-left pr-4 float-none">
						<span id="memImg" class="manPicture" data-anoCd="${prof.anoCd}"
	            		  	   		      style="display:block;width: 150px; height: 150px; border-radius: 70%; overflow: hidden;"></span>
					</div>	
				</div>
				<div class="row justify-content-center">
					<h3 class="font-24 m-b-10" style="font-weight: bold;">${prof.name }&nbsp;교수</h3>
				</div>
				
				<input type="hidden" name="profId" value="${prof.profCd }">
				
				
				<div class="row justify-content-center">
					<label for="counselDate" class="col-sm-2 control-label text-center">날짜 선택</label>
					<div class="tui-datepicker-input tui-datetime-input tui-has-focus ">
						<input type="text" id="datepicker-input" aria-label="Date-Time" name="selectDate"> <span class="tui-ico-date"></span>
					</div>
				</div>

				
				<div id="wrapper" style="margin-top: -1px; position:absolute; left:30%;"></div>
				
				<div class="row justify-content-center" style="margin-top:20px;">
					<div id="summernote"></div>

				</div>
				
				<div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="float-xl-right float-none mt-xl-0 mt-2 row justify-content-end">
						<button class="btn btn-secondary" id="btn_register">예약신청</button>
					</div>
				</div>
			
			</div>
		</div>
	</div>

		
</div>		

<input type="hidden" id="selectDate" value="">

<script
src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
<script
src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>



<script>

var datepicker = new tui.DatePicker('#wrapper', {
	
    date: new Date(),
    selectableRanges: [
        [new Date(), new Date(2222, 0, 1)]
        
    ],
    language: 'ko',
    input: {
      element: '#datepicker-input',
      format: 'yyyy-MM-dd HH:mm A',

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

			
			
			
</script>

<script type="text/javascript">



var pickDate = datepicker.getDate();
var selectDate = f_transFormatToTime(pickDate); 
	//글쓰기
	/*
	function f_regist() {
		var selectDate = datepicker.getDate(); //Thu Oct 13 2022 22:01:13 GMT+0900 (한국 표준시) 
		/* var selectDate = f_transFormat(date); // 2022-10-13 
		console.log(selectDate);
		const content = $('#summernote').summernote('code');
		const formData = new FormData;
		formData.append("content", content);
		/* console.log("content" + content); 
	}
	*/
	datepicker.on('change', ()=> {
		alert("날짜선택함");
		pickDate = datepicker.getDate(); //Thu Oct 13 2022 22:01:13 GMT+0900 (한국 표준시)
		
		
		selectDate = f_transFormatToTime(pickDate); 
		document.querySelector('#selectDate').value = selectDate;
	console.log({pickDate,selectDate})
	});
	
	
	$("#btn_register").on("click",()=> {
		
		const content = $('#summernote').summernote('code');
// 		selectDate = document.querySelector('#selectDate').value;S
		var profId=$('input[name=profId]').val();
		
		var params = {
				  "appContent":content,
				  "profId":profId,
				  "applyDate":selectDate
		};
		console.log(params);
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/stu/counsel/apply",
			data: params, 
			dataType:"text", // 보통 받아온 데이터에 JSON.parse를 할지 안할지 여부
			success:(rslt)=>{
				Swal.fire(
						  '신청완료.'
						  
						).then(()=>{
							CloseWindow();
						});
						
						
						
						
			},
			error:(request,status,error)=>{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
			}
		});
});
	


</script>
<script>
window.onload=function(){
	summernote_go($('#summernote'),'<%=request.getContextPath()%>'); 
}
</script>





<script>
$(document).ready(function() {
	
	  $('#summernote').summernote({
		  placeholder:'상담 원하는 내용을 간략하게 적어주세요.',
			lang:'ko-KR',
			width:500,
			height:150,
		  
		  toolbar: [
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			  ]
		  
	  });
	});
	
	
</script>




