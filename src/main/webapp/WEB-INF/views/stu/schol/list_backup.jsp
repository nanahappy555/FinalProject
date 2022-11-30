<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<div class="row">
   		<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<div class="accrodion-regular">
					    <div id="accordion">
						<div class="card">
					        <div class="card-header" id="headingOne">
					            <h5 class="mb-0">
					               <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
					                  	<i class="fas fa-graduation-cap"></i>&nbsp;&nbsp;건영가족장학
					               </button>
					            </h5>
					        </div>
							<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion" style="">
							    <div class="card-body">
									<table class="table table-hover">
										<tbody>
										    <tr>
										        <th style="width: 10%" scope="row">대상</th>
										        <td>건영 교육 재단 소속 기관에 재직 중인 교직원 및 병원 임직원의 직계 가족</td>
										    </tr>
										    <tr>
										        <th scope="row">혜택</th>
										        <td>입학금 전액 및 수업료 50% / 4년</td>
										    </tr>
										    <tr>
										        <th scope="row">제출서류</th>
												<td>1. 재학증명서<br>2. 가족관계 증명서<br>3. 교직원 및 임직원 본인의 재직증명서
										    </tr>
										  	<tr>
										        <th scope="row">신청기간</th>
										        <td>2022-06-23 ~ 2022-07-01</td>
										   	</tr>
											<tr>
										        <th scope="row">신청</th>
												<td>
										       		<div class="row justify-content-center">
														<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/schol/registForm','글쓰기',600,700);" >신청하기</button>
													</div>
									            </td>
									        </tr>
									    </tbody>
									</table>
					            </div>
					         </div>
					      </div>
					      
					      
						<div class="card">
					         <div class="card-header" id="headingTwo">
					            <h5 class="mb-0">
					               <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					                  	<i class="fas fa-handshake"></i>&nbsp;&nbsp;산업체위탁
					               </button>
					            </h5>
					         </div>
					         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
					            <div class="card-body">
					               <table class="table table-hover">
									   <tbody>
									       <tr>
									           <th style="width: 10%" scope="row">대상</th>
									           <td>건영 교육 재단 소속 기관에 재직 중인 교직원 및 병원 임직원의 직계 가족</td>
									       </tr>
									       <tr>
									           <th scope="row">혜택</th>
									           <td>입학금 전액 및 수업료 50% / 4년</td>
									       </tr>
									       <tr>
									           <th scope="row">제출서류</th>
									           <td>1. 재학증명서<br>2. 가족관계 증명서<br>3. 교직원 및 임직원 본인의 재직증명서
									       </tr>
									       <tr>
									           <th scope="row">신청기간</th>
									           <td>2022-06-23 ~ 2022-07-01</td>
									       </tr>
									       <tr>
									           <th scope="row">신청</th>
									           <td>
									           	<div class="row justify-content-center">
													<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/schol/registForm','글쓰기',700,800);" >신청하기</button>
													</div>
									            </td>
									        </tr>
									    </tbody>
									</table>
					             </div>
					          </div>
					       </div>
					       
					       
						<div class="card">
						   <div class="card-header" id="headingThree">
						      <h5 class="mb-0">
						         <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						            	<i class="fas fa-hand-holding-heart"></i>&nbsp;&nbsp;다사랑장학
						         </button>
						      </h5>
						   </div>
						   <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
						      <div class="card-body">
						         <table class="table table-hover">
									 <tbody>
									     <tr>
									         <th style="width: 10%" scope="row">대상</th>
									        <td>건영 교육 재단 소속 기관에 재직 중인 교직원 및 병원 임직원의 직계 가족</td>
									    </tr>
									    <tr>
									        <th scope="row">혜택</th>
									        <td>입학금 전액 및 수업료 50% / 4년</td>
									    </tr>
									    <tr>
									        <th scope="row">제출서류</th>
									        <td>1. 재학증명서<br>2. 가족관계 증명서<br>3. 교직원 및 임직원 본인의 재직증명서
									    </tr>
									    <tr>
									        <th scope="row">신청기간</th>
									        <td>2022-06-23 ~ 2022-07-01</td>
									    </tr>
									    <tr>
									        <th scope="row">신청</th>
									        <td>
									        	<div class="row justify-content-center">
													<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/schol/registForm','글쓰기',600,700);" >신청하기</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
						   
						   
						<div class="card">
					          <div class="card-header" id="headingFour">
					             <h5 class="mb-0">
					                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					                   	<i class=" fas fa-heart"></i>&nbsp;&nbsp;나라사랑
					                </button>
					             </h5>
					          </div>
					          <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
					             <div class="card-body">
					                <table class="table table-hover">
									    <tbody>
									        <tr>
									            <th style="width: 10%" scope="row">대상</th>
									           <td>건영 교육 재단 소속 기관에 재직 중인 교직원 및 병원 임직원의 직계 가족</td>
									       </tr>
									       <tr>
									           <th scope="row">혜택</th>
									           <td>입학금 전액 및 수업료 50% / 4년</td>
									       </tr>
									       <tr>
									           <th scope="row">제출서류</th>
									           <td>1. 재학증명서<br>2. 가족관계 증명서<br>3. 교직원 및 임직원 본인의 재직증명서
									       </tr>
									       <tr>
									           <th scope="row">신청기간</th>
									           <td>2022-06-23 ~ 2022-07-01</td>
									       </tr>
									       <tr>
									           <th scope="row">신청</th>
									           <td>
									           	<div class="row justify-content-center">
													<button type="button" class="btn btn-secondary mr-5" onclick="OpenWindow('<%=request.getContextPath()%>/stu/schol/registForm','글쓰기',600,700);" >신청하기</button>
													</div>
									            </td>
									        </tr>
									    </tbody>
									</table>
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