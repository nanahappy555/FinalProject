<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script  type="text/x-handlebars-template"  id="subMenu-list-template">
	{{#each .}}
		<li class="nav-item">
             <a class="nav-link" href="#" onclick="goPage('<%=request.getContextPath()%>/{{murl}}','{{mcode}}');"  data-toggle="collapse" aria-expanded="true" data-target="#submenu-{{mcode}}" aria-controls="submenu-{{mcode}}" >{{mname}}</a>
			
 			 <div id="submenu-{{mcode}}" class="submenu collapse" style>
			 	<ul class="nav flex-column" id="ulSubMenu-{{mcode}}">
                                                   
               </ul>
			 </div>       
		</li>

	{{/each}}
</script>
<script type="text/x-handlebars-template" id="threeDepthMenu-list-template">
{{#each .}}
<li class="nav-item">
   <a class="nav-link" data-murl="{{mrul}}",data-mcode="{{mcode}}" href="javascript:go3depthPage('{{lecCd}}','{{mcode}}')">{{lecName}}</a>
</li>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="uchk-list-template">
{{#each .}}
        	<a href="javascript:void(0);" class="list-group-item list-group-item-action uchk" style>
                <div class="notification-info">
                    <div class="notification-list-user-img"><img src="<%=request.getContextPath() %>/resources/bootstrap/assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                    <div class="notification-list-user-block"><span class="notification-list-user-name"><strong>{{prefix}}</strong></span>
                     <br>
                	{{alarmContent}}
                        <div class="notification-date">{{cdate}}</div>
                    </div>
                </div>
            </a>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="chk-list-template">
{{#each .}}
        	<a href="javascript:void(0);" class="list-group-item list-group-item-action chk" style="background-color:#ececec">
                <div class="notification-info">
                    <div class="notification-list-user-img"><img src="<%=request.getContextPath() %>/resources/bootstrap/assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                    <div class="notification-list-user-block"><span class="notification-list-user-name"><strong>{{prefix}}</strong></span>
                     <br>
                	{{alarmContent}}
                        <div class="notification-date">{{cdate}}</div>
                    </div>
                </div>
            </a>
{{/each}}
</script>
<script>
window.onload = function(){
	$.ajax({
		type:'get',
		url:'<%=request.getContextPath()%>/common/mail/count',
		success: function(count){
			var mailIcon  = document.querySelector("#mailIcon");
			if (count!=0){
			      mailIcon.style.display = 'inline';
			} else {
			      mailIcon.style.display = 'none';
			}
			
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status)
		}
	});
	
	var webSocket = new WebSocket("ws://192.168.141.22/<%=request.getContextPath()%>/ws-alarm");
	   
	webSocket.onopen = () => {
		webSocket.send("${loginUser.memId}");
		wsSend();
	}
	webSocket.onmessage = (e) => {
// 		console.log("메세지옵니당",e.data);
		var v_alarmIcon = document.querySelector("#alarmIcon");
		v_alarmIcon.style.display = 'inline';

// 		var v_alertDiv = $("#alertDiv");
// 		v_alertDiv.fadeIn(2000);
// 		v_alertDiv.css('display','inline');
// 		v_alertDiv.slideUp(5000);
	}
	
	
	var wsSend=()=>{
		setInterval(function() {
			// 3초마다 클라이언트로 메시지 전송
			webSocket.send("${loginUser.memId}");
		}, 3000);
	}
}
</script>


<script>
var alarmList = document.querySelector('#navbarDropdownMenuLink1');
alarmList.onclick = () => {
	var alarmIcon = document.querySelector("#alarmIcon");
	alarmIcon.style.display = 'none';
	
	//getList
	var uchkDiv = $('#uchk');
	var chkDiv = $('#chk');
	$.ajax({
		type: 'get',
		url: '<%=request.getContextPath()%>/alarm/getAlarmList',
		dataType: 'json',
		success: (rslt)=>{
// 			console.log(rslt);
			printData(rslt.uchkList,uchkDiv,$('#uchk-list-template'));
			
			printData(rslt.chkList,chkDiv,$('#chk-list-template'));
			
			var totalCount = rslt.uchkList.length + rslt.chkList.length;
			document.querySelector("#totalCount").innerHTML = ` 총 알림 갯수 ( `+totalCount+`개) `;
// 			if(rslt.uchkList.length == 0){
// 				var alarmIcon = document.querySelector("#alarmIcon");
// 				alarmIcon.style.display = 'none';
// 			}
			
		},
		error: (error)=>{
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
	//check update
	setTimeout(function(){
		$.ajax({
			method: 'put',
			url: '<%=request.getContextPath()%>/alarm/updateCheck',
			dataType:'text',
			success: (rslt) => {
				console.log(rslt);
				var uchk = document.querySelectorAll('.uchk');
				for(var i = 0; i<uchk.length; i++){
					uchk[i].style.backgroundColor = '#ececec';
				}
				
				var alarmIcon = document.querySelector("#alarmIcon");
				alarmIcon.style.display = 'none';
				
			},
			error: (error) => {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
			
		});
	}, 1000);
}
</script>
<script>



const cifr = document.getElementById("ifr");

cifr.onload = function(){
	let tunnHeight = 40; //40
	cifr.height=0;
    let docHeight=cifr.contentDocument.documentElement.scrollHeight;
    cifr.height = docHeight + tunnHeight;
};

</script>
<script>
function subMenu_go(mCode,menui){
	if(mCode != "M000000"){
		$.ajax({
			url:'<%=request.getContextPath()%>/subMenu.do?mCode='+mCode,
			method:"get",
			success:function(data){
				printData(data,$('#submenu-'+menui).find('.flex-column'),$('#subMenu-list-template'))
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status)
			}
			
		});
	}else{
		
		$('#submenu-'+menui).find('.flex-column').html("");
	}
}

function threeDepthMenu_go(murl,mCode){
	$.ajax({
		url:'<%=request.getContextPath()%>/threeDepthMenu.do?murl='+murl+'&mCode='+mCode,
		method:"get",
		success:function(data){
			printData(data,$("#ulSubMenu-"+mCode),$('#threeDepthMenu-list-template'));
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status)
		}
	})
	cifr.onload = function(){
		let tunnHeight = 40;
		cifr.height=0;
	    let docHeight=cifr.contentDocument.documentElement.scrollHeight;
	    cifr.height = docHeight + tunnHeight;
	};
}

function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}

function goPage(url,mCode){
	if(url=="<%=request.getContextPath()%>/none"){
		return;
	}
	if(url=="<%=request.getContextPath()%>/stu/lec/board/main.do"||url=="<%=request.getContextPath()%>/prof/lec/list.do"){
		threeDepthMenu_go(url,mCode);
	}
	
	$('iframe[name="ifr"]').attr("src",url);
	 
	$.ajax({
		url:'<%=request.getContextPath()%>/menu.do?mCode='+mCode,
		method:"get",
		success:function(data){
			var pageHeader = document.querySelector("#pageHeaderSpan");
			pageHeader.innerHTML = data.mname;
			pageHeader.setAttribute('murl',"<%=request.getContextPath()%>/"+data.murl);
			pageHeader.style.cursor="pointer";
			
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status)
		}
		
	}); 
	
	if(typeof(history.pushState)=='function'){
		var renewURL = location.href;
		renewURL = renewURL.substring(0,renewURL.indexOf(location.search));
		if(mCode!='M000000'){
			renewURL += "?mCode="+mCode;
		}//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		history.pushState(mCode,null,renewURL);
	}else{
		location.hash="#"+mCode;
	}
	cifr.onload = function(){
		let tunnHeight = 40;
		cifr.height=0;
	    let docHeight=cifr.contentDocument.documentElement.scrollHeight;
	    cifr.height = docHeight + tunnHeight;
	};

	
}

function go3depthPage(lecCd,mCode){
	var pageHeaderSpan = $("#pageHeaderSpan");
	if(mCode=="M030500"){
		url="<%=request.getContextPath()%>/stu/lec/mylecture/index.do?lecCd="+lecCd;
		pageHeaderSpan.attr("murl",url);
	}else if(mCode=="M160100"){

		url="<%=request.getContextPath()%>/prof/lec/main.do?lecCd="+lecCd;
		pageHeaderSpan.attr("murl",url);
	}
	$('iframe[name="ifr"]').attr("src",url);
	pageHeaderSpan.html("강의게시판");
	if(typeof(history.pushState)=='function'){
		var renewURL = location.href;
		renewURL = renewURL.substring(0,renewURL.indexOf(location.search));
		if(mCode!='M000000'){
			renewURL += "?mCode="+mCode+"&lecCd="+lecCd;
		}//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
		history.pushState(mCode,null,renewURL);
	}else{
		location.hash="#"+mCode;
	}
	cifr.onload = function(){
		let tunnHeight = 40;
		cifr.height=0;
	    let docHeight=cifr.contentDocument.documentElement.scrollHeight;
	    cifr.height = docHeight + tunnHeight;
	};

	
}
</script>



<script>

goPage('<%=request.getContextPath()%>/${menu.murl}','${menu.mcode}');
subMenu_go('${menu.mcode}'.substring(0,3)+"0000");
var pageHeader = document.querySelector("#pageHeaderSpan");
pageHeader.addEventListener('click',function(){
	var murl = $("#pageHeaderSpan").attr("murl");
	$('iframe[name="ifr"]').attr("src",murl);
})
</script>
