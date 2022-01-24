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
    <link rel="stylesheet" href="/res/css/user/user_restrantlist.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
</head>
<body>
	<div class="wrap">
        <%@ include file="/WEB-INF/view/include/user_header.jsp" %>

        <div class="container">
            <div class="lcontent">
                <div class="inner_wrap">
                    <div class="search_info">
                        <p class="search_title">대학로 맛집 인기 검색순위</p>
                    </div>
                    <div class="search_list_restarants">
                        <ul class="list_restarants">
                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_1.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>고치비<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_2.jpg"></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>미도리스시<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>

                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_3.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>떡사롱<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_4.jpg"></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>석파랑<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>

                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_5.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>스시미치루<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_6.jpg"></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>한일장<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>

                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_7.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>핏제리아오<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/woman_8.jpg"></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>정할머니 기름떡볶이<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>

                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/man_1.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>신승관<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="img/man_2.jpg"></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>정돈<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="pagenate clear">
                        <ul class='paging'>
                            <li><a href='javascript:;' class='current'>1</a></li>
                            <li><a href='javascript:;'>2</a></li>
                            <li><a href='javascript:;'>3</a></li>
                        </ul> 
                    </div>
                </div>
            </div>
            <div class="rcontent">
                <div id="map" style="width:100%;height:500px;"></div>
        		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f81dcca236fa54aec392c000e7b34051"></script>
        		<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(37.57975302245194, 126.97701954006875),
						level: 3
					};

                    var map = new kakao.maps.Map(container, options);
                </script>
            </div>
        </div>

        <%@ include file="/WEB-INF/view/include/user_footer.jsp" %> 
</body>
</html>