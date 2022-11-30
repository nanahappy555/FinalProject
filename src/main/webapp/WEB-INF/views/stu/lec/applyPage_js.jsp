<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>

<script type="text/x-handlebars-template" id="threeDepthMenu-list-template">
{{#each .}}

{{/each}}
</script>

<script>
document.addEventListener('DOMContentLoaded', () => {
$.ajax({
	url:'<%=request.getContextPath()%>/stu/lec/getAppliedLecList',
	method:"get",
	success:function(data){
		console.log(data);
		
	},
	error:function(error){
		alert(AjaxErrorSecurityRedirectHandler(error.status));
	}
	
}); 
});

function printData(dataArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(dataArr);	
	target.html(html);
}




</script>


