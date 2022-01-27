<%@ page language="java" 
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/adqna/edit.css" rel="stylesheet" type="text/css"/>
<script src="/res/js/common.js"></script>
<link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script>
    
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
var oEditors;
$(function(){
	oEditors = setEditor("aq_contents");
});
function Save() { 
	if($("#aq_title").val()==''){
		alert("제목을 입력하세요");
		$("#aq_title").focus();
		return;
	}
	oEditors.getById['aq_contents'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#frm").submit();	
}

</script>

<body> 
    <div id="wrap">
    	<%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <!-- canvas -->
        <div id="canvas" style="width: 1200px; top:50px; margin: 15px auto; overflow: hidden;">
            <!-- S T A R T :: headerArea-->
            
            <!-- E N D :: headerArea--> 
            <!-- S T A R T :: containerArea-->
            <div id="container">
                <div class="menulist">
                        <h2 class="menu_title">고객센터</h2>
                        <div class="inner_sub">
                            <ul id="adlist">
                                <li><a href="">공지사항</a></li>
                                <li><a href="">찜 목록</a></li>
                                <li><a href="">광고 문의</a></li>
                                <li><a href="">오시는 길</a></li>
                            </ul>
                        </div>
                </div>
                <div id="content">
                    <!-- //con_tit -->
                    <div class="con">
                        <div class="con_tit">
                            <h2 class="con_title">광고 문의</h2>
                            <p class="tit_sub">홈페이지에 광고를 직접 신청하세요.</p>
                        </div>
                        <!-- 내용 : s -->
                        <div id="bbs">
                            <div id="blist">
                                <form method="post" name="frm" id="frm" action="update.do" enctype="multipart/form-data" >
                                <input type="hidden" name="adqna_no" value="${vo.adqna_no}">
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
                                                                            <td><input type="text" id="aq_title" name="aq_title" value="${vo.aq_title }"/></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">작성자</th>
                                                                            <td>${vo.u_name}</td>
                                                                        </tr>
                                                                        <tr class="etcArea">
                                                                            <td id="he" colspan="4">
                                                                                <ul>
                                                                                    <li class="date">
                                                                                        <strong class="th" id='result'></strong>
                                                                                        <span class="td">
                                                                                        <input type="checkbox" value="[메인]" name="checkmain" onclick="getCheckboxValue(event)"/>메인
                                                                                        <input type="checkbox" value="[사이드]" name="checkmain" onclick="getCheckboxValue(event)"/>사이드
                                                                                        <input type="checkbox" value="[메인과사이드]" name="checkmain" onclick="getCheckboxValue(event)"/>메인,사이드
                                                                                        </span>
                                                                                    </li>
                                                                                    <li class="file">
                                                                                        <strong class="th">첨부파일</strong>
                                                                                        <span class="td">
                                                                                            <input type="file" id="file" name="file" title="첨부파일을 올려주세요"/>
                                                                                            <a href="/res/common/download.jsp?path=/upload/&org=${vo.filename_org}&real=${vo.filename_real}" 
																							target="_blank">${vo.filename_org } </a></span></li>
																						<li>
                                                                                            <input type="checkbox" name="delCheck" value="1">기존파일삭제(${vo.filename_org})
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
                                                                <textarea id="aq_contents" name="aq_contents" style="width:100%; height:100%">${vo.aq_contents}</textarea> 
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
                                <!--//btn-->
                                <!-- 페이징 처리 -->
                                ${pageArea}
                                <!-- //페이징 처리 -->
                                <!-- //search --> 
                            </div>
                            <!-- //blist -->
                        </div>
                    </form>
                        <!-- //bbs --> 
                        <!-- 내용 : e -->
                    </div>
                    <!--//con -->
                </div>
                <!--//content -->
            </div>
            <!--//container --> 
            <!-- E N D :: containerArea-->
            <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
        </div>
        <!--//canvas -->
    
    <!--//wrap -->
    
    </body>
    </html>