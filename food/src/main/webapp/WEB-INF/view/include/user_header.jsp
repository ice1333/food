<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<header class="header">
    <a class="mainlogo" href="/res/user/main.do" >
        <img class="mainlogoicon" src="/res/img/user/headerlogo.png" >
    </a>
    <a class="filter">
        <span>
         <img class="headerfilter" src="/res/img/user/filter.jpg">
        </span>
    </a>
    <label class="headersearch">
        <input id="headersearchinput" type="text" class="headersearchinput" placeholder="검색어를 입력해주세요.">
    </label>
    <button class="header_searchbutton"></button> 
    <ul class="headermenulist">
    	<c:if test="${!empty userImfo }"></c:if>
        <li class="menulistheader">
            <a href="/res/user/join.do" class="menulink">
                <span class="menutext">회원가입</span>
            </a>
        </li>
        <li class="menulistheader">
            <a href="/res/user/login.do" class="menulink">
                <span class="menutext">로그인</span>
            </a>
        </li>
        <li class="menulistheader">
            <a href="" class="menulink">
                <span class="menutext">고객센터</span>
            </a>
        </li>
    </ul>
    <ul class="headericonbuttonlist">
        <li class="hedericonbuttonitem only-mobile">
            <button class="menuboutton">
                <img class="menubouttonicon" src="/res/img/user/menubuttonicon2.png">
            </button>
        </li>
        <li class="hedericonbuttonitem only-mobile">
                <button class="menuboutton">
                    <img class="menubouttonicon" src="/res/img/user/menubuttonicon.png">
                </button>     
        </li>
    </ul>
</header>
</body>
</html>