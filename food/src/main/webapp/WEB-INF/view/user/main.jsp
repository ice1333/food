<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link rel="stylesheet" href="/res/css/user/user_content.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/res/js/user_main.js"></script>
    <script src="/res/js/user_common.js"></script>
	
</head>
<body>
	<div class="wrap">
        <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
        <div class="mainad">
        <div class="visual">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                  <div class="swiper-slide" style="background-image: url('/res/img/user/main12.jpg') ; "></div>
                  <!-- <div class="swiper-slide" style="background-image: url('/res/img/user/main2.jpg'); "></div>
                  <div class="swiper-slide" style="background-image: url('/res/img/user/main3.jpg'); "></div>
                  <div class="swiper-slide" style="background-image: url('/res/img/user/main4.jpg'); "></div> -->
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
        </div>
        
        <div class="container">
            <h2>#메뉴별 인기 맛집</h2>
            <div class="shop">
                <div class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood1.jpg');">
                            <span class="imgtitle">육즙 팡팡 터진다!!</span>
                            <span class="imgtitle2">"둘이가서 싸우고 혼자먹는다."</span>    
                        </div>
                        <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood2.jpg');">
                            <span class="imgtitle">회식이 즐거워지는 고기집</span>
                            <span class="imgtitle2">"부장님옆만 아니면..ㅎㅎ"</span>
                        </div>
                        <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood3.jpg');">
                            <span class="imgtitle">부산사나이들이 인정한 국밥</span>
                            <span class="imgtitle2">"마 국밥 먹어봤나??"</span> 
                        </div>
                        <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood4.jpg');">
                            <span class="imgtitle">점심메뉴 추천 1순위</span>
                            <span class="imgtitle2">"돈까스 ㄱ?"</span> 
                        </div>
                        <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood5.jpg');">
                            <span class="imgtitle">해외여행 안해도 되는맛집</span>
                            <span class="imgtitle2">"먹는순간 언어습득가능"</span>
                        </div> 
                        <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood6.jpg');">
                            <span class="imgtitle">잼민이들이 좋아하는 분식</span>
                            <span class="imgtitle2">"어쩔티비~저쩔티비~꿀맛티비~"</span>  
                        </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>

            <div class="shop">
                <div class="swiper mySwiper2">
                    <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood7.jpg');">
                        <span class="imgtitle">여친이랑 인스타 사진찍자</span>
                        <span class="imgtitle2">"대신 사진찍기전에 먹으면 혼남"</span>  
                    </div>
                    <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood8.jpg');">
                        <span class="imgtitle">바다를 느끼고싶나?</span>
                        <span class="imgtitle2">"먹는 순간 바다향나는곳"</span>  
                    </div>
                    <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood9.jpg');">
                        <span class="imgtitle">집들이 할때 당연히 족보</span>
                        <span class="imgtitle2">"大는 시켜야지 사이드많이가요"</span>  
                    </div>
                    <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood10.jpg');">
                        <span class="imgtitle">빠른배달 맛도2배 중국집</span>
                        <span class="imgtitle2">"제트기 타고 배달하나?"</span>  
                    </div>
                    <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood11.jpg');">
                        <span class="imgtitle">부장님 취향저격 맛집</span>
                        <span class="imgtitle2">"진급전이시면.. 점수따고 최고!!"</span>  
                    </div>
                    <div class="swiper-slide" style="background-image: url('/res/img/user/mainfood12.jpg');">
                        <span class="imgtitle">어른들 모시기 좋은 한정식</span>
                        <span class="imgtitle2">"가격은 어마무시하당..ㅎㄷㄷ"</span>  
                    </div>
                    </div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <hr>

            <div class="container2">
                <div class="inner_wrap">
                    <div class="search_info">
                        <p class="search_title">#남자들이 좋아하는 인기맛집</p>
                    </div>
                    <div class="search_list_restarants">
                        <ul class="list_restarants">
                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_1.jpg" ></a>
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
                                        <a href=""><img src="/res/img/user/man_2.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>정돈<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_3.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>백부장집닭한마리<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_4.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>엄용백돼지국밥<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>

                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_5.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>서울식당<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_6.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>종로족빨<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_7.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>털보네해물탕<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/man_8.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>수제왕돈까스<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <hr>

                <div class="inner_wrap">
                    <div class="search_info">
                        <p class="search_title">#여자들이 좋아하는 인기맛집</p>
                    </div>
                    <div class="search_list_restarants">
                        <ul class="list_restarants">
                            <li class="list_restrants2">
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/woman_1.jpg" ></a>
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
                                        <a href=""><img src="/res/img/user/woman_2.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>미도리스시<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/woman_3.jpg" ></a>
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
                                        <a href=""><img src="/res/img/user/woman_4.jpg" ></a>
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
                                        <a href=""><img src="/res/img/user/woman_5.jpg" ></a>
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
                                        <a href=""><img src="/res/img/user/woman_6.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>한일장<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                                <div class="restrant">
                                    <div class="thumb">
                                        <a href=""><img src="/res/img/user/woman_7.jpg" ></a>
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
                                        <a href=""><img src="/res/img/user/woman_8.jpg" ></a>
                                    </div>
                                    <div class="restrant_info">
                                        <a href="">
                                            <h3>정할머니 기름떡볶이<h3>
                                        </a>
                                        <strong class="star">4.6</strong>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            </div>
            <div class="quickMenu">
                <div><a href="http://jg.tjoeun.co.kr/"><img src="/res/img/user/ad.png"></div></a>
                <div><img src="/res/img/user/quick_05.jpg" style="cursor:pointer; width: 70px;height: auto; margin-left: 19px;" class="goTop"></div>
            </div>
            <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>   
        </div>
</body>
</html>