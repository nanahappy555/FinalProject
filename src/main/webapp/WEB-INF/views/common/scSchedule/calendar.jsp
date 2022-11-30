<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.css" rel="stylesheet">
	
	<script	src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script>
	<script	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
	
	<link rel="stylesheet"	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" />
	<link rel="stylesheet"	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" />
	


</head>


<body>
<div class="container-fluid">
<div class="card" >

	<div class="card-body row">
		
		<div class="card col-3 col-lg-3" style="margin-top: 55px; margin-bottom: 0px;">
			
			<div class="card" id="scheduleDetail" style="height:550px; display:none;">
			
				<div class="card-header">
					<div style="font-size: 20px;display:inline-block; text-align:center; width:100%"><strong>일정 상세 보기</strong></div>
				</div>
				<div class="card-body">
					
					<sec:authorize access="hasAuthority('staff')">
					<div class="form-group row">
						<label for="memId" class="col-4 col-xl-4  col-form-label text-right">등록자</label>
						<div class="col-8 col-xl-8">
							<input id="memId" readonly type="text" class="form-control">
						</div>
					</div>
					</sec:authorize>
					<div class="form-group row">
						<label for="detailTitle" class="col-4 col-xl-4  col-form-label text-right">일정 제목</label>
						<div class="col-8 col-xl-8">
							<input id="detailTitle" readonly type="text" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label for="detailStart" class="col-4 col-xl-4  col-form-label text-right">일정 시작 시간</label>
						<div class="col-8 col-xl-8">
							<input id="detailStart" readonly type="text" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label for="detailEnd" class="col-4 col-xl-4 col-form-label text-right">일정 종료 시간</label>
						<div class="col-8 col-xl-8">
							<input id="detailEnd" readonly type="text" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label for="detailText" class="col-4 col-xl-4 col-form-label text-right">일정 상세 내용</label>
						<div class="col-8 col-xl-8">
							<textarea id="detailText" rows="10" readonly class="form-control"></textarea>
						</div>
					</div>
					<sec:authorize access="hasAuthority('staff')">
					<div class="row align-self-center justify-content-center">
						<input type="button" onclick="deleteSch()" class="btn btn-secondary" value="일정 삭제">
						<input type="button" onclick="addSchedule()" class="btn btn-primary" style="margin-left:10px;" value="일정 등록 하러 가기">
						
					</div>
					</sec:authorize>
					<input type="hidden" id="detailId" value="">
				</div>
				
			
			</div>
		
			<sec:authorize access="hasAuthority('staff')">
			<div class="card" id="scheduleAdd" style="height:550px; display:block">
				<div class="card-header">
					<div style="font-size: 20px;display:inline-block; text-align:center;  width:100%"><strong>일정 등록 하기 </strong></div>
				</div>
				<div class="card-body">
					<select id="oneOrMulti" class="form-control col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12" style="margin-bottom:8px">
					<option value="one">하루 일정</option>
					<option value="multi">연속 일정</option>
					</select>
					<div class="row" style="margin-bottom:8px">
					<label for="eventName" class="col-3 col-xl-4 col-form-label text-right">일정 이름</label><input type="text" class="form-control col-3 col-xl-8"  id="eventName"><br>
					</div>
					<div id="selectOne">
						<div class="row">
						<label for="datepicker-input3" class="col-3 col-xl-4 col-form-label text-right">일정 시작</label>
							<div
								class="tui-datepicker-input tui-datetime-input tui-has-focus">
								<input type="text" id="datepicker-input3" name="oneDate" aria-label="Date-Time"> <span class="tui-ico-date"></span>
							</div>
							<div id="wrapper-3" class="dateCss" style="margin-top: -1px;"></div>
						</div>
					</div>
					<div id="selectMulti" style="display:none;">
						<div class="row">
						<label for="datepicker-input" class="col-3 col-xl-4 col-form-label text-right">일정 시작</label> 
							<div
								class="tui-datepicker-input tui-datetime-input tui-has-focus">
								<input type="text" id="datepicker-input" name="createDate" aria-label="Date-Time"> <span class="tui-ico-date"></span>
							</div>
							<div id="wrapper" class="dateCss" style="margin-top: -1px;"></div>
						</div>
						<div class="row">
							<label for="datepicker-input-1" class="col-3 col-xl-4 col-form-label text-right">일정 종료</label>
							<div
								class="tui-datepicker-input tui-datetime-input tui-has-focus">
								<input type="text" id="datepicker-input-1" name="dueDate"
									aria-label="Date-Time"> <span class="tui-ico-date"></span>
							</div>
							<div id="wrapper-1" class="dateCss" style="margin-top: -1px;"></div>
						</div>	
					</div>
					<div class="row">
					<label for="addDetail" class="col-3 col-xl-4 text-right">일정 상세</label><textarea rows="10" id="addDetail" class="form-control col-3 col-xl-8"></textarea>
					</div>
					<br>
					<br>
						<input type="button" onclick="addEvent()" class="btn btn-primary" value="일정등록">
						<!--  <input type="button" value="일정 등록" class="btn btn-primary col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12" data-toggle="modal" data-target="#exampleModal">
						-->
				</div>
			</div>
			</sec:authorize>
		</div>
		<div id='calendar' class="col-9 col-lg-9"></div>
	</div>
</div>
</div>


<%--권한 확인 후 화면 설정 --%>
<c:if test="${loginUser.memClassCd ne 'staff'}">
<script>
	$('#scheduleDetail').css('display','block');
</script>
</c:if>

<script>

$('.dateCss').css({ "margin-left" : "110px", "margin-top": "0px","z-index":"9"});  //달력(calendar) 위치


function addSchedule(){
	$('#scheduleAdd').css("display",'block');
	$('#scheduleDetail').css("display",'none');
}


var scheduleList = ${scheduleList};
for(var i=0;i<scheduleList.length;i++){
	var startBefore = scheduleList[i].start
	var startAfter = startBefore.replace(/\*/gi,"T");
	scheduleList[i].start = startAfter;
	var endBefore = scheduleList[i].end
	if(endBefore){
		var endAfter = endBefore.replace(/\*/gi,"T");
		scheduleList[i].end = endAfter;
	}
}
console.log(scheduleList)
</script>



<script>
var calendar = null;

 document.addEventListener('DOMContentLoaded', function() {
   var calendarEl = document.getElementById('calendar');
   calendar = new FullCalendar.Calendar(calendarEl, {
	   headerToolbar: {
	          left: 'prev,next today',
	          center: 'title',
	          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
	        }, // 월별로 보여줄지, 주별로 보여줄 지 선택하는  버튼 
		initialView: 'dayGridMonth',
		selectable: true,
		locale:'ko',
		events: scheduleList,
	   editable: true, // 수정 가능?
	   dayMaxEvents: true,
	   height:670,
		   eventDrop: function(info) {
			   
	
			    if (! confirm(info.event.title + "이 변경되었습니다. 변경 하시겠습니까?")) {
			      info.revert();
			    }else{
			    	info.event.setExtendedProp("memId",'${loginUser.memId}');
			    }
			  },
	  
	        eventAdd: function(obj) {
	        	console.log("이벤트 추가 이벤트!!!");// 이벤트가 추가되면 발생하는 이벤트
		   console.log("추가 : ",obj)
			console.log("추가 id  : ",obj.event.id)
			console.log("추가  title : ",obj.event.title)
			console.log("추가  start: ",obj.event.start)
		//	console.log("추가  groupId: ",obj.event.groupId)
			console.log("추가  end: ",obj.event.end)
			var startDateObj = obj.event.start
			var endDateObj = obj.event.end
			var calendarData =null;
	   		var detailText = $('#addDetail').val();
	   		//상세 일정 추가
	  
		  	$('#detailEnd').val("");
			$('#detailStart').val("");
			$('#detailText').html("");
			$("#addDetail").val("");
			
			console.log("상세",obj.event.detail)
			console.log("ttt",$('#detailText').val())
			if(endDateObj){
				var calendarData = {
			   		title:obj.event.title,
			   		//scheDetail:obj.event.groupId,
			   		scheId:obj.event.id,
			   		startYear:startDateObj.getFullYear(),
			   		startMonth:startDateObj.getMonth()+1,
			   		startDate:startDateObj.getDate(),
			   		startHour:startDateObj.getHours(),
			   		startMinute:+startDateObj.getMinutes(),
			   		endYear:endDateObj.getFullYear(),
			   		endMonth:endDateObj.getMonth()+1,
			   		endDate:endDateObj.getDate(),
			   		endHour:endDateObj.getHours(),
			   		endMinute:endDateObj.getMinutes(),
			   		detail:detailText
		   		}
			}else{
				var calendarData = {
				   		title:obj.event.title,
				   		detail:detailText,
				   		scheId:obj.event.id,
				   		startYear:startDateObj.getFullYear(),
				   		startMonth:startDateObj.getMonth()+1,
				   		startDate:startDateObj.getDate(),
				   		startHour:startDateObj.getHours(),
				   		startMinute:startDateObj.getMinutes(),
			   		}
			}
			
			
			
			
			Swal.fire({
		        title: '일정을 등록하시겠습니까?',
		        showDenyButton: true,
		        confirmButtonText: '네',
		        denyButtonText: '아니오',
		      }).then((result) => {
		        if (result.isConfirmed) {
		        	$.ajax({
						url:'<%=request.getContextPath()%>'+'/common/scSchedule/calendar/insert',
						type:"post",
						data:JSON.stringify(calendarData),
						contentType:"application/json; charset=utf-8",
						dataType:"json",
						success:function(data){
							Swal.fire(
									  '성공적으로 등록했습니다.',
									  '',
									  'success'
									).then(function(){
										location.href=location.href;
									});
									
							
						},
						error:function(){
//		 					alert("에러")
						}
					})
		        	
		        	
		        	
		        
		               }
		            });
		           
			
		},
		eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
			console.log("이벤트 변경 이벤트!!!");
			console.log(obj);
		  	console.log("변경 : ",obj);
			console.log("변경 id  : ",obj.event.id);
			console.log("변경  start: ",obj.event.start);
			console.log("변경  end: ",obj.event.end);
			console.log("변경  상세: ",obj.event.extendedProps.detail);
			
			var startDateObj = obj.event.start
			var endDateObj = obj.event.end;
			let detail = obj.event.extendedProps.detail
			var memId='${loginUser.memId}';
	
			
			var changeData =null;
			if(endDateObj){
				changeData = {
			   		title:obj.event.title,
			   		scheId:obj.event.id,
			   		memId:memId,
			   		startYear:startDateObj.getFullYear(),
			   		startMonth:startDateObj.getMonth()+1,
			   		startDate:startDateObj.getDate(),
			   		startHour:startDateObj.getHours(),
			   		startMinute:+startDateObj.getMinutes(),
			   		endYear:endDateObj.getFullYear(),
			   		endMonth:endDateObj.getMonth()+1,
			   		endDate:endDateObj.getDate(),
			   		endHour:endDateObj.getHours(),
			   		endMinute:endDateObj.getMinutes(),
			   		detail:detail
		   		}
			}else{
				changeData = {
				   		title:obj.event.title,
				   		detail:detail,
				   		memId:memId,
				   		scheId:obj.event.id,
				   		startYear:startDateObj.getFullYear(),
				   		startMonth:startDateObj.getMonth()+1,
				   		startDate:startDateObj.getDate(),
				   		startHour:startDateObj.getHours(),
				   		startMinute:startDateObj.getMinutes(),
			   		}
			}
			
			$.ajax({
				url:'${webPath}/common/scSchedule/calendar/update',
				data:JSON.stringify(changeData),
				dataType:"json",
				contentType:"application/json; charset=utf-8",
				type:"post",
				success:function(data){
					console.log(data.msg);
					$('#scheduleAdd').css("display",'none');
					$('#scheduleDetail').css("display",'block');
					$('#detailTitle').val(obj.event.title);
					$('#detailStart').val(`\${startDateObj.getFullYear()}년 \${startDateObj.getMonth()+1}월 \${startDateObj.getDate()}일 \${startDateObj.getHours()}시 \${startDateObj.getMinutes()}분`)
					if(endDateObj){
						$('#detailEnd').val(`\${endDateObj.getFullYear()}년 \${endDateObj.getMonth()+1}월 \${endDateObj.getDate()}일 \${endDateObj.getHours()}시 \${endDateObj.getMinutes()}분`);
					}else{
						$('#detailEnd').val('');
					}
					$('#detailText').val(detail);
					$('#memId').val(memId);
					$('#detailTitle').attr("title",obj.event.title);
					
				},
				error:function(){
// 					alert("에러")
				}
				
			})
		},
		eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
		  	console.log("삭제 : ",obj);
			console.log("삭제 id  : ",obj.event.id);
			console.log("삭제  title : ",obj.event.title);
			console.log("삭제  start: ",obj.event.start);
			console.log("삭제  end: ",obj.event.end);
			$.ajax({
				url : '${webPath}/common/scSchedule/calendar/delete',
				data : {scheId:obj.event.id},
				type:"post",
				success:function(data){
					console.log(data.msg);
					$('#scheduleAdd').css("display",'none');
					$('#scheduleDetail').css("display",'block');
					$('#detailTitle').val('');
					$('#detailStart').val('');
					$('#detailEnd').val('');
					$('#detailText').val('');
					$('#detailTitle').removeAttr("title");
					$('#memId').val('');
					
				},
				error:function(){
// 					alert("에러")
				}
				
				
			})
		},
		eventClick:function(info){
			$('#detailEnd').val("");
			$('#detailStart').val("");
			$('#detailText').val("");
			showDetail(info);
			$('#scheduleAdd').css("display",'none');
			$('#scheduleDetail').css("display",'block');
		}
		 
		
   });
 if(${loginUser.memClassCd ne 'staff'}){
	   calendar.setOption('editable',false);
   }
   calendar.render();
 });

</script>


<script>


var beginHour = 00;
var endHour = 00;
var beginMin = 00;
var endMin = 00;

var begin = { hour: 0, minute: 30 };
var end = { hour: 0, minute: 40 };

var datepicker = new tui.DatePicker('#wrapper', {
    date: new Date(),
    language: 'ko',
    input: {
      element: '#datepicker-input',
      format: 'yyyy-MM-dd HH:mm A'
      
    },
    timePicker: {
      	 initialHour: 0,
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
      	 initialHour: 0,
           initialMinute: 00,
           inputType: 'selectbox',
           hourStep: 1,
           minuteStep: 15,
           showMeridiem: false,
      	      
      }
    
  });

var datepicker3 = new tui.DatePicker('#wrapper-3', {
    date: new Date(),
    input: {
      element: '#datepicker-input3',
      format: 'yyyy-MM-dd HH:mm A'
    },
    timePicker: {
   	 initialHour: 0,
        initialMinute: 00,
        inputType: 'selectbox',
        hourStep: 1,
        minuteStep: 15,
        showMeridiem: false,
   	      
   }
  });
  
  
  

var id=parseInt(${maxSeq});
console.log("id :",id);
function addEvent(){
	var selectOption = $("#oneOrMulti").val()
	var selectMulti = $("#selectMulti");
	var selectOne = $("#selectOne");
	 var title = $("#eventName");
	 var startDate = $("#datepicker-input");
	 var endDate=$("#datepicker-input-1");
	 
	 var startDateArr = startDate.val().split(" ");
	 var endDateArr = endDate.val().split(" ");
	 console.log(endDateArr)
	 var addDetail=$("#addDetail");
	 
	 var oneStartDate = $("#datepicker-input3").val();
	 var oneStartDateArr = oneStartDate.split(" ");
	 var oneStartTime="";
	 if(oneStartDateArr[2]=="AM"){
	 	oneStartTime = oneStartDateArr[0]+"T"+oneStartDateArr[1]+":00";
	 }else if(oneStartDateArr[2]=="PM"){
		 oneStartTime = oneStartDateArr[0]+"T"+(parseInt(oneStartDateArr[1].split(":")[0])+12)+":"+oneStartDateArr[1].split(":")[1]+":00"
	 }
	 console.log("oneStartTime : ",oneStartTime)
	 if(selectOption=="multi"){
	 	if(!title.val()){
	 		Swal.fire({
	 			  icon: 'error',
	 			  title: '제목을 입력해주세요',
	 			})
	 		return;
	 	}
		
	 	 if(startDateArr[2]=="AM"){
	 		startDate = startDateArr[0]+"T"+startDateArr[1]+":00"
	 	 }else if(startDateArr[2]=="PM"){
	 		startDate = startDateArr[0]+"T"+(parseInt(startDateArr[1].split(":")[0])+12)+":"+startDateArr[1].split(":")[1]+":00"
	 	 }
	 	 
	 	 if(endDateArr[2]=="AM"){
	 		endDate = endDateArr[0]+"T"+endDateArr[1]+":00"
		 }else if(endDateArr[2]=="PM"){
		 		endDate= endDateArr[0]+"T"+(parseInt(endDateArr[1].split(":")[0])+12)+":"+endDateArr[1].split(":")[1]+":00"
		 }
	 	 
	   	
		console.log("시작 날짜:",startDate)
		console.log("종료 날짜:",endDate)
		calendar.addEvent({
		  title: title.val(),
		  start: startDate,
		  end: endDate,
		  id:id+1,
		//  groupId:addDetail.val()
		})
		
		    
	}
	else if(selectOption=="one"){
		if(!title.val()){
			Swal.fire({
	 			  icon: 'error',
	 			  title: '제목을 입력해주세요',
	 			})
			
			return;
		}
		console.log(oneStartDate)
		if(startDateArr[0]){
			console.log("시작 시간 ",oneStartTime)
			calendar.addEvent({
			    title: title.val(),
			    start: oneStartTime,
			    id:id+1,
			//    groupId:addDetail.val(),
			    allDay:false
			  })
		}
	}
	id=id+1;
	var info = calendar.getEventById(id);
	
	title[0].value="";
	selectMulti[0].style.display="none";
	selectOne[0].style.display="block";
	$("#oneOrMulti").val("one")
	calendar.unselect()
}

$("#oneOrMulti").change(function(){
	let selectOption = $("#oneOrMulti").val()
	let selectMulti = $("#selectMulti");
	let selectOne = $("#selectOne");
	if(selectOption=='multi'){
		selectOne[0].style.display="none";
		selectMulti[0].style.display="block";
	}
	if(selectOption=='one'){
		selectMulti[0].style.display="none";
		selectOne[0].style.display="block";
	}
})
</script>
<script>

function showDetail(info){
	let detailTitle = $('#detailTitle').val(info.event.title);
	let detailStart = info.event.start;
	let memId = info.event.extendedProps.memId;
	
	console.log("아이디 확인 :"+memId);
	console.log(info)
	console.log("확인 : ",info.event.start);
	
	let detailStartTime = detailStart.getFullYear()+"년 "+(detailStart.getMonth()+1)+"월 "+detailStart.getDate()+"일 "+detailStart.getHours()+"시 "+detailStart.getMinutes()+"분 ";
	$('#detailStart').val(detailStartTime);
	
	let detailEnd = info.event.end;
	console.log("끝날짜",detailEnd)
	if(detailEnd){
		var detailEndTime = detailEnd.getFullYear()+"년 "+(detailEnd.getMonth()+1)+"월 "+detailEnd.getDate()+"일 "+detailEnd.getHours()+"시 "+detailEnd.getMinutes()+"분 ";
		console.log(detailEndTime)
		$('#detailEnd').val(detailEndTime);
	}
	var detailId=info.event.id;
	$("#detailId").val(detailId);
	
	console.log("디테일 객체 ",info)
	var detailText = info.event.extendedProps.detail;
	console.log("디테일 내용: ",detailText)
	$('#detailText').val(detailText);
	$('#detailTitle').attr("title",detailTitle.val());
	
	$('#memId').val(memId);
	
	
}

function deleteSch(){
	var id = $("#detailId").val();
	var info = calendar.getEventById(id);
	var memId='${loginUser.memId}';
	console.log(memId)
	console.log(info);
	var writer = info.extendedProps.memId;
	if(memId!=writer){
		Swal.fire({
			  icon: 'error',
			  title: '본인이 등록한 일정만 삭제 가능합니다.',
			})
		
		return;
	}
// 	console.log(info);


Swal.fire({
        title: info.title +"일정을 삭제하시겠습니까 ?",
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
        	info.remove();
        
               }
            }).then((result) => {
                	Swal.fire(
                			  '삭제되었습니다.',
                			  '',
                			  'success'
                			)
                
                    })


// 	if(confirm(info.title +"일정을 삭제하시겠습니까 ?")){
// 		 // 확인 클릭 시
// 	    info.remove();
// 	}
}
</script>


</body>