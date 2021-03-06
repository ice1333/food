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
		var url ='/res/admin/userDelAjax.do';
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
			var check = confirm("되돌릴 수 없습니다. 상태변경 하시겠습니까?");
			$.ajax({
				url: url,
				type : 'POST',
				traditional:true,
				data : {
					valueArr : valueArr
				},
				success: function(res){
	                  alert("변경 성공입니다.");
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
					<h2>회원 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${userVo.page }/${totPage }페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="w15" />
									<col class="w5" />
									<col class="w5" />
									<col class="w15" />
									<col class="w15" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">회원번호</th>
										<th scope="col">이메일</th> 
										<th scope="col">이름</th> 
										<th scope="col">성별</th> 
										<th scope="col">전화번호</th> 
										<th scope="col">가입일</th> 
										<th scope="col" class="last">상태</th>
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
		                   <%//         	<tr onclick="location.href=view.do?boardno=${vo.boardno}">%>
											<tr>
												<td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${vo.u_no}"/></td>
												<td>${vo.u_no}</td>
												<td class="email">${vo.u_uemail}</td>
												<td>${vo.u_name }</td>
												<td class="last"><c:choose>
				                                    <c:when test="${vo.u_gender == 1}">남자</c:when>
													<c:when test="${vo.u_gender == 2}">여자</c:when>
												</c:choose></td>
												<td>${vo.u_tel }</td>
												<td>${vo.u_regdate }</td>
												<td class="last"><c:choose>
				                                    <c:when test="${vo.u_status == 0}">이용불가</c:when>
													<c:when test="${vo.u_status == 1}">이용가능</c:when>
												</c:choose></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:del();"><strong>상태변경</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
								 ${pageArea }
							<form name="searchForm" id="searchForm" action="userList.do"  method="get">
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="u_uemail">이메일</option>
										<option value="u_status">상태</option>
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