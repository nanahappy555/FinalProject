<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.css" rel="stylesheet">
<script src="${webPath }/resources/js/progresscircle.js"></script>
	
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
 										<div class="d-inline-block"><button class="btn btn-rounded btn-primary btn-lg">교직원</button></div>
 										&nbsp;&nbsp;&nbsp;
 										<div class="d-inline-block">
 											<h3 style="padding-top:10px;">
 											<strong> 안녕하세요, <p class="d-inline text-primary">${loginUser.name}님!</p></strong>
 											</h3>
 										</div>
 									</div>
 									<div class="row d-flex" style="padding: 20px 20px 20px 0px;">
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
 												<p class="alert alert-primary m-1">학사관리과</p>
 												<p class="alert alert-primary m-1"
 												style="padding: 5px 5px 5px 5px;">직원</p>
 												<p class="alert alert-primary m-1" style="padding: 5px 5px 5px 5px;">사번&nbsp;${loginUser.memId}</p>
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
		    		
		    		var v_title = rslt.scNoticeList[i].title;
		    		if(v_title.length > 10){
			    		var cropTitle = v_title.substring(0,9) + "..."; 
		    			
		    		}
		    		
	    			bodyContent += 
							`<tr style="cursor:pointer;"
								onclick="pageMove('${webPath}/common/notice/detail.do?scNno=\${rslt.scNoticeList[i].scNno}')">
								<td><span class="badge badge-primary">공지</span></td>
								<td class="table-title">\${cropTitle}</td>
								<td>\${v_attendDate}</td>
							</tr>`;
		   		}
		    	bodyContent +=
						`</tbody>
					</table>
				</div>`;

			var noticeWidget = f_widgetTemplate('&nbsp;학사공지',bodyContent,'notWid','noticeWidget');
			
			if(paramX != null && paramY != null){
// 				console.log("공지 if 들어오나요");
// 				console.log(paramX);
// 				console.log(paramY);
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
// 	console.log("캘린더추가 펑션에서 set");
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
    "id": 5
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
				<a href="javascript:void(0);"><span class="h5 fas fa-star text-warning">전과신청</span></a>
				</li>
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="javascript:void(0);"><span class="h5 fas fa-star text-warning">휴/복학</span></a>
				</li>
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="javascript:void(0);"><span class="h5 fas fa-star text-warning">부/복수전공</span></a>
				</li>
				<li class="list-group-item d-flex justify-content-start align-items-center">
				<a href="javascript:void(0);"><span class="h5 fas fa-star text-warning">QNA</span></a>
				
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
// 	console.log("날씨추가 펑션에서 set");
// 	console.log("추가",usedWidgetList);
	localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
	
	
	
	$('div[class=ms-selectable]>ul>li[data-li="bookmarkWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
	$('div[class=ms-selection]>ul>li[data-li="bookmarkWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
	
}
//13.등록금
var f_addTuitionWidget = (paramX,paramY) => {
	var v_json=
	{
    "id": 13
    };
	
	var tuitionWidget = f_widgetTemplate('&nbsp;등록금납부현황',bodyContent,'tuitionWid','tuitionWidget');
	
	if(paramX != null && paramY != null){
		v_json.x = paramX; 
		v_json.y = paramY;
	}
	
// 	v_json.content=tuitionWidget; 
	usedWidgetList.push(v_json); //배열추가 
	grid.addWidget(v_json);		//위젯추가
// 	console.log("등록금 추가 펑션에서 set");
// 	console.log("추가",usedWidgetList);
	localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
	
	
	
	$('div[class=ms-selectable]>ul>li[data-li="tuitionWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
	$('div[class=ms-selection]>ul>li[data-li="tuitionWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
	
}

//14.qna
var f_addQnaWidget = (paramX,paramY) => {
// 	alert('공지추가');
	var v_json=
		{
	    "id": 14
	    };

	var v_allWidgetList = JSON.parse(localStorage.getItem("allWidgetList"));
	for(var i = 0; i<v_allWidgetList.length; i++){
		if(v_allWidgetList[i].id == 14){
			v_json.w = v_allWidgetList[i].w;
			v_json.h = v_allWidgetList[i].h;
			v_json.noResize = v_allWidgetList[i].noResize;
		}
	}
 	$.ajax({
 		method:'get',
 		url:'${webPath}/portlet/qna',
 		success: (rslt) => {
// 			console.log(rslt);
//  			console.log(rslt.bnoCount);
//  			console.log(rslt.replyNullCount);
 		
			var totalBnoCount = rslt.bnoCount;
			var replyNotNullCount = rslt.replyNullCount;
// 			console.log(totalBnoCount);
// 			console.log(replyNotNullCount);
	

			var rate	= replyNotNullCount /totalBnoCount * 100;
// 			console.log(Math.round(rate));
			var percent = Math.round(rate);
				      
 		      
		    var bodyContent = 
		   		`<div class="card-body row justify-content-center" style="overflow-y:hidden; overflow-x:hidden; height:286px;" >
		    	 	<div class='circlechart' data-percentage='\${percent}' >QnA답변률 </div>
			  	</div>`;
		      
 		      
		         
 			var qnaWidget = f_widgetTemplate('&nbsp;QNA답변현황',bodyContent,'qnaWid','qnaWidget');
			
 			if(paramX != null && paramY != null){
//  				console.log(paramX);
//  				console.log(paramY);
 				v_json.x = paramX; 
 				v_json.y = paramY;
 			}
			
 			v_json.content=qnaWidget; 
 			usedWidgetList.push(v_json); //배열추가
			grid.addWidget(v_json);		//위젯추가
 			localStorage.setItem("usedWidgetList",JSON.stringify(usedWidgetList)); //로컬스토리지추가
			

 			$(function(){
 				  $('.circlechart').circlechart();
 			});

 			
 			
 			
 			
 			
 			
 			
			$('div[class=ms-selectable]>ul>li[data-li="qnaWidget"]').attr('class','ms-elem-selectable ms-selected').css('display','none');
 			$('div[class=ms-selection]>ul>li[data-li="qnaWidget"]').attr('class','ms-elem-selection ms-selected').css('display','');
			
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
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 13){
						f_addTuitionWidget();
					}else if(rslt.allPoList[i].defaultCd == "Y" && rslt.allPoList[i].id == 14){
						f_addQnaWidget();
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
					case 13:
						//강의시간표
						f_addTuitionWidget(rslt.poList[i].x,rslt.poList[i].y);
						break;
					case 14:
						//지도학생관리
						f_addQnaWidget(rslt.poList[i].x,rslt.poList[i].y);
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
        }else if(values == 'tuitionWid' || $('#tuitionWid') == null){
        	f_addTuitionWidget();
        }else if(values == 'qnaWid' || $('#qnaWid') == null){
        	f_addQnaWidget();
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
			
    	}else if(values == 'tuitionWid'){
			var obj = document.querySelector("#tuitionWid");
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
			
    	}else if(values == 'qnaWid'){
			var obj = document.querySelector("#qnaWid");
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
