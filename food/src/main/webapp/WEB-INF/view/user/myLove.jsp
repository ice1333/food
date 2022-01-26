<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    
    <link rel="stylesheet" href="/res/css/user/user_restaurant.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/res/css/user/user_hensuMypage.css"/>

<title>Insert title here</title>
</head>
<body>
    <div id="wrap">
       <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
       <!-- canvas -->
       <div id="canvas" style="width: 1200px; top:50px; margin: 15px auto; overflow: hidden; height: 925PX;">
           <!-- S T A R T :: headerArea-->
           <!-- E N D :: headerArea--> 
           <!-- S T A R T :: containerArea-->
           <div id="container">
               <div class="menulist">
                       <h2 class="menu_title">내정보</h2>
                       <div class="inner_sub">
                           <ul id="adlist">
                               <li><a href="">최근 본 맨장</a></li>
                               <li><a href="">찜 목록</a></li>
                               <li><a href="">개인 정보 수정</a></li>
                               <li><a href="">내가 쓴 댓글</a></li>
                           </ul>
                       </div>
               </div>
               <div id="content">
                   <!-- //con_tit -->
                   <div class="con">
                       <div class="con_tit">
                           <h3 class="con_title">찜목록</h3>
                       </div>
                       <!-- 내용 : s -->
                       <div id="bbs">
                           <div id="blist">
                               <form name="frm" id="frm" action="delAjax.do" method="post">
                               <table width="60%" border="0" cellspacing="0" cellpadding="0" summary="">
                                   <colgroup>
                                       <col width="7%"/>
                                       <col width="20%"/>
                                       <col width="*%"/>
                                       <col width="7%"/>
                                   </colgroup>
                                   <thead>
                                       <tr>
                                           <th scope="col">순번</th>
                                           <th scope="col">상호</th>
                                           <th scope="col">상호내용</th>
                                           <th scope="col" class="last">별점</th>
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
                                           <td>1</td>
                                           <td id="blist_img">
                                               <img id="blist_img_size" src="img/section_1.jpg" >
                                            </td>   
                                           <td class="title">상호명 : <br>업태 : </td>
                                           <td class="last">⭐️ 5.0<c:choose>						
                                       </c:choose></td>
                                       </tr>
                                       </c:forEach>
                                   </c:if>
                                   </tbody>
                               </table>
                               </form>
                               <div class="btn">
                                   <div class="btnRight">
                                       <a href="location.href" class="btns" ><strong>삭제</strong> </a>
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
                                           <option value="업소명" <c:if test="${param.searchType == '같'}">selected</c:if>>제목</option>
                                           <option value="업소정보" <c:if test="${param.searchType == '같'}">selected</c:if>>내용</option>
                                           <option value="별점" <c:if test="${param.searchType == '같'}">selected</c:if>>답변대기</option>
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