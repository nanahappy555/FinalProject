<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> 

<div class="card mb-0">
<div class="card-body">

<div class="row" style="margin-top: 10px;">
	<div class="col-sm-12 justify-content-center text-center">  
		  <video id="video" width="1000" height="700" autoplay></video> 
	</div>
	<div style="visibility:none;"class="" style="border-right: solid 1px;"> 
		<canvas hidden="hidden"  id="canvas" width="640" height="480" ></canvas>
	</div>

</div>
</div>


<div class="card-footer  p-0 text-center d-flex justify-content-center">
                                        <div style="cursor:pointer;" class="card-footer-item card-footer-item-bordered bg-primary"onclick="uploadCanvasToServer()">
                                            <a id="snap" class="" >사진촬영</a>
                                        </div>
                                        <div style="cursor:pointer;" class="card-footer-item card-footer-item-bordered bg-danger">
                                            <a class="text-white"onclick="CloseWindow();">닫기</a>
                                        </div>
                                    </div>


</div>

<script>
	// Grab elements, create settings, etc.
	var video = document.getElementById('video');
	// Get access to the camera!
	if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
	    // Not adding `{ audio: true }` since we only want video now
	    navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
	        //video.src = window.URL.createObjectURL(stream);
	        video.srcObject = stream;
	        video.play();
	    });
	}
</script>
<script>
	// Elements for taking the snapshot
	var canvas = document.getElementById('canvas');
	var context = canvas.getContext('2d');
	var video = document.getElementById('video');

</script>

<script>
	uploadCanvasToServer = function() {
		  context.drawImage(video, 0, 0, 640, 480);
		  const canvas = document.getElementById('canvas');
		  const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
		  const decodImg = atob(imgBase64.split(',')[1]);
	
		  let array = [];
		  for (let i = 0; i < decodImg .length; i++) {
		    array.push(decodImg .charCodeAt(i));
		  }
	
		  
		  $("#canvas").attr("display","none");
		  
		  
		  const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
		  const filename = 'img.jpg';
		  
		  let fd = new FormData();
		  fd.append("file", file, filename);

		  Swal.fire(
				  '파일전송 성공',
				  '',
				  'success'
				)
		  
		  
		  $.ajax({
		     url : "http://192.168.141.22:5000/webcamLogin",
		     type : "post",
		     contentType : false,
		     processData : false,
		     data : fd,
		     danataType : "text",
		     success : function(data) {
		    	 console.log(data);
		    	 if (data.detectedName == "박건영") {
		    		 Swal.fire({
		    			  icon: 'error',
		    			  title: '출입불가',
		    			  text: '허가되지 않은 사람입니다.'
		    			})
		    			
				}
		    	 if (data.detectedName == "한재웅") {
		    		 Swal.fire(
		    				  '성공!',
		    				  '허가된 사람입니다.',
		    				  'success'
		    				)
		    			
				}
		    	 if (data.detectedName == "장재훈") {
		    		 Swal.fire(
		    				  '성공!',
		    				  '허가된 사람입니다.',
		    				  'success'
		    				)
		    			
				}
		    	 
		    	 
		    	 
		     },
		     error : function(errorMessage) {
		        console.log("Error" + errorMessage);

		     },
		  }).done(function(data) {
		     console.log(data);
		  });
		  
		};
</script>
