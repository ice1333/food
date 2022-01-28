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
    
    <div class="popupr">
        <div class="modal-btn-box">
        <a id="modal-open"><img class="headerfilter" src="/res/img/user/filter.jpg" style="height:40px;width:40px;display:block;"></a>
        </div>
        
        <div class="popup-wrap" id="popup">
          <div class="popup">
            <div class="popup-head">
                <span class="head-title">
                  검색필터 : 평점순</span>
            </div>

            <div class="popup-body">
              <div class="body-content">
                <div class="body-titlebox">

                    <div class="f_container">
                        <div class="price_wrap">
                            <div class="price_info">
                                <p>가격/1인당</p>
                            </div>
                            <ul class="price_box">
                                <li class="price_text">
                                    <a href=""><img src="/res/img/user/circle.png" style="height: 80px; width: 80px;" ></a>
                                    <p id="price" href="">만원미만</p>
                                </li>
                                <li class="price_text">
                                    <a href=""><img src="/res/img/user/circle.png" style="height: 80px; width: 80px;" ></a>
                                    <p id="price" href="">1만원대</p>
                                </li>
                                <li class="price_text">
                                    <a href=""><img src="/res/img/user/circle.png" style="height: 80px; width: 80px;" ></a>
                                    <p id="price" href="">2만원대</p>
                                </li>
                                <li class="price_text">
                                    <a href=""><img src="/res/img/user/circle.png" style="height: 80px; width: 80px;" ></a>
                                    <p id="price" href="">3만원대</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr>

                    <div class="f_container2">
                        <div class="food_wrap">
                            <div class="food_info">
                                <p>음식종류</p>
                            </div>
                            <ul class="food_box">
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_1.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_2.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_3.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_4.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_5.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_6.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_7.png" style="height: 80px; width: auto;" ></a>
                                </li>
                                <li class="food_text">
                                    <a href=""><img src="/res/img/user/icon_8.png" style="height: 80px; width: auto;" ></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr>

                    <div class="f_container3">
                        <div class="park_wrap">
                            <div class="park_info">
                                <p>주차</p>
                            </div>
                            <ul class="park_box">
                                <li class="park_text">
                                    <a href=""><img src="/res/img/user/park.png" style="height: 80px; width: 230px;" ></a>
                                    <p id="park" href="">상관없음</p>
                                </li>
                                <li class="park_text">
                                    <a href=""><img src="/res/img/user/park.png" style="height: 80px; width: 230px;" ></a>
                                    <p id="park" href="">가능한 곳만</p>
                                </li>
                            </ul>
                        </div>
                    </div>

                </div>
              </div>
            </div>
            <div class="popup-foot">
              <span class="pop-btn close" id="close">취소</span>
              <span class="pop-btn confirm" id="confirm">적용</span>
              
            </div>
          </div>
      </div>
      </div>
    <label class="headersearch">
        <input id="headersearchinput" type="text" class="headersearchinput" placeholder="검색어를 입력해주세요.">
    </label>
    <button class="header_searchbutton"></button> 
    <ul class="headermenulist">
    	<c:if  test="${empty userInfo }">
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
        </c:if>
        <c:if  test="${!empty userInfo }">
        	<li class="menulistheader">
	            <a href="privacy.do" class="menulink">
	                <span class="menutext">마이페이지</span>
	            </a>
	        </li>
	        <li class="menulistheader">
	            <a href="/res/user/logout.do" class="menulink">
	                <span class="menutext">로그아웃</span>
	            </a>
	        </li>
        </c:if>
        <li class="menulistheader">
            <a href="/res/adqna/index.do" class="menulink">
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