<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="sentList" value="${dataMap.sentList}"></c:set>
<c:set var="pageMaker" value="${dataMap.pageMaker}"></c:set>
<c:set var="cri" value="${dataMap.pageMaker.cri}"></c:set>

<style>
.dashboard-main-wrapper{ 
 	 padding-top : 0px; 
 	} 
	
 	.dashboard-wrapper{ 
 	margin-left : 0px; 
 	} 
	
 	.page-aside{ 
 	margin-top : 0px; 
	left : 0px; 
 	} 
</style>




	<div class="dashboard-main-wrapper">
		<div class="dashboard-wrapper">

		<div class = "card">
			<div class="container-fluid">
				<aside class="page-aside"  >
					<div class="aside-content">
						<div class="aside-header">
							<button class="navbar-toggle" data-target=".aside-nav"
								data-toggle="collapse" type="button">
								<span class="icon"><i class="fas fa-caret-down"></i></span>
							</button>
								<div class="f-icon">
								<span class="title" onclick="pageMove('<%=request.getContextPath()%>/common/mail/received/list');"><i class="fas fa-envelope" style="margin-right:10px"></i>쪽지함</span>
								</div>
							
						</div>
						<div class="aside-compose">
							<button class="btn btn-lg btn-primary btn-block" type="button" 
							onclick="pageMove('<%=request.getContextPath()%>/common/mail/sendForm.do');" >쪽지 보내기</button>
						</div>
						<div class="aside-nav collapse" style="cursor: pointer;">
							<ul class="nav">
								<li ><a onclick="pageMove('<%=request.getContextPath() %>/common/mail/received/list.do')"><span class="icon"><i
											class="fas fa-fw fa-inbox"></i></span>받은 쪽지함<span
										class="badge badge-primary float-right">${count }</span></a></li>
								<li class="active"><a onclick="pageMove('<%=request.getContextPath() %>/common/mail/sent/list.do')"><span class="icon"><i
											class="fas fa-fw  fa-envelope"></i></span>보낸 쪽지함</a></li>
								<li><a onclick="pageMove('<%=request.getContextPath()%>/common/mail/bin/list.do')"><span class="icon"><i
											class="fas fa-fw fa-trash"></i></span>휴지통</a></li>
							</ul>
							
						</div>
					</div>
				</aside>


				<div class="main-content">
				
					<div class="email-inbox-header">
						<div class="row">
							<div class="col-lg-6">
								<div class="email-title">
									<span class="icon">
										<i class="far fa-envelope"></i></span> 보낸 쪽지함 
								</div>
							</div>
							<div class="col-lg-6">
								<div class="email-search">
									<div id="keyword">
					<div class="input-group mb-3 justify-content-end">
									
						<select class="form-control col-md-2" name="searchType" id="searchType">
							<option value="" ${cri.searchType eq '' ? 'selected':'' }>전 체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제 목</option>
							<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>받는 사람</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내 용</option>
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>제목+내용</option>
							<option value="cw" ${cri.searchType eq 'cw' ? 'selected':'' }>받는 사람+내용</option>							
							<option value="tcw" ${cri.searchType eq 'tcw' ? 'selected':'' }>받는 사람+제목+내용</option>
						</select>					
						<input  class="form-control col-md-5" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btn-primary btn-sm" type="button" onclick="list_go(1);" 
							id="searchBtn">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
								</div>
							</div>
						</div>
					</div>
					<div class="email-filters">
						<div class="email-filters-left">
							<label class="custom-control custom-checkbox be-select-all">
								<input class="custom-control-input chk_all" type="checkbox"
								name="chk_all"><span class="custom-control-label"></span>
							</label>
							<!--  <div class="btn-group">
								<button class="btn btn-light dropdown-toggle"
									data-toggle="dropdown" type="button" style=margin-right:5px>
									선택하기 <span class="caret"></span>
								</button>
								<div class="dropdown-menu" role="menu">
									<a class="dropdown-item" href="#">읽음 표시하기</a><a
										class="dropdown-item" href="#">안읽음 표시하기</a><a
										class="dropdown-item" href="#">스팸</a>
									<!-- <div class="dropdown-divider"></div> -->
									<!-- <a class="dropdown-item" href="#">Delete</a> 
								</div>
							</div> -->
							<div class="btn-group">
								<button class="btn btn-light" type="button" onclick="moveToBin()" >삭제</button>
							</div>
							<div class="btn-group">
								<button class="btn btn-light dropdown-toggle"
									data-toggle="dropdown" type="button">
									정렬하기 <span class="caret"></span>
								</button>
								<div class="dropdown-menu dropdown-menu-right" role="menu">
									<a class="dropdown-item" href="#">날짜순</a><a
										class="dropdown-item" href="#">보낸사람순</a>
									<!-- <div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Size</a> -->
								</div>
							</div>
						</div>
<!-- 						<div class="email-filters-right">
							<span class="email-pagination-indicator">1-50 of 253</span>
							<div class="btn-group email-pagination-nav">
								<button class="btn btn-light" type="button">
									<i class="fas fa-angle-left"></i>
								</button>
								<button class="btn btn-light" type="button">
									<i class="fas fa-angle-right"></i>
								</button>
							</div>
						</div> -->
					</div>
					<c:forEach items="${sentList}" var="send" varStatus="status">
						<div class="email-list">

							<div class="email-list-item email-list-item--unread">
								<div class="email-list-actions">
									<label class="custom-control custom-checkbox"> <input
										class="custom-control-input checkboxes" type="checkbox"
										id="one" name='chk' value="${send.sentNoteSeq }"><span class="custom-control-label"></span>
									</label><a class="favorite active" href="#"><span></span></a>
								</div>
								
								<div class="email-list-detail" onclick="pageMove('<%=request.getContextPath()%>/common/mail/sentDetail?sentNoteSeq=${send.sentNoteSeq }')">
									<span class="date float-right">
											<fmt:formatDate value="${send.sendDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/></span>
											<span class="from">${send.title }</span>
									<p class="msg" style="color: gray; font-weight:normal;">받은사람: ${send.senderId }</p>
								</div>
								
							</div>
						</div>
					</c:forEach>
					<br>
					<div class="row justify-content-center">
					<%@ include file="/WEB-INF/views/include/pagination.jsp" %>
					</div>
					<br>
				</div>
				
			</div>
		</div>	
</div>

</div>





	<script>
		$(document)
				.ready(
						function() {

							// binding the check all box to onClick event
							$(".chk_all").click(function() {

								var checkAll = $(".chk_all").prop('checked');
								if (checkAll) {
									$(".checkboxes").prop("checked", true);
								} else {
									$(".checkboxes").prop("checked", false);
								}

							});

							// if all checkboxes are selected, then checked the main checkbox class and vise versa
							$(".checkboxes")
									.click(
											function() {

												if ($(".checkboxes").length == $(".subscheked:checked").length) {
													$(".chk_all").attr(
															"checked",
															"checked");
												} else {
													$(".chk_all").removeAttr(
															"checked");
												}

											});

						});
	</script>

<script>
	function moveToBin(){
		console.log("moveBin");
		var chkList = []
	
		var idx = 0;
		
		var chkNode = $("input:checkbox[name='chk']:checked").each(function(){
			 chkList[idx] = (this).value;
		     console.log("chkNode",(this).value)
			 idx = idx + 1;
		});
		
		console.log("chkNode",chkNode);
		console.log("chkList",chkList);
		
	
	
	
/* 	var paramss = {
			"mailList" : chkList
		}; */
	
	
	$.ajax({
		method:'post',
		url:"<%=request.getContextPath()%>/common/sent/moveBin",
				data : JSON.stringify(chkList),
				contentType : 'application/json; charset=utf-8',
				success : function(data) {

					$.each(chkNode, function() {

						$(this)[0].checked = false;
					});
					window.location.reload(); 
				},
				error : function() {
					alert("잘못된 시도입니다.");

				}
			});

		}
</script>

	

<script>
function list_go(page,url){
	if(!url) url="${webPath}/common/mail/sent/list";
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val(${cri.perPageNum});
	jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	jobForm.attr({
		action:url,
		method:'get'
	}).submit(); 
}


</script>
