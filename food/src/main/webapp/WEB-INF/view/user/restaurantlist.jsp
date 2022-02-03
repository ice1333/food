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
    <link rel="stylesheet" href="/res/css/user/user_restaurant.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	
</head>
<body>
<div class="wrap">
        <%@ include file="/WEB-INF/view/include/user_header.jsp" %>

        <div class="container">
            <div class="lcontainer">
                <div class="inner_wrap">
                    <p class="search_title">대학로 맛집 인기 검색순위</p>
                    <div class="search_list_restarants">
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>
                        <div class="restarant">
                            <a                                                                                                                            href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>      
                    </div>
                    <div class="search_list_restarants">
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>      
                    </div>
                    <div class="search_list_restarants">
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>      
                    </div>
                    <div class="search_list_restarants">
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>
                        <div class="restarant">
                            <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
                            <div class="restrant_info">
                                <a href="">
                                    <h3>고치비<h3>
                                </a>
                                <strong class="star">4.6</strong>
                            </div>
                        </div>      
                    </div>
                </div>
            </div>
            <div class="rcontainer">
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
    </div>

        
</body>
</html>