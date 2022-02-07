<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
   <link rel="stylesheet" href="/res/css/user/user_hensuMypage.css"/>
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
         var url ='/res/admin/admincommentdelAjax.do';
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
    		} 
    	if(confirm("되돌릴 수 없습니다. 정말 삭제하시겠습니까?")){
    			$.ajax({
    				url: url,
    				type : 'POST',
    				traditional:true,
    				data:{
    					valueArr : valueArr
    				},
    				success:function(res){
    					if(res=1){
    						alert("삭제 성공입니다.");
    						location.reload();
    					} else { 
    						alert("삭제 오류입니다.");
    						location.reload();
    						return false;	
    						
    					}
    				}
    			
    			});
    	} else {
    		location.reload();
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
                                <li><a href="">최근 본 매장</a></li>
                                <li><a href="">찜 목록</a></li>
                                <li><a href="">개인 정보 수정</a></li>
                                <li><a href="/res/user/mypage/myComment">내가 쓴 댓글</a></li>
                            </ul>
                        </div>
                </div>
                <div id="content">
                    <!-- //con_tit -->
                    <div class="con">
                        <div class="con_tit">
                            <h3 class="con_title">내가 쓴 댓글목록</h3>
                        </div>
                        <!-- 내용 : s -->
                        <div id="bbs">
                            <div id="blist">
                               <p><span><strong>총 ${totCount }개</strong>  |  ${commentVo.page }/${totPage }페이지</span></p>
                                <form name="frm" id="frm" action="process.do" method="post">
                                <table width="60%" border="0" cellspacing="0" cellpadding="0" summary="">
                                    <colgroup>
                                       <col width="5%" />
                                        <col width="15%"/>
                                        <col width="40%"/>
                                        <col width="20%"/>
                                        <col width="7%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                        <th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
                                            <th scope="col">상호명</th>
                                            <th scope="col">댓글내용</th>
                                            <th scope="col">작성일</th>
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
                                        <c:forEach var="list" items="${list}" varStatus="status">
                                        <tr class="board_tr" style="cursor:pointer;">
                                           <td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${list.c_no }"/></td>
                                            <td>${list.r_name}</td>   
                                            <td class="title"><a href="/res/shop/shopmain.do?r_no=${list.r_no }">${list.content}</td>
                                            <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
                                            <td class="last">${list.stars}</td>
                                        </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                                </form>
                                <div class="btn">
                                    <div class="btnRight">
                                        <a href="javascript:del();" class="btns" ><strong>삭제</strong> </a>
                                    </div>
                                </div>
                                <!--//btn-->
                                <!-- 페이징 처리 -->
                               ${PageArea }
                                <!-- //페이징 처리 -->
                                <form name="searchForm" id="searchForm" action="myComment.do"  method="get">
                                    <div class="search">
                                        <select  name="searchType" title="검색을 선택해주세요">
											<option value="">전체</option>
											<option value="u_name">작성자</option>
											<option value="content">댓글내용</option>
											<option value="stars">별점</option>
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
</html>