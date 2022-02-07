<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(document).ready(function(){
	changeIMG();
})
$(function() {
	//$("#a1").val('1');
	$("#f_a1").click(function() {
		if ($("#a1").val() == '0') {
			$("#a1").val('1');
			$(this).attr("src", "/res/img/user/circle2.png");
			$(this).css("height: 80px; width: auto;");
		} else {
			$("#a1").val('0');
			$(this).attr("src", "/res/img/user/circle.png");
		}
	})
	$("#f_a2").click(function() {
			if ($("#a2").val() == '0') {
				$("#a2").attr("value","1");
				$(this).attr("src", "/res/img/user/circle2.png");
				$(this).css("height: 80px; width: auto;");
			} else {
				$("#a2").attr("value","0");
				$(this).attr("src", "/res/img/user/circle.png");
			}
		})
		$("#f_a3").click(function() {
			if ($("#a3").val() == '0') {
				$("#a3").attr("value","1");
				$(this).attr("src", "/res/img/user/circle2.png");
				$(this).css("height: 80px; width: auto;");
			} else {
				$("#a3").attr("value","0");
				$(this).attr("src", "/res/img/user/circle.png");
			}
		})
		$("#f_a4").click(function() {
			if ($("#a4").val() == '0') {
				$("#a4").attr("value","1");
				$(this).attr("src", "/res/img/user/circle2.png");
				$(this).css("height: 80px; width: auto;");
			} else {
				$("#a4").attr("value","0");
				$(this).attr("src", "/res/img/user/circle.png");
			}
		})
		$("#f_f1").click(function() {
			if ($("#f1").val() == '0') {
				$("#f1").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f1").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f2").click(function() {
			if ($("#f2").val() == '0') {
				$("#f2").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f2").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f3").click(function() {
			if ($("#f3").val() == '0') {
				$("#f3").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f3").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f4").click(function() {
			if ($("#f4").val() == '0') {
				$("#f4").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f4").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f5").click(function() {
			if ($("#f5").val() == '0') {
				$("#f5").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f5").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f6").click(function() {
			if ($("#f6").val() == '0') {
				$("#f6").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f6").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f7").click(function() {
			if ($("#f7").val() == '0') {
				$("#f7").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f7").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_f8").click(function() {
			if ($("#f8").val() == '0') {
				$("#f8").attr("value","1");
				$(this).css('border',"2px groove red");
			} else {
				$("#f8").attr("value","0");
				$(this).css("border","none");
			}
		})
		$("#f_p1").click(function() {
			if ($("#p1").val() == '0') {
				$("#p1").attr("value","1");
				$(this).attr("src", "/res/img/user/park2.png");
				$(this).css("height: 80px; width: auto;");
			} else {
				$("#p1").attr("value","0");
				$(this).attr("src", "/res/img/user/park.png");
			}
		})
		$("#f_p2").click(function() {
			if ($("#p2").val() == '0') {
				$("#p2").attr("value","1");
				$(this).attr("src", "/res/img/user/park2.png");
				$(this).css("height: 80px; width: auto;");
			} else {
				$("#p2").attr("value","0");
				$(this).attr("src", "/res/img/user/park.png");
			}
		})
	})
$(function(){
if ('${param.a1}'== '1'){
	$("#f_a1").css('border',"1px solid red");
}
if ('${param.a2}'== '1'){
	$("#f_a2").css('border',"1px solid red");
}
if ('${param.a3}'== '1'){
	$("#f_a3").css('border',"1px solid red");
}
if ('${param.a4}'== '1'){
	$("#f_a4").css('border',"1px solid red");
}
if ('${param.f1}'== '1'){
	$("#f_f1").css('border',"1px solid black");
}
if ('${param.f2}'== '1'){
	$("#f_f2").css('border',"1px solid black");
}
if ('${param.f3}'== '1'){
	$("#f_f3").css('border',"1px solid black");
}
if ('${param.f4}'== '1'){
	$("#f_f4").css('border',"1px solid black");
}
if ('${param.f5}'== '1'){
	$("#f_f5").css('border',"1px solid black");
}
if ('${param.f6}'== '1'){
	$("#f_f6").css('border',"1px solid black");
}
if ('${param.f7}'== '1'){
	$("#f_f7").css('border',"1px solid black");
}
if ('${param.f8}'== '1'){
	$("#f_f8").css('border',"1px solid black");
}
if ('${param.p1}'== '1'){
	$("#f_p1").css('border',"3px solid black");
}
if ('${param.p2}'== '1'){
	$("#f_p2").css('border',"3px solid black");
}


})

	
	
</script>
<script src="/res/js/user_common.js"></script>
<html>
<head>
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
                                    <img id="f_a1" src="/res/img/user/circle.png" style="height: 80px; width: 80px;" >
                                    <p id="price" >만원미만</p>
                                </li>
                                <li class="price_text">
                                    <img id="f_a2" src="/res/img/user/circle.png" style="height: 80px; width: 80px;" >
                                    <p id="price" >1만원대</p>
                                </li>
                                <li class="price_text" >
                                    <img id="f_a3" src="/res/img/user/circle.png" style="height: 80px; width: 80px;" >
                                    <p id="price" >2만원대</p>
                                </li>
                                <li class="price_text" >
                                    <img id="f_a4" src="/res/img/user/circle.png" style="height: 80px; width: 80px;" >
                                    <p id="price" >3만원대</p>
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
                                <li class="food_text" >
                                    <img id="f_f1" src="/res/img/user/icon_1.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text" >
                                   <img  id="f_f2" src="/res/img/user/icon_2.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text" >
                                    <img id="f_f3" src="/res/img/user/icon_3.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text">
                                    <img id="f_f4" src="/res/img/user/icon_4.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text" >
                                    <img id="f_f5" src="/res/img/user/icon_5.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text" >
                                    <img id="f_f6" src="/res/img/user/icon_6.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text">
                                    <img id="f_f7" src="/res/img/user/icon_7.png" style="height: 80px; width: auto;" >
                                </li>
                                <li class="food_text" >
                                    <img id="f_f8" src="/res/img/user/icon_8.png" style="height: 80px; width: auto;" >
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
                                    <img id="f_p1"src="/res/img/user/park.png" style="height: 80px; width: 230px;" >
                                    <p id="park">상관없음</p>
                                </li>
                                <li class="park_text">
                                    <img id="f_p2" src="/res/img/user/park.png" style="height: 80px; width: 230px;" >
                                    <p id="park">가능한 곳만</p>
                                </li>
                            </ul>
                        </div>
                    </div>
					
                </div>
              </div>
            </div>
            <div class="popup-foot">
              <span class="pop-btn close" id="close" href="/res/user/main.do">취소</span>
              <span class="pop-btn confirm" id="confirm" >적용</span>
            </div>
          </div>
      </div>
      </div>
    <div class="headersearch">
        <form name="searchForm" id="searchForm" action="list.do"  method="POST">

        <input type="hidden" name="a1" id="a1" value="0">
        <input type="hidden" name="a2" id="a2" value="0">
        <input type="hidden" name="a3" id="a3" value="0">
        <input type="hidden" name="a4" id="a4" value="0"> 
        <input type="hidden" name="f1" id="f1" value="0">
        <input type="hidden" name="f2" id="f2" value="0">
        <input type="hidden" name="f3" id="f3" value="0">
        <input type="hidden" name="f4" id="f4" value="0">
        <input type="hidden" name="f5" id="f5" value="0">
        <input type="hidden" name="f6" id="f6" value="0">
        <input type="hidden" name="f7" id="f7" value="0">
        <input type="hidden" name="f8" id="f8" value="0">
        <input type="hidden" name="p1" id="p1" value="0">
        <input type="hidden" name="p2" id="p2" value="0">
            <div class="search">
                <select id="stype" name="searchType" title="검색분류 선택">
                    <option value=""<c:if test="${param.searchType == ''}">selected</c:if>>전체</option>
                    <option value="r_name" <c:if test="${param.searchType == 'r_name'}">selected</c:if>>매장이름</option>
                    <option value="r_foodtype" <c:if test="${param.searchType == 'r_foodtype'}">selected</c:if>>음식종류</option>
                </select>
		        <input type="text" id="sval" name="searchWord" value="" placeholder="검색어를 입력해주세요." class="sbtn" alt="검색"/>
		        <input type="image" src="/res/img/admin/btn_search.gif" class="header_searchbutton" alt="검색" title="검색" />
            </div>
         </form>
    </div>
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
	            <a href="/res/user/privacy.do" class="menulink">
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
            <a href="/res/user/noticeindex.do" class="menulink">
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