<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.css" rel="stylesheet">
	
<script>
//그리그 고정옵션
let options = {
		   column: 12,
		   minRow: 2,
		   maxRow: 10,
		   cellHeight: 180,
		   float:true,
		   removable: '#trash'
		};

var grid = GridStack.init(options); //초기화

var allWidgetList = [];
var usedWidgetList = [];

//삭제버튼
function f_removeBtn(e,dataLi) {
	var v_dataLi = dataLi;
	$('div[class=ms-selectable]>ul>li[data-li="'+dataLi+'"]').attr('class','ms-elem-selectable').css('display','');
	$('div[class=ms-selection]>ul>li[data-li="'+dataLi+'"]').attr('class','ms-elem-selection').css('display','none');

	var obj = document.querySelector('div[data-li="'+dataLi+'"]');
	var par = obj.parentNode;
	var gra = par.parentNode;
	
	var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
	for(var i = 0; i<v_usedWidgetList.length; i++){
		if(v_usedWidgetList[i].id == 2){
			usedWidgetList = usedWidgetList.splice(i);
// 			console.log("목록에서삭제",usedWidgetList);
// 			console.log("위젯목록제거-공지제거에서 set");
// 			localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
		}
	}
	
	grid.removeWidget(gra);
}

//1.프로필
var f_addProfileWidget =()=>{
	
	$.ajax({
 		type:'get',
 		url:'<%=request.getContextPath()%>/portlet/profile',
 		success: (rslt)=>{
 			var v_json=
			{
 			    "id": 1,
 			    "w": 3,
 			    "h": 2,
 			    "noResize": true,
 			    "noMove": true,
 			    "locked": true,
 			    "x": 0,
 			    "y": 0,
 			    "content": `<div class="card border-3 border-top border-top-primary" style="height:330px;">
 								<div class="card-body">
 									<div class="d-flex justify-content-center mt-2">
 										<div class="d-inline-block"><button class="btn btn-rounded btn-primary btn-lg">교수</button></div>
										&nbsp;&nbsp;&nbsp;
										<div class="d-inline-block">
											<h3 style="padding-top:10px;">
											<strong> 안녕하세요, <p class="d-inline text-primary">${loginUser.name}님!</p></strong>
											</h3>
										</div>
 									</div>
 									<div class="row d-flex" style="padding: 20px 0px 0px 0px;">
 										<div class="col-xl-5">
 											<div class="user-avatar text-center d-block">
 												<span id="memImg" class="manPicture" data-anoCd="\${rslt.anoCd}"
												style="display:block; width:120px; height:120px; border-radius: 60px;"></span>
 											</div>
 												<span class="d-flex justify-content-center">
 													<a href="javascript:void(0);" onclick="pageMove('/ai/stu/aca/info.do')">개인정보수정</a>
 												</span>
 											</div>
 											<div class="col-xl-7 text-center">
 												<p class="alert alert-primary m-1">`+rslt.colName+`<br>`+rslt.majorName+`</p>
 												<p class="alert alert-primary m-1"
 												style="padding: 5px 5px 5px 5px;">`+rslt.profPosiCd+`</p>
 												<p class="alert alert-primary m-1" style="padding: 5px 5px 5px 5px;">교번&nbsp;${loginUser.memId}</p>
 											</div>
 										</div>
 										<div class="row d-flex justify-content-center m-2 mt-1">
 										<a href="javascript:void(0);" onclick="f_editStart();" class="" data-toggle="modal" data-target="#widgetModal">
 											<i class="fas fa-cog">&nbsp;위젯편집</i>
 										</a>
 										&nbsp;&nbsp;&nbsp;
 										<a onclick="saveGrid()" href="javascript:void(0);">
 											<i class="fas fa-save">&nbsp;저장</i>
 											&nbsp;&nbsp;&nbsp;
 										</a>
 										<a href="javascript:void(0);" onclick="javascript:grid.compact();">
 											<i class="fas fa-align-left">&nbsp;정렬</i>
 										</a>
 									</div>
 								</div>
 							</div>`
			};
 			usedWidgetList.push(v_json);
 			grid.addWidget(v_json);
 			localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
 			
 			MemberPictureThumb("${webPath}");
 		},
 		error: ()=>{
 			AjaxErrorSecurityRedirectHandler(error.status);
 		}
 	});
	
}

function f_editStart(){
	setTimeout(function(){
		var v_div = $('.grid-stack-item');
		v_div.each(function(){
			$(this).addClass('shakeCard');
		});
	},500);
}

function f_editEnd(){
	setTimeout(function(){
		var v_div = $('.grid-stack-item');
		v_div.each(function(){
			$(this).removeClass('shakeCard');
		});
	},200);
}

var f_widgetTemplate = (title,bodyContent,paramId,dataLi) => {
	//id=notWid42 , data-li=noticeWidget42
// 	alert("된다...");
	var v_card =
	`<div class="card" id="`+paramId+`" data-li="`+dataLi+`" style="border:0px solid #7a80b4;">
	<span class="row d-flex justify-content-between m-2">
   		<span style="font-size:20px; " class="d-flex align-items-end ml-2 mt-2">
   			<i class="fas fa-star text-muted">`+title+`</i>
 		</span>
   		<div>
   			<a href="javascript:void(0);" onclick="f_removeBtn(event,'`+dataLi+`')">
   				<i class="fas fa-window-close"></i>
 			</a>
 		</div>
		</span>
		`+bodyContent+`
</div>`;
return v_card;

}
//2.공지사항
var f_addNoticeWidget = (paramX,paramY) => {
// 	alert('공지추가');
	var v_json=
		{
	    "id": 2
	    };
	
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 2){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	
	$.ajax({
		method:'get',
		url:'${webPath}/portlet/notice',
		success: (rslt) => {
			//rslt로 들어오는 값 Map안에 포틀릿vo, noticeList portletVO(w,h),공지리스트
			var bodyContent = 
		         `<div class="card-body" style="overflow-y:hidden; overflow-x:hidden; height:286px;">
	         		<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>`;
		    	for(i=0; i<rslt.scNoticeList.length; i++){
					var v_getDate = new Date(rslt.scNoticeList[i].cdate);
		    		var v_attendDate = f_transFormatToDate(v_getDate);
	    			bodyContent += 
							`<tr style="cursor:pointer;"
								onclick="pageMove('${webPath}/common/notice/detail.do?scNno=\${rslt.scNoticeList[i].scNno}')">
								<td><span class="badge badge-primary">공지</span></td>
								<td class="table-title">\${rslt.scNoticeList[i].title}</td>
								<td>\${v_attendDate}</td>
							</tr>`;
		   		}
		    	bodyContent +=
						`</tbody>
					</table>
				</div>`;

			var noticeWidget = f_widgetTemplate('&nbsp;학사공지',bodyContent,'notWid','noticeWidget');
			
			if(paramX != null && paramY != null){
				console.log("공지 if 들어오나요");
				console.log(paramX);
				console.log(paramY);
				v_json.x = paramX;
				v_json.y = paramY;
			}
			
			v_json.content=noticeWidget; 
			usedWidgetList.push(v_json); //배열추가 
			grid.addWidget(v_json);		//위젯추가
			localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
			
			$('div[class=ms-selectable]>ul>li[data-li="noticeWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
			$('div[class=ms-selection]>ul>li[data-li="noticeWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
			
		}, 
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
}

//3.학사일정 캘린더
var f_addCalendarWidget = (paramX,paramY) => {
	var v_json=
	{
    "id": 3
    };
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 3){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	
	var bodyContent = 
		`<div class="card-body" style="overflow-y:hidden; overflow-x:hidden; height:655px;">
			<iframe src="${webPath}/common/scSchedule/calendar/mini" scrolling="no" style="overflow-y:hidden;" width="100%" height="100%" frameborder="0"></iframe>
		</div>`;

	
	var calWidget = f_widgetTemplate('&nbsp;학사일정',bodyContent,'calWid','calWidget');
	
	if(paramX != null && paramY != null){
		v_json.x = paramX; 
		v_json.y = paramY;
	}
	
	v_json.content=calWidget; 
	usedWidgetList.push(v_json); //배열추가
	grid.addWidget(v_json);		//위젯추가
	console.log("캘린더추가 펑션에서 set");
	localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
	
	$('div[class=ms-selectable]>ul>li[data-li="calWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
	$('div[class=ms-selection]>ul>li[data-li="calWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
	
}

//4.버스노선도
var f_addBusWidget = (paramX,paramY) => {
	var v_json=
	{
    "id": 4
    };
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 4){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	
	var bodyContent = 
		`<div class="card-body" style="overflow-y:hidden; overflow-x:hidden; height:286px;">
			<img id="busImg" src="${webPath}/resources/img/bus.jpg" alt="건영대학교 셔틀버스 노선도" height="260px">
		</div>`;
		
	var busWidget = f_widgetTemplate('&nbsp;셔틀버스 노선도',bodyContent,'busWid','busWidget');
	
	if(paramX != null && paramY != null){
		v_json.x = paramX; 
		v_json.y = paramY;
	}
	
	v_json.content=busWidget; 
	usedWidgetList.push(v_json); //배열추가 
	grid.addWidget(v_json);		//위젯추가
	localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
	
	
	let v_img = document.querySelector('#busImg');
	let v_div = document.querySelector('#busOrignDiv');
	
	
	$('div[class=ms-selectable]>ul>li[data-li="busWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
	$('div[class=ms-selection]>ul>li[data-li="busWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
	
}

//5.날씨
var f_addWeatherWidget = (paramX,paramY) => {
	var v_json=
	{
    "id": 5,
    };
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 5){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	
	var bodyContent = 
		`<div class="card-body" style="overflow-y:hidden; overflow-x:hidden; height:286px;">
			<iframe width="100%" height="100%" src="https://forecast.io/embed/#lat=36.325029&lon=127.408951&name=대전 중구 오류동 &color=#cce5ff&font=arial&units=si" frameborder="0"></iframe>
		</div>`;
		
	var weatherWidget = f_widgetTemplate('&nbsp;날씨',bodyContent,'weatherWid','weatherWidget');
	
	if(paramX != null && paramY != null){
		v_json.x = paramX; 
		v_json.y = paramY;
	}
	
	v_json.content=weatherWidget; 
	usedWidgetList.push(v_json); //배열추가 
	grid.addWidget(v_json);		//위젯추가
	localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
	
	$('div[class=ms-selectable]>ul>li[data-li="weatherWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
	$('div[class=ms-selection]>ul>li[data-li="weatherWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
	
	
}




//6.북마크
var f_addBookmarkWidget = (paramX,paramY) => {
	var v_json=
	{
	   "id": 6
// 	   "noResize": true
	};
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 6){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	
	var bodyContent = 
		`<div class="card-body" style="overflow-y:hidden; overflow-x:hidden; height:286px;">
			<ul class="list-group">
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="${webPath}/prof/lec/counsel/stu/list.do"><span class="h5 fas fa-star text-warning">지도학생목록</span></a>
				</li>
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="${webPath}/prof/lec/counsel/stu/list.do"><span class="h5 fas fa-star text-warning">상담신청관리</span></a>
				</li>
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="${webPath}/prof/lec/counsel/stu/list.do"><span class="h5 fas fa-star text-warning">강의목록</span></a>
				</li>
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="${webPath}/prof/lec/counsel/stu/list.do"><span class="h5 fas fa-star text-warning">학사일정</span></a>
				
				</li>
			</ul>
		</div>`;
		
	var bookmarkWidget = f_widgetTemplate('&nbsp;바로가기',bodyContent,'bookmarkWid','bookmarkWidget');
	
	if(paramX != null && paramY != null){
		v_json.x = paramX; 
		v_json.y = paramY;
	}
	
	v_json.content=bookmarkWidget; 
	usedWidgetList.push(v_json); //배열추가 
	grid.addWidget(v_json);		//위젯추가
	console.log("날씨추가 펑션에서 set");
	console.log("추가",usedWidgetList);
	localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
	
	
	
	$('div[class=ms-selectable]>ul>li[data-li="bookmarkWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
	$('div[class=ms-selection]>ul>li[data-li="bookmarkWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
	
}

//7.강의시간표
var f_addTimetableWidget = (paramX,paramY) => {
// 	alert('공지추가');
	var v_json=
	{
    "id": 7
    };
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 7){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	console.log("강의시간표크기",v_json);
	
	$.ajax({
		method:'get',
		url:'${webPath}/portlet/proftimetable',
		success: (rslt) => {
			var v_rslt = JSON.stringify(rslt.lectureList);
			console.log(rslt.lectureList);
			var bodyContent = 
		         `<div class="card-body" style="overflow-y:hidden; overflow-x:hidden; height:655px;">
					<table class="table table-bordered ">
					 <thead>
					    <tr class="text-center">
					     <th scope="col" style="width:10%">시간</th>
					     <th scope="col" style="width:18%">월</th>
					     <th scope="col" style="width:18%">화</th>
					     <th scope="col" style="width:18%">수</th>
					     <th scope="col" style="width:18%">목</th>
					     <th scope="col" style="width:18%">금</th>
					   </tr>
					 </thead>
					 <tbody class="text-center">`;
					 
					
			var a_day = ["월","화","수","목","금"];
				for(var time=9; time<18; time++){
					bodyContent += 
					   `<tr>
					    	<th scope="row" ><div style="height: 41px">`+time+`~`+(time+1)+`</div></th>`;
						for(var i=0; i<5; i++){
							bodyContent += 
							`<td id="`+a_day[i]+``+time+`"></td>`;
							
						}						
					bodyContent += 
					   `</tr>`;
				}					
				bodyContent += 
					 `</tbody>
					</table>
				</div>`;

			
			var timeWidget = f_widgetTemplate('&nbsp;수업시간표',bodyContent,'timeWid','timeWidget');
			
			if(paramX != null && paramY != null){
				v_json.x = paramX; 
				v_json.y = paramY;
			}
			
			v_json.content=timeWidget; 
			usedWidgetList.push(v_json); //배열추가
			grid.addWidget(v_json);		//위젯추가
			console.log("시간표추가 펑션에서 set");
			localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
			
			var colorArray = ['#ffafb0','#fcffb0','#aee4ff','#b5c7ed','#fcc6f7','#bee9b4','#ffe4af','#A9A0FC','#8AV481'];
			
			for(var i=0; i<rslt.lectureList.length; i++){
				var index = i;
			 	var color = colorArray[i];
				
				var lecCd = rslt.lectureList[i].lecCd;
				var name = rslt.lectureList[i].name;
				var lecDate1 = rslt.lectureList[i].lecDate1;
				var lecDate2 = rslt.lectureList[i].lecDate2;
				var classroom=rslt.lectureList[i].classroom;
				var subjCd=rslt.lectureList[i].subjCd;
				var subjName=rslt.lectureList[i].subjName;
// 				if(subjName.length > 6){
// 					subjName = subjName.substring(0,9)+"...";
// 				}
				
				var htmlStr = "<span style='font-size:0.8em;'>"+subjName+"</span><br>";
// 					htmlStr +="<span>"+classroom+"</span>";
				
				var firstDay = lecDate1.substring(0,1);
				var firStartTime =lecDate1.substring(2,4);
				var firEndTime = lecDate1.substring(10,12);
				for(var j=firStartTime; j<firEndTime; j++){
					var id = "#"+firstDay+j;
// 					console.log("for문 id확인",id);
// 					console.log("for문 color",color);
// 					console.log("for문 name",name);
					$(id).css("backgroundColor",color);
// 					$(id).attr("title",name+" 교수님");
					$(id).html(htmlStr);
				}
				
				if(lecDate2){
					
					var secondDay = lecDate2.substring(0,1);
					var secStartTime =lecDate2.substring(2,4);
					var secEndTime = lecDate2.substring(10,12);	
					for(var k=secStartTime; k<secEndTime; k++){
						var id = '#'+secondDay+k;
	// 					console.log("for문2 id확인",id);
	// 					console.log("for문2 color",color);
	// 					console.log("for문2 name",name);
						$(id).css("backgroundColor",color);
	// 					$(id).attr("title",name+" 교수님");	
						$(id).html(htmlStr);
					}
				}
			}
			
			$('div[class=ms-selectable]>ul>li[data-li="timeWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
			$('div[class=ms-selection]>ul>li[data-li="timeWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
			
		}, 
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
//8.지도학생관리
var f_addCounselWidget = (paramX,paramY) => {
	var v_json=
	{
    "id": 8
    };
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 8){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}

	var bodyContent = 
         `<div class="card-body row justify-content-center" style="overflow-y:hidden; overflow-x:hidden; height:287px;">
         	<canvas id="counselChart" style="height:30vh;"></canvas>
         </div>`;

        
		var counselWidget = f_widgetTemplate('&nbsp;지도학생상태',bodyContent,'counselWid','counselWidget');
		
		if(paramX != null && paramY != null){
			v_json.x = paramX; 
			v_json.y = paramY;
		}
		
		v_json.content=counselWidget; 
		usedWidgetList.push(v_json); //배열추가
		grid.addWidget(v_json);		//위젯추가
		console.log("시간표추가 펑션에서 set");
		localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
		
		const ctx = document.getElementById('counselChart').getContext('2d');
		
		const a_labels = ['양호','위험','경고'];
		const a_data = [5,2,1];
		const a_bgcolor = ['#B4ED4C','#FFF26D','#FF7B67'];
		
		const data = {
		  labels: a_labels,
		  datasets: [
		    {
		      label: 'Dataset 1',
		      data: a_data,
		      backgroundColor:a_bgcolor,
		    }
		  ]
		};
		
	    const counselChart = new Chart(ctx, {
			  type: 'doughnut',
			  data: data,
			  options: {
				  responsive: false,
				    plugins: {
				      legend: {
				        position: 'right',
				      },
// 				      title: {
// 				        display: true,
// 				        text: 'Chart.js Doughnut Chart'
// 				      }
				    }
			  },
	    });
		
		$('div[class=ms-selectable]>ul>li[data-li="counselWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
		$('div[class=ms-selection]>ul>li[data-li="counselWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
		
}

//9.과제제출현황
var f_addAssignWidget = (paramX,paramY) => {
// 	alert('공지추가');
	var v_json=
	{
    "id": 9,
    };
	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 9){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
	
	$.ajax({
		method:'get',
		url:'${webPath}/portlet/assignment',
		success: (rslt) => {
// 			console.log(rslt.lectureList);
			var v_rslt = JSON.stringify(rslt);
			var bodyContent = 
		         `<div class="card-body row justify-content-center" style="overflow-y:hidden; overflow-x:hidden; height:287px;">
		         	<canvas id="assignChart" style="width:250px;"></canvas>
		         </div>`;

	        
			var assignWidget = f_widgetTemplate('&nbsp;과제제출현황(%)',bodyContent,'assignWid','assignWidget');
			
			if(paramX != null && paramY != null){
				v_json.x = paramX; 
				v_json.y = paramY;
			}
			
			v_json.content=assignWidget; 
			usedWidgetList.push(v_json); //배열추가
			grid.addWidget(v_json);		//위젯추가
			console.log("시간표추가 펑션에서 set");
			localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
			
			const ctx = document.getElementById('assignChart').getContext('2d');
			
			const a_labels = [];
			for(var i=0; i<rslt.length; i++){
				a_labels.push(rslt[i].subjName);
			}
			const a_data = [];
			const a_bgcolor = [];
			for(var i=0; i<rslt.length; i++){
				var per = Math.round((rslt[i].submitCount / rslt[i].stuNum) * 100) ;
				a_data.push(per);
				const r = Math.floor(Math.random()*256);
				const g = Math.floor(Math.random()*256);
				const b = Math.floor(Math.random()*256);
				a_bgcolor.push('rgba('+r+','+g+','+b+',0.4)');
			}
			
			const data = {
			  labels: a_labels,
			  datasets: [
			    {
			      label: 'Dataset 1',
			      data: a_data,
			      backgroundColor:a_bgcolor,
			    }
			  ]
			};
			
		    const assignChart = new Chart(ctx, {
   			  type: 'polarArea',
   			  data: data,
   			  options: {
   			    responsive: false,
   			    scales: { 
// 	   			      r: {
// 	   			        pointLabels: {
// 	   			          display: false,
// 	   			          centerPointLabels: true,
// 	   			          font: {
// 	   			            size: 15
// 	   			          }
// 	   			        }
// 	   			      },
   			    	  ticks:{
//    			    		  beginAtZero:true,
// 	   			    	  min:0,
	   			    	  max:100,
	   			    	  stepSize: 20
   			    	  }
   			    },
   			    plugins: {
   			    }
   			  },
		    });
			
			$('div[class=ms-selectable]>ul>li[data-li="assignWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
			$('div[class=ms-selection]>ul>li[data-li="assignWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
			
		}, 
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}



//윈도우 온로드
window.onload = function(){
	
	$.ajax({
		type:'get',
		url:'${webPath}/portlet/list',
		success: (rslt) => {
			localStorage.setItem("allWidgetList",JSON.stringify(rslt.allPoList));
			if(rslt.poList.length == 0){
				//'최초로그인/커스텀한 적이 없는 유저는 기본위젯세팅'
				f_addProfileWidget();
				for(var i = 0; i<rslt.allPoList.length; i++){
					console.log("들어오나용");
					if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 2){
						f_addNoticeWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 3){
						f_addCalendarWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 4){
						f_addBusWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 5){
						f_addWeatherWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 6){
						f_addBookmarkWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 7){
						f_addTimetableWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 8){
						f_addCounselWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 9){
						f_addAssignWidget();
					}
								
				}
			}else{
				//커스텀한 적 있는 유저는 selected된 위젯만 불러온다
				f_addProfileWidget(); //필수 프로필
				for(var i = 0; i<rslt.poList.length; i++){
					switch(rslt.poList[i].id){
					case 2:
						//학사공지
						f_addNoticeWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 3:
						//학사일정
						f_addCalendarWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 4:
						//버스노선도
						f_addBusWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 5:
						//날씨
						f_addWeatherWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 6:
						//북마크
						f_addBookmarkWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 7:
						//강의시간표
						f_addTimetableWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 8:
						//지도학생관리
						f_addCounselWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 9:
						//과제제출현황
						f_addAssignWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
						
					}
				}
				
			}
		},
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	

//위젯추가, 삭제 (ajax로 수정해야됨)
$('#callbacks').multiSelect({
	afterSelect: function(values) {
		var data_li = $('option[value='+values+']').attr('data-li');
		
		if(values == 'notWid' || $('#notWid') == null){
			f_addNoticeWidget();
        }else if(values == 'calWid' || $('#calWid') == null){
        	f_addCalendarWidget();
        }else if(values == 'busWid' || $('#busWid') == null){
        	f_addBusWidget();
        }else if(values == 'weatherWid' || $('#weatherWid') == null){
        	f_addWeatherWidget();
        }else if(values == 'bookmarkWid' || $('#bookmarkWid') == null){
        	f_addBookmarkWidget();
        }else if(values == 'timeWid' || $('#timeWid') == null){
        	f_addTimetableWidget();
        }else if(values == 'counselWid' || $('#counselWid') == null){
        	f_addCounselWidget();
        }else if(values == 'assignWid' || $('#assignWid') == null){
        	f_addAssignWidget();
        }
	},
    afterDeselect: function(values) {
    	if(values == 'notWid'){
			var obj = document.querySelector("#notWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 2){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
    		
    	}else if(values == 'calWid'){
			var obj = document.querySelector("#calWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}else if(values == 'busWid'){
			var obj = document.querySelector("#busWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}else if(values == 'weatherWid'){
			var obj = document.querySelector("#weatherWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}else if(values == 'bookmarkWid'){
			var obj = document.querySelector("#bookmarkWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}else if(values == 'timeWid'){
			var obj = document.querySelector("#timeWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}else if(values == 'counselWid'){
			var obj = document.querySelector("#counselWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}else if(values == 'assignWid'){
			var obj = document.querySelector("#assignWid");
			var par = obj.parentNode;
			var gra = par.parentNode;
			
			var v_usedWidgetList = JSON.parse(localStorage.getItem("usedWidgetList"));
			
			for(var i = 0; i<v_usedWidgetList.length; i++){
				if(v_usedWidgetList[i].id == 7){
					usedWidgetList = usedWidgetList.splice(i);
					localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList));
				}
			}
			grid.removeWidget(gra);
			
    	}
   			
	}
});



//저장기능 ajax put
saveGrid = () => {
   serializedData = grid.save();
//    document.querySelector('#saved-data').value = JSON.stringify(serializedData, null, '  ');
	   //컨트롤러 가서 데이터있는지 조회하고 없으면 insert부터
   $.ajax({
		method:'post',
		url:'${webPath}/portlet/save',
		data: JSON.stringify(serializedData),
		contentType: 'application/json',
		success: (rslt) => {
// 			alert('위젯 배치가 저장됐습니다.');
			Swal.fire(
					  '저장성공!',
					  '',
					  'success'
					);
		},
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);			
		}
   });
}

//자동정렬   
compact = () => {
   grid.compact();
}



} //window.onload끝
</script>




<script>
	$('#keep-order').multiSelect({ keepOrder: true });
</script>
<script>
    $('#public-methods').multiSelect();
    $('#select-all').click(function() {
        $('#public-methods').multiSelect('select_all');
        return false;
    });
    $('#deselect-all').click(function() {
        $('#public-methods').multiSelect('deselect_all');
        return false;
    });
    $('#select-100').click(function() {
        $('#public-methods').multiSelect('select', ['elem_0', 'elem_1'..., 'elem_99']);
        return false;
    });
    $('#deselect-100').click(function() {
        $('#public-methods').multiSelect('deselect', ['elem_0', 'elem_1'..., 'elem_99']);
        return false;
    });
    $('#refresh').on('click', function() {
        $('#public-methods').multiSelect('refresh');
        return false;
    });
    $('#add-option').on('click', function() {
        $('#public-methods').multiSelect('addOption', { value: 42, text: 'test 42', index: 0 });
        return false;
    });
</script>
<script>
    $('#optgroup').multiSelect({ selectableOptgroup: true });
</script>
<script>
    $('#disabled-attribute').multiSelect();
</script>
<script>
    $('#custom-headers').multiSelect({
        selectableHeader: "<div class='custom-header'>Selectable items</div>",
        selectionHeader: "<div class='custom-header'>Selection items</div>",
        selectableFooter: "<div class='custom-header'>Selectable footer</div>",
        selectionFooter: "<div class='custom-header'>Selection footer</div>"
    });
</script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"75c993dfdd16af8e","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.10.3","si":100}' crossorigin="anonymous"></script>
