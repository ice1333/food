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
    <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link rel="stylesheet" href="/res/css/user/user_restaurant.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/res/css/user/user_hensuMypage.css"/>

<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/view/include/user_header.jsp" %>
    <div class="wrap">
        <div class="container" style="width: 1200px; top:50px; margin: 15px auto; overflow: hidden;">
            <div class="menulist">
                <h2 class="menu_title">마이페이지</h2>
                <div class="inner_sub">
                    <ul id="adlist">
                        <li><a href="">최근 본 매장</a></li>
                        <li><a href="">찜 목록</a></li>
                        <li><a href="">개인 정보 수정</a></li>
                        <li><a href="">내가 쓴 댓글</a></li>
                    </ul>
                </div>
            </div>
            <div class="main">
                <div class="content" >
                    <div class="sub">
                        <div class="size">
                        
                                <div class="type_form member_join">
                                <form name="frm" id="frm" action="insert.do" method="post" enctype="multipart/form-data">
                                <p class="page_sub"><span class="ico">내가 쓴 댓글</span>
                                    <select class="searchType" name="searchType" title="검색을 선택해주세요">
                                        <option value="">전체</option>
                                        <option value="">최근 1달</option>
                                        <option value="">최근 2달</option>
                                        <option value="">최근 3달</option>
                                    </select>
                                </p>
                                    <table class="tbl_comm">
                                        <tbody>
                                            <th class="thead">매장 정보</th>
                                            <th class="thead">댓글 내용</th>
                                            <th class="thead">작성일</th>
                                            <th class="thead">별점</th>
                                            <tr class="commentList">
                                                <td>현수네</td>
                                                <td>맛없어요</td>
                                                <td>2022-01-24</td>
                                                <td>⭐️5</td>
                                            </tr>
                                            <tr class="commentList">
                                                <td>현수네</td>
                                                <td>맛없어요</td>
                                                <td>2022-01-24</td>
                                                <td>⭐️5</td>
                                            </tr>
                                            <tr class="commentList">
                                                <td>현수네</td>
                                                <td>맛없어요</td>
                                                <td>2022-01-24</td>
                                                <td>⭐️5</td>
                                            </tr>
                                            <tr class="commentList">
                                                <td>현수네</td>
                                                <td>맛없어요</td>
                                                <td>2022-01-24</td>
                                                <td>⭐️5</td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    
    <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>      
    
</body>
</html>