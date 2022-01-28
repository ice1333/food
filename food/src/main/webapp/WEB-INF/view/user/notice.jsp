<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link rel="stylesheet" href="/res/css/user/user_notice.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/res/js/user/user_main.js"></script>
	
</head>
<body>
<div class="wrap">
        <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <div class="container">
            <div class="lcontainer">
                <div class="l_list">
                    <p class="notice_title">공지사항</p>
                    <ul>
                        <li ><a href="notice.do" id="notice_a">&nbsp 공지사항</a></li>
                        <li ><a href="" id="notice_a">&nbsp 광고문의</a></li>
                    </ul>
                </div>
            </div>

            <div class="rcontainer">
                <!-- //con_tit -->
                <div class="con">
                    <div class="con_tit">
                        <h3 class="con_title">공지사항</h3>
                    </div>
                    <!-- 내용 : s -->
                    <div id="bbs">
                        <div id="blist">
                            <form name="frm" id="frm" action="delAjax.do" method="post">
                            <table width="60%" border="0" cellspacing="0" cellpadding="0" summary="">
                                <colgroup>
                                    <col width="10%"/>
                                    <col width="40%"/>
                                    <col width="7%"/>
                                    <col width="7%"/>
                                    <col width="7%"/>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col" class="last">상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td class="first" colspan="8">등록된 글이 없습니다.</td>
                                    </tr>
                                </c:if>
                                <c:if test="${!empty list}">
                                    <c:forEach var="vo" items="${list}" varStatus="status">
                                    <tr class="board_tr" data-adqna_no="" style="cursor:pointer;">
                                        <td></td>   
                                        <td class="title"><a href="adqnaview.do?adqna_no=${vo.adqna_no}"></a></td>
                                        <td class="writer"></td>
                                        <td><fmt:formatDate value="" pattern="yyyy-MM-dd"/></td>
                                        <td class="last"></td>
                                    </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                            </form>
                            <div class="btn">
                                <div class="btnRight">
                                    <a href="location.href" class="btns" ><strong>글작성</strong> </a>
                                </div>
                            </div>
                            <!--//btn-->
                            <!-- 페이징 처리 -->
                            ${pageArea}
                            <!-- //페이징 처리 -->
                            <form name="searchForm" id="searchForm" action="adqnaindex.do"  method="get">
                                <div class="search">
                                    <select id="stype" name="searchType" title="검색분류 선택">
                                        <option value="">전체</option>
                                        <option value="같은값" <c:if test="${param.searchType == '같'}">selected</c:if>>제목</option>
                                        <option value="같은값" <c:if test="${param.searchType == '같'}">selected</c:if>>내용</option>
                                    </select>
                                    <input type="text" id="sval" name="searchWord" value="" title="검색어 입력" />
                                    <input type="image" src="/res/img/admin/btn_search.gif" class="sbtn" alt="검색" title="검색" />
                                </div>
                            </form>
                            <!-- //search --> 
                        </div>
                        <!-- //blist -->
                    </div>
                    <!-- //bbs --> 
                    <!-- 내용 : e -->
                </div>
                <!--//con -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>  
</body>
</html>