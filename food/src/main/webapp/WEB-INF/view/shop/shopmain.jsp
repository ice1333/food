<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/res/css/user/user_common.css"/>
    <link rel="stylesheet" href="/res/css/user/user_restaurant.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="/res/css/shop/shopmain.css"/>

</head>
<body>
<div id="wrap">
    	<%@ include file="/WEB-INF/view/include/user_header.jsp" %>
	<main>
      <div class="mainimg">
        <div><img class="mainimg_size" src="img/woman_1.jpg"></div>
        <div><img class="mainimg_size" src="img/woman_2.jpg"></div>
        <div><img class="mainimg_size" src="img/woman_3.jpg"></div>
        <div><img class="mainimg_size" src="img/woman_4.jpg"></div>
      </div>
      <div class="no1">
        <div class="no1__left">
          <div class="table__head">
            <h2>음식점명</h2>
            <button>찜하기</button>
          </div>
          <table class="table__top">
            <colgroup>
              <col style="width: 150px" />
              <col />
              <col style="width: 380px" />
            </colgroup>
            <thead>
              <tr>
                조회수 찜횟수 별점
              </tr>
            </thead>
            <tbody >
              <tr>
                <th>주소</th>
                <td>서울시 강서구 등촌2동</td>
              </tr>
              <tr>
                <th>전화번호</th>
                <td>02-1234-5678</td>
              </tr>
              <tr>
                <th>음식 종류</th>
                <td>포차</td>
              </tr>
              <tr>
                <th>가격대</th>
                <td>15000원</td>
              </tr>
              <tr>
                <th>영업시간</th>
                <td>17:00~22:00</td>
              </tr>
              <tr>
                <th>쉬는시간</th>
                <td>없음</td>
              </tr>
              <tr>
                <th>휴무일</th>
                <td>없음</td>
              </tr>
              <tr>
                <th>주차공간</th>
                <td>무료주차</td>
              </tr>
              <tr>
                <th>메뉴</th>
                <td>ddd</td>
              </tr>
            </tbody>
          </table>
          <button class="fix" style="float: right;">수정/문의 하기</button>
        </div>
        <div class="no1__right">
          <img src="img/map.png" style="width: 321px;">
        </div>
      </div>

      <div class="no2">
        <div class="review">
          <table class="table__under">
            <colgroup>
              <col style="width: 100px" />
              <col style="width: 100px" />
              <col style="width: 650px" />
              <col style="width: 200px" />
              <col style="width: 100px" />
              <col style="width: 50px"/>
            </colgroup>
            <thead>
              <tr>
                <th rowspan="3">번호</th>
                <th rowspan="3">이름</th>
                <th>내용</th>
                <th>작성일</th>
                <th>별점</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>a</td>
                <td>f</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td><button>삭제</button></td>
              </tr>
              <tr>
                <td>1</td>
                <td>1</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td><button>삭제</button></td>
              </tr>
              <tr>
                <td>s</td>
                <td>s</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="pagination">
        <div class="pagination">
          <button><</button>
          <button>1</button>
          <button>2</button>
          <button>3</button>
          <button>4</button>
          <button>></button>
        </div>
      </div>
      <div class="underline"></div>
      <div class="text">
        <textarea
          name=""
          id=""
          cols="30"
          rows="10"
          placeholder="내용을 입력하세요"
          style="width: 1055px; height: 165px;"
        ></textarea>
        <select id="con_searchlist" name="searchType" title="검색을 선택해주세요">
          <option value="">별점</option>
          <option value="">5점</option>
          <option value="">4점</option>
          <option value="">3점</option>
          <option value="">2점</option>
          <option value="">1점</option>
</select>
        <button>입력</button>
      </div>
    </main>
  <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
     <!--//canvas -->
 </div>
</body>
</html>