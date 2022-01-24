<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
		var url ='/res/admin/noticedelAjax.do';
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
				data:{
					valueArr : valueArr
				},
				success:function(){
					//if(res.trim()=='1'){
						alert("삭제 성공입니다.");
						location.reload();
					//} else {
					//	alert("삭제 오류입니다.");
					//}
				}
			});
		}
	}
	
	$(function(){
		$(".txt_l").click(function(){
			location.href='noticeview.do?n_no='+$(this).data("boardno");
		});
	});
	
	
	
</script>
</head>
<body> 
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>공지사항 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount }개</strong>  |  ${noticeVo.page }/${totpage }페이지</span></p>
							<form name="frm" id="frm" action="delAjax.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w4" />
									<col class="" />
									<col class="w10" />
									<col class="w5" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" /></th>
										<th scope="col">공지번호</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th>  
										<th scope="col" class="last">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
			                            <tr>
			                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
			                            </tr>
									</c:if>	
									<c:if test="${!empty list}">
										<c:forEach var="vo" items="${list}" varStatus="status" >
											<tr>
												<td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${vo.n_no}"/></td>
												<td>${vo.n_no}</td>
												<td class="txt_l"  data-boardno="${vo.n_no }" style="text-align:left; cursor:pointer;" >
													${vo.n_title}
												</td>
												<td><fmt:formatDate value="${vo.n_regdate}" pattern="yyyy-MM-dd"/></td>
												<td >${vo.n_readcount }</td>
											</tr>
										</c:forEach>
									</c:if>
									<!--  <tr>
										<td class="first"><input type="checkbox" name="no" id="no" value=""/></td>
										<td>111</td>
										<td class="title"><a href="view.do">제목입니다.</a></td>
										<td>2020-01-01 11:11:11</td>
										<td>홍길동</td>
										<td class="last">9</td>
									</tr>	
									-->								
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="javascript:del();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="noticewrite.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							
								${PageArea }
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="noticeindex.do"  method="get">
								<div class="search">
									<select name="searchType" title="검색을 선택해주세요">
										<option value="">전체</option>
										<option value="n_title">제목</option>
										<option value="n_content">내용</option>
									</select>
									<input type="text" name="searchWord" value="" title="검색할 내용을 입력해주세요" />
									<input type="image" src="<%=request.getContextPath()%>/img/admin/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
					
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