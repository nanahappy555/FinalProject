<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<style>
*{margin:0; padding:0;}
li{list-style:none;}
.flex{
  display:flex;
}
.flex-jc-c{
  justify-content:center;
}
.con{
  max-width:1200px;
  margin:0 auto;
}

.article-board-box{
  position:relative;
}
.slide_wrapper{
  position:relative;
  width:1290px;
  margin:0 auto;
  height:300px;
  overflow:hidden
}

.slides{
  position:absolute;
  left:0;
  top:0;
  transition:left 0.5s ease-out;
}

.slides li:not(:last-child){
  justify-content:flex-start;
  margin-right:30px;
}


.controls{
  text-align:center;
}

.controls span{
  z-index:2;
  position:absolute;
  top:50%;
  transform:translateY(-50%);
}

.controls>.prev{
  right:calc(100% - 40px);
}

.controls>.next{
  left:calc(100% - 40px);
}

.ha{
  width:50px;
}

</style>
</head>
<div class="slide_wrapper ">
  <ul class="slides flex">
    <li>
    	<div class="card" style="width:300px; height:300px; border:1px solid black;">
    				<div>
						<div class="card">
							<div class="card-header align-items-center">
								<h2>
									<a href="#">과목명</a>
								</h2>
							</div>
							<div class="card-body" style="cursor: pointer">
								<p>교수님</p>
								<p>
									<strong>수업시간</strong> :월 금, 수 금
								</p>
								<p>
									<strong>강의실</strong> : 강의실
								</p>
								<p>
									<strong>교수님 이메일</strong> : 메일
								</p>
							</div>
						</div>
					</div>
    	</div>
    </li>
   	 <li>
    	<div class="card" style="width:300px; height:300px; border:1px solid black;">
    				<div>
						<div class="card">
							<div class="card-header align-items-center">
								<h2>
									<a href="#">과목명</a>
								</h2>
							</div>
							<div class="card-body" style="cursor: pointer">
								<p>교수님</p>
								<p>
									<strong>수업시간</strong> :월 금, 수 금
								</p>
								<p>
									<strong>강의실</strong> : 강의실
								</p>
								<p>
									<strong>교수님 이메일</strong> : 메일
								</p>
							</div>
						</div>
					</div>
    	</div>
    </li>
     <li>
    	<div class="card" style="width:300px; height:300px; border:1px solid black;">
    				<div>
						<div class="card">
							<div class="card-header align-items-center">
								<h2>
									<a href="#">과목명</a>
								</h2>
							</div>
							<div class="card-body" style="cursor: pointer">
								<p>교수님</p>
								<p>
									<strong>수업시간</strong> :월 금, 수 금
								</p>
								<p>
									<strong>강의실</strong> : 강의실
								</p>
								<p>
									<strong>교수님 이메일</strong> : 메일
								</p>
							</div>
						</div>
					</div>
    	</div>
    </li>
     <li>
    	<div class="card" style="width:300px; height:300px; border:1px solid black;">
    				<div>
						<div class="card">
							<div class="card-header align-items-center">
								<h2>
									<a href="#">과목명</a>
								</h2>
							</div>
							<div class="card-body" style="cursor: pointer">
								<p>교수님</p>
								<p>
									<strong>수업시간</strong> :월 금, 수 금
								</p>
								<p>
									<strong>강의실</strong> : 강의실
								</p>
								<p>
									<strong>교수님 이메일</strong> : 메일
								</p>
							</div>
						</div>
					</div>
    	</div>
    </li>
     <li>
    	<div class="card" style="width:300px; height:300px; border:1px solid black;">
    				<div>
						<div class="card">
							<div class="card-header align-items-center">
								<h2>
									<a href="#">과목명</a>
								</h2>
							</div>
							<div class="card-body" style="cursor: pointer">
								<p>교수님</p>
								<p>
									<strong>수업시간</strong> :월 금, 수 금
								</p>
								<p>
									<strong>강의실</strong> : 강의실
								</p>
								<p>
									<strong>교수님 이메일</strong> : 메일
								</p>
							</div>
						</div>
					</div>
    	</div>
    </li>
  </ul>
  <p class="controls">
    <span class="prev"><i class="fas fa-chevron-left"></i></span>
    <span class="next"><i class="fas fa-chevron-right"></i></span>
  </p>
</div>

<div class="ha"></div>

<script>
var slides = document.querySelector('.slides'),
slide = document.querySelectorAll('.slides li'),
currentIdx = 0,
slideCount = slide.length,
slideWidth = 300,
slideMargin = 30,
prevBtn = document.querySelector('.prev'),
nextBtn = document.querySelector('.next');

slides.style.width =
(slideWidth + slideMargin) * slideCount - slideMargin + 'px';

function moveSlide(num) {
slides.style.left = -num * 330 + 'px';
currentIdx = num;
}

nextBtn.addEventListener('click', function () {
if( currentIdx < slideCount - 3){
  moveSlide(currentIdx + 1);
}else{
  moveSlide(0);
}   
});

prevBtn.addEventListener('click', function () {
if( currentIdx > 0){
  moveSlide(currentIdx - 1);
}else{
  moveSlide(slideCount - 3);
}   
});

</script>