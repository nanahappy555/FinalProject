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
</style>

<link href="<%=request.getContextPath()%>/resources/css/gridstack.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/multi-select/css/multi-select.css">
<!-- <meta name="robots" content="noindex, nofollow"> -->
<script nonce="38fdc5de-d9a7-45da-afae-765026c93c2c">
(function(w,d){!function(Z,_,ba,bb){Z.zarazData=Z.zarazData||{};Z.zarazData.executed=[];Z.zaraz={deferred:[],listeners:[]};Z.zaraz.q=[];Z.zaraz._f=function(bc){return function(){var bd=Array.prototype.slice.call(arguments);Z.zaraz.q.push({m:bc,a:bd})}};for(const be of["track","set","debug"])Z.zaraz[be]=Z.zaraz._f(be);Z.zaraz.init=()=>{var bf=_.getElementsByTagName(bb)[0],bg=_.createElement(bb),bh=_.getElementsByTagName("title")[0];bh&&(Z.zarazData.t=_.getElementsByTagName("title")[0].text);Z.zarazData.x=Math.random();Z.zarazData.w=Z.screen.width;Z.zarazData.h=Z.screen.height;Z.zarazData.j=Z.innerHeight;Z.zarazData.e=Z.innerWidth;Z.zarazData.l=Z.location.href;Z.zarazData.r=_.referrer;Z.zarazData.k=Z.screen.colorDepth;Z.zarazData.n=_.characterSet;Z.zarazData.o=(new Date).getTimezoneOffset();Z.zarazData.q=[];for(;Z.zaraz.q.length;){const bl=Z.zaraz.q.shift();Z.zarazData.q.push(bl)}bg.defer=!0;for(const bm of[localStorage,sessionStorage])Object.keys(bm||{}).filter((bo=>bo.startsWith("_zaraz_"))).forEach((bn=>{try{Z.zarazData["z_"+bn.slice(7)]=JSON.parse(bm.getItem(bn))}catch{Z.zarazData["z_"+bn.slice(7)]=bm.getItem(bn)}}));bg.referrerPolicy="origin";bg.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(Z.zarazData)));bf.parentNode.insertBefore(bg,bf)};["complete","interactive"].includes(_.readyState)?zaraz.init():Z.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,0,"script");})(window,document);
</script>
</head>
<div class="container-fluid">
<div class="grid-stack">

 <!-- 프로필 -->
<!--    <div class="grid-stack-item" gs-w="3" gs-h="2" gs-no-resize="true" gs-no-move="true" gs-locked="true" -->
<!--       style="border:1px solid black;"> -->
<!--        <div class="grid-stack-item-content" style="border:1px solid red;"> -->
<!--           <div class="card"> -->
<!--             <div class="card-body"> -->
            
<!--                <div class="d-flex justify-content-center"> -->
<!--                   <span class="btn btn-rounded btn-primary">교수</span>&nbsp;&nbsp;&nbsp; -->
<!--                   <h3 class="mt-1"><strong>안녕하세요, <p class="d-inline text-primary">장원영님!</p></strong></h3> -->
<!--                </div> -->
<!--                <div class="card-body d-flex" style="padding: 22px 0px 0px 0px;"> -->
<!--                   <div class="col-xl-5"> -->
<!--                      <div class="user-avatar text-center d-block"> -->
<%--                         <img src="<%=request.getContextPath() %>/resources/img/장원영.png" alt="User Avatar" --%>
<!--                            class="rounded-circle user-avatar-xxl" style="box-shadow: 6px 3px 3px #EEEEEE;"> -->
<!--                      </div> -->
<%--                      <p class="text-center"><a href="javascript:void(0);" onclick="pageMove('<%=request.getContextPath() %>/stu/aca/info.do')">개인정보수정</a></p> --%>
<!--                      </br> -->
<!--                   </div> -->
<!--                   <div class="col-xl-7 text-center"> -->
<!--                      <p style="font-size: 0.85em;" class="alert alert-dark m-1" style="padding: 5px 5px 5px 5px;">연예대학</br>컴퓨터공학과</p> -->
<!-- <!--                      <p class="alert alert-dark">2학년 / 재학</p><br/> --> 
<!--                      <p class="alert alert-dark m-1" style="padding: 5px 5px 5px 5px;">교수</p> -->
<!--                      <p class="alert alert-dark m-1" style="padding: 5px 5px 5px 5px;">교번 22101001</p> -->
<!--                      <p class="mt-2"> -->
<!--                      <a href="javascript:void(0);" class="" -->
<!--                         data-toggle="modal" data-target="#widgetModal"> -->
<!--                         <i class="fas fa-cog">위젯편집</i></a> -->
<!--                      &nbsp; -->
<!--                      <a onClick="saveGrid()" href="javascript:void(0);"> -->
<!--                         <i class="fas fa-save">저장</i> -->
<!--                      </a> -->
<!--                      <a onClick="loadGrid()" href="javascript:void(0);"> -->
<!--                         <i class="fas fa-save">불러오기확인</i> -->
<!--                      </a> -->
<!--                      </p> -->
<!--                      </div> -->
<!--                </div> -->
            
<!--             </div> -->
<!--          </div> -->
<!--          </div> -->
<!--    </div>프로필끝 -->
   
   

<!--    <!-- 아이템 시작 --> 
<!--    <div class="grid-stack-item" gs-w="2" -->
<!--       style="border:1px solid black;"> -->
<!--        <div class="grid-stack-item-content" style="border:1px solid red;"> -->
<!--           <div class="card"> -->
<!--             <span class="d-flex justify-content-end m-2"> -->
<!--                <button class="btn btn-sm btn-outline-light" onclick="grid.removeWidget(this.parentNode.parentNode.parentNode.parentNode)" style="border:0;outline:0;"> -->
<!--                   <i class="fas fa-window-close"></i> -->
<!--                </button> -->
<!--             </span>       -->
<!--             <div class="card-body"> -->
<!--                카드바디1 -->
<!--             </div> -->
<!--          </div> -->
<!--          </div> -->
<!--    </div>아이템 끝 -->
<!--    <!-- 아이템 시작 --> 
<!--    <div class="grid-stack-item" gs-w="2" -->
<!--       style="border:1px solid black;"> -->
<!--        <div class="grid-stack-item-content" style="border:1px solid red;"> -->
<!--           <div class="card"> -->
<!--             <span class="d-flex justify-content-end m-2"> -->
<!--                <button class="btn btn-sm btn-outline-light" onclick="grid.removeWidget(this.parentNode.parentNode.parentNode.parentNode)" style="border:0;outline:0;"> -->
<!--                   <i class="fas fa-window-close"></i> -->
<!--                </button> -->
<!--             </span>       -->
<!--             <div class="card-body" style="border:1px dotted blue; width:100%; height:100%;"> -->
<!--                <iframe style="border:1px dotted green; width:100%; height:100%;" -->
<%--                   src="<%=request.getContextPath() %>/mylecture/notice/list.do?lecCode=${lecCode}" --%>
<!--                   onload="this.style.height=(this.contentWindow.document.body.scrollHeight)+'px';"> -->
<!--                </iframe> -->
<!--             </div> -->
<!--          </div> -->
<!--          </div> -->
<!--    </div>아이템 끝 -->
  
</div><!-- 그리드 끝 -->



<textarea id="saved-data" cols="100" rows="20" readonly="readonly"></textarea>




</div><!-- 본문끝 -->




<!-- Modal -->
<div id="widgetModal" class="modal modal-default fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">위젯 추가하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body" data-rno>
      
		<select id='callbacks' multiple='multiple'>
		<option value='elem_11'>add Widget 1x1</option>
		<option value='elem_22'>add Widget 2x2</option>
		<option value='wid32'>add Widget 3x2</option>
		<option value='elem_33'>add Widget 3x3</option>
		<option value='elem_42'>add Widget 4x2</option>
		</select>
      
         <!-- 위젯추가버튼 -->
      <a onClick="f_addWidget(bodyContent(),1,1,'wid11')" class="btn btn-primary" href="javascript:void(0);">Add Widget1x1</a>
      <a onClick="f_addWidget(bodyContent(),2,2,'wid22')" class="btn btn-primary" href="javascript:void(0);">Add Widget2x2</a>
      <a onClick="f_addWidget(bodyContent(),3,2,'wid32')" class="btn btn-primary" href="javascript:void(0);">Add Widget3x2</a>
      <a onClick="f_addWidget(bodyContent(),3,3,'wid33')" class="btn btn-primary" href="javascript:void(0);">Add Widget3x3</a>
      <a onClick="f_addWidget(bodyContent(),4,2,'wid42')" class="btn btn-primary" href="javascript:void(0);">Add Widget4x2</a>
      <a onClick="f_addWidget(bodyContent(),5,5,'wid55')" class="btn btn-primary" href="javascript:void(0);">Add Widget5x5</a>
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-primary" id="replyModBtn" onclick="replyModify_go();">Modify</button> -->
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div><!-- Modal End -->


<script src="<%=request.getContextPath()%>/resources/js/gridstack-all.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/libs/js/main-js.js"></script>
<script>
var merong = (args) => {
	return 'merong'+args;
}

    $('#callbacks').multiSelect({
        afterSelect: function(values) {
        	if(values == 'wid32'){
// 	            alert("Select value: " + values);
// 				alert(merong(1));
				f_addWidget(bodyContent(),3,2,'wid32');
        	}
        },
        afterDeselect: function(values) {
        	if(values == 'wid32'){
// 	            alert("Deselect value: " + values);
				var obj = document.querySelector("#wid32");
				var par = obj.parentNode;
				var gra = par.parentNode;
				console.log(obj);
				console.log(par);
				console.log(gra);
// 				var widId = $('#wid32');
// 				var target = $('#wid32').parentNode;
// 				console.log("widId",widId);
// 				console.log("parentNode",widId.parentNode);
// 				console.log("parentElement",widId.parentElement);
// 				console.log("target",target);
				grid.removeWidget(gra);
        		
        	}
        }
    });
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
<script>
//gs-w="2"
//gs-h="2"
let options = {
   column: 8,
   minRow: 2,
   maxRow: 5,
   cellHeight: 170,
   float:true,
   removable: '#trash'
};

var initWidget =
	[
		  {
		    "w": 3,
		    "h": 2,
		    "noResize": true,
		    "noMove": true,
		    "locked": true,
		    "x": 0,
		    "y": 0,
		    "content": "\n          <div class=\"card\">\n            <div class=\"card-body\">\n            \n               <div class=\"d-flex justify-content-center\">\n                  <span class=\"btn btn-rounded btn-primary\">교수</span>&nbsp;&nbsp;&nbsp;\n                  <h3 class=\"mt-1\"><strong>안녕하세요, <p class=\"d-inline text-primary\">장원영님!</p></strong></h3>\n               </div>\n               <div class=\"card-body d-flex\" style=\"padding: 22px 0px 0px 0px;\">\n                  <div class=\"col-xl-5\">\n                     <div class=\"user-avatar text-center d-block\">\n                        <img src=\"/ai/resources/img/장원영.png\" alt=\"User Avatar\" class=\"rounded-circle user-avatar-xxl\" style=\"box-shadow: 6px 3px 3px #EEEEEE;\">\n                     </div>\n                     <p class=\"text-center\"><a href=\"javascript:void(0);\" onclick=\"pageMove('/ai/stu/aca/info.do')\">개인정보수정</a></p>\n                     <br>\n                  </div>\n                  <div class=\"col-xl-7 text-center\">\n                     <p style=\"font-size: 0.85em;\" class=\"alert alert-dark m-1\">연예대학<br>컴퓨터공학과</p>\n<!--                      <p class=\"alert alert-dark\">2학년 / 재학</p><br/> -->\n                     <p class=\"alert alert-dark m-1\" style=\"padding: 5px 5px 5px 5px;\">교수</p>\n                     <p class=\"alert alert-dark m-1\" style=\"padding: 5px 5px 5px 5px;\">교번 22101001</p>\n                     <p class=\"mt-2\">\n                     <a href=\"javascript:void(0);\" class=\"\" data-toggle=\"modal\" data-target=\"#widgetModal\">\n                        <i class=\"fas fa-cog\">위젯편집</i></a>\n                     &nbsp;\n                     <a onclick=\"saveGrid()\" href=\"javascript:void(0);\">\n                        <i class=\"fas fa-save\">저장</i>\n                     </a>\n                     <a onclick=\"loadGrid()\" href=\"javascript:void(0);\">\n                        <i class=\"fas fa-save\">불러오기확인</i>\n                     </a>\n                     </p>\n                     </div>\n               </div>\n            \n            </div>\n         </div>\n         "
		  },
		  {
		    "w": 2,
		    "x": 3,
		    "y": 0,
		    "content": "\n          <div class=\"card\">\n            <span class=\"d-flex justify-content-end m-2\">\n               <button class=\"btn btn-sm btn-outline-light\" onclick=\"grid.removeWidget(this.parentNode.parentNode.parentNode.parentNode)\" style=\"border:0;outline:0;\">\n                  <i class=\"fas fa-window-close\"></i>\n               </button>\n            </span>      \n            <div class=\"card-body\">\n               카드바디1\n            </div>\n         </div>\n         "
		  },
		  {
		    "w": 2,
		    "x": 5,
		    "y": 0,
		    "content": "\n          <div class=\"card\">\n            <span class=\"d-flex justify-content-end m-2\">\n               <button class=\"btn btn-sm btn-outline-light\" onclick=\"grid.removeWidget(this.parentNode.parentNode.parentNode.parentNode)\" style=\"border:0;outline:0;\">\n                  <i class=\"fas fa-window-close\"></i>\n               </button>\n            </span>      \n            <div class=\"card-body\" style=\"border:1px dotted blue; width:100%; height:100%;\">\n               <iframe style=\"border: 1px dotted green; width: 100%; height: 831px;\" src=\"/ai/mylecture/notice/list.do?lecCode=\" onload=\"this.style.height=(this.contentWindow.document.body.scrollHeight)+'px';\">\n               </iframe>\n            </div>\n         </div>\n         "
		  }
		];

var grid = GridStack.init(options); //초기화
grid.load(initWidget,true); //초기데이터

var bodyContent = () =>{
   var str = '<table class="table table-hover"><thead><tr><th scope="col">#</th><th scope="col">제목</th><th scope="col">날짜</th></tr></thead><tbody>';
   str +='<tr><td>1</td><td class="table-title">3x3열글자이후로는잘리게...</td><td>2022.10.19</td></tr>';
   str +='<tr><td>1</td><td class="table-title">4x3은더써도상관없습니다......</td><td>2022.10.19</td></tr>';
   str +='<tr><td>1</td><td class="table-title">글네개까지</td><td>2022.10.19</td></tr>';
   str +='<tr><td>1</td><td class="table-title">제모모모목제모모모목</td><td>2022.10.19</td></tr>';
   str += '</tbody></table>';
   return str;
}




function f_addWidget(fnContent,wargs,hargs,widId){
   var newWidget = `<div class="card" id="`+widId+`">
			<span class="row d-flex justify-content-between m-2">
           		<h3 class="d-flex align-items-end ml-2 mt-2"><i class="fas fa-paperclip"> 공지사항</i></h3>
           		<div>
           			<button class="btn btn-sm btn-outline-light"
           				onclick="grid.removeWidget(this.parentNode.parentNode.parentNode.parentNode.parentNode)"
           				style="border:0;outline:0;">
           				<i class="fas fa-window-close"></i>
         			</button>
         		</div>
       		</span>
         	<div class="card-body">
           		`+fnContent+`
           	</div>
		</div>`;
   grid.addWidget({w: wargs,h:hargs, content:newWidget}); //가로,세로,내용
   
}


//    grid.addWidget({
//       w : 5,
//       content : 'item 1'
//    });
//    grid.addWidget({
//       w : 5,
//       content : 'item 2'
//    });
//    grid.addWidget({
//       w : 5,
//       content : 'item 3'
//    });
//    grid.addWidget({
//       w : 5,
//       content : 'item 4'
//    });
   
// fucntion compact(i){
//    grid.compact();
// }

saveGrid = function() {
//    delete serializedFull;
   serializedData = grid.save();
   document.querySelector('#saved-data').value = JSON.stringify(serializedData, null, '  ');
}

loadGrid = function() {
   grid.removeAll();
   grid.load(serializedData, true); // update things
}

</script>