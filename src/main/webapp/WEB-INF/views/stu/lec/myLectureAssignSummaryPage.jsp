<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<style>
textarea {
    font-size: 20px;
      }
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',endColorstr='#20000000');    /* ie */
}
.wrap-loading .win{ /*전체창*/
    position: fixed;
    top:42%;
    left:42.5%;
    margin-left: -21px;
    margin-top: -21px;
}
.wrap-loading .dashboard-spinner{ /*로딩 이미지*/
    position: fixed;
    top:45%;
    left:49%;
    margin-left: -21px;
    margin-top: -21px;
}
.wrap-loading .loadingWin{ /*로딩 텍스트*/
    position: fixed;
    top:57%;
    left:49%;
    margin-left: -21px;
    margin-top: -21px;
}
.display-none{ /*감추기*/
    display:none;
}    
</style>

</head>
<body>
<div class="container-fluid">
	<div class="card mb-0">

			<h2 class="card-header">
			<i class="fas fa-clipboard"></i>&nbsp;&nbsp;논문 번역 및 요약
			</h2>
			<div class="card-body">
				<form id="form" data-parsley-validate="" novalidate="">
					<div class="row d-flex jutify-content-between mt-2">
						<div class="col-5 ml-2">
							<div class="metric-value d-inline-block">
								<textarea style="font-size:20px; width:400px; height:430px; border-radius: 5px;" class="form-control"
								placeholder="번역할 내용을 입력하세요." id="taBF"></textarea>
							</div>
						</div>
						<div class="col-1 text-center ml-4 align-self-center">
							<h1><i class="fas fa-angle-double-right"></i></h1>
						</div>
						<div class="col-5">
							<div class="metric-value d-inline-block">
								<textarea id="resultTA" style="font-size:20px; width:400px; height:430px; border-radius: 5px;" class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center">
						<button type="button" class="btn-xl btn btn-primary mt-3" onclick="autofill();">자동완성</button>
						<button type="button" id="summaryBtn" class="btn-xl btn btn-primary mt-3">번역하기</button>
					</div>
				</form>
	
			</div>


	</div>

</div>

<div class="wrap-loading display-none">
	<div class="win" style="width:180px; height:130px; background-color:white; border-radius:5px;">
		<div class="dashboard-spinner spinner-sm justify-content-center align-items-center" ></div>
		<div class="loadingWin">loading</div>
	</div>
</div>

<script>
$('#summaryBtn').click(()=>{
	
	var texts = $('#taBF').val();
	
// 	console.log(texts);
	
	payloads = {
			'texts':texts
	};
		
	$.ajax({
		type:'post',
		url:'http://192.168.141.22:5000/summary',
		data:JSON.stringify(payloads),
		contentType : 'application/json; charset=utf-8',
		dataType:"json",
		success: (rslt) => {
			console.log(rslt);
			var completeData = rslt;
			console.log(typeof completeData);
			completeData = completeData.replace(/\\n/gim,"");
			var splitArray = completeData.split(':');
			var splitValue = splitArray[1];
			var substrStartPoint=splitValue.indexOf('"');
			var substrEndPoint =splitValue.lastIndexOf('"');
			completeData = splitValue.substring(substrStartPoint+1,substrEndPoint);
			$('#resultTA').val(completeData);
		},
		beforeSend:function(){
	        $('.wrap-loading').removeClass('display-none');
	    },
	    complete:function(){
	        $('.wrap-loading').addClass('display-none');
	    },
		error: () => {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
});

</script>
<script>
function autofill(){
	$('#taBF').val(`The present article proposes a new memory model called Act-In (Activation-Integration). Act-In extends the multiple trace memory models by placing them within the situated cognition perspective. Act-In considers that the activation and integration mechanisms play a key role in memory processes.  These mechanisms are involved in both the construction of memory traces and the emergence of knowledge. The model is based on four main assumptions: (1) Memory traces reflect all the components of past experiences and, in particular, their sensory properties, actions performed on the objects in the environment and the emotional states of individuals. Memory traces are therefore distributed across multiple neuronal systems which code the multiple components of the experiences. (2) Knowledge is emergent and is the product of the coupling of the present experience with past experiences. (3) The brain is a categorisation system which develops by accumulating experiences and which, by default, produces categorical knowledge. (4) The emergence of specific knowledge (memories or episodic knowledge) requires very simple mechanisms which occur during learning and/or during retrieval. These assumptions are defended and discussed in the light of the work reported in the literature.`);
}

</script>
