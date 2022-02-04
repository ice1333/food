$(function(){
    //메인광고
    var swiper = new Swiper(".mySwiper", {
        loop:true,
        autoplay : {
            delay:5000
        },
        navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        },
    });
    //메뉴별 인기맛집
    var swiper2 = new Swiper(".mySwiper2", {
        slidesPerView: 3,
        spaceBetween: 30,
        slidesPerGroup: 3,
        loop: true,
        loopFillGroupWithBlank: true,
        pagination: {
        el: ".swiper-pagination",
        clickable: true,
        },
        navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
        },
    });
    // 퀵메뉴
    var quick_left = $(".shop > div:first-child").position().left + 1220;
    var quick_top = $(".shop > div:first-child").position().top - 100;
    //console.log(quick_left);
    $(".quickMenu").css({
        top : quick_top,
        left : quick_left
    });
    // 스크롤이벤트 좌표 변경
    $(window).scroll(function(){
        var newTop = $(window).scrollTop() + quick_top +"px";
        console.log($(window).scrollTop());
        //$(".quickMenu").css("top",newTop);
        $(".quickMenu").stop().animate({
            "top":newTop
        }, 2000);
    });
    // goTop클릭하면 맨위로 이동
    $(".goTop").click(function(){
        $("html").animate({scrollTop:0},300);
    });   
    $(".hover").mouseleave(
    function () {
        $(this).removeClass("hover");
    }
    );
});