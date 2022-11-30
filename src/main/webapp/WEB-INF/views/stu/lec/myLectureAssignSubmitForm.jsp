<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style>

.drop-zone {
    width: 500px;
    height: 300px;
    background-color: #ffffff;
    margin: 0 auto;
    position:relative;
    padding : 50px;
   	border-radius: 15px;
   	border : 3px dashed #71748d;
   	font-size:15px;
}

#fileUpload{
	position:absolute;
	top : 400px;
	right : 200px;
}


.drop-zone-dragenter, .drop-zone-dragover {
	background-color: #dbdbe7;
/*     border: 3px solid pink; */
}

.title{
	text-align: center;
	font-size: 30px;

}


</style>

</head>

<div class="container-fluid">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<div class="card-header">
				<div class="title">과제 제출 또는 수정하기</div>
			</div>
			<div class="card-body">
				<form>
					<div class="row flex justify-content-center">
						<textarea style="display: inline"
							class="form-control col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6"
							id="content" rows="3">${myAssignSub.subContent} </textarea>
						<div>
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
							<input type="file" id="fileUpload" multiple> <br> <br>
							 <c:if test="${not empty myAssignSub.attachList}">
				       	 	 <div class="justify-content-end d-flex col-md-12 col-sm-12 col-xs-12">
					       	 	 <div class="col-md-12 col-sm-12 col-xs-12" id="submitAttachList" style="border : 3px dashed gray; width: 500px; border-radius: 15px;">
					       	 			<div class="d-flex justify-content-end">
											 <h3>이전에 제출한 과제 파일 다운로드</h3>
										</div>
										 <c:forEach items="${myAssignSub.attachList}" var ="attach" >
													<div class="col-md-12 col-sm-4 col-xs-12 d-flex justify-content-end row" >
															
															<span data-ano="${attach.anoCd}${attach.anoSeq}" class="info-box-icon bg-yellow">
																<i  class="fa fa-copy"></i>
															</span>
															<span data-ano="${attach.anoCd}${attach.anoSeq}" class ="info-box-text">
																<fmt:formatDate value="${myAssignSub.submitDate}" pattern="yyyy/MM/dd"/>&nbsp;&nbsp;	
															</span>
															<span style="cursor:pointer;" data-ano="${attach.anoCd}${attach.anoSeq}" onclick="location.href='<%=request.getContextPath()%>/getFile?anoCd=${attach.anoCd}&anoSeq=${attach.anoSeq}'">${attach.filename }</span>
															<span style="cursor:pointer;" data-ano="${attach.anoCd}${attach.anoSeq}" onclick="removeFile(${attach.anoCd},${attach.anoSeq});">&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-times" style="color : red;"></i></span>
										</div>
										</c:forEach>
									 </div>
								</div>
							 </c:if>	
						</div>
					</div>
				</form>
			</div>
				<div class="row justify-content-end mt-3 mr-4">
			<!-- 					<button class="btn btn-info" type="button" onclick="">	</button>&nbsp; -->
			<!-- 					<button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
			<!-- 					<button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
			<!-- 					<br> -->
			<button class="btn btn-outline-primary m-1" type="button"
				onclick="assignSubmit()">과제제출하기/수정하기</button>
			<button class="btn btn-outline-secondary m-1" type="button"
				onclick="CloseWindow()">목록으로 돌아가기</button>
			
		</div>
		</div>
	</div>

		<input type="hidden" id="assBno" value="${assBno}">
		<input type="hidden" id="lecCd" value="${lecCd}">
	
</div>
<script>
window.onload=function(){
  summernote($('#content'),'<%=request.getContextPath()%>');	

 }
	 

function summernote(target,context){
	
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
		height:500,
		width:850,
		disableResizeEditor: true,
		callbacks:{
			onImageUpload : function(files, editor, welEditable) {
				for(var file of files){
					//alert(file.name);
					
					if(file.name.substring(file.name.lastIndexOf(".")+1).toUpperCase() != "JPG"){
						Swal.fire({
							  icon: 'error',
							  title: 'JPG 이미지형식만 가능합니다.',
							})
						return;
					}
					if(file.size > 1024*1024*5){
						Swal.fire({
							  icon: 'error',
							  title: '이미지는 5MB 미만입니다.',
							})
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
</script>
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
function removeFile(anoCd,anoSeq){
	
	Swal.fire({
        title: "제출한 파일을 삭제하시겠습니까?",
        text:" 삭제한 파일은 되돌릴 수 없습니다.",
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
           
        
	
		$.ajax({
			url:'${webPath}/stu/lec/mylecture/assign/delete',
			type:"post",
			data:{
				anoCd:anoCd,
				anoSeq:anoSeq
			},
			dataType:"json",
			success:function(data){
				$('span[data-ano='+anoCd+anoSeq+']').remove();
			},
			error:function(){
// 				alert('파일 삭제에 실패하였습니다. 관리자에게 문의하세요.');
			}
		})
        }
      });
} 
</script>
<script>
function assignSubmit(){
	
		
	Swal.fire({
        title: '제출하시겠습니까?',
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니오',
      }).then((result) => {
        if (result.isConfirmed) {
           
        
             
		

	
	var formData = new FormData();
	var content = $("#content").val();
	var assBno = $("#assBno").val();
	var lecCd=$("#lecCd").val();
	var uploadFile =$('#fileUpload');
	
	formData.append("subContent",content);
	formData.append("assBno",assBno);
	formData.append("lecCd",lecCd);
	for(var i=0;i<uploadFile[0].files.length;i++){
		formData.append("uploadFile",uploadFile[0].files[i]);
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/lec/mylecture/assign/regist",
		method:"post",
		contentType : false,
		processData : false,
		data:formData,
		dataType:"json",
		success:function(data){
			Swal.fire(
					  '성공적으로 과제를 제출하였습니다!',
					  '',
					  'success'
					).then(()=>{
						location.reload();
					});
		},error:function(){
// 			alert("실패");
		}
	})
	
        }
      });	
	
}

</script>
