<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->


<head>
<style>
.card-header {
	background-color: rgba(204,204,255,0.3);
	height: 60px;
	font-size: 30px;
}


li{list-style:none;}


.flex{
  display:flex;
  padding-left: 30px;
  margin-top:0px;
  
}

.slide_wrapper{
  position:relative;
  width:1470px;
  margin:0 auto;
  height:400px;
  overflow:hidden;
}

.slides{
  position:absolute;
	  transition:left 0.7s ease-out;
}

.slides li:not(:last-child){
  margin-right:30px;
}


.controls{
  width:100%;
  display:inline-block;
  height:400px;
  text-align:center;
  
}

.controls div{
  line-height:400px;
  z-index:2;
  position:absolute;
  top:50%;
  width:30px;
  height:400px;
  background-color : rgba(117,227,117,0.1 );
  display:inline-block;
  transform:translateY(-50%);
}

.controls>.prev{
  right:calc(100% - 30px);
}

.controls>.next{
  left:calc(100% - 30px);
}

.lecCard {box-sizing: border-box;  position: relative;}
.more {width: 330px; height: 400px; color:yellow; background-color: rgba(50,50,50,0.8); position: absolute; z-index: 2; display : flex; justify-content : center; align-items : center; font-size: 15px; cursor: pointer;}
.hidden {display: none;}

.ellipsisSubj{
	text-overflow:ellipsis;
	white-space : nowrap;
	overflow : hidden;
		width:160px;
}
.ellipsisTitle{
	text-overflow: ellipsis;
	text-align:left;
	white-space : nowrap;
	overflow : hidden;
	width:280px;
}
.ellipsisTitle2{
	text-overflow: ellipsis;
	white-space : nowrap;
	overflow : hidden;
	width:230px;
	text-align:left;
}
.subjCard{
	text-overflow: ellipsis;
	white-space : nowrap;
	overflow : hidden;
	width:300px;
	text-align:left;
	line-height: 60px;
}

</style>
</head>
<div class="container-fluid">
	<div class="card">
		
		<div class="card-body">
		<div class="slide_wrapper ">
		  <ul class="slides flex">
		  <%
			java.util.List<String> colorList = new java.util.ArrayList<String>();
			colorList.add("#ffafb0");
			colorList.add("#aee4ff");
			colorList.add("#fcffb0");
			colorList.add("#caa6fe");
			colorList.add("#e2ffaf");
			colorList.add("#83a7a3");
			colorList.add("#dfd4e4");
			colorList.add("#fdfa87");
			colorList.add("#00FF33");
			pageContext.setAttribute("colorList", colorList);
		  %>
			<c:forEach items="${lecList}" var="lec" varStatus="status">
				
			    <li>
					<div>
						<div class="card lecCard"  style="width:330px; height:400px;">
							<div class="card-header align-items-center" style="height:90px; background-color: ${colorList[status.index]}">
								<h2 class="subjCard" title="${lec.subjName}">${lec.subjName}</h2>
							</div>
							<div class="more hidden card" onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/index?lecCd=${lec.lecCd}')">
								과목명 : ${lec.subjName}<br><br>
								과목 구분 : ${lec.lecCategoryCd }<br><br>
								학점 : ${lec.credit}학점<br><br>
								강의 시수 : ${lec.lecHour}시간<br><br>
								교양 구분 : ${lec.geCd }<br><br>
							</div>
							<div class="contents card-body" style="cursor: pointer"
								onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/index?lecCd=${lec.lecCd}')">
								<span class="manPicture" data-anoCd="${lec.anoCd}"
		            		  	   		      style="display:block;width:130px;height:130px;margin:0 auto; border-radius: 50%"></span><br>
								<center><strong style="font-size: 18px; color:blue;">${lec.name}</strong> 교수님<br></center>
								<strong style="font-size: 18px;">수업시간</strong> : ${lec.lecDate1}, ${lec.lecDate2}<br>
								<strong style="font-size: 18px;">강의실</strong> : ${lec.classroom }<br>
								<strong style="font-size: 18px;">교수님 이메일</strong> : ${lec.emailAddr}
							</div>
						</div>
					</div>
			    </li>
			</c:forEach>
		  </ul>
		  <div class="controls">
		    <div class="prev"><</div>
		    <div class="next">></div>
		  </div>
		</div>
		
		
		
			<div class="justify-content-center" style="margin-top:30px;">
			<div class="row" style="width:1500px; margin:0 auto">
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
					<div class="card" style="height : 350px;">
						<h3 class="card-header">
							<i class="fas fa-tasks"></i>&nbsp;&nbsp;수업진행공지
						</h3>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>글번호</th>
										<th>과목명</th>
										<th>공지제목</th>
										<th>게시날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${fn:length(boardLecNoticeList) < 5}">
										<c:forEach items="${boardLecNoticeList}" var="lecNotice"
											varStatus="status">
											<tr style="cursor:pointer" onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/index?lecCd=${lecNotice.lecCd}')">
												<td>${status.count}</td>
												<td><div class="ellipsisSubj">${lecNotice.subjName}</div></td>
												<td><div class="ellipsisTitle">${lecNotice.title}</div></td>
												<td><fmt:formatDate value="${lecNotice.cdate}"
														pattern="yyyy/MM/dd" /></td>
											</tr>
										</c:forEach>


									</c:if>
									<c:if test="${fn:length(boardLecNoticeList) >= 5}">
										<c:forEach var="i" begin="0" end="4" varStatus="status">
											<tr style="cursor:pointer" onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/index?lecCd=${boardLecNoticeList[i].lecCd}')">
												<td>${status.count}</td>
												<td><div class="ellipsisSubj">${boardLecNoticeList[i].subjName}</div></td>
												<td><div class="ellipsisTitle">${boardLecNoticeList[i].title}</div></td>
												<td><fmt:formatDate
														value="${boardLecNoticeList[i].cdate}"
														pattern="yyyy/MM/dd" /></td>
											</tr>
										</c:forEach>
									</c:if>

								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
					<div class="card" style="height : 350px;" >
						<h3 class="card-header">
							<i class="fas fa-edit"></i>&nbsp;&nbsp;과제공지
						</h3>
						<div class="card-body">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>과목명</th>
										<th>과제글제목</th>
										<th>제출여부</th>
										<th>게시날짜</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="i" begin="0" end="4" varStatus="status">
									<tr  style="cursor:pointer" onclick="pageMove('<%=request.getContextPath()%>/stu/lec/mylecture/index?lecCd=${boardAssignList[i].lecCd}')">
										<td>${status.count }</td>
										<td><div class="ellipsisSubj">${boardAssignList[i].subjName}</div></td>
										<td><div class="ellipsisTitle2">${boardAssignList[i].title}</div></td>
										<td>${boardAssignList[i].subEvalStatusCd}</td>
										<td><fmt:formatDate value="${boardAssignList[i].createDate}" pattern="yyyy/MM/dd"/></td>
									</tr>
								</c:forEach>	
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
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script>
MemberPictureThumb('<%=request.getContextPath()%>');

</script>
<script>

var slides = document.querySelector('.slides'),
slide = document.querySelectorAll('.slides li'),
currentIdx = 0,
slideCount = slide.length,
slideWidth = 330,
slideMargin = 30,
prevBtn = document.querySelector('.prev'),
nextBtn = document.querySelector('.next');

slides.style.width =(slideWidth + slideMargin)*slideCount - slideMargin + 'px';

function moveSlide(num) {
slides.style.left = -num * 360 + 'px';
slides.style.transition='left 0.7s ease-out';
currentIdx = num;
}

nextBtn.addEventListener('click', function () {
if( currentIdx < slideCount - 4){
  moveSlide(currentIdx + 1);
}else{
  moveSlide(0);
}   
});

prevBtn.addEventListener('click', function () {
if( currentIdx > 0){
  moveSlide(currentIdx - 1);
}else{
  moveSlide(slideCount - 4);
}   
});

</script>


<script>
const more = document.querySelectorAll(".more");
const contents = document.querySelectorAll(".contents");
const lecCard = document.querySelectorAll(".lecCard");

for(let i=0;i<lecCard.length;i++){
	lecCard[i].addEventListener("mouseover", function(){
			more[i].classList.remove("hidden");
	})
}

for(let i=0;i<lecCard.length;i++){
	lecCard[i].addEventListener("mouseout", function(){
		more[i].classList.add("hidden");
	})
}

</script>



