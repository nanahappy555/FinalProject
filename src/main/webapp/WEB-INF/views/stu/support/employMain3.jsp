<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<video id="video-output"></video>
<button id="start-btn">녹화 시작</button>
<button id="finish-btn">녹화 종료</button>
 <button id="download-btn">다운로드</button>
<script>
const constraints = {audio: false, video: true};
var videoMediaStream = null;

const videoOutput = document.getElementById("video-output");

navigator.mediaDevices.getUserMedia(constraints)
  .then(function(mediaStream){
    // MediaStream을 HTMLVideoElement의 srouce로 설정
    videoOutput.srcObject = mediaStream;
    // metadata가 로드될 때 실행되는 이벤트
    videoOutput.onloadedmetadata = function() {
      // HTMLVideoElement로 카메라의 화면을 출력하기 시작
      videoOutput.play();
    };
    videoMediaStream=mediaStream;
  })
  
const startBtn = document.getElementById("start-btn");
const finishBtn = document.getElementById("finish-btn");

let mediaRecorder = null;
let recordedMediaUrl = null;

// 녹화 시작 버튼 클릭 시 빌생하는 이벤트 핸들러 등록
startBtn.addEventListener("click", function(){
  let mediaData = [];
  
  // 1.MediaStream을 매개변수로 MediaRecorder 생성자를 호출
  mediaRecorder = new MediaRecoder(videoMediaStream, {
    mimeType: "video/webm; codecs=vp9"
  });

  // 2. 전달받는 데이터를 처리하는 이벤트 핸들러 등록
  mediaRecorder.ondataavailable = function(event){
    if(event.data && event.data.size > 0){
      mediaData.push(event.data);
    }
  }
  
  // 3. 녹화 중지 이벤트 핸들러 등록
  mediaRecorder.onstop = function(){
    const blob = new Blob(mediaData, {type: "video/webm"});
    recordedMediaUrl = new URL.createObjectURL(blob);
  }
  
  // 4. 녹화 시작
  mediaRecorder.start();
})

// 녹화 종료 버튼 클릭 시 빌생하는 이벤트 핸들러 등록
finishBtn.addEventListener("click", function(){
  if(mediaRecorder){
    // 5. 녹화 중지
    mediaRecorder.stop();
    mediaRecorder = null;
  }
})

const downloadBtn = document.getElementById("download-btn");

downloadBtn.addEventListener("click", function () {
  if (recordedMediaURL) {
    const link = document.createElement("a");
    document.body.appendChild(link);
    // 녹화된 영상의 URL을 href 속성으로 설정
    link.href = recordedMediaURL;
    // 저장할 파일명 설정
    link.download = "video.webm";
    link.click();
    document.body.removeChild(link);
  }
});
</script>