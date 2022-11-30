<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
/* #uplode {
		margin: 1px 0;
		border-width: 2px;
		border-color: red;
		border-style: dotted;
	} */
#myModal {   /* 모달창 기본 css*/
    position:fixed; 
    width:100%;
    height:100%;  /* 화면을 꽉 채움  fixed인 경우 % 작동됨 */
    background-color: rgba(0,0, 0, 0.3);
    }
#modal {
	position: absolute;
    top:50%;
    left:50%;  /* 화면을 꽉 채움  fixed인 경우 % 작동됨 */
    transform: translate(-50%, -50%);
}
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
	/* top : 400px;
	right : 200px; */
}


.drop-zone-dragenter, .drop-zone-dragover {
	background-color: #dbdbe7;
/*     border: 3px solid pink; */
}

.title{
	text-align: center;
	font-size: 30px;

}
.dashboard-main-wrapper {
	padding-top: 0px;
}

.dashboard-wrapper {
	margin-left: 0px;
}

.page-aside {
	margin-top: 0px;
	left: 0px;
}


</style>


<link href="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/skin-win8/ui.fancytree.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/jquery.fancytree@2.27/dist/jquery.fancytree-all-deps.min.js"></script>



<!-- 첨부파일 모달 -->
					<!-- ------------------------------------------- -->
				<div class="card" id="myModal" style="display:none; z-index: 9999999999">
				
			        <div class="card-body" id="modal" class="modal-content">
			        	<div class="card" id="back">
				        	<div class="card-body">
									<div class="row">
									
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
											
										</div>
									</div>
							</div>
							<div class="row justify-content-left ml-3">
				         		<input type="file" id="fileUpload" multiple>
				         	</div>
					        <div class="row justify-content-end mr-3 mt-1">
				         		<input type="button" class="btn btn-sm btn-primary" style="font-size: 1em;" name="" value="close" onclick="f_close()">
				         	</div><br>
				         	
			         	</div>
					</div>
					
				</div>
					<!-- ------------------------------------------- -->
<div class="card">
   <div class="card-body">

<div class="dashboard-main-wrapper">
	<div class="dashboard-wrapper">


		<div class="container-fluid">
			<aside class="page-aside">
				<div class="aside-content">
					<div class="aside-header">
						<button class="navbar-toggle" data-target=".aside-nav"
							data-toggle="collapse" type="button">
							<span class="icon"><i class="fas fa-caret-down"></i></span>
						</button>
						<div class="f-icon">
							<span class="title" onclick="pageMove('<%=request.getContextPath()%>/common/mail/received/list');"><i class="fas fa-envelope" style="margin-right:10px"></i>쪽지함</span>
						</div>

					</div>
					<div class="aside-compose">
						<button class="btn btn-lg btn-primary btn-block" type="button" 
							onclick="pageMove('<%=request.getContextPath()%>/common/mail/sendForm.do');" >쪽지 보내기</button>
					</div>
					<div class="aside-nav collapse" style="cursor: pointer;" >
						<ul class="nav">
							<li><a onclick="pageMove('<%=request.getContextPath() %>/common/mail/received/list.do')"><span class="icon"><i
										class="fas fa-fw fa-inbox"></i></span>받은 쪽지함<span
									class="badge badge-primary float-right">${count }</span></a></li>
							<li><a onclick="pageMove('<%=request.getContextPath() %>/common/mail/sent/list.do')"><span class="icon"><i
										class="fas fa-fw  fa-envelope"></i></span>보낸 쪽지함</a></li>		
							<li><a onclick="pageMove('<%=request.getContextPath()%>/common/mail/bin/list.do')"><span class="icon"><i
										class="fas fa-fw fa-trash"></i></span>휴지통</a></li>
						</ul>
						
					</div>
				</div>
			</aside>

			<!-- 수정할 부분 -->
			<div class="main-content container-fluid p-0">
				<div class="email-head">

			<div class="email-head-title"><i class="fas fa-envelope" style="margin-right: 10px"></i>쪽지보내기<span class="icon mdi mdi-edit"></span></div>
	
			</div>

			<div class="card">
   				<div class="card-body">

					<div class="to">
						<div class="form-group row pt-0" >
							<label class="col-md-1 control-label" ><strong>&nbsp;&nbsp;받는사람</strong></label>
	
					<div class="col-md-9" class="receiverIdBar row">
						<input class="form-control receiverIdBar__Input" type="text" id="receiverId">
					</div>
						<a href="#" class="btn btn-light" style="width:85px; height:35px;" data-toggle="modal" data-target="#mailSendFormModal"><strong>주소록</strong></a>
						</div>
					</div>
			<div class="subject">
				<div class="form-group row pt-2">
					<label class="col-md-1 control-label"><strong>&nbsp;&nbsp;제 목</strong></label>
						<div class="col-md-10">
							<input class="form-control" type="text" id="title">
						</div>
				</div>
			</div>
			
						<br>
			<div class="to">
				<div class="form-group row pt-0" >
					<label class="col-md-1 control-label" ><strong>&nbsp;&nbsp;첨부파일</strong></label>
					<div class="col-md-9" id="uplode">
						<div class="form-control" id="showFilessss" style="height:35px;"></div>
					</div>
					<input type="button" value="파일 선택" onclick="f_modal()" class="btn btn-sm btn-primary" >
				</div>
			</div>
<!-- 			<div class="subject">
				<div class="form-group row pt-2">
					<label class="col-md-1 control-label"><strong>&nbsp;&nbsp;첨부파일</strong></label>
						<div class="col-md-11">
							<input class="form-control" type="text">
						</div>
				</div>
			</div> -->
		</div>

		<div class="email editor">
			<div class="col-md-12 p-0">
				<div class="form-group">
					<label class="control-label sr-only" for="summernote">Descriptions </label>
						<textarea class="textarea" name="content" id="content" rows="20"
							placeholder="1000자 내외로 작성하세요." style="display: none;"></textarea>
						<div id="summernote"></div>
				</div>
			</div>
		</div>
			<div class="form-group col-md-12" align="right">
				<button class="btn btn-primary btn-space" type="button"  id="assignSubmit" onclick="sendMail();"><i class="icon s7-mail"></i>보내기</button>
				<button onclick="goBack()" class="btn btn-secondary btn-space" style=width:75px;><i class="icon s7-close"></i>취소</button>
			</div>
				<div class="modal fade" id="mailSendFormModal" tabindex="-1" role="dialog" aria-labelledby="mailSendFormModalLabel" aria-hidden="true" style="display: none;">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="mailSendFormModalLabel">주소록</h5>
								
								
					
								
								
								<a href="#" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
								</a>
							</div>
							<div class="modal-body">
										<%--주소록 나오는 위치 --%>	
										 <div id="tree"></div>
										 
										     <input type="button" style="margin-top:10px;" class="btn btn-brand float-right" value="받는 사람 아이디 추가" onclick="addReceiverId()" id="add">
										 
										 
							</div>
									
						</div>		
					</div>
				</div>	
			</div>	
		</div>
	</div>
</div>
</div>
</div>
</div>

<%--주소록 스크립트 --%>
<script>
/* var arrData = [
    {title: "1조", key: "2", folder: true, checkbox:true, children: [
      {title: "동석", key: "3",checkbox:true},
      {title: "정현", key: "4",checkbox:true}
    ]}
]; */

console.log("원본 : ",arrData);

var arrData = null;
$.ajax({
	url:"${webPath}/common/addressBook",
	dataType:"json",
	success:function(data){
		console.log("데이터 : ",data)
		arrData=data;
		
		<%--트리그리기--%>
		$("#tree").fancytree({
		    //source:arrData,
		    source:arrData,
		    click:function(event,data){
		        //data에 필요한 정보를 거의 담아서 줌.
		        console.log(data.node.title)
		    },
		    icon:function(event,data){
		        if(data.node.folder){
		            return
		        }else{
		            return "${webPath}/resources/img/addrPerson.png"
		        }
		    }
		});
		
	}
});



function addReceiverId(){
    var tree = $.ui.fancytree.getTree("#tree"),
    activeNode = tree.getActiveNode();
    console.log(tree.getSelectedNodes());
    var nodeList = tree.getSelectedNodes();
    var addressString = '';
    for(let i=0;i<nodeList.length;i++){
        if(i!=nodeList.length-1){
            addressString += nodeList[i].data.content +","
        }else{
            addressString += nodeList[i].data.content
        }
    }
	$('#receiverId').val(addressString);
	$("#mailSendFormModal").modal('hide');
	 
}


</script>

<%-- <script type="text/javascript">
	$("#btn_register").on("click",()=> {
		
		const content = $('#content').val();
		
		var v_receiverId=$('#receiverId').val();
		var title=$('#title').val();
		
		console.log("receiverId", v_receiverId);
		console.log("content", content);
		
		console.log("title", title);
		
		var sendData =
					{
					  "receiverId":v_receiverId,
					  "content":content,
					  "title":title
					  }
		console.log(sendData);
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/common/send",
			data:JSON.stringify(sendData),  // 넘길 데이타
			//"applyDate":selectDate,"appContent":content,
			contentType:"application/json", 
			
			success:(rslt)=>{
				alert("쪽지을 성공적으로 보냈습니다.");
				pageMove('/ai/common/mail/sent/list.do');
			},
			error:(request,status,error)=>{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
			}
		});
});
</script> 

<script>
window.onload=function(){
	summernote_go($('#content'),'<%=request.getContextPath()%>'); 
}
</script>--%>
<script type="text/javascript">

   function goBack(){
      window.history.back();
   }

</script>
<script>
	var v_myModal = document.querySelector("#myModal");
	function f_close(){
	  v_myModal.style.display = "none";   //   있어도 누네 안보이겡
	}
	function f_modal(reason){
	     v_myModal.style.display = "block";   //  눈에 보이겡
	     
	     $('#rejReason').val(reason)
	     
	}
</script>

<script>
window.onload=function(){
  summernote($('#content'),'<%=request.getContextPath()%>');	

 }//-----------------------------------------------------------@5 써머노트 사용.
//summernote()라는 함수는 common.js에 있음.
	 

function summernote(target,context){
	
	contextPath = context;
	
	target.summernote({
		placeholder:'여기에 내용을 적으세요.',
		lang:'ko-KR',
		height:350,
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
</script>
<script>
 //--------------------------------------@6 드래그앤 드랍을 가능하게 하는 자바스크립트 코드
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
            var mytitle = document.querySelector("#showFilessss");
            var showFiles = function(files) {
                dropZone.innerHTML = ""
                if(files.length == 0){
                	dropZone.innerHTML += `</br>
					 	<div style="text-align:center; font-size:50px;"><i class="fas fa-upload"></i></div>
			      		<div style="text-align:center; font-size:20px; font-weight:bold;">파일 선택 클릭</br>또는 파일을 여기로 드래그하세요.</div>`;
                }
                for(var i = 0, len = files.length; i < len; i++) {
                    dropZone.innerHTML += "<p><i class='fas fa-file'></i>&nbsp;&nbsp;" + files[i].name + "</p>";
                    mytitle.innerHTML += "<span class='mr-3'><i class='fas fa-file'></i>&nbsp;&nbsp;" + files[i].name + "</span>";
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
function sendMail(){
	
	var formData = new FormData();
	var content = $("#content").val();
	var title = $("#title").val();
	var receiverId=$("#receiverId").val();
	console.log("receiverId",receiverId);
	var uploadFile =$('#fileUpload');//------------------------------------@1
	
	formData.append("content",content);
	formData.append("title",title);
	formData.append("receiverIdList",receiverId);
	for(var i=0;i<uploadFile[0].files.length;i++){ //-----------------------@2
		formData.append("uploadFile",uploadFile[0].files[i]);
	}
	
	console.log("데이터 ",formData)
	
	$.ajax({//@--------------------------------------------------------------@3
		method:"post",
		url:"${webPath}/common/send",
		contentType : false,
		processData : false,
		data:formData,
		success:function(data){
			 Swal.fire({
   			  icon: 'info',
   			  title: '',
   			  text: '쪽지를 성공적으로 보냈습니다.'
   			 }).then((result) => {
     			  if (result.isConfirmed) {
   					pageMove('/ai/common/mail/sent/list.do');
     	   		}
     	   	});
     				 
   			
		},error:function(){
			alert("올바르지 않은 대상입니다.");
		}
	})
}

</script>