<%@ page language="java" 
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/adqna/view.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>
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

</script>


<body> 
    <div id="wrap">
    <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <!-- canvas -->
        <div id="canvas" style="margin-top:50px; padding:50px 0px 0px 470px;" >
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
                                                                            <td>&nbsp&nbsp&nbsp[맛지게] 맛지게</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row">작성자</th>
                                                                            <td>&nbsp&nbsp&nbsp전창혁</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th scope="row" id='result' style="padding: 10pxpx 2px 10px 2px;"></th>
                                                                            <td><input type="checkbox" value="[메인]" name="checkmain" onclick="getCheckboxValue(event)"/>메인
                                                                                <input type="checkbox" value="[사이드]" name="checkmain" onclick="getCheckboxValue(event)"/>사이드
                                                                                <input type="checkbox" value="[메인과사이드]" name="checkmain" onclick="getCheckboxValue(event)"/>메인,사이드</td>
                                                                        </tr>
                                                                        <tr class="etcArea">
                                                                            <td colspan="2">
                                                                                <ul>
                                                                                    <li class="date">
                                                                                        <strong class="th">작성일</strong>
                                                                                        <span class="td">2022-01-19</span>
                                                                                    </li>
                                                                                    <li class="file">
                                                                                        <strong class="th">첨부파일</strong>
                                                                                        <span class="td"><input type="file" id="file" name="file" title="첨부파일을 올려주세요"/></span>
                                                                                    </li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="eng" style="padding:5px;"></td>
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
                                        <a href="" class="btns"><strong>목록</strong></a>
                                        <a href="" class="btns"><strong>수정</strong></a>
                                        <a href="location.href" class="btns" ><strong>저장</strong> </a>
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
                        <!-- //bbs --> 
                        <!-- 내용 : e -->
                    </div>
                    <!--//con -->
                </div>
                <div>커멘트 에어리어</div>
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