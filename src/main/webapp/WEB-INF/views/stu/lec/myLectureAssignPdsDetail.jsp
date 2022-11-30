<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 게시판상세 -->
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
	<div class="card-body">
		<div class="main-content-jsp">

					<div class="card">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<h5 class="card-header"><i class="fas fa-archive"></i>&nbsp;&nbsp;자료실</h5>

					<div class="card-body m-3">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th colspan="6">수업자료</th>
							</tr>
							<tr>
								<th style="width:15%">작성자</th>
								<td colspan="5" class="table-title">리미정 교수</td>
							</tr>
							<tr>
								<th >등록일시</th>
								<td class="table-title">2022-10-10</td>
							</tr>
							<tr>
								<th >첨부파일</th>
								<td colspan="5" class="table-title">
									2022-2 학생선택에 따른 SU평가제도 안내문.pdf</br>
									2022-2 학생선택에 따른 SU평가제도 안내문.pdf</br>
									학생선택에 따른 SU평가제도 안내문2022-2 학생선택에 따른 SU평가제도 안내문.xlsx</br>
									
								</td>
							</tr>
							<tr>
								<td colspan="6" class="table-title">
									<p class="m-3">
										안녕하세요 내용입니다 미정아 행복하십니까...</br>
										ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</br>
										sdfasdfasdfasdfasdfasdfasdf</br>
										저 10월7일 오전 11시에 301번 탄 대전 주민이에요ㅎㅎ 몸이 불편하신 분이 탔는데 
										아무말씀안하시고 친절하시게 응대해주셔서 놀랐습니당ㅠㅠㅠ </br>
										처음뵈요 기사님 같은분!앞으로도 기사님 같은 분이 많아 지셔서 더 좋은 대전이 되었으면 좋겠다고 생각했어요
										진짜 기사님 너무 멋있고 최고라고 생각해요 안전운전하세요:)!!
									</p>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				
				
				<!-- ================================================= -->
				<!-- 버튼 시작 -->
				<!-- ================================================= -->
				<div class="row justify-content-end mt-3 mr-4">
<!-- 					<button class="btn btn-info" type="button" onclick="">수정</button>&nbsp; -->
<!-- 					<button class="btn btn-secondary" type="button" onclick="">삭제</button>&nbsp; -->
<!-- 					<button class="btn btn-primary" type="button" onclick="">목록</button>&nbsp; -->
<!-- 					<br> -->
					<button class="btn btn-outline-primary m-1" type="button" onclick="">수정</button>
					<button class="btn btn-outline-danger m-1" type="button" onclick="f_alert();">삭제</button>
					<button class="btn btn-primary m-1" type="button" onclick="">목록</button>
				</div>
				<!-- ================================================= -->
				<!-- 버튼 끝 -->
				<!-- ================================================= -->
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
