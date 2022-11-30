<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 

 
<div id="contAreaBox">
    <form name="inputForm" method="post" onsubmit="return _onSubmit();" action="<%=request.getContextPath() %>/staff/stumanage/user/regist"   enctype="multipart/form-data" class="form-horizontal">
        <div class="panel">
            <div class="panel-body">
            <h4 class="mt0"><i class="fa fa-cube" aria-hidden="true"></i>사용자등록</h4>
                <div class="table-responsive">
                <p> 양식파일을 다운로드 하시고 파일내에 있는 모든 항목들을 채워서 업로드하셔야 정상적으로 등록됩니다.</p>
                <table id="datatable-scroller" class="table table-bordered tbl_Form">
                        <caption>신청자 업로드</caption>
                        <colgroup>
                            <col width="250px" />
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="active" style="text-align:right"><label class="control-label" for="">파일 업로드</label></th>
                                <td>
                                    <input type="file" name="file" id="file" accept=".xlsx, .xls"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="pull-right">
            <input type="submit" value="엑셀파일 업로드" class="btn btn btn-primary btn-lg" />
            <a href="<%=request.getContextPath() %> /document/userRegist.xlsx" class="btn btn btn-primary btn-lg">양식파일 다운로드</a>
        </div>
    </form>
</div>


<script type="text/javascript">
    
    $(document).ready(function() {
      var msg = "${resMap.msg}";
        if(msg != "") alert(msg);
    });
    
    function _onSubmit(){
        
        if($("#file").val() == ""){
            alert("파일을 업로드해주세요.");
            $("#file").focus();
            return false;
        }
        
        if(!confirm(gTxt("confirm.save"))){
            return false;
        }
        
        return true;
    }
    
</script>