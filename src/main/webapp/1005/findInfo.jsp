<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div class=container-fluid>

	<div class="content access">
		<div class="center-form">
			<div class="text-center">
				<!-- <div=""></div> -->
			</div>
			<div class="container" style="max-width: 500px;">
				<div class="row">

					<div class="card">

						<div class="card-header text-center">
							<a href="../index.html"><img class="logo-img"
								src="<%=request.getContextPath()%>/resources/img/프로젝트로고-화면용.jpg"
								alt=" logo" width="200px"></a>
						</div>
						<!--  <h5 class="card-header text-center">intell</h5> -->
						
						<div class="card-body">
							<div class="mt-4 col-12">
								<h4 class="text-left">아이디 찾기</h4>
								<div class="card w-100">
									<!---->
									<!---->
									<div class="list-group list-input list-group-flush">
										<div class="list-group-item">
											<div role="group" class="input-group">
												<!---->
												<div class="input-group-prepend">
													<!-- 	<div class="input-group-text"> -->
													<!-- <svg aria-hidden="true" width="12" height="16"
												viewBox="0 0 384 512" focusable="false" class="fa-icon">
												<path
													d="M336 0c26.5 0 48 21.5 48 48v416c0 26.5-21.5 48-48 48h-288c-26.5 0-48-21.5-48-48v-416c0-26.5 21.5-48 48-48h288zM144 32c-8.8 0-16 7.2-16 16s7.2 16 16 16h96c8.8 0 16-7.2 16-16s-7.2-16-16-16h-96zM192 160c-35.3 0-64 28.7-64 64s28.7 64 64 64 64-28.7 64-64-28.7-64-64-64zM304 396.8v-19.2c0-31.8-30.1-57.6-67.2-57.6h-5c-12.2 5.1-25.7 8-39.8 8s-27.5-2.9-39.8-8h-5c-37.1 0-67.2 25.8-67.2 57.6v19.2c0 10.6 10 19.2 22.4 19.2h179.2c12.4 0 22.4-8.6 22.4-19.2z">
</path></svg> -->
													<!-- </div> -->
												</div>
												<!-- <input 123="" type="text" placeholder="이름" class="form-control"
										id="__BVID__11"> -->
												<input type="text" placeholder="이름" class="form-control"
													id="">
											</div>
										</div>
										<div class="list-group-item">
											<div role="group" class="input-group">
												<!---->
												<div class="input-group-prepend">
													<!-- <div class="input-group-text">
															<svg aria-hidden="true" width="14" height="16"
												viewBox="0 0 448 512" focusable="false" class="icon-user">
											
												<path d="icon-user"></path></svg>
													</div> -->
												</div>
												<!--  -->
												<input type="text" placeholder="연락처" class="form-control"
													id=""> <a href="#"
													class="btn btn-outline-primary btn-block btn-lg "
													style="margin-top: 10px">인증번호 받기</a> <input type="text"
													placeholder="인증번호" class="form-control" id="__BVID__13">
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-12">
										<button type="button" class="btn w-100 btn-primary">아이디
											찾기</button>

									</div>
								</div>
							</div>



							<!-- <div class="row"> -->

							<!-- 		<div class="mt-5 col-12">
						<h4 class="text-center">비밀번호 찾기</h4>
						<div class="card w-100">
							
							
							<div class="list-group list-input list-group-flush">
								<div class="list-group-item">
									<div role="group" class="input-group">
										
										<div class="input-group-prepend">
											<div class="input-group-text">
												<svg aria-hidden="true" width="16" height="14.222222222222221" viewBox="0 0 576 512"
													focusable="false" class="fa-icon">
												<path
														d="M528 32c26.5 0 48 21.5 48 48v16h-576v-16c0-26.5 21.5-48 48-48h480zM0 432v-304h576v304c0 26.5-21.5 48-48 48h-480c-26.5 0-48-21.5-48-48zM352 200v16c0 4.4 3.6 8 8 8h144c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8h-144c-4.4 0-8 3.6-8 8zM352 264v16c0 4.4 3.6 8 8 8h144c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8h-144c-4.4 0-8 3.6-8 8zM352 328v16c0 4.4 3.6 8 8 8h144c4.4 0 8-3.6 8-8v-16c0-4.4-3.6-8-8-8h-144c-4.4 0-8 3.6-8 8zM176 192c-35.3 0-64 28.7-64 64s28.7 64 64 64 64-28.7 64-64-28.7-64-64-64zM67.1 396.2c-3.2 9.8 5.2 19.8 15.6 19.8h186.6c10.4 0 18.8-9.9 15.6-19.8-8.4-25.7-32.5-44.2-60.9-44.2h-8.2c-12.2 5.1-25.7 8-39.8 8s-27.5-2.9-39.8-8h-8.2c-28.4 0-52.5 18.5-60.9 44.2z"></path></svg>
											</div>
										</div>
										<input type="text" placeholder="아이디" class="form-control"
											id="__BVID__15">
										
									</div>
								</div>
							</div>
							
							
						</div>
						<div class="row mt-3">
							<div class="col-12">
								<button type="button" class="btn w-100 btn-secondary">이메일 보내기</button>
							</div>
						</div>
					</div> -->
							<!-- </div> -->

							<!-- 
				
				 -->

						</div>
						
						
						
						
						<!-- 카드바디  2 -->


						<div class="card-body border-top">

							<div class="mt-4 col-12">
								<h4 class="text-left">비밀번호 찾기</h4>
								<div class="card w-100">
									<!---->
									<!---->
									<div class="list-group list-input list-group-flush">

										<div class="list-group-item">
											<div role="group" class="input-group">
												<!---->
												<div class="input-group-prepend"></div>
												<input type="text" placeholder="아이디" class="form-control"
													id="">

											</div>
										</div>

										<div class="list-group-item">
											<div role="group" class="input-group">
												<!---->
												<div class="input-group-prepend">
													<!-- 	<div class="input-group-text">
														<svg aria-hidden="true" width="12" height="16"
												viewBox="0 0 384 512" focusable="false" class="fa-icon">
												<path
													d="M336 0c26.5 0 48 21.5 48 48v416c0 26.5-21.5 48-48 48h-288c-26.5 0-48-21.5-48-48v-416c0-26.5 21.5-48 48-48h288zM144 32c-8.8 0-16 7.2-16 16s7.2 16 16 16h96c8.8 0 16-7.2 16-16s-7.2-16-16-16h-96zM192 160c-35.3 0-64 28.7-64 64s28.7 64 64 64 64-28.7 64-64-28.7-64-64-64zM304 396.8v-19.2c0-31.8-30.1-57.6-67.2-57.6h-5c-12.2 5.1-25.7 8-39.8 8s-27.5-2.9-39.8-8h-5c-37.1 0-67.2 25.8-67.2 57.6v19.2c0 10.6 10 19.2 22.4 19.2h179.2c12.4 0 22.4-8.6 22.4-19.2z">
</path></svg>
													</div> -->
												</div>
												<!-- <input 123="" type="text" placeholder="이름" class="form-control"
										id="__BVID__11"> -->
												<input type="text" placeholder="이름" class="form-control"
													id="">

											</div>
										</div>



										<div class="list-group-item">
											<div role="group" class="input-group">
												<!---->
												<div class="input-group-prepend">
													<!-- <i class="icon-user"></i>
													<div class="input-group-text"></div> -->
												</div>
												<!--  -->
												<input type="text" placeholder="연락처" class="form-control"
													id=""> <i class="icon-phone"></i> <a href="#"
													class="btn btn-outline-primary btn-block btn-lg "
													style="margin-top: 10px">인증번호 받기</a> <input type="text"
													placeholder="인증번호" class="form-control" id="__BVID__13">
											</div>
										</div>
									</div>
								</div>



								<div class="row mt-3">
									<div class="col-12">
										<button type="button" class="btn w-100 btn-primary">비밀번호
											찾기</button>

									</div>
								</div>
							</div>




						</div>



					</div>







				</div>
			</div>
		</div>

	</div>

</div>
