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
		var url ='/res/admin/adminDelAjax.do';
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
					<h2>매장등록요청 - [목록]</h2>
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
									<col width="2.5%"/>
									<col width="2.5%"/>
									<col width="6.5%"/>
									<col width="6%"/>
									<col width="15%"/>
									<col width="5%"/>
									<col width="2.5%"/>
									<col width="2.5%"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" /></th>
										<th scope="col">번호</th>
										<th scope="col">이메일</th>
										<th scope="col">제목</th>
										<th scope="col">내용</th> 
										<th scope="col">작성일</th> 
										<th scope="col">작성자</th> 
										<th scope="col" class="last">답변상태</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
			                            <tr>
			                                <td class="first" colspan="8">등록된 글이 없습니다.</td>
			                            </tr>
			                        </c:if>
			                        <c:if test="${!empty list}">
									<c:forEach var="vo" items="${list}" varStatus="status">
									<tr class="board_tr" data-adqna_no="${vo.rqna_no}" style="cursor:pointer;">
										<td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${vo.rqna_no}"/></td>
										<td>${vo.rqna_no}</td>
										<td>${vo.u_uemail}</td>
										<td class="title"><a href="/res/admin/requestView.do?rqna_no=${vo.rqna_no}">${vo.rqna_title}</a></td>
										<td>${vo.rqna_contents}</td>
										<td><fmt:formatDate value="${vo.rqna_regdate}" pattern="yyyy-MM-dd"/></td>
										<td>${vo.u_name}</td>
										<td>${vo.rqna_status}</td>
									</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick=""><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="restWrite.do"><strong>등록</strong> </a><!-- r_stauts를 1로 바꾸는 버튼으로 바꾸기 -->
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