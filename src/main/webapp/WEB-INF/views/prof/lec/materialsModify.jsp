<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<style>


.drop-zone {
    width: 560px;
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
</head>

<!-- 게시판등록 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

<!-- 111111 -->
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card mb-0">
			<h2 class="card-header">수정하기</h2>

			<div class="card-body">
					<table class="table table-bordered" width="1500">

						<tbody>
							<tr>
								<th style="width:10%">주차</th>
								<td>
								<select name="week" style="width:100%; height:30px;" disabled>
									<option value='1' ${detail.weekNo eq 1 ? 'selected':'' }>1주차</option>
									<option value='2' ${detail.weekNo eq 2 ? 'selected':'' }>2주차</option>
									<option value='3' ${detail.weekNo eq 3 ? 'selected' : '' }>3주차</option>
									<option value='4' ${detail.weekNo eq 4 ? 'selected' : '' }>4주차</option>
									<option value='5' ${detail.weekNo eq 5 ? 'selected' : '' }>5주차</option>
									<option value='6' ${detail.weekNo eq 6 ? 'selected' : '' }>6주차</option>
									<option value='7' ${detail.weekNo eq 7 ? 'selected' : '' }>7주차</option>
									<option value='8' ${detail.weekNo eq 8 ? 'selected' : '' }>8주차</option>
									<option value='9' ${detail.weekNo eq 9 ? 'selected' : '' }>9주차</option>
									<option value='10' ${detail.weekNo eq 10 ? 'selected' : '' }>10주차</option>
									<option value='11' ${detail.weekNo eq 11 ? 'selected' : '' }>11주차</option>
									<option value='12' ${detail.weekNo eq 12 ? 'selected' : '' }>12주차</option>
									<option value='13' ${detail.weekNo eq 13 ? 'selected' : '' }>13주차</option>
									<option value='14' ${detail.weekNo eq 14 ? 'selected' : '' }>14주차</option>
									<option value='15' ${detail.weekNo eq 15 ? 'selected' : '' }>15주차</option>
									<option value='16' ${detail.weekNo eq 16 ? 'selected' : '' }>16주차</option>
								</select>
								</td>
							</tr>

						</tbody>
					</table>
				<div>
					<div class="form-group">
						<textarea class="textarea" name="content" id="content" rows="20"
							placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
					</div>
				</div>
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
							<input  style="padding-left:210px;" type="file" id="fileUpload" multiple> <br> <br> 	
				</div>
				<c:choose>
				<c:when test="${empty detail.attachList}"></c:when>
				<c:otherwise>
					<div class="card-footer fileInput" >
										<ul class="mailbox-attachments" >
											<!-- 첨부파일 썸네일 -->		
											<c:forEach items="${detail.attachList }" var="attach" >
												<li class="attach-item${attach.anoCd }${attach.anoSeq }" file-name="${attach.filename }" target-ano="${attach.anoCd }">																			
												<div class="mailbox-attachment-info"  style="display:inline">
													<a class="mailbox-attachment-name" name="attachedFile" attach-fileName="${attach.filename }" attach-no="${attach.anoCd }" href="${webPath }/pds/getFile.do?ano=${attach.anoCd }"  >													
														<i class="fas fa-paperclip"></i>
														${attach.filename }&nbsp;&nbsp;
													</a>													
														<button type="button" onclick="removeFile_go(${attach.anoCd},${attach.anoSeq });" style="border:0;outline:0;" 
																class="badge bg-red">X</button>																									
												</div>
											</li>	
											</c:forEach>								
										</ul>
										<br/>														
									</div>
				</c:otherwise>
				</c:choose>
				<!-- ================================================= -->
				<!-- 버튼 시작 -->
				<!-- ================================================= -->
				<div class="row justify-content-end mt-1">
					<button class="btn btn-outline-primary" type="button" onclick="modify_go();">등록</button>&nbsp;&nbsp;
					<button class="btn btn-outline-danger" type="button" onclick="window.close();">닫기</button>&nbsp;&nbsp;
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
	
	$('#content').summernote('code', '${detail.content}');
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
var anoCd = ${detail.anoCd};
var lecCd = "<%=request.getParameter("lecCd")%>";
function modify_go(){
	
	if(!$('select[name="week"]').val()){
		Swal.fire('주차 선택을 필수 입니다.', '', 'info')
		  return;
		}
	
	if(!$('textarea[name="content"]').val()){
		Swal.fire('내용은 필수 입니다.', '', 'info')
		  return;
	}
	
	var formData = new FormData();
	var uploadFile =$('#fileUpload');
	var weekNo = $('select[name="week"]').val();
	var content = $('textarea[name="content"]').val();
	
	
	console.log("anoCd",anoCd);
	
	formData.append("weekNo",weekNo);
	formData.append("content",content);
	formData.append("lecCd",lecCd);
	formData.append("anoCd",anoCd);
	for(var i=0;i<uploadFile[0].files.length;i++){ //-----------------------@2
		formData.append("uploadFile",uploadFile[0].files[i]);
	}
	
	
	
	Swal.fire({
		  title: '저장하시겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니오',
		}).then((result) => {
		  if (result.isConfirmed) {
			  
			  $.ajax({
					method:"post",
					url: "<%=request.getContextPath()%>/prof/lec/materials/modify",
					contentType : false,
					processData : false,
					data:formData,
					success:function(data){
						 Swal.fire('저장했습니다!', '', '닫기').then(()=>{
							CloseWindow(); 
						 });
					},
					error:function(){
						Swal.fire({
							  icon: 'error',
							  text: '서버에러',
							})
					}
				});
			  
		    
			 
		    
		  } else if (result.isDenied) {
			  
		    Swal.fire('저장하지 않았습니다.', '', 'info')
		    
		  }
		});
		
}
</script>
<script>

$(function(){
	var xbtns = document.querySelectorAll("button[class='badge bg-red']");
	for (var i = 0; i < xbtns.length; i++) {
		xbtns[i].addEventListener('click',function(e){
			e.stopPropagation();
		});
	}
});
function removeFile_go(anocd,anoSeq){
	var className = "attach-item" + anocd + anoSeq;
	
	
	Swal.fire({
		  title: '삭제하시겠습니까?',
		  text: "다시 되돌릴 수 없습니다!",
		  icon: 'warning',
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '네',
		  denyButtonText: '아니오'
		}).then((result) => {
		  if (result.isConfirmed) {
			  $.ajax({
					method:"get",
					url:"${webPath}/removeSelectedFile?anoCd="+anocd+"&anoSeq="+anoSeq,
					dataType:"text",
					success:function(data){
						Swal.fire(
							      'Deleted!',
							      'Your file has been deleted.',
							      'success'
							    )
							    
						 $(this).closest("li").remove();
						 $('li[class='+className+']').remove();
						    
						
					},
					error:function(){
					}
				});
		    
		  }
		})
	
	
}


</script>

