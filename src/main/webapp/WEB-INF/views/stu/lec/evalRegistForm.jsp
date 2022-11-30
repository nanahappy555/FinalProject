<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="main-content-jsp">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<div class="card-body" style="padding-bottom:50px;">
				<form id="evalRegistForm" action="${webPath}/stu/lec/eval/evalRegist" method="post">
					<table class="table table-bordered">
						<thead>
							<tr>
								<td rowspan="2" scope="col"><strong>평가번호</strong></td>
								<td rowspan="2" colspan="5" scope="col"><strong>평가내용</strong></td>
								<td colspan="5" scope="col"><strong>평가</strong></td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${lecEvalItem}" var="lecEval">
							<c:if test="${lecEval.evalQueCd ne '주관식'}">
							<tr>
								<td rowspan="2" scope="row">${lecEval.evItemNo}</td>
								<td rowspan="2" colspan="5">${lecEval.content}</td>
								
								<c:forEach var="i" begin="0" end="${fn:length(lecEval.evalQueItems)-1}">
									<td>${lecEval.evalQueItems[i]}</td>
								</c:forEach>
								
							</tr>
								<tr>
								<td><label
									class="custom-control custom-radio custom-control-inline">
										<input type="radio" originEvalCd="${lecEval.originEvalCd}" name="eval${lecEval.evItemNo}"
										class="custom-control-input requireInput"
										value="5"
										><span
										class="custom-control-label"></span>
								</label></td>
								<td><label
									class="custom-control custom-radio custom-control-inline">
										<input type="radio" originEvalCd="${lecEval.originEvalCd}" name="eval${lecEval.evItemNo}"
										class="custom-control-input requireInput"
										value="4">
										<span
										class="custom-control-label"></span>
								</label></td>
								<td><label
									class="custom-control custom-radio custom-control-inline">
										<input type="radio" originEvalCd="${lecEval.originEvalCd}" name="eval${lecEval.evItemNo}"
										class="custom-control-input requireInput"
										value="3"
										><span
										class="custom-control-label"></span>
								</label></td>
								<td><label
									class="custom-control custom-radio custom-control-inline">
										<input type="radio" originEvalCd="${lecEval.originEvalCd}" name="eval${lecEval.evItemNo}"
										class="custom-control-input requireInput"
										value="2"><span
										class="custom-control-label"></span>
								</label></td>
								<td><label
									class="custom-control custom-radio custom-control-inline">
										<input type="radio" originEvalCd="${lecEval.originEvalCd}" name="eval${lecEval.evItemNo}"
										class="custom-control-input requireInput"
										value="1"><span
										class="custom-control-label"></span>
								</label></td>
								
							</tr>
							</c:if>
							<c:if test="${lecEval.evalQueCd eq '주관식'}">
								<tr>
									<td style="background-color: #5969FF; color: white" colspan="13">
										${lecEval.content}</td>
								</tr>
								<tr>
								<td colspan="13"><textarea class="form-control"
										id="evalSubject" name="eval${lecEval.evItemNo}" style="width: 100%" rows="5"></textarea></td>
							</tr>
							</c:if>
						</c:forEach>
						</tbody>
					
					</table>
					<input style="position : absolute; bottom:5px; right:15px;" type="button" class="btn btn-primary" onclick="sub()" value="제출"/>
					<input type="hidden" name="lecCd" value="${lecCd }"/>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
function sub(){
	

	var requireInput = $(".requireInput");
	var bEmpty = false;
	var focus;
	requireInput.each(function(index){
		if($(this).val()==''){
			focus=$(this);
			bEmpty=true;
			alert("객관식 문항은 필수로 응답해주세요.")
			focus.focus();
			return false;
		}
	});
	
	if(bEmpty) return;
	
	
	
	var confirmFlag = confirm('제출 하시겠습니까?');
	var data = $("#evalRegistForm").serialize();
	if(confirmFlag){
		var radioInput = $('input:checked');
		var originEvalCdList=[];
		console.log(radioInput)
		for(var i=0;i<radioInput.length;i++){
			let originEvalCd = radioInput.eq(i).attr("originEvalCd");
			originEvalCdList.push(originEvalCd);
		}
		
		var originEvalCdInput = $('<input name="originEvalCdArr">');
		originEvalCdInput.val(originEvalCdList);
		$("#evalRegistForm").append(originEvalCdInput);
		$("#evalRegistForm").submit();
	}
}

</script>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
