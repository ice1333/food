<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
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
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>댓글관리게시판 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${commentVo.page }/${totPage }페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w8" />
									<col class="w8" />
									<col class="w*" />
									<col class="w15" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">상호이름</th>
										<th scope="col">작성자</th> 
										<th scope="col">댓글내용</th> 
										<th scope="col">작성일</th> 
										<th scope="col" class="last">별점</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
			                            <tr>
			                                <td class="first" colspan="8">등록된 정보가 없습니다.</td>
			                            </tr>
									</c:if>	
									<c:if test="${!empty list}">
										<c:forEach var="list" items="${list}" varStatus="status" >
												<tr>									
													<td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${list.c_no }"/></td>
													<td>${list.r_name }</td>										
													<td>${list.u_name }</td>																			
													<td><a href="/res/shop/shopmain.do?r_no=${list.r_no }" target="_blank">${list.content }</a></td>
													<td>${list.regdate}</td>
													<td class="last">${list.stars }</td>
												</tr>
										</c:forEach>
									</c:if>									
								</tbody>							
							</table>
							</form>
							<div class="btn">
								<div class="btnRight">
									<a href="javascript:del();" class="btns"><strong>삭제</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->					
							${PageArea }										
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="get">
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