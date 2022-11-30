<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="container-fluid">
	<div class="row">
		<div class="pills-regular col-xl-12">

			<!-- ================================================= -->
			<!-- 탭LIST 시작 -->
			<!-- ================================================= -->
			<ul class="nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/mylecture/notice/list?lecCd=${lecCd}"
					id="Stulenotice-tab" data-toggle="pill" href="#pills-lecnotice"
					role="tab" aria-controls="home" aria-selected="true">공지사항</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath()%>/stu/lec/mylecture/assign/list?lecCd=${lecCd}"
					id="Stulecassignment-tab" data-toggle="pill" href="#pills-lecqna"
					role="tab" aria-controls="profile" aria-selected="false">과제게시판</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/syllabus.do?lecCd=${lecCd}"
					id="Stureviews-tab" data-toggle="pill" href="#pills-lecassignment"
					role="tab" aria-controls="contact" aria-selected="false">강의계획서</a></li>
				<li class="menuMove nav-item"><a class="nav-link active show"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/pds/list?lecCd=${lecCd}"
					id="StuReference-tab" data-toggle="pill" href="#pills-lecmarks"
					role="tab" aria-controls="contact" aria-selected="false">자료실</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/qna/list?lecCd=${lecCd}"
					id="StuQna-tab" data-toggle="pill" href="#pills-lecattend"
					role="tab" aria-controls="contact" aria-selected="false">Q&A</a></li>

			</ul>
			<!-- ================================================= -->
			<!-- 탭 LIST 끝 -->
			<!-- ================================================= -->


			<!-- ================================================= -->
			<!-- 카드 시작 -->
			<!-- ================================================= -->
			<!-- 게시판상세 -->
			<!-- ================================================= -->
			<!-- MAIN-CONTENT -->
			<!-- ================================================= -->
			<div class="card">

				<div class="card-header">
					<h1 id="header" class="header-title"
						style="text-align: left; margin-top: 20px; margin-left: 20px; display: inline">
						<strong>경영학개론</strong>
					</h1>
				</div>

				<div class="card-body">
					<div class="main-content-jsp">
						<h4 class="card-header">
							<i class="fas fa-clipboard"></i>&nbsp;&nbsp;경영학개론
						</h4>
						<div class="card">

							<table class="table table-hover">
								<tr>
									<th style="width: 20%">
										<div class="row justify-content-end mr-2">
											<label for="inputText"
												class="col-9 col-lg-9 col-form-label text-right">과목명</label>
											<div class="col-3 col-lg-3">
												<div class="input-group-append">
													<input type="text" class="form-control">
													<button type="button" class="btn btn-primary">검색</button>
												</div>
											</div>
										</div>
									</th>
								</tr>
							</table>
							<div class="card">
								<div class="card-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th style="width: 15%">글번호</th>
												<th style="width: 55%">제목</th>
												<th style="width: 15%">작성일자</th>
												<th style="width: 15%">조회수</th>
											</tr>
										</thead>
										<tbody>
											<tr style="font-size: 0.85em;"
												onclick="pageMove('/ai/stu/lec/mylecture/assign/pds/detail')">
												<td>541</td>
												<td>나만의 노트 정리 또는 암기법 공유합니다.</td>
												<td>2022-09-28 15:12</td>
												<td>24</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row justify-content-end mr-2">
								<button type="button" class="btn btn-lg btn-primary"
									data-toggle="popover" title=""
									data-content="And here's some amazing content. It's very engaging. Right?"
									data-original-title="Popover title">글쓰기</button>
							</div>
							<div class="row justify-content-center">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Previous"> <span aria-hidden="true">«</span>
												<span class="sr-only">Previous</span>
										</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#"
											aria-label="Next"> <span aria-hidden="true">»</span> <span
												class="sr-only">Next</span>
										</a></li>
									</ul>
								</nav>
							</div>


						</div>

					</div>



				</div>
			</div>
		</div>
	</div>
</div>

<script>
function f_alert(){
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#5969FF',
		  cancelButtonColor: '#EF172C',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
	});
		
}

</script>



<script>
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}
</script>
