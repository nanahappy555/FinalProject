<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="container-fluid">
<div class="card" >
	<h3 class="card-header"><i class="fas fa-edit"></i>&nbsp;&nbsp;시간표</h3>	
	<div class="card-body row justify-content-center">
		<div class="col-xl-10 col-lg-10 col-md-10 col-sm-10 col-12 ">
				<select id="gradeSeme" onchange="selectGradeSeme(event)" class="form-control col-xl-3 col-lg-3 col-md-3 col-sm-3 col-3 " >
					<c:forEach items="${gradeSemesterList}" var="gradeSeme" varStatus="status">
						<c:set var="seme" value="${fn:substring(gradeSeme,3,4)}"/>
							<option value="${gradeSeme}" ${status.last ? 'selected' : ''}>
							${fn:substring(gradeSeme,1,2)}학년
							<c:choose>
							<c:when test="${seme eq '3'}">
								여름 계절 학기
							</c:when>
							<c:when test="${seme eq '4'}">
								겨울 계절 학기
							</c:when>
							<c:otherwise>
								${seme}학기
							</c:otherwise>
							</c:choose>
							</option>
					</c:forEach>
				</select>
				<br/>
				<table class="table table-bordered ">
				 <thead>
				    <tr class="text-center">
				     <th scope="col" style="width:10%">시간</th>
				     <th scope="col" style="width:18%">월</th>
				     <th scope="col" style="width:18%">화</th>
				     <th scope="col" style="width:18%">수</th>
				     <th scope="col" style="width:18%">목</th>
				     <th scope="col" style="width:18%">금</th>
				   </tr>
				 </thead>
				 <tbody class="text-center">
				
				<%
					String [] day = {"월","화","수","목","금"};
				
				%>
				
				
				<% for(int time=9; time<18; time++){ %>
				   <tr>
				     <th scope="row" ><div style="height: 50px"><%= time %>시~<%= time+1 %>시</div></th>
				  <%for(int i=0; i<5; i++){ %>
				 <td id="<%=day[i]%><%=time%>" ></td>
				 <%}; %>
				   </tr>
				   <%}%>
				 </tbody>
				</table>
				
		</div>
	</div>
</div>
</div>

<script>
	var colorArray = ['#ffafb0','#fcffb0','#aee4ff','#b5c7ed','#fcc6f7','#bee9b4','#ffe4af','#A9A0FC','#8AV481'];
</script>
<c:forEach items="${lecList}" var="myLecture" varStatus="status">

<script>
	var index = ${status.index};
 	var color = colorArray[parseInt(index)];
	var lecCd = '${myLecture.lecCd}';
	var name = '${myLecture.name}';
	var lecDate1 = '${myLecture.lecDate1}';
	var lecDate2 = '${myLecture.lecDate2}';
	var classroom='${myLecture.classroom}';
	var subjCd='${myLecture.subjCd}';
	var subjName='${myLecture.subjName}';
	console.log("글자",subjName);
	console.log("글자수",subjName.length);
	if (subjName.length > 14){
		subjName = subjName.substring(0,14) + "...";
	}
	
	var htmlStr = "<span>"+subjName+"</span><br>";
		htmlStr +="<span>"+classroom+"</span>";
	
	var firstDay = lecDate1.substring(0,1);
	var firStartTime =lecDate1.substring(2,4);
	var firEndTime = lecDate1.substring(10,12);
	for(var i=firStartTime;i<firEndTime;i++){
		var id = "#"+firstDay+i;
		$(id).css("backgroundColor",color).css("cursor","pointer");
		$(id).attr("title",name+" 교수님");
		$(id).html(htmlStr);
		$(id).click(function(){
			OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/syllabusWithoutTab?lecCd=${myLecture.lecCd}','강의계획서',1200,1000)
		});
	}
	
	var secondDay = lecDate2.substring(0,1);
	var secStartTime =lecDate2.substring(2,4);
	var secEndTime = lecDate2.substring(10,12);	
	for(var i=secStartTime;i<secEndTime;i++){
		var id = '#'+secondDay+i;
		$(id).css("backgroundColor",color).css("cursor","pointer");
		$(id).attr("title",name+" 교수님");	
		$(id).html(htmlStr);
		$(id).click(function(){
			OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/syllabusWithoutTab?lecCd=${myLecture.lecCd}','강의계획서',1200,1000)
		});
	}
</script>

</c:forEach>

<script>
function selectGradeSeme(e){
	var gradeSemeCd = e.target.value;
	$.ajax({
		url:"<%=request.getContextPath()%>/stu/lec/timetable/changeSeme",
		data:{"gradeSemeCd":gradeSemeCd},
		dataType:"json",
		success:function(data){
			$('td').html('');
			$('td').removeAttr("style");
			$('td').removeAttr('title');
			$('td').off("click");
			for(let i=0;i<data.length;i++){
			 	color = colorArray[i];
				
				lecCd = data[i].lecCd;
				name = data[i].name;
				lecDate1 = data[i].lecDate1;
				lecDate2 = data[i].lecDate2;
				classroom=data[i].classroom;
				subjCd=data[i].subjCd;
				subjName=data[i].subjName;
				
				htmlStr = "<span>"+subjName+"</span><br>";
				htmlStr +="<span>"+classroom+"</span>";
				
				firstDay = lecDate1.substring(0,1);
				firStartTime =lecDate1.substring(2,4);
				firEndTime = lecDate1.substring(10,12);
				for(let j=firStartTime;j<firEndTime;j++){
					let id = "#"+firstDay+j;
					$(id).css("backgroundColor",color).css("cursor","pointer");
					$(id).attr("title",name+" 교수님");
					$(id).html(htmlStr);
					$(id).click(
							function(){
								OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/syllabusWithoutTab?lecCd='+data[i].lecCd,'강의계획서',1200,1000)		
							}
					);
				}
				
				secondDay = lecDate2.substring(0,1);
				secStartTime =lecDate2.substring(2,4);
				secEndTime = lecDate2.substring(10,12);	
				for(let k=secStartTime;k<secEndTime;k++){
					let id = '#'+secondDay+k;
					$(id).css("backgroundColor",color).css("cursor","pointer");
					$(id).attr("title",name+" 교수님");	
					$(id).html(htmlStr);
					$(id).click(
							function(){
								console.log(i);
								OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/syllabusWithoutTab?lecCd='+data[i].lecCd,'강의계획서',1200,1000)		
							}
					);

					
				}
			}
			
		},
		error:function(){
			alert("실패")
		}
	})
}

function syllabus(id,lecCd){
	$(id).click(
			function(){
				OpenWindow('<%=request.getContextPath()%>/stu/lec/mylecture/syllabusWithoutTab?lecCd='+lecCd,'강의계획서',1200,1000)		
			}
	);
}
</script>


			