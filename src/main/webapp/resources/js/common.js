
//js파일내에서 페이지 이동
function pageMove(url){
	 location.href =url;
}
//barChart 만들기 xValues, yValues,barColor 는 데이터배열.
/*
 ex)
var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = ["red", "green","blue","orange","brown"];
				

function makeBarChart(xValues,yValues,barColors,chartTitle){
	new Chart("myChart", {
	  type: "bar",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: barColors,
	      data: yValues
	    }]
	  },
	  options: {
		  legend: {display: false},
		    title: {
		      display: true,
		      text: chartTitle
		    }
	  }
	});
}
 */




//사용자 사진 출력
function MemberPictureThumb(contextPath){
	 for(var target of document.querySelectorAll('.manPicture')){	
		 var anoCd = target.getAttribute('data-anoCd');
		 
		 target.style.backgroundImage="url('"+contextPath+"/getPicture?anoCd="+anoCd+"&anoSeq=1')";
		 target.style.backgroundPosition="center";
		 target.style.backgroundRepeat="no-repeat";
		 target.style.backgroundSize="cover";
	}
}	

//팝업창들 뛰우기
//새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
							+"height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
	
	
	
	
	$(function(){
		


	    var strWidth;
	    var strHeight;

	    if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
	        strWidth = $('#contents').outerWidth() + (window.outerWidth - window.innerWidth);
	        strHeight = $('#contents').outerHeight() + (window.outerHeight - window.innerHeight);
	    }

	    else {
	        var strDocumentWidth = $(document).outerWidth();
	        var strDocumentHeight = $(document).outerHeight();
	        window.resizeTo ( strDocumentWidth, strDocumentHeight );

	        var strMenuWidth = strDocumentWidth - $(window).width();
	        var strMenuHeight = strDocumentHeight - $(window).height();

	        strWidth = $('#contents').outerWidth() + strMenuWidth;
	        strHeight = $('#contents').outerHeight() + strMenuHeight;
	    }

		//resize
		window.resizeTo( strWidth, strHeight );

	});
	
	
	
	
}

//팝업창 닫기
function CloseWindow(){
	
	window.opener.location.reload(true);		
	window.close();
}


//리스트업 함수

function list_go(page,url){
	//alert(page);
	if(!url) url="list.do";
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	jobForm.attr({
		action:url,
		method:'get'
	}).submit(); 
}


var contextPath="";

function summernote_go(target,context){
	
	contextPath = context;
	
	target.summernote({
		
		toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		
		placeholder:'여기에 내용을 적으세요.',
		lang:'ko-KR',
		height:220,
		disableResizeEditor: true,
		callbacks:{
			onImageUpload : function(files, editor, welEditable) {
				for(var file of files){
					//alert(file.name);
					
					if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
						alert("JPG 이미지형식만 가능합니다.");
						return;
					}
					if(file.size > 1024*1024*5){
						alert("이미지는 5MB 미만입니다.");
						return;
					}	
					
				}
				
				for (var file of files) {
					sendFile(file,this);
				}
			},
			onMediaDelete : function(target) {
				deleteFile(target[0].src);	
			}
		}
	});
}



function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append("file", file); 
	$.ajax({
		url: contextPath+'/uploadImg.do',
    	data: form_data,
    	type: "POST",	    	
    	contentType: false,	    	
    	processData: false,
    	success: function(img_url) {
    		//alert(img_url);
    		$(el).summernote('editor.insertImage', img_url);
    	},
    	error:function(){
    		AjaxErrorSecurityRedirectHandler(error.status);
    	}
	});
}

function deleteFile(src) {		
	var splitSrc= src.split("=");
	var fileName = splitSrc[splitSrc.length-1];
	
	var fileData = {fileName:fileName};
	
	$.ajax({
		url:contextPath+"/deleteImg.do",
		data : JSON.stringify(fileData),
		type:"post",
		contentType:"application/json",
		success:function(res){
			console.log(res);
		},
		error:function(){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function AjaxErrorSecurityRedirectHandler(status){
	if(status=="302"){
		alert("세션이 만료되었습니다.\n로그인하세요.");
		location.reload();
	}else if(status=="403"){
		alert("권한이 유효하지 않습니다.");
		history.go(-1);
	}else if(status == "404"){
		alert("해당 페이지를 찾을 수 없습니다.");
	}else{
		alert("시스템 장애로 실행이 불가합니다.");
		history.go(-1);
	}
}

//날짜포맷변경 2022/10/30
function f_transFormatToDate(p_date){
	let year = p_date.getFullYear();
	let month = p_date.getMonth() + 1;
	let v_date = p_date.getDate();
	
	return year + '/' + month + '/' + v_date;
}

function f_transFormatToTime(p_date){
	let year = p_date.getFullYear();
	let month = p_date.getMonth() + 1;
	let v_date = p_date.getDate();
	let hour = p_date.getHours();
	let minute = p_date.getMinutes();
	
	return year + '/' + month + '/' + v_date+" "+('00'+hour).slice(-2)+":"+('00'+minute).slice(-2);
	
}


