<%@ page language="java" 
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/adqna/index.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>


<html>
<head>
<body> 
    <div id="wrap">
    	<%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <!-- canvas -->
        <div id="canvas" style="margin-top:50px; padding:50px 0px 0px 0px;" >
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
                            <h3 class="con_title">광고 문의</h3>
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
                                            <td>${vo.adqna_no}</td>   
                                            <td class="title"><a href="adqnaview.do?adqna_no=${vo.adqna_no}">${vo.aq_title }</a></td>
                                            <td class="writer">${vo.u_name }</td>
                                            <td><fmt:formatDate value="${vo.aq_regdate}" pattern="yyyy-MM-dd"/></td>
                                            <td class="last"><c:choose>
										<c:when test="${vo.status == 0}">답변대기</c:when>
										<c:when test="${vo.status >= 1}">답변완료</c:when>
										</c:choose></td>
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
                                            <option value="제목" <c:if test="${param.searchType == '같'}">selected</c:if>>제목</option>
                                            <option value="내용" <c:if test="${param.searchType == '같'}">selected</c:if>>내용</option>
                                            <option value="답변대기" <c:if test="${param.searchType == '같'}">selected</c:if>>답변대기</option>
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
                <!--//content -->
            </div>
            <!--//container --> 
            <!-- E N D :: containerArea-->
        </div>
        <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
        <!--//canvas -->
    </div>
    <!--//wrap -->
    
    </body>
    </html>