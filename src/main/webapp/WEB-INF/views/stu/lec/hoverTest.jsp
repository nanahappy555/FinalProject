<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.lecCard {width: 300px; height: 400px; border-radius: 20px; border: 1px Bisque solid; box-sizing: border-box; margin: 0 10px;  position: relative;}
.more {width: 300px; height: 400px;border-radius: 20px; color:yellow; background-color: rgba(0,0,0,0.8); text-align: center; position: absolute; z-index: 2; font-size: 30px;}
.hidden {display: none;}

</style>
<div class="row">
	
	  <div class="lecCard card">
	    <div class="more hidden card">
	     	<div class="card-body"> 
	     	 더 알아보기
	     	 </div>
	    </div>
	    <div class="contents card-body">
	      <br><h3>한 권으로 읽는 컴퓨터 구조와 프로그래밍</h3>
	    </div>
	  </div>
	
	  <div class="lecCard card">
	    <div class="more hidden card">
	     	<div class="card-body">
	   	  	 더 알아보기
	   	  	</div>
	    </div>
	    <div class="contents card-body">
	      <br><h6>한 권으로 읽는 컴퓨터 구조와 프로그래밍</h6>
	    </div>
	  </div>
</div>
<script>
const more = document.querySelectorAll(".more");
const contents = document.querySelectorAll(".contents");
const lecCard = document.querySelectorAll(".lecCard");

for(let i=0;i<lecCard.length;i++){
	lecCard[i].addEventListener("mouseover", function(){
			more[i].classList.remove("hidden");
	})
}

for(let i=0;i<lecCard.length;i++){
	lecCard[i].addEventListener("mouseout", function(){
		more[i].classList.add("hidden");
	})
}

</script>