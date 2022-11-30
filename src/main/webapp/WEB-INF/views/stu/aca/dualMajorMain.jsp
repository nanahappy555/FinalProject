<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="card">
		<div class="card-body">
<div class="main-content-jsp">
    
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->

	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header"><i class="fas fa-clipboard"></i>&nbsp;&nbsp;부/복수전공 신청 공지 조회</h3>
				
				<div class="card-body">
					<ul>
						<li>부/복수전공 가능한 학과(부)전공 정보를 조회할 수 있는 화면입니다.</li>
						<li>학과 홈페이지를 클릭하면 해당 학과(부)전공의 페이지로 이동합니다.</li>
						<li>신청 버튼을 클릭하면 부/복수전공 신청할 수 있는 화면으로 이동합니다.</li>
			        </ul>
				</div>
			</div>
		</div>
	</div> 
	<!-- ================================================= -->
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="card">
				<h3 class="card-header"><i class="fas fa-clipboard"></i>&nbsp;&nbsp;유의사항</h3>
				
				<div class="card-body">
					<ul>
						<li>부전공은 1개, 복수전공은 2개까지 신청이 가능합니다.</li>
			        </ul>
				</div>
			</div>
		</div>
	</div> 
	<!-- ================================================= -->
<div class="row">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
		<div class="card">
			<div class="card-body">
	
				<div class="row">
					<div class="col-md-3 mb-3">
						<label for="country">분과대학</label>
						<select id="collegeSelect" name="collegeCd" class="custom-select d-block w-100" onchange="getMajorListByCollegeCd()" id="country" required="">
							<option value="">선택</option>
							<c:forEach items = "${collegeList}" var="college">
								<option value="${college.colCd}">${college.colName}</option>
							</c:forEach>
						</select>
					<div class="invalid-feedback">
						분과대학을 선택하세요
					</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">학과(부)</label>
						<select id="majorSelect" name="majorCd" class="custom-select d-block w-100" id="state" required="">
							<option value="">선택</option>
							<option>아시아언어문명학부</option>
						</select>
						<div class="invalid-feedback">
							학과(부)를 선택하세요
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">전공</label>
						<select class="custom-select d-block w-100" id="state" required="">
							<option value="">선택</option>
							<option>인도언어문명전공</option>
						</select>
						<div class="invalid-feedback">
							전공을 선택하세요
						</div>
					</div>
					<div class="col-md-1 mb-3">
						<label for="state"></label>
						<span class="input-group-append">
	      					<button class="btn btn-primary" type="button" 
	            					id="searchBtn" onclick="list_go(1);">검색</button>
	   					</span>
					</div>
				</div>
	
			</div>
		</div>
	</div>
</div> 
	<!-- ================================================= -->
	<!-- 본문 2 -->
	<!-- ================================================= -->
	<div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	<div class="card">
		<h4 class="card-header">[검색결과]</h4>
		
		<div class="card-body">
			<table class="table table-hover">
			    <thead>
			        <tr>
			            <th>구분</th>
			            <th>분과대학</th>
			            <th>학과(부)</th>
			            <th>전공</th>
			            <th></th>
			        </tr>
			    </thead>
			    <tbody>
			        <tr>
			        	<td style="width : 10%">
			        		<select class="form-control" id="input-select">
								<option>선택</option>
								<option>제 2전공</option>
								<option>제 3전공</option>
								<option>부전공</option>
							</select>
						</td>
			            <td style="width : 10%">인문대학</td>
			            <td style="width : 15%">아시아언어문명학부</td>
			            <td style="width : 25%">인도언어문명전공</td>
			            <td style="width : 20%"><a href="#" class="btn btn-primary btn-sm">홈페이지</a>&nbsp;
			            &nbsp;<a href="#" class="btn btn-primary btn-sm" onclick="OpenWindow('<%=request.getContextPath()%>/stu/aca/dualMajor/applyPage','글쓰기',1280,650);">부/복수전공신청</a></td>
			        </tr>
			    </tbody>
			</table>
		</div>
	</div>
</div>
	</div> 
	<!-- ================================================= -->
	<!-- 본문2 끝 -->
	<!-- ================================================= -->
	
		
</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script  type="text/x-handlebars-template"  id="searchMajorListTemplate">
	{{#each .}}
<tr>
     <td style="width : 20%">{{colName}}</td>
     <td style="width : 25%">{{majorName}}</td>
     <td style="width : 10%">{{inPersonnel}}</td>
     <td style="width : 10%">{{outPersonnel}}</td>
     <td style="width : 15%"><a href="{{majorWeb}}" class="btn btn-primary btn-sm">홈페이지</a>&nbsp;&nbsp;
	<a href="#" class="btn btn-primary btn-sm" onclick="OpenWindow('<%=request.getContextPath()%>/stu/aca/changeMajor/applyPage?colName={{colName}}&majorName={{majorName}}','신청페이지',1280,650);">전과신청</a></td>
</tr>

	{{/each}}
</script>



<script>

function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}

function getMajorListByCollegeCd(){
	var collegeCd = $("select[name=collegeCd").val();
	$.ajax({
		url : "<%=request.getContextPath()%>/stu/aca/majorList",
		data : {"collegeCd":collegeCd},
		type:"post",
		dataType:"json",
		success:function(data){
			var majorSelect = document.getElementById("majorSelect");
			var result = "";
			for(var i=0;i<data.length;i++){
				result+="<option value='none'>선택</option>"
				result+="<option value="+data[i].majorCd+">"+data[i].majorName+"</option>";
			}
			majorSelect.innerHTML=result; 
		},
		error:function(){
			alert("실패");
		}
			
	})
}

function searchMajorList(){
	var collegeCd = $("select[name=collegeCd").val();
	var majorCd = $("select[name=majorCd]").val();
	if(!collegeCd&&!majorCd){
		alert("검색할 항목을 선택해주세요.");
		return;
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/aca/searchMajorList",
		data:{
			"colCd":collegeCd,
			"majorCd":majorCd	
		},
		type:"post",
		dataType:"json",
		success:function(data){
			printData(data,$('#searchMajorList'),$('#searchMajorListTemplate'))
		},
		error:function(){
			alert("실패");
		}
	})
	
}
</script>