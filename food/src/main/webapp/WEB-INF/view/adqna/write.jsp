<%@ page language="java" 
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/adqna/write.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script src="/res/js/common.js"></script>
<script>
var oEditors;
$(function(){
	oEditors = setEditor("aq_contents");
});
function Save() {
	if($("#aq_title").val()==''){
		alert("제목을 입력해주세요");
		$("#aq_title").focus();
		return;
	}
	oEditors.getById['aq_contents'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#frm").submit();	
}

function getCheckboxValue(event)  {
	  let result = '';
	  if(event.target.checked)  {
	    result = event.target.value;
	  }else {
	    result = '';
	  }
	  
	  document.getElementById('result').innerText
	    = result;
	}

$(document).ready(function() {
 $('input[type="checkbox"][name="checkmain"]').click(function(){
	 console.log($(this).val());
  if($(this).prop('checked')){
     $('input[type="checkbox"][name="checkmain"]').prop('checked',false);
     $(this).prop('checked',true);
     
     
    }
  $("input[type='checkbox'][name='checkmain']").push(this.value);
   });
 }); 
</script>
<html>
<body> 
	
    <div id="wrap">
        <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <div id="canvas" style="width: 1200px; top:50px; margin: 15px auto; overflow: hidden;">
            <div id="container">
                <div class="menulist">
                        <h2 class="menu_title">고객센터</h2>
                        <div class="inner_sub">
                            <ul id="adlist">
                                <li><a href="<%=request.getContextPath()%>/user/noticeindex.do">공지사항</a></li>
                                <li><a href="index.do">광고 문의</a></li>
                            </ul>
                        </div>
                </div>
                <div id="content">
                    <div class="con">
                        <div class="con_tit">
                            <h2 class="con_title">광고 문의</h2>
                            <p class="tit_sub">홈페이지에 광고를 직접 신청하세요.</p>
                        </div>
                        <div id="bbs">
                            <div id="blist">
                                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data" >
                                <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <table class="boardView" width="100%">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th scope="row" style="border:none;">제목</th>
                                                                            <td><input type="text" id="aq_title" name="aq_title" value=""/></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">작성자</th>
                                                                            <td>${userInfo.u_name}</td>
                                                                        </tr>
                                                                        
                                                                        <tr class="etcArea">
                                                                            <td colspan="4">
                                                                                <ul>
                                                                                    <li class="date">
                                                                                        <strong class="th" id='result'></strong>
                                                                                        <span class="td" style="padding:0;">
                                                                                        <p> &nbsp신청 항목의 유형을 하나만 골라주세요.</p>
                                                                                        <input type="checkbox" id="check1" value="[메인]" name="checkmain" onclick="getCheckboxValue(event)" />메인
                                                                                        <input type="checkbox" id="check2" value="[사이드]" name="checkmain" onclick="getCheckboxValue(event)"/>사이드
                                                                                        <input type="checkbox" id="check3" value="[메인과사이드]" name="checkmain" onclick="getCheckboxValue(event)"/>메인,사이드
                                                                                        
                                                                                        </span>
                                                                                    </li>
                                                                                    <li class="file">
                                                                                        <strong class="th">첨부파일</strong>
                                                                                        <span class="td"><input multiple="multiple"type="file" id="file" name="file" title="첨부파일을 올려주세요"/></span>                               	
                                                                                    	
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="eng" style="padding:5px;">
                                                                <textarea id="aq_contents" name="aq_contents" style="width:100%; height:100%"></textarea> 
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="1" bgcolor="#f4f4f4"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                </div>
                                <div class="btn">
                                    <div class="btnRight">
                                        <a href="index.do" class="btns"><strong>목록</strong></a>
                                        <a href="javascript:Save()" class="btns" ><strong>저장</strong> </a>
                                    </div>
                                </div>
                                ${pageArea}
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
    </body>
    </html>