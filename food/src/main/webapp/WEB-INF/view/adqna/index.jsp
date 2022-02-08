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
                            <h3 class="con_title">광고 문의</h3>
                        </div>
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
                                        <tr class="board_tr" data-adqna_no="adqna_no" style="cursor:pointer;">
                                            <td>${vo.adqna_no}</td>   
                                            <td class="title"><a href="view.do?adqna_no=${vo.adqna_no}">${vo.aq_title }</a></td>
                                            <td class="writer">${vo.u_name}</td>
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
                                    <c:if test="${!empty userInfo}">
                                        <a href="write.do" class="btns" ><strong>글작성</strong> </a>
                                    </c:if>
                                    <c:if test="${empty userInfo}">
	                        			<a href="javascript:alert('로그인후 사용가능합니다.');location.href='/res/user/login.do';"><strong>글작성</strong></a>
	                        		</c:if>
                                    </div>
                                </div>
                                ${pageArea}
                                <form name="searchForm" id="searchForm" action="index.do"  method="get">
                                    <div class="search">
                                        <select id="stype" name="searchType" title="검색분류 선택">
                                            <option value="">전체</option>
                                            <option value="aq_title" <c:if test="${param.searchType == 'aq_title'}">selected</c:if>>제목</option>
                                            <option value="aq_contents" <c:if test="${param.searchType == 'aq_contents'}">selected</c:if>>내용</option> 
                                        </select>
                                        <input type="text" id="sval" name="searchWord" value="" title="검색어 입력" />
                                        <input type="image" src="/res/img/admin/btn_search.gif" class="sbtn" alt="검색" title="검색" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
    </div>
    </body>
    </html>