<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
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
      var url ='/res/admin/restaurantDelAjax.do';
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
         var check = confirm("정말 삭제하시겠습니까?");
         $.ajax({
            url: url,
            type : 'POST',
            traditional:true,
            data : {
               valueArr : valueArr
            },
            success: function(res){
                     alert("삭제 됐습니다.");
                     location.reload();
            }
         });
      }
   }
   function register(){
	      var url ='/res/admin/restRegisterAjax.do';
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
	         var check = confirm("등록하시겠습니까?");
	         $.ajax({
	            url: url,
	            type : 'POST',
	            traditional:true,
	            data : {
	               valueArr : valueArr
	            },
	            success: function(res){
	                     alert("등록 됐습니다.");
	                     location.reload();
	            }
	         });
	      }
	   }
</script>
</head>
<body> 
<div id="wrap">
   <!-- canvas -->
   <div id="canvas">
      <!-- S T A R T :: headerArea-->
      <%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
      <%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
      <!-- E N D :: headerArea--> 
      
      <!-- S T A R T :: containerArea-->
      <div id="container">
         <div id="content">    
            <div class="con_tit">
               <h2>매장관리 - [목록]</h2>
            </div>
            <!-- //con_tit -->
            <div class="con">
               <!-- 내용 : s -->
               <div id="bbs">
                  <div id="blist">
                     <p><span><strong>총 111개</strong>  |  1/12페이지</span></p>
                     <form name="frm" id="frm" action="process.do" method="post">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
                        <colgroup>
                           <col class="w3" />
                           <col class="w4" />
                           <col class="w15" />
                           <col class="" />
                           <col class="w10" />
                           <col class="w10" />
                           <col class="w6" />
                        </colgroup>
                        <thead>
                           <tr>
                              <th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
                              <th scope="col">상호번호</th>
                              <th scope="col">상호명</th>
                              <th scope="col">주소</th>
                              <th scope="col">업태</th> 
                              <th scope="col">작성일</th> 
                              <th scope="col" class="last">상태</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:if test="${empty list}">
                                     <tr>
                                         <td class="first" colspan="7">등록된 글이 없습니다.</td>
                                     </tr>
                                 </c:if>
                                 <c:if test="${!empty list}">
                              <c:forEach var="vo" items="${list}" varStatus="status" >
                         <%//            <tr onclick="location.href=view.do?boardno=${vo.boardno}">%>
                                 <tr>
                                    <td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${vo.r_no}"/></td>
                                    <td>${vo.r_no}</td>
                                    <td class="title"><a href="/res/shop/shopmain.do?r_no=${vo.r_no}">${vo.r_name}</a></td>
                                    <td>${vo.r_address }</td>
                                    <td>${vo.r_foodtype }</td>
                                    <td>${vo.r_regdate}</td>
                                    <td class="last"><c:choose>
                                    <c:when test="${vo.r_status == 0}">대기</c:when>
									<c:when test="${vo.r_status == 1}">등록</c:when>
									<c:when test="${vo.r_status == 2}">삭제</c:when>
									</c:choose></td>
                                 </tr>
                              </c:forEach>
                           </c:if>
                        </tbody>
                     </table>
                     </form>
                     <div class="btn">
                        <div class="btnLeft">
                           <a class="btns" href="javascript:del();"><strong>삭제</strong> </a>
                        </div>
                        <div class="btnRight">
                           <a class="wbtn" href="javascript:register()"><strong>등록</strong> </a><!-- r_stauts를 1로 바꾸는 버튼으로 바꾸기 -->
                        </div>
                     </div>
                     <!--//btn-->
                     <!-- 페이징 처리 -->
                     <div class='page'>
                        <strong>1</strong>
                        <a href="">2</a>
                        <a href="">3</a>
                        <a href="">4</a>
                     </div>
                     <!-- //페이징 처리 -->
                     <form name="searchForm" id="searchForm" action="index.do"  method="post">
                        <div class="search">
                           <select name="stype" title="검색을 선택해주세요">
                              <option value="">전체</option>
                              <option value="r_name">상호명</option>
                              <option value="r_status">상태</option>
                           </select>
                           <input type="text" name="sval" value="" title="검색할 내용을 입력해주세요" />
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
   <!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>