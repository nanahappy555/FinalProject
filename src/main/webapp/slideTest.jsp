<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<style>
li{list-style:none;}


.flex{
  display:flex;
  padding-left: 30px;
  margin-top:0px;
  
}

.slide_wrapper{
  border:solid red;
  position:relative;
  width:1350px;
  margin:0 auto;
  height:400px;
  overflow:hidden
}

.slides{
  position:absolute;
  transition:left 0.7s ease-out;
}

.slides li:not(:last-child){
  margin-right:30px;
}


.controls{
  width:100%;
  display:inline-block;
  height:400px;
  text-align:center;
  
}

.controls div{
  line-height:400px;
  z-index:2;
  position:absolute;
  top:50%;
  width:30px;
  height:400px;
  background-color : rgba(0,0,0,0.1 );
  display:inline-block;
  transform:translateY(-50%);
}

.controls>.prev{
  right:calc(100% - 30px);
}

.controls>.next{
  left:calc(100% - 30px);
}

</style>
</head>
<div class="slide_wrapper ">
  <ul class="slides flex">
    <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			1
		</div>	    
    </li>
	  <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			2
		</div>	    
    </li>
      <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			3
		</div>	    
    </li>
      <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			4
		</div>	    
    </li>
      <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			5
		</div>	    
    </li>
      <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			6
		</div>	    
    </li>
       <li>
		<div style="background-color:yellow; width:300px; height:400px;">
			6
		</div>	    
    </li>
	
	
	
  </ul>
  <div class="controls">
    <div class="prev"><</div>
    <div class="next">></div>
  </div>
</div>


<script>
var slides = document.querySelector('.slides'),
slide = document.querySelectorAll('.slides li'),
currentIdx = 0,
slideCount = slide.length,
slideWidth = 300,
slideMargin = 30,
prevBtn = document.querySelector('.prev'),
nextBtn = document.querySelector('.next');

slides.style.width =(slideWidth + slideMargin)*slideCount - slideMargin + 'px';

function moveSlide(num) {
slides.style.left = -num * 330 + 'px';
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