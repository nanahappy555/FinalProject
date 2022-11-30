<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script> --%>

<head>
<style>
#recordInfoMark {
	margin-top: 10px;
	background-color: gray;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	display: inline-block;
}

#scriptCheck:hover {
	color: red;
	cursor: pointer;
}


.op2 {
	margin-left:10px;
	animation: op2 1s infinite;
	border-radius: 50%;
	display: inline-block;
	background-color: red;
	width: 35px;
	height: 35px;
	display:none;
}

@keyframes op2 {
	 30% {
		opacity: 0.3;
		}
}
#recordbtn {
	background-color: rgb(52, 235, 113);
	border-radius: 30px;
	border: none;
	width: 300px;
	height: 50px;
	cursor: pointer;
	font-weight: bold;
	position: relative;
	bottom: 20px;
}

#interviewScript {
	width: 50%;
	height: 300px;
	border: 3px #648CFF solid;
	border-radius:20px;
}

#audio {
	top: 70px;
	display: inline-block;
}

#recordCheck {
	position: relative;
}

#recordSubmit {
	background-color: rgb(52, 119, 235);
	border-radius: 30px;
	border: none;
	width: 150px;
	height: 50px;
	cursor: pointer;
	font-weight: bold;
	color: white;
	position: relative;
	bottom: 23px;
	margin-left: 10px;
}

#script_show_btn {
	cursor: pointer;
}

#script_show_btn:hover {
	color: red;
}

#analysisDiv {
	display: none;
}

#outputdiv {
	font-size: 20px;
	font-weight: bold;
}

#myChartdiv {
	display: none;
}
</style>
</head>
<script
	src="<%=request.getContextPath()%>/resources/js/diff/diff_match_patch_uncompressed.js">
	</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script> 


<script>
var dmp = new diff_match_patch();

function launch() {
  var text1 = document.getElementById('text1').value;
  var text2 = document.getElementById('text2').value;
  dmp.Diff_Timeout = parseFloat(document.getElementById('timeout').value);
  dmp.Diff_EditCost = parseFloat(document.getElementById('editcost').value);

  var ms_start = (new Date()).getTime();
  var d = dmp.diff_main(text1, text2);
  var ms_end = (new Date()).getTime();

  if (document.getElementById('semantic').checked) {
    dmp.diff_cleanupSemantic(d);
  }
  if (document.getElementById('efficiency').checked) {
    dmp.diff_cleanupEfficiency(d);
  }
  var ds = dmp.diff_prettyHtml(d);
  var analysisDiv = document.getElementById('analysisDiv');
  analysisDiv.style.display="block";
  outputdiv.innerHTML = ds;
}
</script>

<div class="pills-regular">
	<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
		<li class="nav-item"><a class="nav-link active"
			id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab"
			aria-controls="home" aria-selected="true">표정분석</a></li>
		<li class="nav-item"><a class="nav-link" id="pills-profile-tab"
			data-toggle="pill" href="#pills-profile" role="tab"
			aria-controls="profile" aria-selected="false">발음분석</a></li>

	</ul>
	<div class="tab-content" id="pills-tabContent" style="padding-bottom:20px;">
		<div class="tab-pane fade show active" id="pills-home" role="tabpanel"
			aria-labelledby="pills-home-tab">
			<div class="row">
				<div id="videoDiv" class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6"
					style="height: 35vw; border-radius:20px; border: 3px #648CFF solid;"></div>
				<div style=" border-radius:20px;" 
					class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
					<div class="card faceScript">
						<div class="card-header" style="margin-top:5px; background-color:#648CFF;">
						 	<h3 style="color:white ;"><strong>모의면접 이용 방법</strong></h3>
						</div>
						<div class="card-body">
							<span style="font-size: 18px;">본 페이지는 <strong>웹캠</strong>을 이용한 모의면접 페이지 입니다. 원활한 서비스 이용을 위해서 웹캠사용을 허가해주시기 바랍니다.</span>
							<br>	
							<br>
							<span style="font-size:15px;">*이용방법</span>
							<br>
							<br>
							<div style="font-size: 18px;">
							모의면접 질문 스크립트 확인하기 버튼 클릭 웹캠 켜기 -> 녹화시작 -> 녹화종료. 녹화가 종료되면 해당 녹화영상을
							분석하여 모의 면접 점수 결과를 확인할 수 있습니다.
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" style="background-color:#648CFF;">
							<strong id="faceScriptHeader" style="font-size: 20px;color:white; ">모의 면접 질문 스크립트</strong>
						</div>
						<div class="card-body">
							<span id="scriptCheck" class="faceScript" onclick="showFaceScript()"> 모의면접 질문 스크립트 확인하기.</span>
							<div id="scriptContent" class="faceScript">
							
							
							</div>
							<div id="myChartdiv">
								<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
							</div>
							<div class="row">
								<div class="card-body" id="analysisResult" class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
								
								</div>
								<div class="card-body col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
									<span id="analysisNotice" style="font-size: 18px; color : #ef172cd9"></span>
								</div>
							</div>
						</div>
					
					
					</div>
					
				</div>
			</div>
			<br>
			<div class="row">
				<button class="btn btn-outline-brand" onclick="webcamOn()">웹캠 켜기</button>
				<button class="btn btn-outline-brand" onclick="webcamOff()">웹캠 끄기</button>
				<button class="btn btn-outline-brand" onclick="videoCaptureStart()" id="start-btn">녹화 시작</button>
				<button class="btn btn-outline-brand" onclick="videoCaptureEnd()" id="finish-btn">녹화 종료</button>
				<button class="btn btn-outline-brand" id="download-btn">다운로드</button>
				<div id="redBtn" class="op2 align-self-center" ></div>
			</div>
			
		</div>


		
	
		<!-- 음성 인식  -->
		<div class="tab-pane fade" id="pills-profile" role="tabpanel"
			aria-labelledby="pills-profile-tab">
			<div class="row">
				<div class="card col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
					<div class="card-header">
					<h1>AI 음성 모의 면접</h1>
					</div>
					<div class="card-body">
						<p style="font-size:18px">본 서비스는 면접시 발음의 정확도를 분석할 수 있는 서비스를 제공합니다.</p>
						<h2>*사용방법*</h2>
						<p style="width: 80%; font-size:17px;">스크립트 보이기 버튼을 누르기 -> 녹음 시작 버튼 클릭-> 주어진 스크립트 파일을 읽음 -> 녹음 종료 버튼 클릭 -> 녹음 파일 전송 클릭
						<br>이후 스크립트의 내용과 녹음된 목소리의 발음을 비교해줍니다.</p>
						<p id="script_show_btn" onclick="show_script()" style="font-size:20px; color:#4287f5">스크립트 보이기</p>
					</div>
				</div>
				<div id="interviewScript" class="card-body col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
					<p id="script_body" class="card-text" style="font-size:20px;"></p>
							
					<div>
						<div id="analysisDiv" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
							<TABLE WIDTH="100%">
								<TR>
									<TD WIDTH="50%">
										<H3 style="color:#6b97db">내가 말한 것</H3> <TEXTAREA ID="text1" readonly STYLE="width: 100%; font-size:20px;"
											ROWS=7></TEXTAREA>
									</TD>
									<TD WIDTH="50%">
										<H3 style="color:#6b97db">스크립트 원본</H3> <TEXTAREA ID="text2" readonly STYLE="width: 100%;font-size:20px;"
											ROWS=7></TEXTAREA>
									</TD>
								</TR>
							</TABLE>
		
							<!-- diff 계산에 필요한 시간 설정
							If the mapping phase of the diff computation takes longer than this, then the computation
							is truncated and the best solution to date is returned.  While guaranteed to be correct,
							it may not be optimal.  A timeout of '0' allows for unlimited computation.
							  -->
							<INPUT style="display: none" TYPE="text" SIZE=3 MAXLENGTH=5
								VALUE="1" ID="timeout">
		
		
							<!--  Post-diff cleanup:-->
		
							<!-- Semantic Cleanup 
							Increase human readability by factoring out commonalities which are likely to be
							coincidental.
							-->
							<input style="display: none" type="radio" name="cleanup"
								id="semantic" checked>
		
							<!-- Efficiency Cleanup -->
							<input style="display: none" type="radio" name="cleanup"
								id="efficiency">
		
							<!-- edit cost: 
							Increase computational efficiency by factoring out short commonalities which are
							not worth the overhead.  The larger the edit cost, the more aggressive the cleanup. -->
		
							<input style="display: none" TYPE="text" SIZE=3 MAXLENGTH=5
								VALUE="4" ID="editcost">
							<!-- No Cleanup 
							Raw output.-->
							<INPUT style="display: none" TYPE="radio" NAME="cleanup" ID="raw">
		
						</div>
						<DIV ID="outputdiv" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12"></DIV>
		
					</div>
							
					
					
				</div>
			</div>
			<div id="recordcontent">
				<div id="recordFunction">
					<div id="recordInfoMark"></div>
					<button id="recordbtn">녹음 시작</button>
				</div>
				<div id="recordCheck">
					<audio controls id="audio"></audio>
					<button id="recordSubmit">녹음 파일 전송</button>
				</div>
			</div>


		</div>
	</div>
</div>


<script>
var scriptOn=false;
function showFaceScript(){
	scriptOn=true;
	$.ajax({
		url:"${webPath}/stu/support/faceAiScript",
		dataType:"text",
		success:function(data){
			$('#scriptCheck').css("display","none");
			$('#scriptContent').html(`<span style="font-size : 18px;color: #FF5675; font-weight:bolder;">\${data}</span><br/><br/>* 질문을 읽은 뒤 답을 먼저 생각한 뒤 <strong>웹캡 켜기->녹화시작->녹화종료</strong> 순으로 눌러주세요.`);
		},error:function(){
// 			alert("실패")
		}
	})
}

//chart만들기 함수
function makeBarChart(xValues,yValues,barColors,chartTitle){
	new Chart("myChart", {
	  type: "pie",
	  data: {
	    labels: xValues,
	    datasets: [{
	      backgroundColor: barColors,
	      data: yValues
	    }]
	  },
	  options: {
		  legend: {display: true,
			  position:'top',
			  fontColor:'black',
			  align:'center',
			  fullWidth:true},
		    title: {
		      display: true,
		      text: chartTitle,
		    },
			maintainAspectRatio: false,
			responsive:true,
			plugins:{
				labels:{
					render:'percentage'
				}
			}
			
	  }
	});
}


function show_script(){
	var script_body = document.getElementById("script_body");
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/support/employ/script",
		type:"get",
		dataType:"text",
		success:function(data){
			console.log(data)
			script_body.innerHTML = "<p>"+data+"</p>";
			$("#text2").val(data);
		},
		error:function(){
// 			alert("실패");
		}
		
		
	});
}

</script>


<script>
	var videoDiv = $("#videoDiv");
	var vidoeTag = null;
	let videoMediaStream = null;
	
	
	function webcamOn() {
		if(!scriptOn){
			Swal.fire({
				  icon: 'error',
				  title: '',
				  text: '모의면접 질문 스크립트 확인하기를 먼저 클릭해주세요.'
				})
			
			return;
		}
		
				Swal.fire({
			        title: '웹캠 사용에 동의하십니까?',
			        showDenyButton: true,
			        confirmButtonText: '네',
			        denyButtonText: '아니오',
			      }).then((result) => {
			       
			if (result.isConfirmed) {
			var userVideo = $('<video>').addClass('user-video');
			videoDiv.append(userVideo);
			videoTag = document.querySelector(".user-video");
			videoTag.style.width="100%";
			videoTag.style.height="35vw";
			navigator.mediaDevices.getUserMedia({ // constraints
				audio : false,
				video : {
					width: 1280, height:800
				}
			}).then(function(mediaStream) {
				videoTag.srcObject = mediaStream;
				videoTag.onloadedmetadata = function() {
					videoTag.play();
				};
				videoMediaStream = mediaStream;
			});
			        
             }
          });
			
			
		
	}

	function webcamOff() {
		if(!videoMediaStream){
			return;
		}
		$("#videoDiv *").remove();

		videoMediaStream.getTracks()[0].stop();
		videoMediaStream = null;
	}

	let videoRecorder = null;
	let recordedVideoURL = null;
	let videoBlob = null;

	let videoData = [];
	const videoCaptureStart = function() {
		if (!videoMediaStream) {
			Swal.fire({
				  icon: 'error',
				  title: '웹캠을 켜주세요.',
				  text: ''
				})
			
			return;
		}

		if (navigator.mediaDevices.getUserMedia) {
			$('#redBtn').css("display","block");
			// 1) MediaStream을 매개변수로 MediaRecorder 생성자를 호출
			// webm만?????
			videoRecorder = new MediaRecorder(videoMediaStream, {
				mimeType : "video/webm; codecs=vp9"
			});

			// 2) 전달받는 데이터를 처리하는 이벤트 핸들러 등록

			videoRecorder.addEventListener('dataavailable', function(event) {
				if (event.data && event.data.size > 0) {
					videoData.push(event.data);
					console.log(videoData)
				}
			});

			// 3) 녹화 중지 이벤트 핸들러 등록
			videoRecorder.onstop = function() {
				videoBlob = new Blob(videoData, {
					type : "video/webm"
				});
				recordedVideoURL = window.URL.createObjectURL(videoBlob);
				
				Swal.fire(
				  '녹화 종료',
				  '',
				  'success'
				)
				
				$('#redBtn').css("display","none");
				// 이벤트 실행 시에 서버로 파일 POST
				sendAvi(videoBlob);
			}

			// 4) 녹화 시작
			videoRecorder.start();

		}
	};

	const videoCaptureEnd = function() {
		if (videoRecorder) {
			// 5) 녹화 중지
			videoRecorder.stop();
			videoRecorder = null;

			// our final videoBlob
			// sendAvi(videoBlob);
			// -> 이벤트의 비동기로 인해 순서가 꼬이므로 이벤트 발생 시에 선언한다
		} else {
			Swal.fire({
				  icon: 'error',
				  title: '녹화를 시작해주세요.',
				  text: ''
				})
			
			
		}
	};

	const downloadBtn = document.getElementById("download-btn");

	downloadBtn.addEventListener("click", function() {
		if (recordedVideoURL) {
			const link = document.createElement("a");
			document.body.appendChild(link);
			// 녹화된 영상의 URL을 href 속성으로 설정
			link.href = recordedVideoURL;
			// 저장할 파일명 설정
			link.download = "video.webm";
			link.click();
			document.body.removeChild(link);
			window.URL.revokeObjectURL(recordedVideoURL); // url에 연결된 메모리 해제.
			recordedVideoURL = null;
		} else {
			Swal.fire({
				  icon: 'error',
				  title: '영상을 녹화해주세요.',
				  text: ''
				})
			
		}
	});

	const sendAvi = function(blob) {
		if (blob == null)
			return;

		let filename = new Date().toString() + "ai_video.avi";
		const file = new File([ blob ], filename);
		// url은 파이썬 플라스크 서버로 연결해야함.
		let fd = new FormData();
		fd.append("file", file, filename);
		$.ajax({
			url : "http://192.168.141.22:5000/webcam",
			type : "post",
			contentType : false,
			processData : false,
			data : fd,
			dataType : "json",
			success : function(data, textStatus) {
				document.querySelector("#myChartdiv").style.display="block";
				var xValues =  [
			        "웃음","슬픔","무표정","당황","분노"    
			        ];
				var yValues=[0,0,0,0,0];
				var length = 0;
				console.log("data",data)
				console.log("data길이 ",data.length)
				for(var i=0;i<data.length;i++){
					yValues[data[i]]++;
					length++;
				}
				console.log("길이",length)
				for(var i=0;i<yValues.length;i++){
					console.log(yValues[i]/length);
					yValues[i]=(yValues[i]/length)*100
				}
				console.log("yValue : ",yValues)
				barColors=["#fdfa87","#caa6fe","#b5c7ed","#ffe4af","#83a7a3"];
				$(".faceScript").css("display","none");
				$("#faceScriptHeader").text("모의 면접 분석 결과");
				analysisResult(xValues,yValues);
				makeBarChart(xValues,yValues,barColors,"모의면접 표정 분석차트");
				console.log("xValues",xValues)
				console.log("yValues",yValues)
			},
			error : function(errorMessage) {
// 				alert("파일 전송 실패, 관리자에게 문의바랍니다.")
				console.log("Error" + errorMessage);

			},
		}).done(function(data) {
			console.log(data);
		});
	}
</script>
<script>
function analysisResult(xValues,yValues){
	
	objList=[]
	for(var i =0;i<xValues.length;i++){
		var myObj = {
				key:xValues[i],
				value:yValues[i]
		}
		objList.push(myObj)
	}
	
	objList.sort(function(a,b){
		if(a.value>b.value) return -1;
		if(a.value==b.value) return 0;
		if(a.value<b.value) return 1;
	})
	
	var resultStr = "<h3>분석 결과</h3>"
	for(var k=0;k<3;k++){
		resultStr+=`\${k+1}순위는 <strong>\${objList[k].key}</strong> : <strong>\${parseInt(objList[k].value)}%</strong><br>`;
	}
	if(objList[0].key=='웃음'&&objList[0].value>80){
		$('#analysisNotice').html("면접관이 좋아하는 인상을 지니고 있습니다. 면접 태도가 우수한 편이라 판단됩니다.");
	}else{
		$('#analysisNotice').html("면접 볼 때 좀 더 환한 미소로 응하는 것을 추천 드립니다.")
	}
	console.log(resultStr);
	$('#analysisResult').html(resultStr);
}

</script>

<!-- 음성녹음 js -->

<script>
// 엘리먼트 취득
const audioEl = document.querySelector("#audio");
const recordbtn = document.querySelector("#recordbtn");
var recordInfoMark=document.querySelector("#recordInfoMark");
var recordSubmitBtn=document.querySelector("#recordSubmit");
// 녹음중 상태 변수
let isRecording = false;

// MediaRecorder 변수 생성
let mediaRecorder = null;

// 녹음 데이터 저장 배열
const audioArray = [];
var audioBlob =null;
recordbtn.onclick = async function (event) {
	if(!$("#script_body").children().length){
		
		Swal.fire({
			  icon: 'error',
			  title: '스크립트를 먼저 확인해주세요!',
			  text: ''
			})
		return;
	}
	
    if(!isRecording){
    	recordbtn.innerText="종료"
    	recordInfoMark.style.backgroundColor="red";
        // 마이크 mediaStream 생성: Promise를 반환하므로 async/await 사용
        const mediaStream = await navigator.mediaDevices.getUserMedia({audio: true});

        // MediaRecorder 생성
        mediaRecorder = new MediaRecorder(mediaStream);

        // 이벤트핸들러: 녹음 데이터 취득 처리
        mediaRecorder.ondataavailable = (event)=>{
            audioArray.push(event.data); // 오디오 데이터가 취득될 때마다 배열에 담아둔다.
        }

        // 이벤트핸들러: 녹음 종료 처리 & 재생하기
        mediaRecorder.onstop = (event)=>{
            
            // 녹음이 종료되면, 배열에 담긴 오디오 데이터(Blob)들을 합친다: 코덱도 설정해준다.
            audioBlob = new Blob(audioArray, {"type": "audio/ogg codecs=opus"});
            audioArray.splice(0); // 기존 오디오 데이터들은 모두 비워 초기화한다.
            
            // Blob 데이터에 접근할 수 있는 주소를 생성한다.
            const blobURL = window.URL.createObjectURL(audioBlob);

            // audio엘리먼트로 재생한다.
            audioEl.src = blobURL;
            //audioEl.play();

        }

        // 녹음 시작
        mediaRecorder.start();
        isRecording = true;

    }else{
    	recordbtn.innerText="시작"
        // 녹음 종료
        recordInfoMark.style.backgroundColor="gray";
        mediaRecorder.stop();
        isRecording = false;
    }
    
}

recordSubmitBtn.onclick = function(){
	if (audioBlob == null){
		
		
		Swal.fire({
			  icon: 'error',
			  title: '녹음을 해주세요.'
			})
		return;
	}
	let audio_filename = new Date().toString() + "ai_audio.mp3";
	const audio_file = new File([ audioBlob ], audio_filename);
	// url은 파이썬 플라스크 서버로 연결해야함.
	let audiofd = new FormData();
	audiofd.append("file", audio_file, audio_filename);
	$.ajax({
		url : "http://192.168.141.22:5000/audio",
		type : "post",
		contentType : false,
		processData : false,
		data : audiofd,
		dataType : "text",
		success : function(data, textStatus) {
			Swal.fire(
					  '파일 전송에 성공했습니다',
					  '',
					  'success'
					)
			
			
			analysis(data);
			$("#script_body").css("display","none");
			launch();
			$("#interviewScript").css("border","none");
			console.log("오디오 저장"+data);
			audioBlob=null;

		},
		error : function(errorMessage) {
// 			alert("파일 전송 실패, 관리자에게 문의바랍니다.")
			console.log("Error" + errorMessage);

		},
	}).done(function(data) {
		console.log(data);
	});
	
	
}

function analysis(data){
	 var text1 = document.getElementById('text1');
	 text1.value = data;
	
}

</script>









