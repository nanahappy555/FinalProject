<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid" style="padding-left:0px;">
    
<div class="card">
<div class="card-body">
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">
	
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<h2><i class="fas fa-tasks"></i>&nbsp;&nbsp;공지사항</h2>
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-2" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
							<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
							<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>
			
						</select>
						<!-- keyword -->
						<input class="form-control col-md-3" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
							class="input-group-append">
							<button class="btn btn-primary btn-sm" type="button"
								id="searchBtn" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
								<td>2022.10.18</td>
								<td>1000</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
								<td>2022.10.18</td>
								<td>1000</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
								<td>2022.10.18</td>
								<td>1000</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
								<td>2022.10.18</td>
								<td>1000</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
								<td>2022.10.18</td>
								<td>1000</td>
							</tr>
<%-- 							<c:if test="${empty lnList }"> --%>
<!-- 								<tr> -->
<!-- 									<td colspan="5"><strong>해당 내용이 없습니다.</strong></td> -->
<!-- 								</tr> -->
<%-- 							</c:if> --%>
<%-- 							<c:forEach items="${lnList }" var="list"> --%>
<!-- 								<tr> -->
<%-- 									<td>${list.lecNoticeNo }</td> --%>
<%-- 									<td>${list.title}</td> --%>
<%-- 									<td><fmt:formatDate value="${list.cdate }" pattern="yyyy-MM-dd"/></td> --%>
<%-- 									<td>${list.viewCnt }</td> --%>
					
<!-- 								</tr> -->
<%-- 							</c:forEach> --%>
						</tbody>
					</table>

					<!-- ================================================= -->
					<!-- 등록 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-2 mr-2">
						<button class="btn btn-outline-primary" type="button"
							onclick="pageMove('<%=request.getContextPath()%>/mylecture/notice/registForm');">작성하기</button>
					</div>
					<!-- ================================================= -->
					<!-- 등록 버튼 끝 -->
					<!-- ================================================= -->
					<!-- ================================================= -->
					<!-- 페이지네이션 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">«</span> <span
										class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">»</span> <span
										class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->
				</div>
			</div>
		</div>


		<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
				<h2><i class="fas fa-question"></i>&nbsp;&nbsp;질문게시판</h2>
				
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-2" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
							<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
							<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>
			
						</select>
						<!-- keyword -->
						<input class="form-control col-md-3" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
							class="input-group-append">
							<button class="btn btn-primary btn-sm" type="button"
								id="searchBtn" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">내용</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
					     		<td>1</td>
					     		<td class="table-title">
									<c:if test="${qna.secret ne '1' }">		
										<span class="nav-item">			
											<i class="fas fa-lock"></i>&nbsp;
										</span>
									</c:if>
						     		<c:if test="${qna.replycnt ne 0 }">		
										<span class="nav-item">															
											<span class="text-success">[답변완료]</span>&nbsp;
										</span>
									</c:if>
									<c:if test="${qna.replycnt eq 0}">		
										<span class="nav-item">															
											<span class="text-warning">[답변대기중]</span>&nbsp;
										</span>
									</c:if>
								<!-- 유저가 학생일 경우 비밀글은 클릭하지 못하는 c:if문이 필요함. a태그만 감싸려면 지저분한데..링크 끊는 속성이 없을까? -->
								<!-- a말고 쓸수 있는거 고민해보기.. -->
								<!-- href="javascript:;" 이거는 링크자체가 활성화 되니까 내가 원하는게 아님 -->
								<!-- href="javascript:void(0);" 이거는 유효성 오류가 생길수있다고 함 -->
					     		<a ${member.memclass ne 2? 'href="http://www.naver.com" target="_blank"' : '' }>
						     		이거비밀글이지롱................
					     		</a>
					     		
					     		</td>
					     		<td>안녕안녕</td>
					     		<td>안녕아녕</td>
					     		<td>ㅇ안녕</td>
					     		<td>500</td>
					     	</tr>
					     	<tr class=" ">
					     		<td>1</td>
					     		<td class="table-title">
									<span class="nav-item">															
										<span class="text-warning">[답변대기중]</span>&nbsp;
									</span>
					     		안녕
					     		</td>
					     		<td>안녕못함</td>
					     		<td>안녕아녕아녕</td>
					     		<td>ㅇ안녕ㅋㅋ</td>
					     		<td>50000</td>
					     	</tr>
					     	<tr class=" ">
					     		<td>1</td>
					     		<td class="table-title">
									<span class="nav-item">															
										<span class="text-warning">[답변대기중]</span>&nbsp;
									</span>
					     		안녕
					     		</td>
					     		<td>안녕못함</td>
					     		<td>안녕아녕아녕</td>
					     		<td>ㅇ안녕ㅋㅋ</td>
					     		<td>50000</td>
					     	</tr>
					     	<tr class=" ">
					     		<td>1</td>
					     		<td class="table-title">
									<span class="nav-item">															
										<span class="text-warning">[답변대기중]</span>&nbsp;
									</span>
					     		안녕
					     		</td>
					     		<td>안녕못함</td>
					     		<td>안녕아녕아녕</td>
					     		<td>ㅇ안녕ㅋㅋ</td>
					     		<td>50000</td>
					     	</tr>
						</tbody>
					</table>

					<!-- ================================================= -->
					<!-- 등록 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-2 mr-2">
						<button class="btn btn-outline-primary" type="button"
							onclick="pageMove('<%=request.getContextPath()%>/mylecture/notice/registForm');">작성하기</button>
					</div>
					<!-- ================================================= -->
					<!-- 등록 버튼 끝 -->
					<!-- ================================================= -->
					<!-- ================================================= -->
					<!-- 페이지네이션 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">«</span> <span
										class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">»</span> <span
										class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->					
				
				</div>
			</div>
		</div>



		
	</div> 
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->

	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	<div class="row">
	
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
				<h2><i class="fas fa-clipboard-list"></i>&nbsp;&nbsp;과제관리</h2>
				
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
						<select class="form-control col-md-2" name="searchType"
							id="searchType">
							<option value="">검색구분</option>
							<option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
							<option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
							<option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>
			
						</select>
						<!-- keyword -->
						<input class="form-control col-md-3" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="${cri.keyword }" /> <span
							class="input-group-append">
							<button class="btn btn-primary btn-sm" type="button"
								id="searchBtn" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->

					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
								<td>박건영</td>
								<td>2022.10.18</td>
							</tr>
							<tr>
								<td>2</td>
								<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
								<td>박건영</td>
								<td>2022.10.18</td>
							</tr>
							<tr>
								<td>3</td>
								<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
								<td>박건영</td>
								<td>2022.10.18</td>
							</tr>
							<tr>
								<td>4</td>
								<td class="table-title">제출합니다제출합니다제출합니다제출합니다제출합니다제출합니다</td>
								<td>박건영</td>
								<td>2022.10.18</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="table-title">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</td>
								<td>박건영</td>
								<td>2022.10.18</td>
							</tr>
						</tbody>
					</table>
					
					<!-- ================================================= -->
					<!-- 등록 버튼 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-end mt-2 mr-2">
						<button class="btn btn-outline-primary" type="button"
							onclick="pageMove('<%=request.getContextPath()%>/mylecture/notice/registForm');">작성하기</button>
					</div>
					<!-- ================================================= -->
					<!-- 등록 버튼 끝 -->
					<!-- ================================================= -->
					<!-- ================================================= -->
					<!-- 페이지네이션 시작 -->
					<!-- ================================================= -->
					<div class="row justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">«</span> <span
										class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">»</span> <span
										class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->	
				
				</div>
			</div>
		</div>
		
		
		
		
		
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<h2><i class="fas fa-calendar-check"></i>&nbsp;&nbsp;일정</h2>
				<!-- ================================================= -->
				<!-- 등록칸 시작 -->
				<!-- ================================================= -->
					<div class="input-group mt-2mb-3 justify-content-center">
					
						&nbsp;&nbsp;&nbsp;<button class="btn btn-rounded btn-primary mb-1"><b>구분</b> </button>&nbsp;&nbsp;&nbsp;
						<select class="form-control col-md-2" name="perPageNum" id="perPageNum" onchange="list_go(1);">					  		  		
					  		<option value="10">중간고사</option>
					  		<option value="10">기말고사</option>
					  		<option value="2">쪽지시험</option>
					  		<option value="3">과제</option>
					  		
					  	</select>
					
						&nbsp;&nbsp;&nbsp;<button class="btn btn-rounded btn-primary mb-1"><p><strong>일시</strong></p></button>&nbsp;&nbsp;
						<div class="code-html">
					        <div class="mt-2 tui-datepicker-input tui-datetime-input tui-has-focus">
					            <input type="text" id="datepicker-input" aria-label="Date-Time">
					            <span class="tui-ico-date"></span>
					        </div>
					        <div id="datepicker-div"  style="position: relative; background-color:white; z-index: 1; margin-top: -1px;"></div>
					    </div>
					  	
						&nbsp;&nbsp;&nbsp;<button class="btn btn-rounded btn-primary mb-1"><p><strong>강의실</strong></p></button>&nbsp;&nbsp;
					 	<input type="text" class="form-control col-md-2" name="searchType" id="searchType">
						&nbsp;&nbsp;&nbsp;<button class="btn btn-outline-primary" type="button" onclick="f_regist(event)">일정등록</button>
					</div>
				</div>
				<!-- ================================================= -->
				<!-- 등록칸 끝 -->
				<!-- ================================================= -->
					
				
				
				
				<div class="card-body border-top">
					<!-- ================================================= -->
					<!-- 검색바 시작 -->
					<!-- ================================================= -->
					<div class="input-group mb-3 justify-content-end">
					
					   <select class="form-control col-md-1" name="perPageNum" id="perPageNum" onchange="list_go(1);">                               
					        <option value="10" ${cri.perPageNum eq 10 ? 'selected' : '' } >정렬개수</option>
					        <option value="2" ${cri.perPageNum eq 2 ? 'selected' : '' }>2개씩</option>
					        <option value="3" ${cri.perPageNum eq 3 ? 'selected' : '' }>3개씩</option>
					        <option value="5" ${cri.perPageNum eq 5 ? 'selected' : '' }>5개씩</option>
					     </select>
					    <select class="form-control col-md-1" name="searchType" id="searchType">
					       <option value=""  >검색구분</option>
					      <option value="t" ${param.searchType=='t' ? "selected":"" }>글제목</option>
					      <option value="w" ${param.searchType=='w' ? "selected":"" }>작성자</option>
					      <option value="c" ${param.searchType=='c' ? "selected":"" }>글내용</option>   
					                                              
					   </select>
					   <!-- keyword -->
					    <input  class="form-control col-md-2" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }"/>
					   <span class="input-group-append">
					      <button class="btn btn-primary btn-sm" type="button" 
					            id="searchBtn" onclick="list_go(1);">
					         <i class="fa fa-fw fa-search"></i>
					      </button>
					   </span>
					</div>
					<!-- ================================================= -->
					<!-- 검색바 끝 -->
					<!-- ================================================= -->
			
					<!-- ================================================= -->
					<!-- 게시판 시작 -->
					<!-- ================================================= -->
					
						<table class="table table-hover">
							<thead>
								<tr>
									<th>종류</th>
									<th>일시</th>
									<th>강의실명</th>
									<th style="width:12%">수정</th>
									<th style="width:12%">삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>중간고사</td>
									<td>2022-10-15</td>
									<td>BT031</td>
									<td>
										<button class="btn btn-outline-primary btn-sm m-1" type="button" onclick="f_modify()">수정</button>
									</td>
									<td>
										<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="f_alert();">삭제</button>
									</td>
								</tr>
								<tr>
									<td>기말고사</td>
									<td>2022-12-10</td>
									<td>BT031</td>
									<td>
										<button class="btn btn-outline-primary btn-sm m-1" type="button" onclick="f_modify()">수정</button>
									</td>
									<td>
										<button class="btn btn-outline-danger btn-sm m-1" type="button" onclick="f_alert();">삭제</button>
									</td>
								</tr>
			
								
							</tbody>
						</table>
									
									
					<!-- ================================================= -->
					<!-- 게시판 끝 -->
					<!-- ================================================= -->
					
			
					<!-- ================================================= -->
					<!-- 페이지네이션 시작 -->
					<!-- ================================================= -->
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
					<!-- ================================================= -->
					<!-- 페이지네이션 끝 -->
					<!-- ================================================= -->
			      
				</div>
				   
				   
				</div>
				
				</div>
			</div>
		</div>

		
		
	</div> 
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
		
		
</div>
</div>
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->