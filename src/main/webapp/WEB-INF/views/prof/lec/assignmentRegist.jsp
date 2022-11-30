<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>

<style>
.tui-datepicker {
	z-index: 999;
}


.drop-zone {
    width: 500px;
    height: 250px;
    background-color: #ffffff;
    margin-top: 20px;
    position:relative;
    padding : 50px;
   	border-radius: 15px;
   	border : 3px dashed #71748d;
   	font-size:15px;
}

#fileUpload{
}


.drop-zone-dragenter, .drop-zone-dragover {
	background-color: #dbdbe7;
/*     border: 3px solid pink; */
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
<div class="container-fluid">

	<!-- 111111 -->
	<div class="row">
		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h2 class="card-header">과제 등록하기</h2>
				

					<div class="card-body">
					<form role="form" method="post"action="<%=request.getContextPath() %>/prof/lec/assignment/regist"name="registForm">
						<div class="row">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th>제목</th>
										
										<td class="table-title"><input class="form-control"
											id="title" name="title" type="text" style="width:100%"/>
											</td>
										<th>시작날짜</th>
										<td class="table-title">
											<div
												class="tui-datepicker-input tui-datetime-input tui-has-focus">
												<input type="text" id="datepicker-input" name="createDate" aria-label="Date-Time"> <span class="tui-ico-date"></span>
											</div>
											<div id="wrapper" style="margin-top: -1px;"></div>
										</td>
									</tr>
									<tr>
										<th>점수비율</th>
										<td class="table-title"><input type="number" name="evalRate" style="width:100%"/></td>
										<th>마감날짜</th>
										<td class="table-title">
											<div
												class="tui-datepicker-input tui-datetime-input tui-has-focus">
												<input type="text" id="datepicker-input-1" name="dueDate"
													aria-label="Date-Time"> <span class="tui-ico-date"></span>
											</div>
											<div id="wrapper-1" style="margin-top: -1px;"></div>

										</td>
									</tr>

								</tbody>
							</table>
							</div>
							<div class="row">
							<div class="col-xl-8">
								<div class="form-group">
									<label for="content"></label>
									<textarea class="textarea" name="content" id="content"
										rows="20" placeholder="1000자 내외로 작성하세요."
										style="display: none;"></textarea>
								</div>
							</div>
							<div class="col-xl-4">
								<div class="drop-zone ">
									<br />
									<div style="text-align: center; font-size: 50px;">
										<i class="fas fa-upload"></i>
									</div>
									<div
										style="text-align: center; font-size: 20px; font-weight: bold;">
										파일 선택 클릭<br />또는 파일을 여기로 드래그하세요.
									</div>
								
								</div>
										<input  style="padding-left:210px;" type="file" id="fileUpload" multiple> <br> <br> 	
							</div>
				</div>
			
</form>


					<!-- ================================================= -->
					<!-- 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-3">
						<!--                <button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
						<!--                <button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
						<!--                <button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
						<!--                <br> -->
						<div class="col-xl-8">
							<button class="btn btn-outline-primary" type="button"
								onclick="autoFill();">자동완성</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-primary" type="button"
								onclick="regist_go();">등록</button>
							&nbsp;&nbsp;
							<button class="btn btn-outline-danger" type="button"
								onclick="closeFn();">취소</button>
							&nbsp;&nbsp;
						</div>
					</div>
					<!-- ================================================= -->
					<!-- 버튼 끝 -->
					<!-- ================================================= -->
				</div>
			</div>
		</div>
	</div>

	<!-- 11111끝 -->

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
(function() {
    
    var $file = document.getElementById("fileUpload")
    var dropZone = document.querySelector(".drop-zone")

    var toggleClass = function(className) {
        
        console.log("current event: " + className)

        var list = ["dragenter", "dragleave", "dragover", "drop"]

        for (var i = 0; i < list.length; i++) {
            if (className === list[i]) {
                dropZone.classList.add("drop-zone-" + list[i])
            } else {
                dropZone.classList.remove("drop-zone-" + list[i])
            }
        }
    }
    
    var showFiles = function(files) {
        dropZone.innerHTML = ""
        if(files.length == 0){
        	dropZone.innerHTML += `</br>
			 	<div style="text-align:center; font-size:50px;"><i class="fas fa-upload"></i></div>
	      		<div style="text-align:center; font-size:20px; font-weight:bold;">파일 선택 클릭</br>또는 파일을 여기로 드래그하세요.</div>`;
        }
        for(var i = 0, len = files.length; i < len; i++) {
            dropZone.innerHTML += "<p><i class='fas fa-file'></i>&nbsp;&nbsp;" + files[i].name + "</p>";
        }
    }

    var selectFile = function(files) {
        // input file 영역에 드랍된 파일들로 대체
        $file.files = files
        showFiles($file.files)
        
    }
    
    $file.addEventListener("change", function(e) {
        showFiles(e.target.files)
    })

    // 드래그한 파일이 최초로 진입했을 때
    dropZone.addEventListener("dragenter", function(e) {
        e.stopPropagation()
        e.preventDefault()

        toggleClass("dragenter")

    })

    // 드래그한 파일이 dropZone 영역을 벗어났을 때
    dropZone.addEventListener("dragleave", function(e) {
        e.stopPropagation()
        e.preventDefault()

        toggleClass("dragleave")

    })

    // 드래그한 파일이 dropZone 영역에 머물러 있을 때
    dropZone.addEventListener("dragover", function(e) {
        e.stopPropagation()
        e.preventDefault()

        toggleClass("dragover")

    })

    // 드래그한 파일이 드랍되었을 때
    dropZone.addEventListener("drop", function(e) {
        e.preventDefault()

        toggleClass("drop")

        var files = e.dataTransfer && e.dataTransfer.files
        console.log(files)

        if (files != null) {
            if (files.length < 1) {
                alert("폴더 업로드 불가")
                return
            }
            selectFile(files)
        } else {
            alert("ERROR")
        }

    })

})();
</script>

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

  
</script>


<script>

function regist_go(){
	
	if(!$('input[name="title"]').val()){
		  alert("제목은 필수입니다.");
		  return;
		}
	
	if(!$('textarea[name="content"]').val()){
		  alert("내용은 필수입니다.");
		  return;
	}
	

	if ($('input[name="evalRate"]').val() < 0) {
		alert("점수비율을 확인하세요");
		  return;
	}
	
	var formData = new FormData();
	var uploadFile =$('#fileUpload');
	var createDate = f_transFormatToTime(datepicker.getDate());
	var dueDate = f_transFormatToTime(datepicker1.getDate());
	var title = $('input[name="title"]').val();
	var content = $('textarea[name="content"]').val();
	var evalRate = $('input[name="evalRate"]').val();
	var lecCd = "<%=request.getParameter("lecCd")%>";
	console.log(lecCd);
	
	formData.append("createDate",createDate);
	formData.append("dueDate",dueDate);
	formData.append("title",title);
	formData.append("content",content);
	formData.append("evalRate",evalRate);
	formData.append("lecCd",lecCd);
	for(var i=0;i<uploadFile[0].files.length;i++){ //-----------------------@2
		formData.append("uploadFile",uploadFile[0].files[i]);
	}
	
	
$.ajax({
	
	method:"post",
	url: "<%=request.getContextPath()%>/prof/lec/assignment/regist",
	contentType : false,
	processData : false,
	data:formData,
	success:function(data){
// 		console.log(data);
		
		Swal.fire(
			  '성공적으로 과제를 제출했습니다!',
			  '',
			  'success'
		).then(()=>{
			  CloseWindow();
		});
	},
	error:function(){
		alert("실패");
	}
});

}
	
// 	var ele = document.querySelector("input[name='createDate']").value = createDate;
// 	var ele = document.querySelector("input[name='dueDate']").value = dueDate;
	
function closeFn(){
	
	Swal.fire({
		  title: '취소하시겠습니깨?',
		  icon: 'warning',
		  showCancelButton: false,
		  showDenyButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '네',
		  denyButtonText:'아니요'
		}).then((result) => {
		  if (result.isConfirmed) {
		   CloseWindow();
		  }
		})
}
function autoFill(){
	$('#title').val('그림심리학 조사');
	$("input[name='evalRate']").val(30);
	$('#content').summernote('pasteHTML', '그림심리학의 개요를 A4용지 한장으로 조사해오시오');
}

</script>
