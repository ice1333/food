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
<link rel="stylesheet" href="/res/css/user/user_hensuMypage.css"/>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	$(function(){ //전체선택 Rchk
		var chk = document.getElementsByName("Rchk");
		var row = chk.length;
		$("input[name='allChk']").click(function(){ 
			var c = $("input[name='Rchk']");
			for (var i=0; i<c.length; i++){
				c[i].checked = this.checked;
			}
		});
		$("input[name='Rchk']").click(function(){
			if($("input[name='Rchk']:checked").length == row) {
				$("input[name='allChk']")[0].checked = true;
			} else {
				$("input[name='allChk']")[0].checked = false;
			}
		});
	});
	
	function del(){
		var url ='/res/user/mypage/listDelAjax.do';
		var valueArr = new Array();
		var list= $("input[name='Rchk']");
		for(var i=0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
				console.log(list[i].value)
			}
		}
		if (valueArr.length==0){
			alert('하나 이상 선택하세요.')
			} else {
				var check = confirm("되돌릴 수 없습니다. 정말 삭제하시겠습니까?");
				$.ajax({
					url: url,
					type : 'POST',
					traditional:true,
					data : {
						valueArr : valueArr
					},
					success: function(res){
		                  alert("삭제 성공입니다.");
		                  location.reload();
					}
				});
			}
	}
	
	
</script>
<title>Insert title here</title>
</head>
<body>
    <div id="wrap">
       <%@ include file="/WEB-INF/view/include/user_header.jsp" %>
       <!-- canvas -->
       <div id="canvas" style="width: 1200px; top:50px; margin: 15px auto; overflow: hidden; height: 925PX;">
           <!-- S T A R T :: headerArea-->
           <!-- E N D :: headerArea--> 
           <!-- S T A R T :: containerArea-->
           <div id="container">
               <div class="menulist">
                       <h2 class="menu_title">내정보</h2>
                       <div class="inner_sub">
                           <ul id="adlist">
                                <li><a href="/res/user/mypage/mylist.do">최근 본 매장</a></li>
		                        <li><a href="/res/user/mypage/myLove.do">찜 목록</a></li>
		                        <li><a href="/res/user/privacy.do">개인 정보 수정</a></li>
		                        <li><a href="/res/user/mypage/myComment">내가 쓴 댓글</a></li>
		                        <li><a href="/res/shop/join.do">매장등록</a></li>
                           </ul>
                       </div>
               </div>
               <div id="content">
                   <!-- //con_tit -->
                   <div class="con">
                       <div class="con_tit">
                           <h3 class="con_title">최근 본 매장</h3>
                       </div>
                       <select id="con_searchlist" name="visit" >
                                        <option value="">전체</option>
                                        <option value="1">최근 1달</option>
                                        <option value="2">최근 2달</option>
                                        <option value="3">최근 3달</option>
                       </select>
                       <!-- 내용 : s -->
                       <div id="bbs">
                           <div id="blist">
                               <form name="frm" id="frm" action="delAjax.do" method="post">
                               <table width="60%" border="0" cellspacing="0" cellpadding="0" summary="">
                                   <colgroup>
                                   	   <col class="w1"/>
                                       <col width="w1"/>
                                       <col width="w5"/>
                                       <col width="w5"/>
                                       <col width="w3"/>
                                   </colgroup>
                                   <thead>
                                       <tr>
                                       	   <th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
                                           <th scope="col">순번</th>
                                           <th scope="col">상호</th>
                                           <th scope="col">상호내용</th>
                                           <th scope="col" class="last">별점</th>
                                       </tr>
                                   </thead>
                                   <tbody>
                                   <c:if test="${empty list}">
                                       <tr>
                                           <td class="first" colspan="8">등록된 글이 없습니다.</td>
                                       </tr>
                                   </c:if>
                                   <c:if test="${!empty list}">
                                         <c:forEach var="vo" items="${list}" varStatus="status" > 
                                          <tr class="board_tr" data-adqna_no="" style="cursor:pointer;">
                                                <td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${vo.r_no }"/></td>
                                              <td>${(totCount-status.index)-((visitVo.page-1)*5) }</td>
                                              <td id="blist_img" style="width: 100px; height: 100px">
                                                  <img style="width: 100%; height: 100%" src="/res/upload/${vo.r_filename_real}">
                                               </td>         
                                              <td class="title" style="text-align: center;">상호명 : ${vo.r_name } <br>업태 : ${vo.r_foodtype } </td>
                                              <td class="last">️${vo.r_stars }</td>                  
                                          </tr>
                                       </c:forEach>
                                   </c:if>
                                   </tbody>
                               </table>
                               </form>
                                 ${pageArea}
                               <div class="btn">
                                   <div class="btnRight">
                                       <a href="javascript:del();" class="btns" ><strong>삭제</strong> </a>
                                   </div>
                               </div>
                               
                               
                               <form name="searchForm" id="searchForm" action="mylist.do"  method="get">
									<div class="search">
										<select name="searchType" title="검색을 선택해주세요">
											<option value="">전체</option>
											<option value="t.r_name">상호명</option>
											<option value="t.r_foodtype">업태명</option>
										</select>
										<input type="text" name="searchWord" value="" title="검색할 내용을 입력해주세요" />
										<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
									</div>
								</form>
                               <!-- //search --> 
                           </div>
                           <!-- //blist -->
                       </div>
                       <!-- //bbs --> 
                       <!-- 내용 : e -->
                   </div>
                   <!--//con -->
               </div>
               <!--//content -->
           </div>
           <!--//container --> 
           <!-- E N D :: containerArea-->
       </div>
       <%@ include file="/WEB-INF/view/include/user_footer.jsp" %>
       <!--//canvas -->
   </div>
   <!--//wrap -->   
</body>
<style type="text/css">
.pagenate {width:100%; clear:both;}
.pagenate {text-align:center; margin:20px auto 0;}
.pagenate li {display:inline-block;}
.pagenate li:first-child { margin-left:0px; }
.pagenate li a{display:inline-block; text-decoration:none; padding:0; width:30px; height:30px; line-height:30px; border:1px solid #c7c8cc; box-sizing:border-box; margin-left:-1px; vertical-align:middle;}
.pagenate li a:hover{background:#f6f6f6; font-weight:bold; text-decoration:none !important;}
.pagenate li a.board { text-indent:-9999em; margin-left:4px; }
.pagenate li a.board.first {background:#f3f3f3 url('/img/ico_first.png') no-repeat center center;}
.pagenate li a.board.prev {margin-right:30px; background:#efefef url('/img/ico_prev.png') no-repeat center center;}
.pagenate li a.board.next {margin-left:30px; background:#efefef url('/img/ico_next.png') no-repeat center center;}
.pagenate li a.board.last {background:#f3f3f3 url('/img/ico_last.png') no-repeat center center;}
.pagenate li a.current {color:#fff; background-color:#221f1f; font-weight:bold;  border:1px solid #221f1f;}
</style>
</html>