<%@ page language="java" 
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script src="/res/js/user_common.js"></script>
<link href="<%=request.getContextPath()%>/css/adqna/index.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/user/user_common.css" rel="stylesheet" type="text/css"/>


<html>
<head>
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
                                <li><a href="<%=request.getContextPath()%>/user/noticeindex.do">공지사항</a></li>
                                <li><a href="<%=request.getContextPath()%>/adqna/index.do">광고 문의</a></li>
                            </ul>
                        </div>
                </div>
                <div id="content">
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
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">번호</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">작성일</th>
                                            <th scope="col" class="last">조회수</th>
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
                                            <td>${vo.n_no}</td>   
                                            <td class="title"><a href="noticeview.do?n_no=${vo.n_no}">${vo.n_title }</a></td>
                                            <td><fmt:formatDate value="${vo.n_regdate}" pattern="yyyy-MM-dd"/></td>
                                            <td class="last">${vo.n_readcount }</td>                                   
                                        </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                                </form>
                             
                                <!--//btn-->
                                <!-- 페이징 처리 -->
                                ${PageArea}
                                <!-- //페이징 처리 -->
                                <form name="searchForm" id="searchForm" action="noticeindex.do"  method="get">
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="n_title" <c:if test="${param.searchType == 'n_title'}">selected</c:if>>제목</option>
										<option value="n_content" <c:if test="${param.searchType == 'n_content'}">selected</c:if>>내용</option>
									</select>
									<input type="text" name="searchWord" value="" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
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