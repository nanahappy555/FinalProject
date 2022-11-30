<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
				<div class="title">사용자 등록</div>
			</div>
			<div class="card-body">
				<form>
					<div class="row">
						<div>
							<div class="drop-zone ">
								<br />
								<div style="text-align: center; font-size: 50px;">
									<i class="fas fa-upload"></i>
								</div>
									<div
										style="text-align: center; font-size: 20px; font-weight: bold;">
										파일 선택 클릭<br />
										
									</div>
										
								</div>
							<input type="file" id="fileUpload" multiple>
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
				onclick="assignSubmit()">등록하기</button>
			
		</div>
		</div>
	</div>

		<input type="hidden" id="assBno" value="${assBno}">
		<input type="hidden" id="lecCd" value="${lecCd}">
	
</div>

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
function assignSubmit(){
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
			alert("성공적으로 과제를 제출하였습니다.");
			CloseWindow();
		},error:function(){
			alert("실패");
		}
	})
}

</script>
