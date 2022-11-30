<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>멀티셀렉트테스트.jsp</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/multi-select/css/multi-select.css">
<meta name="robots" content="noindex, nofollow">
<script nonce="38fdc5de-d9a7-45da-afae-765026c93c2c">
(function(w,d){!function(Z,_,ba,bb){Z.zarazData=Z.zarazData||{};Z.zarazData.executed=[];Z.zaraz={deferred:[],listeners:[]};Z.zaraz.q=[];Z.zaraz._f=function(bc){return function(){var bd=Array.prototype.slice.call(arguments);Z.zaraz.q.push({m:bc,a:bd})}};for(const be of["track","set","debug"])Z.zaraz[be]=Z.zaraz._f(be);Z.zaraz.init=()=>{var bf=_.getElementsByTagName(bb)[0],bg=_.createElement(bb),bh=_.getElementsByTagName("title")[0];bh&&(Z.zarazData.t=_.getElementsByTagName("title")[0].text);Z.zarazData.x=Math.random();Z.zarazData.w=Z.screen.width;Z.zarazData.h=Z.screen.height;Z.zarazData.j=Z.innerHeight;Z.zarazData.e=Z.innerWidth;Z.zarazData.l=Z.location.href;Z.zarazData.r=_.referrer;Z.zarazData.k=Z.screen.colorDepth;Z.zarazData.n=_.characterSet;Z.zarazData.o=(new Date).getTimezoneOffset();Z.zarazData.q=[];for(;Z.zaraz.q.length;){const bl=Z.zaraz.q.shift();Z.zarazData.q.push(bl)}bg.defer=!0;for(const bm of[localStorage,sessionStorage])Object.keys(bm||{}).filter((bo=>bo.startsWith("_zaraz_"))).forEach((bn=>{try{Z.zarazData["z_"+bn.slice(7)]=JSON.parse(bm.getItem(bn))}catch{Z.zarazData["z_"+bn.slice(7)]=bm.getItem(bn)}}));bg.referrerPolicy="origin";bg.src="/cdn-cgi/zaraz/s.js?z="+btoa(encodeURIComponent(JSON.stringify(Z.zarazData)));bf.parentNode.insertBefore(bg,bf)};["complete","interactive"].includes(_.readyState)?zaraz.init():Z.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,0,"script");})(window,document);
</script>
</head>
<body>
<div class="container-fluid  dashboard-content">



<div class="row">
<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
<div class="page-header">
<h2 class="pageheader-title">Multiselect </h2>
<p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
<div class="page-breadcrumb">
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
<li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Forms</a></li>
<li class="breadcrumb-item active" aria-current="page">Multiselect</li>
</ol>
</nav>
</div>
</div>
</div>
</div>






<div class="row">



<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
<div class="card">
<h5 class="card-header">Boxed Multiselect</h5>
<div class="card-body">
<select multiple="multiple" id="my-select" name="my-select[]">
<option value='elem_1'>Elements 1</option>
<option value='elem_2'>Elements 2</option>
<option value='elem_3'>Elements 3</option>
<option value='elem_4'>Elements 4</option>
</select>
</div>
</div>
</div>






<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
<div class="card">
<h5 class="card-header">Pre-selected options</h5>
<div class="card-body">
<select id='pre-selected-options' multiple='multiple'>
<option value='elem_1' selected>Elements 1</option>
<option value='elem_2'>Elements 2</option>
<option value='elem_3'>Elements 3</option>
<option value='elem_4' selected>Elements 4</option>
</select>
</div>
</div>
</div>




 

<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
<div class="card">
<h5 class="card-header">Callbacks</h5>
<div class="card-body">
<select id='callbacks' multiple='multiple'>
<option value='elem_1'>Elements 1</option>
<option value='elem_2'>Elements 2</option>
<option value='elem_3'>Elements 3</option>
<option value='elem_4'>Elements 4</option>
</select>
</div>
</div>
</div>



</div>
<div class="row">



<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
<div class="card">
<h5 class="card-header">Keep Over</h5>
<div class="card-body">
<select id='keep-order' multiple='multiple'>
<option value='elem_1'>Elements 1</option>
<option value='elem_2'>Elements 2</option>
<option value='elem_3'>Elements 3</option>
<option value='elem_4'>Elements 4</option>
<option value='elem_5'>Elements 5</option>
<option value='elem_6'>Elements 6</option>
<option value='elem_7'>Elements 7</option>
<option value='elem_8'>Elements 8</option>
<option value='elem_9'>Elements 9</option>
<option value='elem_10'>Elements 10</option>
<option value='elem_11'>Elements 11</option>
<option value='elem_12'>Elements 12</option>
</select>
</div>
</div>
</div>






<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
<div class="card">
<h5 class="card-header">Optgroup</h5>
<div class="card-body">
<select id='optgroup' multiple='multiple'>
<optgroup label='Friends'>
<option value='1'>Yoda</option>
<option value='2' selected>Obiwan</option>
 </optgroup>
<optgroup label='Enemies'>
<option value='3'>Palpatine</option>
<option value='4' disabled>Darth Vader</option>
</optgroup>
</select>
</div>
</div>
</div>






<div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12">
<div class="card">
<h5 class="card-header">Disabled attribute</h5>
<div class="card-body">
<select id='disabled-attribute' disabled='disabled' multiple='multiple'>
<option value='elem_1'>Elements 1</option>
<option value='elem_2'>Elements 2</option>
<option value='elem_3'>Elements 3</option>
<option value='elem_4'>Elements 4</option>
<option value='elem_5'>Elements 5</option>
</select>
</div>
</div>
</div>



</div>
</div>



<div class="footer">
<div class="container-fluid">
<div class="row">
<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
Copyright © 2018 Concept. All rights reserved.
</div>
<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
<div class="text-md-right footer-links d-none d-sm-block">
<a href="javascript: void(0);">About</a>
<a href="javascript: void(0);">Support</a>
<a href="javascript: void(0);">Contact Us</a>
</div>
</div>
</div>
</div>
</div>







<!-- <script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script> -->
<!-- <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script> -->
<!-- <script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script> -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/libs/js/main-js.js"></script>
<script>
var merong = (args) => {
	return 'merong'+args;
}

    $('#callbacks').multiSelect({
        afterSelect: function(values) {
        	if(values == 'elem_1'){
// 	            alert("Select value: " + values);
				alert(merong(1));
        	}
        },
        afterDeselect: function(values) {
            alert("Deselect value: " + values);
        }
    });
    </script>
<script>
    $('#keep-order').multiSelect({ keepOrder: true });
    </script>
<script>
    $('#public-methods').multiSelect();
    $('#select-all').click(function() {
        $('#public-methods').multiSelect('select_all');
        return false;
    });
    $('#deselect-all').click(function() {
        $('#public-methods').multiSelect('deselect_all');
        return false;
    });
    $('#select-100').click(function() {
        $('#public-methods').multiSelect('select', ['elem_0', 'elem_1'..., 'elem_99']);
        return false;
    });
    $('#deselect-100').click(function() {
        $('#public-methods').multiSelect('deselect', ['elem_0', 'elem_1'..., 'elem_99']);
        return false;
    });
    $('#refresh').on('click', function() {
        $('#public-methods').multiSelect('refresh');
        return false;
    });
    $('#add-option').on('click', function() {
        $('#public-methods').multiSelect('addOption', { value: 42, text: 'test 42', index: 0 });
        return false;
    });
    </script>
<script>
    $('#optgroup').multiSelect({ selectableOptgroup: true });
    </script>
<script>
    $('#disabled-attribute').multiSelect();
    </script>
<script>
    $('#custom-headers').multiSelect({
        selectableHeader: "<div class='custom-header'>Selectable items</div>",
        selectionHeader: "<div class='custom-header'>Selection items</div>",
        selectableFooter: "<div class='custom-header'>Selectable footer</div>",
        selectionFooter: "<div class='custom-header'>Selection footer</div>"
    });
    </script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194" integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw==" data-cf-beacon='{"rayId":"75c993dfdd16af8e","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.10.3","si":100}' crossorigin="anonymous"></script>
</body>
</html>