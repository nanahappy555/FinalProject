<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<style>
        .pdfobject-container { height: 500px;}
        .pdfobject { border: 1px solid #666; }
        
#dorpdownBox{

position:fixed;
top: 80px;
left: 550px;
}
</style>


<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">

	<div class="main-content-jsp">

		<!-- 111111 -->
		<div class="row mr-0">
			<div class="col-xl-12">
				<div class="card">
					<h2 class="card-header">과제평가 상세보기</h2>
					<div class="card-body">
					
		
	
					
					
					
						<div class="row">
							<div class="col-xl-3">
								<div class="card-body" style="height:850px;overflow:auto;">
                                    <div class="list-group">
                                    <c:forEach items="${evalStuList }" var="list">
                                        <a href="#" class="list-group-item d-flex justify-content-between align-items-center" 
                                        data-stuCd="${list.stuCd }"
                                        data-LecCd="${list.lecCd }"
                                        data-assBno="${list.assBno }"
                                        data-status="${list.subEvalStatusCd }"
                                        > ${list.name }
                                        
                                        
                                        
                                        
                                        
                                        <c:choose>
                                        <c:when test="${list.subEvalStatusCd eq null }"><span class="badge badge-danger">미제출</span></c:when>
                                        <c:when test="${list.subEvalStatusCd eq 'submit' }"><span class="badge badge-primary">제출완료</span></c:when>
                                        <c:when test="${list.subEvalStatusCd eq 'evalcom' }"><span class="badge badge-success">평가완료</span></c:when>
                                        </c:choose>
                                        </a>
                                    </c:forEach>
                                </div>
									
									
									
									
								</div>
							</div>
							<div class="col-xl-6">
							
							
								<iframe id="pdfdisp"
									src=""
									style="width: 100%; height: 850px;"></iframe>
							</div>

							<div class="col-xl-3">
							
							<div class="row">
							
							<div class="card" style="height:250px; width:466px;">
                                    <div class="card-header">학생 코멘트</div>
                                    <div class="card-body">
                                        <p class="card-text" id="StuSubComment"></p>
                                    </div>
                                    <div class="card-footer d-flex text-muted" id="StuSubDate">
                                    </div>
                                </div>
							</div>
							
							
								
								<div class="row">

									<div class="col-xl-6">
										 <h4>점수</h4>
									</div>
									<div class="col-xl-6">
										<div class="input-group-append">

											<input id="submitScore" type="text" class="form-control"style="text-align:right" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
											<div class="input-group-append">
											<input type="hidden" id="hiddenStuCd" value="">
												<span class="input-group-text">/100점</span>
											</div>
										</div>
									</div>
								</div>


								<h4 style="padding-top:10px;">코멘트</h4>
									<textarea id="summernote"></textarea>
								<a onclick="evalAss();" class="btn btn-outline-primary" style="float:right;">저장하기</a>
							</div>
						</div>

						<!-- ================================================= -->
						<!-- 버튼 시작 -->
						<!-- ================================================= -->

						<!-- ================================================= -->
						<!-- 버튼 끝 -->
						<!-- ================================================= -->
					</div>
				</div>
			</div>
		</div>

	</div>
</div>






<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfobject/2.2.8/pdfobject.min.js" integrity="sha512-MoP2OErV7Mtk4VL893VYBFq8yJHWQtqJxTyIAsCVKzILrvHyKQpAwJf9noILczN6psvXUxTr19T5h+ndywCoVw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>
        var options = {
        height: "500px",
        page: '1',
        pdfOpenParams: {
                view: 'FitV',
                pagemode: 'thumbs',
                search: 'lorem ipsum'
        },
        
        forcePDFJS: true, // 강제로 PDF Viewer를 실행시키는 옵션
    PDFJS_URL: "/pdftest/web/viewer.html" //PDF.js의 PDF viewer를 viewer로 지정.
        };
 
        //제일 처음 열리는 pdf파일 경로 설정.
//         PDFObject.embed("files/samplepdf.pdf", "#example1", options);
</script>
 
<!-- 드롭다운리스트에서 선택한 내용에 맞게 pdf파일을 호출하는 함수 작성 -->

<script>



$(document).ready(function() {
	  $('#summernote').summernote({
		  placeholder:'여기에 내용을 적으세요.',
			lang:'ko-KR',
			height:340,
		  
		  toolbar: [
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			  ]
		  
	  });
	  
	  
	});
	
	
</script>

<script>
var uploadPath = "${webPath}/resources/pdfs/";

$("div[class='list-group']>a").on("click",function(e){
	
	$("div[class='list-group']").find("a").removeClass("active");
	$(this).addClass("active");
	
	event.stopPropagation();
	var stuCd = $(this).attr("data-stuCd");
// 	if(e.currentTarget.children[0].innerText == "미제출"){
// 		return;
// 	}
	
	var v_stuCd = $(this).attr('data-stucd');
	$('#hiddenStuCd').val(v_stuCd);
	getDetail(v_stuCd);

	
});

</script>

<script>
var lecCd = '<%=request.getParameter("lecCd")%>';
var assBno = '<%=request.getParameter("assBno")%>';

function getDetail(stuCd){
	$('#summernote').summernote('code', "");
	$("#pdfdisp").attr("src","${webPath}/resources/pdfs/blank.pdf");
	
	if ($('#dorpdownBox')) {
		$('#dorpdownBox').remove();
	}
	
	$.ajax({
		method:"get",
		url:"<%=request.getContextPath()%>/prof/lec/assignment/eval/detail?lecCd="+lecCd+"&stuCd="+stuCd+"&AssBno="+assBno,
		dataType:"json",
		success:function(data){
			
			var dropdownStr = ``;
			
			dropdownStr += `<div id="dorpdownBox">`;
// 	        <!-- 드롭다운 리스트 생성 -->
	        dropdownStr += `<select onchange="f_changePdf(this.value);"`+
	        `style="height:35px; background:#1e1e1e; width:250px; height:50px; color:#fff; border-left:1px solid #5d5d5d;`+
	        `border-top:1px solid #5d5d5d; border-right:1px solid #5d5d5d; border-bottom:1px solid #1e1e1e;">`;
	        
	        
	        for (var i = 0; i < data.attachList.length; i++) {
	        	var filename = data.attachList[i].filename.split("$$")[1];
// 	        	console.log(filename);
	        	dropdownStr +=  `<option value="`+data.attachList[i].filename+`">`+filename+`</option>`;
		        
			}
	             
	        dropdownStr += `</div>`;

			$('body').append(dropdownStr);
			
			
			var fileName = data.attachList[0].filename;
			
			
			
			$("#pdfdisp").attr("src",uploadPath+fileName);
			$('#StuSubComment').html(data.subContent);
			$('#StuSubDate').html(data.submitDate);
			$('#submitScore').val(data.score);
			$('#summernote').summernote('code', data.evalContent);
			
			
			
		},
		error:function(){
// 			alert("에러");
		}
		
	});
}		

function evalAss(){
	
	var vv_score = $('#submitScore').val();
	var vv_stuCd = $('#hiddenStuCd').val();
	var vv_comment = $('#summernote').val();
	
	
	
	if (vv_stuCd == "") {
		alert("학생을 선택하세요");
	}
	
	
	if (vv_score > 100) {
		alert("100점 이상입니다.");
		return;
	}
	
	$.ajax({
		method:"post",
		url:"<%=request.getContextPath()%>/prof/lec/assignment/eval/modify",
		data:{
			stuCd:vv_stuCd,
			lecCd:lecCd,
			assBno:assBno,
			score:vv_score,
			evalContent:vv_comment
		},
		success:function(data){
			var activeOne = $("a[class='list-group-item d-flex justify-content-between align-items-center active']")
			activeOne[0].children[0].className ="badge badge-success";
			Swal.fire(
					  '성공적으로 변경하였습니다.',
					  '',
					  'success'
					).then(()=>{
						
						getDetail(data.stuCd);
					});
			
			
		},
		error:function(){
// 			alert("실패");
		}
	});
		
	
}
function f_changePdf(e){
	
	$("#pdfdisp").attr("src",uploadPath+e);
	
}
</script>



<c:if test="${from eq 'modfy' }" >
	<script>
		window.close();
		alert("저장되었습니다.");
		window.opener.location.reload();			
	</script>
</c:if>