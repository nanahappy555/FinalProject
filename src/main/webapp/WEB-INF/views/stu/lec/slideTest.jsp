<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style>
li{list-style:none;}


.flex{
  display:flex;
}

.slide_wrapper{
  border:solid red;
  position:relative;
  width:1408px;
  margin:0 auto;
  height:300px;
  overflow:hidden
}

.slides{
  position:absolute;
  transition:left 0.5s ease-out;
}

.slides li:not(:last-child){
  margin-right:40px;
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
  right:calc(100% - 20px);
}

.controls>.next{
  left:calc(100% - 20px);
}

.ha{
  width:50px;
}

</style>
</head>
<div class="slide_wrapper ">
  <ul class="slides flex">
    <li>
	    <div class="card">
			<div class="card-body" style="border:1px solid black; width:300px; height:300px;">
			1
			</div>	    
	    </div>
    </li>
     <li>
	    <div class="card">
			<div class="card-body" style="border:1px solid black; width:300px; height:300px;">
			2
			</div>	    
	    </div>
    </li>
     <li>
	    <div class="card">
			<div class="card-body" style="border:1px solid black; width:300px; height:300px;">
			3
			</div>	    
	    </div>
    </li>
    <li>
	    <div class="card">
			<div class="card-body" style="border:1px solid black; width:300px; height:300px;">
			4
			</div>	    
	    </div>
    </li>
      <li>
	    <div class="card">
			<div class="card-body" style="border:1px solid black; width:300px; height:300px;">
			5
			</div>	    
	    </div>
    </li>
      <li>
	    <div class="card">
			<div class="card-body" style="border:1px solid black; width:300px; height:300px;">
			6
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
slideMargin = 40,
prevBtn = document.querySelector('.prev'),
nextBtn = document.querySelector('.next');

slides.style.width =
(slideWidth + slideMargin) * slideCount - slideMargin + 'px';

function moveSlide(num) {
slides.style.left = -num * 340 + 'px';
currentIdx = num;
}

nextBtn.addEventListener('click', function () {
if( currentIdx < slideCount - 4){
  moveSlide(currentIdx + 1);
}else{
  moveSlide(0);
}   
});

prevBtn.addEventListener('click', function () {
if( currentIdx > 0){
  moveSlide(currentIdx - 1);
}else{
  moveSlide(slideCount - 4);
}   
});

</script>