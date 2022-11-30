<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<div class="row">
		<!-- 탭 -->
		<!-- ================================================= -->
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
				<li class="menuMove nav-item"><a class="nav-link active show"
					data-url="<%=request.getContextPath() %>/stu/lec/mylecture/assign/syllabus.do?lecCd=${lecCd}"
					id="Stureviews-tab" data-toggle="pill" href="#pills-lecassignment"
					role="tab" aria-controls="contact" aria-selected="false">강의계획서</a></li>
				<li class="menuMove nav-item"><a class="nav-link"
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







			<div class="row">
				<div class="col-xl-12">
					<div class="card">
						<!-- <h5 class="card-header" style=font-size:35px;>강의계획서</h5> -->

						<div class="card-header">
							<h1 id="header" class="header-title"
								style="text-align: left; margin-top: 20px; margin-left: 20px; display: inline">
								<strong>${syllabus.subjName}</strong>
							</h1>
						</div>



						<div class="card-body">

							<table class="table table-hover" border="1">


								<tr>
									<th style="background-color: #F0F0F8">과목코드</th>
									<td>${syllabus.subjCd}</td>
									<th style="background-color: #F0F0F8">이수구분</th>
									<td>${syllabus.lecCategoryCd}</td>
									<th style="background-color: #F0F0F8">대상학년</th>
									<td>${syllabus.targetGrade}</td>
									<th style="background-color: #F0F0F8">학점</th>
									<td>${syllabus.credit}</td>

								</tr>




								<tr>

									<th style="background-color: #F0F0F8">최대수강인원</th>
									<td>${syllabus.maxStuNum}</td>
									<th style="background-color: #F0F0F8">강의 시수</th>
									<td>${syllabus.lecHour}</td>
									<th style="background-color: #F0F0F8">교재 및 참고서</th>
									<td>${syllabus.materials}</td>
									<th style="background-color: #F0F0F8">교양 카테고리</th>
									<td>${syllabus.geCd}</td>

								</tr>


								<tr>

									<th style="background-color: #F0F0F8">중간고사비율</th>
									<td>${syllabus.midRatio}%</td>
									<th style="background-color: #F0F0F8">기말고사 비율</th>
									<td>${syllabus.finalRatio}%</td>
									<th style="background-color: #F0F0F8">과제 비율</th>
									<td>${syllabus.assignRatio}%</td>
									<th style="background-color: #F0F0F8">출결비율</th>
									<td>${syllabus.attendRatio}%</td>

								</tr>


								<tr>

									<th style="background-color: #F0F0F8">평가구분</th>
									<td>${syllabus.evalClassCd}</td>
									<th style="background-color: #F0F0F8">강의시간 1</th>
									<td>${syllabus.lecDate1}</td>
									<th style="background-color: #F0F0F8">강의시간 2</th>
									<td>${syllabus.lecDate2}</td>


								</tr>

								<tr>

									<th style="background-color: #F0F0F8">교과목 개요</th>
									<td colspan="7">${syllabus.outline}</td>


								</tr>

								<tr>
									<th style="background-color: #F0F0F8">주차</th>
									<th colspan="3" style="background-color: #F0F0F8">학습내용</th>
									<th colspan="4" style="background-color: #F0F0F8">학습목표</th>
								</tr>
							<c:forEach items="${weekLearningList}" var="weekLearn">
								<tr>
									<td>${weekLearn.weekNo}</td>
									<td colspan="3">${weekLearn.content}</td>
									<td colspan="4">${weekLearn.goal}</td>
								</tr>
							</c:forEach>

							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var menus = document.querySelectorAll('.menuMove');
	for (var i = 0; i < menus.length; i++) {
		menus[i].addEventListener("click", function() {
			location.href = event.target.getAttribute('data-url');
		});
	}
</script>

