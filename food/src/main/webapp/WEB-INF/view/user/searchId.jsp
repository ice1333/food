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
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link rel="stylesheet" href="/res/css/user/user_login.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/view/include/user_header.jsp" %>
	<div class="sub">
	    <div class="size">
	        <h3 class="sub_title">이메일 찾기</h3>
	        
	        <div class="member">
	            <div class="box">
	                <fieldset class="login_form">
	                    <ul>
	                        <li><input type="text" id="name" name="name" placeholder="이름"></li>
	                        <li><input type="text" id="tel" name="tel" placeholder="전화번호"></li>
	                    </ul>
	                    <div class="login_btn"><input type="submit" value="이메일찾기" alt="이메일찾기" /></div>
	                </fieldset>
	                <div class="btnSet clear">
	                    <div>
	                        <a href="searchid.do" class="btn">이메일 찾기</a> 
	                        <a href="searchpwd.do" class="btn">비밀번호 찾기</a>
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