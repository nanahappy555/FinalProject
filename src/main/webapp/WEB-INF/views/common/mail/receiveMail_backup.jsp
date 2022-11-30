<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
 	
 	.pointer,.sub,textarea{ cursor:pointer;}
</style>



	<div class="dashboard-main-wrapper">
		<div class="dashboard-wrapper">


			<div class="container-fluid">
				<aside class="page-aside">
					<div class="aside-content">
						<div class="aside-header">
							<button class="navbar-toggle" data-target=".aside-nav"
								data-toggle="collapse" type="button">
								<span class="icon"><i class="fas fa-caret-down"></i></span>
							</button>
								<div class="f-icon">
								<span class="title"><i class="fas fa-envelope" style="margin-right:10px"></i>메일</span>
								</div>
							
						</div>
						<div class="aside-compose">
							<button class="btn btn-lg btn-primary btn-block" type="button" 
							onclick="pageMove('<%=request.getContextPath()%>/common/mail/sendForm.do');" >메일 보내기</button>
						</div>
						<div class="aside-nav collapse" style="cursor: pointer;">
							<ul class="nav">
								<li class="active"><a onclick="pageMove('<%=request.getContextPath() %>/common/mail/received/list.do')"><span class="icon"><i
											class="fas fa-fw fa-inbox"></i></span>받은 메일함<span
										class="badge badge-primary float-right">2</span></a></li>
								<li><a onclick="pageMove('<%=request.getContextPath() %>/common/mail/sent/list.do')"><span class="icon"><i
											class="fas fa-fw  fa-envelope"></i></span>보낸 메일함</a></li>
								<li><a  onclick="pageMove('<%=request.getContextPath()%>/common/mail/bin/list.do')"><span class="icon"><i
											class="fas fa-fw fa-trash"></i></span>휴지통</a></li>
							</ul>
						</div>
					</div>
				</aside>


				<div class="main-content container-fluid p-0">
					<div class="email-inbox-header">
						<div class="row">
							<div class="col-lg-6">
								<div class="email-title">
									<span class="icon"><i class="fas fa-inbox"></i></span> 받은 메일함 <span
										class="new-messages">(2개의 새로운 메세지 )</span>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="email-search">
									<div class="input-group input-search">
										<input class="form-control" type="text"
											placeholder="검색하기"><span
											class="input-group-btn">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search"></i>
											</button>
										</span>
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
							<!-- <div class="btn-group">
								<button class="btn btn-light dropdown-toggle"
									data-toggle="dropdown" type="button">
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
								<button class="btn btn-light" type="button"  style=margin-right:5px>답장</button>
								
								<button class="btn btn-light" type="button" >삭제</button>
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
					<div class="email-list" onclick="pageMove('<%=request.getContextPath()%>/common/mail/detail.do')">
						<div class="email-list-item email-list-item--unread">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="1" id="one"><span class="custom-control-label"></span>
								</label><a class="favorite active" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right"><span class="icon"><i
										class="fas fa-paperclip"></i> </span>2022-10-01</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림 - 상담일정</p>
							</div>
						</div>
						<div class="email-list-item email-list-item--unread">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="2" id="two"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right"></span><span
									class="date float-right"><span class="icon"><i
										class="fas fa-paperclip"></i></span>2022-10-01</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
						</div>
						<div class="email-list-item">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="3" id="three"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right">2022-10-02</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
						</div>
						<div class="email-list-item">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="4" id="four"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right">2022-10-03</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
						</div>
						<div class="email-list-item">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="5" id="five"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right">2022-10-04</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
						</div>
						<div class="email-list-item">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="6" id="six"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right">2022-10-05</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
						</div>
						<div class="email-list-item">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="7" id="seven"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right">2022-10-05</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
						</div>
						<div class="email-list-item">
							<div class="email-list-actions">
								<label class="custom-control custom-checkbox"> <input
									class="custom-control-input checkboxes" type="checkbox"
									value="8" id="eight"><span class="custom-control-label"></span>
								</label><a class="favorite" href="#"><span></span></a>
							</div>
							<div class="email-list-detail">
								<span class="date float-right">2022-10-06</span><span class="from">한태훈 교수님</span>
								<p class="msg">상담알림- 상담일정</p>
							</div>
							
						</div>
						
							
					</div>
					<div class="row justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous">
										<span aria-hidden="true">«</span>
										<span class="sr-only">Previous</span>
									</a>
								</li>
								<li class="page-item active">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next">
										<span aria-hidden="true">»</span>
										<span class="sr-only">Next</span>
									</a>
								</li>
							</ul>
						</nav>
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

