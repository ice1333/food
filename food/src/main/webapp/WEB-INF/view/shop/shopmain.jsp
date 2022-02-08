<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="util.MapUtil"%>
<%@ page import="restaurant.RestaurantService"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/res/css/user/user_common.css" />
<link rel="stylesheet" href="/res/css/user/user_restaurant.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/res/css/shop/shopmain.css" />
</head>
<script>
function goSave(){
	$.ajax({
		url:'/res/comment/restinsert.do',
		type:'get',
		data:$("#frm").serialize(), // serialize() 값을 넣어준다
		success:function(){
				alert("댓글 작성 완료"); //댓글이 등록되었을때
				$("#content").val("");
				commentList('restaurant',${data.r_no});
		}
	})
}
	function commentList(tablename, r_no, u_no){
		$.ajax({
			url:'/res/comment/restlist.do',
			data:{tablename:tablename, r_no:r_no , u_no:u_no},
				success:function(res) {
					$("#commentArea").html(res);
				}
			})
		}
	$(function(){ //페이지가 열리자마자
		commentList('restaurant',${data.r_no});
	})
	function goDel(c_no){
		if(confirm('댓글을 삭제하시겠습니까?')){
			$.ajax({
				url:"/res/comment/restdelete.do",
				data:{c_no:c_no},
				success:function(res){
					if(res.trim()=='1'){
						alert('정상적으로 삭제되었습니다.');
						commentList('restaurant', ${data.r_no});
					} else {
						alert('삭제 오류입니다. 확인하세요');
					}
				}
			})
		}
	}
	function wishInsert(){
		$.ajax({
			url:'/res/shop/shopmain/wishlistInsert.do',
			type:'get',
			data:$("#withInsert").serialize(), // serialize() 값을 넣어준다
			success:function(){
					alert("좋아요 완료"); //댓글이 등록되었을때
					location.reload();
					
			}
		})
	}
	function wishDel(){
		$.ajax({
			url:'/res/shop/shopmain/wishlistDel.do',
			type:'get',
			data:$("#wishDel").serialize(), // serialize() 값을 넣어준다
			success:function(){
					alert("좋아요 취소"); //댓글이 등록되었을때
					location.reload();
					
			}
		})
	}

</script>
<body>
<div id="wrap">
       <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
   <main>
      <div class="mainimg">
        <div><img class="mainimg_size" src="/res/upload/${data.r_filename_real }"></div>
        <div><img class="mainimg_size" src="/res/upload/${data.r_filename_real1 }"></div>
        <div><img class="mainimg_size" src="/res/upload/${data.r_filename_real2 }"></div>
      </div>
      <div class="no1">
        <div class="no1__left">
          <div class="table__head">
            <h2>${data.r_name}</h2>
            <c:if test="${data.r_status==0 }">
				<div><h1 style="text-align: center; padding: "></h1></div>
			</c:if>
            <c:if test="${!empty userInfo and listcount == 0}">
			<div class="btnSet"  style="text-align:right;">
				<form action="" id="withInsert">
					<input type="hidden" name="r_no" value="${data.r_no}">
                       <a class="btn" href="javascript:wishInsert();">찜하기 </a>
                      </form>
                  </div>
                  </c:if>
			<c:if test="${!empty userInfo and listcount ==1}">
			<div class="btnSet"  style="text-align:right;">
				<form action="" id="wishDel">
					<input type="hidden" name="r_no" value="${data.r_no}">
                       <a class="btn" href="javascript:wishDel();">찜취소 </a>
                      </form>
                  </div>
                  </c:if>
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
               <%-- <c:if test="${empty list}">
=======
	<input type="hidden" name="r_no" value="${data.r_no }">
	<div id="wrap">
		<%@ include file="/WEB-INF/view/include/user_header.jsp"%>
		<main>
			<div class="mainimg">
				<div>
					<img class="mainimg_size"
						src="/res/upload/${data.r_filename_real }">
				</div>
				<div>
					<img class="mainimg_size"
						src="/res/upload/${data.r_filename_real1 }">
				</div>
				<div>
					<img class="mainimg_size"
						src="/res/upload/${data.r_filename_real2 }">
				</div>
			</div>
			<div class="no1">
				<div class="no1__left">
					<div class="table__head">
						<h2>${data.r_name}</h2>
						<c:if test="${data.r_status==0 }">
							<div>
								<h1 style="text-align: center; padding:"></h1>
							</div>
						</c:if>
						<c:if test="${!empty userInfo and listcount == 0}">
						<div class="btnSet"  style="text-align:right;">
							<form action="" id="withInsert">
								<input type="hidden" name="r_no" value="${data.r_no}">
		                        <a class="btn" href="javascript:wishInsert();">찜하기 </a>
	                        </form>
	                    </div>
	                    </c:if>
	                    
						<c:if test="${!empty userInfo and listcount ==1}">
						<div class="btnSet"  style="text-align:right;">
							<form action="" id="wishDel">
								<input type="hidden" name="r_no" value="${data.r_no}">
		                        <a class="btn" href="javascript:wishDel();">찜취소 </a>
	                        </form>
	                    </div>
	                    </c:if>
					</div>
					<table class="table__top">
						<colgroup>
							<col style="width: 150px" />
							<col />
							<col style="width: 380px" />
						</colgroup>
						<thead>
							<tr>조회수 찜횟수 별점
							</tr>
						</thead>
						<tbody>
							<%-- <c:if test="${empty list}">
>>>>>>> branch 'master' of https://github.com/ice1333/food.git
                                     <tr>
                                         <td class="first" colspan="8">등록된 정보가 없습니다.</td>
                                     </tr>
                                 </c:if>
               <c:if test="${!empty list}">
                  <c:forEach var="vo" items="${list}" varStatus="status">--%>
                    <tr>
                      <th>주소</th>
                      <td>${data.r_address} ${data.r_address2}</td>
                    </tr>
                    <tr>
                      <th>전화번호</th>
                      <td>${data.r_tel}</td>
                    </tr>
                    <tr>
                      <th>음식 종류</th>
                      <td>${data.r_foodtype}</td>
                    </tr>
                    <tr>
                      <th>가격대</th>
                      <td>${data.r_price}</td>
                    </tr>
                    <tr>
                      <th>영업시간</th>
                      <td>${data.r_week}</td>
                    </tr>
                    <tr>
                      <th>쉬는시간</th>
                      <td>${data.r_breaktime}</td>
                    </tr>
                    <tr>
                      <th>휴무일</th>
                      <td>${data.r_holiday}</td>
                    </tr>
                    <tr>
                      <th>주차공간</th>
					  <td class="last"><c:choose>
					  <c:when test="${data.r_parking == 0}">주차불가</c:when>
					  <c:when test="${data.r_parking >= 1}">주차가능</c:when>
					  </c:choose></td>
                    </tr>
                    <tr>
                      <th>메뉴</th>
                      <td>${data.r_menu}</td>
                    </tr>
<<<<<<< HEAD
                  <%-- 
=======
							<tr>
								<th>주소</th>
								<td>${data.r_address},${data.r_address2}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${data.r_tel}</td>
							</tr>
							<tr>
								<th>음식 종류</th>
								<td>${data.r_foodtype}</td>
							</tr>
							<tr>
								<th>가격대</th>
								<td>${data.r_price}</td>
							</tr>
							<tr>
								<th>영업시간</th>
								<td>${data.r_week}</td>
							</tr>
							<tr>
								<th>쉬는시간</th>
								<td>${data.r_breaktime}</td>
							</tr>
							<tr>
								<th>휴무일</th>
								<td>${data.r_holiday}</td>
							</tr>
							<tr>
								<th>주차공간</th>
								<td class="last"><c:choose>
										<c:when test="${data.r_parking == 0}">주차불가</c:when>
										<c:when test="${data.r_parking >= 1}">주차가능</c:when>
									</c:choose></td>
							</tr>
							<tr>
								<th>메뉴</th>
								<td>${data.r_menu}</td>
							</tr>
							<%-- 
>>>>>>> branch 'master' of https://github.com/ice1333/food.git
                  </c:forEach>
                     </c:if>
                     --%>
						</tbody>
=======
				</tbody>
>>>>>>> branch 'master' of https://github.com/ice1333/food.git

					</table>
					<div class="btn">
						<a class="btn1" href="join.do" style="float: right;"><strong>문의
								하기</strong></a>
					</div>

				</div>
				<div class="no1__right">
					${MapUtil.getMap(data.r_address,data.r_name) }</div>
			</div>
			<div class="no2">
				<br>
				<div id="commentArea"></div>
			</div>
			<c:if test="${!empty userInfo}">
			<div class="text">
				<form action="" id="frm">
					<tr>
						<td>
							<input type="hidden" name="r_no" value="${data.r_no}">
							<input type="hidden" name="tablename" value="restaurant">
							<textarea name="content" id="content"></textarea> <select
							name="stars" id="stars">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
						</select></td>
						<td>
							<div class="btnSet" style="text-align: right;">
								<a class="btn" href="javascript:goSave();">저장 </a>
							</div>
						</td>
					</tr>
				</form>
			</div>
			</c:if>
		</main>

		<%@ include file="/WEB-INF/view/include/user_footer.jsp"%>
		<!--//canvas -->
	</div>
</body>

</html>