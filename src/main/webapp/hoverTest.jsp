<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <head>
   <meta charset="utf-8">
   <title>CSS</title>
   <style>
      * {
        font-family: Consolas, monospace;
        font-size: 16px;
      }
      .jb-text {
        padding: 15px 20px;
        background-color: #444444;
        border-radius: 5px;
        color: #ffffff;
        position: absolute;
        opacity: 0;
        transition: all ease 0.5s;
        width:300px;
        height:400px;
        boder:1px solid black;
      }
    /*   .jb-title:hover + .jb-text {
       opacity: 1;
      } */
   </style>
 </head>
  <body>
 	 <div>
	  	<div>
		    <div class="jb-title card" style="width:300px; height:400px; background-color: yellow;">Lorem ipsum dolor</div>
		    <div class="jb-text card" >
		    	하이 보이니?
		    </div>
	    </div>
	    <div>
		    <div class="jb-title card" style="width:300px; height:400px; background-color: yellow;">Lorem ipsum dolor</div>
		    <div class="jb-text card" >
		    	하이 보이니?
		    </div>
	    </div>
    </div>
    
    <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  </body>
<script>
var jbTitle = $('.jb-title');
alert(jbTitle.length);
var jbText=$('.jb-text');

jbTitle.click(function(){
	var indexNo = $(this).index();
	alert(indexNo);
	jbText.eq(indexNo).css("opacity",1);
})

</script>