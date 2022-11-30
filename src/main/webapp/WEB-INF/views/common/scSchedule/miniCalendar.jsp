<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<!--   <meta charset='utf-8' /> -->
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<!--   <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"> -->

	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.css" rel="stylesheet">
	
<!-- 	<script	src="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.js"></script> -->
<!-- 	<script	src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script> -->
	
<!-- 	<link rel="stylesheet"	href="https://uicdn.toast.com/tui.time-picker/latest/tui-time-picker.css" /> -->
<!-- 	<link rel="stylesheet"	href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css" /> -->
	


</head>

<body>
<div class="container-fluid">
	<div class="row"  >
		<div class="card" >
		
			<div class="card-body" >
				<div id='calendar' style="overflow-y:hidden; width : 555px;"></div>
			</div>
		</div>	
	</div>
</div>
<script>


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
	          right: 'dayGridMonth'
	        }, // 월별로 보여줄지, 주별로 보여줄 지 선택하는  버튼 
		initialView: 'dayGridMonth',
		selectable: true,
		locale:'ko',
		events: scheduleList,
	   editable: false, // 수정 가능?
	   dayMaxEvents: true,
	   height:580
   });
   calendar.render();
 });

</script>

</body>