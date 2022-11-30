<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<head>
<style>
.grid-stack-item{
   padding :20px;
}
.grid-stack-item-content{
}

.card{
   margin-bottom: 0px;
}

.shakeCard {
    animation-name: shake;
    animation-duration: 0.7s;
    animation-iteration-count: infinite;
}
@keyframes shake {
    0% {
        transform: rotate(0deg)
    }
    25% {
        transform: rotate(-0.5deg);
    }
    50% {
        transform: rotate(0.5deg);
    }
    75% {
        transform: rotate(-0.5deg);
    }
    100% {
        transform: rotate(0.5deg);
    }
}

</style>

<link href="<%=request.getContextPath()%>/resources/css/gridstack.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/multi-select/css/multi-select.css">
<!-- <meta name="robots" content="noindex, nofollow"> -->
<script nonce="38fdc5de-d9a7-45da-afae-765026c93c2c">
// (function(w,d){!function(Z,_,ba,bb){Z.zarazData=Z.zarazData||{};Z.zarazData.executed=[];Z.zaraz={deferred:[],listeners:[]};Z.zaraz.q=[];Z.zaraz._f=function(bc){return function(){var bd=Array.prototype.slice.call(arguments);Z.zaraz.q.push({m:bc,a:bd})}};for(const be of["track","set","debug"])Z.zaraz[be]=Z.zaraz._f(be);Z.zaraz.init=()=>{var bf=_.getElementsByTagName(bb)[0],bg=_.createElement(bb),bh=_.getElementsByTagName("title")[0];bh&&(Z.zarazData.t=_.getElementsByTagName("title")[0].text);Z.zarazData.x=Math.random();Z.zarazData.w=Z.screen.width;Z.zarazData.h=Z.screen.height;Z.zarazData.j=Z.innerHeight;Z.zarazData.e=Z.innerWidth;Z.zarazData.l=Z.location.href;Z.zarazData.r=_.referrer;Z.zarazData.k=Z.screen.colorDepth;Z.zarazData.n=_.characterSet;Z.zarazData.o=(new Date).getTimezoneOffset();Z.zarazData.q=[];for(;Z.zaraz.q.length;){const bl=Z.zaraz.q.shift();Z.zarazData.q.push(bl)}bg.defer=!0;for(const bm of[localStorage,sessionStorage])Object.keys(bm||{}).filter((bo=>bo.startsWith("_zaraz_"))).forEach((bn=>{try{Z.zarazData["z_"+bn.slice(7)]=JSON.parse(bm.getItem(bn))}catch{Z.zarazData["z_"+bn.slice(7)]=bm.getItem(bn)}}));bg.referrerPolicy="origin";bg.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(Z.zarazData)));bf.parentNode.insertBefore(bg,bf)};["complete","interactive"].includes(_.readyState)?zaraz.init():Z.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,0,"script");})(window,document);
</script>
</head>
<div class="container-fluid">
	<div class="" style="position:relative; border:0px solid red;">
		<div class="grid-stack" style="">
		
		   
		  
<!-- 		</div>그리드 끝 -->
	</div>

</div><!-- 본문끝 -->
<!-- <button onclick="loadGrid()" href="javascript:void(0);"> -->
<!-- 	<h1><i class="fas fa-save">로드확인용! 아래쪽 textarea랑 나중에지울거임</i></h1> -->
<!-- </button></br> -->
<!-- <textarea id="saved-data" cols="100" rows="20" readonly="readonly"></textarea> -->







<!-- Modal -->
<div id="widgetModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title">위젯 추가하기</h3>
        <button type="button" class="close" data-dismiss="modal" onclick="f_editEnd()">&times;</button>        
      </div>
      
      <div class="row mt-3">
     	<div class="col-xl-6" style="font-size:1.2em; left:12%;"><strong>전체 위젯 목록</strong></div>
     	<div class="col-xl-6" style="font-size:1.2em; left:12%;"><strong>사용중인 위젯</strong></div>
      </div>
      <div class="modal-body" data-rno>
		<select id='callbacks' multiple='multiple'>
		<option value='notWid' data-li='noticeWidget' onclick="f_editStart()">학사공지(4x2)</option>
		<option value='calWid' data-li='calWidget'onclick="f_editStart()">학사일정(5x4)</option>
		<option value='busWid' data-li='busWidget'onclick="f_editStart()">버스노선도(4x2)</option>
		<option value='weatherWid' data-li='weatherWidget'onclick="f_editStart()">날씨(4x2)</option>
		<option value='bookmarkWid' data-li='bookmarkWidget'onclick="f_editStart()">북마크(2x2)</option>
		<option value='timeWid' data-li='timeWidget'onclick="f_editStart()">강의시간표(4x4)</option>
		<option value='attendWid' data-li='attendWidget'onclick="f_editStart()">출석 현황(3x3)</option>
		<option value='scoreWid' data-li='scoreWidget'onclick="f_editStart()">이번학기성적(3x3)</option>
		</select>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="f_editEnd()">Close</button>
      </div>
    </div>
  </div>
</div><!-- Modal End -->

<div id="busOrignDiv" style="display:none; position:absolute; left:0px; top:0px;">
<img id="busOrign" src="${webPath}/resources/img/bus.jpg" alt="건영대학교 셔틀버스 노선도" height="450px" style="border-radius:10px;">
</div>

<script src="<%=request.getContextPath()%>/resources/js/gridstack-all.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/libs/js/main-js.js"></script>
<%@ include file="./main_js.jsp" %>