<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.dashboard-main-wrapper {
	padding-top: 0px;
}

.dashboard-wrapper {
	margin-left: 0px;
}

.page-aside {
	margin-top: 0px;
	left: 0px;
}
</style>




<div class="dashboard-main-wrapper">
	<div class="dashboard-wrapper">
		<input type="hidden" name="noteSeq" value="${noteSeq}">

		<div class="container-fluid">
			<aside class="page-aside">
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
						<a class="btn btn-lg btn-primary btn-block" href="#"
						 style="cursor: pointer;" onclick="pageMove('<%=request.getContextPath()%>/common/mail/sendForm.do');">쪽지 보내기</a>
					</div>
					<div class="aside-nav collapse" >
						<ul class="nav">
							<li ><a href="#"  style="cursor: pointer;" onclick="pageMove('<%=request.getContextPath()%>/common/mail/received/list.do');"><span class="icon"><i
										class="fas fa-fw fa-inbox"></i></span>받은 쪽지함<span
									class="badge badge-primary float-right">${count }</span></a></li>
							<li ><a href="#" style="cursor: pointer;" onclick="pageMove('<%=request.getContextPath()%>/common/mail/sent/list.do');"><span class="icon"><i
										class="fas fa-fw  fa-envelope"></i></span>보낸 쪽지함</a></li>
						<!-- 	<li><a href="#"><span class="icon"><i
										class="fas fa-fw fa-briefcase"></i></span>중요 쪽지함<span
									class="badge badge-secondary float-right">4</span></a></li>
							<li><a href="#"><span class="icon"><i
										class="fas fa-fw fa-star"></i></span>즐겨찾기</a></li> -->
							<li><a href="#"  style="cursor: pointer;" onclick="pageMove('<%=request.getContextPath()%>/common/mail/bin/list.do');"><span class="icon"><i
										class="fas fa-fw fa-trash"></i></span>휴지통</a></li>
						</ul>
						<!-- <span class="title">Labels</span>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="#"><i
									class="m-r-10 mdi mdi-label text-secondary"></i> Important </a></li>
							<li><a href="#"> <i
									class="m-r-10 mdi mdi-label text-primary"></i> Business
							</a></li>
							<li><a href="#"> <i
									class="m-r-10 mdi mdi-label text-brand"></i> Inspiration
							</a></li>
						</ul> -->
					</div>
				</div>
			</aside>




			<div class="main-content container-fluid p-0">
				<div class="email-head">
					<div class="email-head-subject">
						<div class="title">
							<a class="" href="#">
							<span class="icon"><i
									class="fas fa-bookmark"></i></span></a>
									 <span>${detail.title }</span>
									 
									 <!-- <div class="icons">
								<a href="#" class="icon"><i class="fas fa-reply"></i></a><a
									href="#" class="icon"><i class="fas fa-print"></i></a><a
									href="#" class="icon"><i class="fas fa-trash"></i></a>
							</div> -->
							
						</div>
					</div>
					<div class="email-head-sender">
						<div class="date"><fmt:formatDate value="${detail.sendDate }" pattern="yyyy년 MM월 dd일 hh:mm:ss"/></div>
						
						<div class="sender">
							<a href="#">보낸사람: ${detail.senderId }</a>
							<!-- to <a href="#">me</a> -->
							<div class="actions">
								<a class="icon toggle-dropdown" href="#" data-toggle="dropdown"><i
									class="fas fa-caret-down"></i></a>
								<div class="dropdown-menu" role="menu">
									<a class="dropdown-item" href="#">바로 답장하기</a>
										
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="email-body">
					${detail.content }
				</div>
				<div class="email-attachments">
					<div class="title">첨부파일</div>
					<ul>
						<c:if test="${not empty detail.attachList}">
                        <td>
										 <c:forEach items="${detail.attachList}" var ="attach" >
													<div class="col-md-12 col-sm-4 col-xs-12 d-flex justify-content-front" style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/getFile?anoCd=${attach.anoCd}&anoSeq=${attach.anoSeq}'">
															
																<i class="fa fa-copy"></i>
															<span class ="info-box-number">${attach.filename }</span>
													</div>
										</c:forEach>
								</td>
							 </c:if>
                        
                        <c:if test="${empty detail.attachList}">
                        <td> <span>첨부파일 없음</span></td>
                        </c:if>
					</ul>
				</div>
			</div>





		</div>
	</div>

</div>




<script src="../assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script src="../assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script src="../assets/libs/js/main-js.js"></script>
<script>
	$(document).ready(function() {

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
		$(".checkboxes").click(function() {

			if ($(".checkboxes").length == $(".subscheked:checked").length) {
				$(".chk_all").attr("checked", "checked");
			} else {
				$(".chk_all").removeAttr("checked");
			}

		});

	});
</script>

<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-23581568-13');
</script>
<script defer=""
	src="https://static.cloudflareinsights.com/beacon.min.js/v652eace1692a40cfa3763df669d7439c1639079717194"
	integrity="sha512-Gi7xpJR8tSkrpF7aordPZQlW2DLtzUlZcumS8dMQjwDHEnw9I7ZLyiOj/6tZStRBGtGgN6ceN6cMH8z7etPGlw=="
	data-cf-beacon="{&quot;rayId&quot;:&quot;757d8f593c31af37&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2022.8.1&quot;,&quot;si&quot;:100}"
	crossorigin="anonymous"></script>

