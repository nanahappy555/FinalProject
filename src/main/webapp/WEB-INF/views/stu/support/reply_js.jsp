<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="card replyDIV">
	<span class="card-header d-flex justify-content-between align-items-center">
		<span><strong>${share.stuCd }</strong>
			&nbsp;&nbsp;{{prettifyDate cdate}}</span>
		<span>
			<a class="btn btn-rounded btn-outline-primary btn-sm {{shaRno}}-a"
				id="modifyReplyBtn" data-shaRno={{shaRno}}
				onclick="replyModifyModal_go('{{shaRno}}');"
				data-replyer={{stuCd}}
				data-toggle="modal" data-target="#modifyModal">수정</a>&nbsp;
			<a class="btn btn-rounded btn-outline-danger btn-sm"
				onclick="replyRemove_go();">삭제</a>
		</span>
						
	</span>
	<span class="card-body">
		${share.content }
	</span>
</div>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>




<script>

var replyPage=1;

window.onload=function(){
	getPage("<%=request.getContextPath()%>/stu/support/share/replies/${share.shaBno}/"+replyPage);
	$('ul#pagination').on('click','li a',function(event){
		//alert($(this).attr("href"));
		
		replyPage=$(this).attr("href");
		
		getPage("<%=request.getContextPath()%>/stu/support/share/replies/${share.shaBno}/"+replyPage);
		
		return false;
	});
		
}

function getPage(pageInfo,page){
	if(page) replyPage = page;	
	
	$.getJSON(pageInfo,function(data){	  
	
		console.log("댓글",data);
		
		printData(data.replyList,$('.timeline'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}


function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.replyDIV').remove();
	target.after(html);
}
/* pagination */
function printPagination(pageMaker,target,templateObject){
	var pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNumArray[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNumArray;  
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html(html);
}


Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"VisibleByLoginCheck":function(replyer){
		var result="none";		
		if(replyer == "${loginUser.id}") result="visible";		
		return result;						  
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
});


</script>

<script>
function replyRegist_go(){
	//alert("add reply btn click");	

	var replytext=$('#newReplyText').val();
	var shaBno=$('input[name="shaBno"]').val();
	
	if(!replytext){
		alert("내용은 필수입니다.");
		return;
	}
	
	var data={
			"shaBno":shaBno,
			"replyer":"${loginUser.memId}",
			"replytext":replytext	
	}
	
	//console.log(data);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			alert('댓글이 등록되었습니다.\n마지막페이지로 이동합니다.');
			replyPage=data; //페이지이동
			getPage("<%=request.getContextPath()%>/replies/"+shaBno+"/"+data); //리스트 출력
			
			$('#newReplyText').val("");	
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);				
		}
	});
	
}


function replyModifyModal_go(shaRno){	
	//alert("reply modify modal");
	$('div#modifyModal div.modal-body #replytext').val($('div#'+shaRno+'-replytext').text());
	$('div#modifyModal div.modal-header h4.modal-title').text(shaRno);
} 


function replyModify_go(){
	//alert("reply modify btn");
	
	var shaRno=$('.modal-title').text();
	var replytext=$('#replytext').val();
	
	var sendData={
			"shaRno":shaRno,
			"replytext":replytext
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/"+shaRno,
		type:"put",
		data:JSON.stringify(sendData),
		contentType:"application/json",
		headers:{			
			"X-HTTP-Method-Override":"PUT"
		},
		success:function(result){
			
			console.log(result);
			
			alert("수정되었습니다.");	
			getPage("<%=request.getContextPath()%>/replies/${share.shaBno}/"+replyPage);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);	
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}

function replyRemove_go(){
	//alert("reply remove btn");
	
	var shaRno=$('.modal-title').text();
	
	//alert(rno);
	
	$.ajax({
		url:"<%=request.getContextPath()%>/replies/${share.shaBno}/"+shaRno+"/"+replyPage,
		type:"delete",
		headers:{			
			"X-HTTP-Method-Override":"DELETE"
		},
		success:function(page){
			alert("삭제되었습니다.");
			getPage("<%=request.getContextPath()%>/replies/${share.shaBno}/"+page);
			replyPage=page;
		},
		error:function(error){			
			AjaxErrorSecurityRedirectHandler(error.status);	
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}
</script>









