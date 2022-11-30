<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-date-picker.css" >
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tui-example-style.css" >
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />

<script src="https://unpkg.com/ag-grid-community/dist/ag-grid-community.min.js"></script>

</head>
<body>
<!-- ================================================= -->
<!-- MAIN-CONTENT -->
<!-- ================================================= -->
<div class="container-fluid">
	<!-- ================================================= -->
	<!-- 본문 1 -->
	<!-- ================================================= -->
	<div class="row">


		<!-- ================================================= -->
		<!-- 탭 -->
		<!-- ================================================= -->
		<div class="pills-regular col-xl-12">

			<!-- ================================================= -->
			<!-- 탭LIST 시작 -->
			<!-- ================================================= -->
			<ul class="menuMove nav nav-pills mb-1" id="pills-tab" role="tablist">
				<li class="nav-item"><a class="nav-link"
					id="lecMain-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/main?lecCd=${lecCd }')"
					data-toggle="pill" href="#"
					role="tab" aria-controls="home" aria-selected="true">메인</a></li>
					
				
				<li class="menuMove nav-item"><a class="nav-link"
					id="lecAttend-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/attend/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#"
					role="tab" aria-controls="contact" aria-selected="false">출결관리</a>
				</li>
				<li class="menuMove nav-item"><a class="nav-link active show"
					id="lecMarks-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/marks/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#"
					role="tab" aria-controls="contact" aria-selected="false">성적관리</a>
				</li>
				
				<li class="menuMove nav-item"><a class="nav-link"
					id="lecMaterials-tab"
					onclick="pageMove('<%=request.getContextPath() %>/prof/lec/materials/list.do?lecCd=${lecCd}')"
					data-toggle="pill" href="#"
					role="tab" aria-controls="contact" aria-selected="false">학습자료</a></li>
			</ul>
			<!-- ================================================= -->
			<!-- 탭 LIST 끝 -->
			<!-- ================================================= -->
			
			<!-- ================================================= -->
			<!-- 탭 CONTENT 시작 -->
			<!-- ================================================= -->
<!-- 				 onload="pageChanged()"  -->
<!-- alert(this.contentWindow.location); -->
<!-- 				<iframe id="innerFrame" -->
<%-- 					src="<%=request.getContextPath()%>/prof/lec/index.do"frameborder="0" --%>
<!-- 					scrolling="no" style="border:1px dotted red; overflow-x:hidden; width:100%;height:93%;"></iframe> -->

			<div class="tab-content" id="pills-tabContent">
				<!-- 탭 1 시작 -->
				<div class="tab-pane fade" id="lecMain" role="tabpanel" aria-labelledby="pills-lecMain-tab">
					<p>텍스트1</p>
				</div> 
				<!-- 탭 1 끝 -->
				<!-- 탭 2 시작 -->
				
				<!-- 탭 5 끝 -->
				<!-- 탭 6 시작 -->
				<div class="tab-pane fade" id="lecAttend" role="tabpanel" aria-labelledby="pills-lecAttend-tab">
					<p>텍스트6</p>
				</div>
				<!-- 탭 6 끝 -->
				<!-- 탭 7 시작 -->
				<div class="tab-pane fade active show" id="lecMarks" role="tabpanel" aria-labelledby="pills-lecMarks-tab">
				
					<div id="myGrid" class="ag-theme-alpine" style="height: 500px"></div>
				</div>
			
				<!-- 탭 7 끝 -->
				<!-- 탭 8 시작 -->
				<div class="tab-pane fade" id="lecMaterials" role="tabpanel" aria-labelledby="pills-lecMaterials-tab">
					<p>텍스트8</p>
				</div>
				<!-- 탭 8 끝 -->
				<!-- 탭 9 시작 -->
				<!-- 탭 9 끝 -->
			</div>
			<!-- ================================================= -->
			<!-- 탭 CONTENT 끝 -->
			<!-- ================================================= -->

		</div>
		<!-- ================================================= -->
		<!-- 탭 끝 -->
		<!-- ================================================= -->
	</div>
	<!-- ================================================= -->
	<!-- 본문1 끝 -->
	<!-- ================================================= -->


</div>
<!-- ================================================= -->
<!-- MAIN-CONTENT 끝 -->
<!-- ================================================= -->
<script>
var lecCd ="<%=request.getParameter("lecCd")%>";
console.log("lecCd",lecCd);

class myDropDown {
	  init(params) {
		    this.eGui = document.createElement('div');
		    this.eGui.innerHTML = `
		    <select class="agSel" style="width:100%;height:100%;">
		    <option  value=""></option>
		    <option  value="A+">A+</option>
		    <option  value="A">A</option>
		    <option  value="B+">B+</option>
		    <option  value="B">B</option>
		    <option  value="C+">C+</option>
		    <option  value="C">C</option>
		    <option  value="D+">D+</option>
		    <option  value="D">D</option>
		    <option  value="F">F</option>
		    </select>`;
		    
	
		    this.mySel = this.eGui.querySelectorAll('.agSel');
		    
		    for (var i = 0; i < this.mySel.length; i++) {
		    	
		    	var options = this.mySel[i].children;
		    	
		    	for (var j = 0; j < options.length; j++) {
		    		if (options[j].value == params.data.finalMarks) {
		    			
						options[j].setAttribute("selected","selected");
					}
				}
		    	
		    	this.mySel[i].onchange=function(){
		    		params.data.finalMarks = this.value;
		    		
		    		$.ajax({
		    			method:"post",
		    			url:"<%=request.getContextPath()%>/prof/lec/marks/update",
		    			contentType : "application/json; charset=utf-8",
		    			data : JSON.stringify(params.data),
		    	        dataType:"text",
		    			success:function(){
		    			},
		    			error:function(){
		    				alert("실패");
		    			}
		    		});
		    	}
		    	
		    }
		    
		  }
	  getGui() {
	    return this.eGui;
	  }
	  refresh() {
	    return false;
	  }

}

function totalValueGetter(params) {
	
	var midRatio = params.data.midRatio;
	var finalRatio = params.data.finalRatio;
	var assignRatio = params.data.assignRatio;
	var attendRatio = params.data.attendRatio;
	
	
	
	
	var mid = parseInt(params.getValue('midScore')) * midRatio * 0.01;
	var fin = parseInt(params.getValue('finScore'))  * finalRatio * 0.01;
	var ass = parseInt(params.getValue('assScore')) * assignRatio * 0.01;
	var attend = parseInt(params.getValue('attendScore') * attendRatio * 0.01);
	var result = mid + fin+attend+ass;
	
	params.data.finalScore = result;
	
	  return result;
}

const columnDefs = [
  { headerName:"학번",field: "stuCd" },
  { headerName:"이름",field: "name"},
  { headerName:"중간고사(40)" ,field: "midScore",editable: true },
  { headerName:"기말고사(40)",field: "finScore",editable: true },
  { headerName:"과제점수(10)",field: "assScore" },
  { headerName:"출결점수(10)",field: "attendScore" },
  { headerName:"종합점수",field: "finalScore" ,valueGetter: totalValueGetter},
  { headerName:"종합점수",field: "fianlMarks",cellRenderer:myDropDown }
];

fetch("<%=request.getContextPath()%>/prof/lec/marks/gradeList?lecCd="+lecCd)
.then(response => response.json())
.then(data => { 
	console.log(data);
	gridOptions.api.setColumnDefs(columnDefs);     
	gridOptions.api.setRowData(data);
});

	const gridOptions = {
	        defaultColDef: {
	            sortable:true,
	            filter:true,
	            resizable:true,
	            editable:false,
	            flex: 1
	    },
	    enableCellChangeFlash: true,
	    onCellValueChanged:function(params) {
	    	  if (params.oldValue !== params.newValue) {
	    	      var column = params.column.colDef.field;
// 	    	            params.column.colDef.cellStyle = { 'background-color': 'lightgreen' };
	    	            params.api.refreshCells({
	    	                force: true,
	    	                columns: [column],
	    	                rowNodes: [params.node]
	    	        });
	    	  }
	    	  
	    	  
	    		$.ajax({
	    			method:"post",
	    			url:"<%=request.getContextPath()%>/prof/lec/marks/update",
	    			contentType : "application/json; charset=utf-8",
	    			data : JSON.stringify(params.data),
	    	        dataType:"text",
	    			success:function(){
// 	    				alert("성공");
	    			},
	    			error:function(){
	    				alert("실패");
	    			}
	    		});
	    
	    }
	    
	   
	};
	
	
	document.addEventListener('DOMContentLoaded', () => {
        const gridDiv = document.querySelector('#myGrid');
        new agGrid.Grid(gridDiv, gridOptions);
    }); 

</script>



