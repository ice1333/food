<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/css/admin/index.css" rel="stylesheet" type="text/css"/>
<html>
<head>
<script>
	$(function(){ //전체선택 
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
		var url ='/res/admin/delAjax.do';
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
				success:function(){
						alert("삭제 성공입니다.");
						location.reload();
				}
			});
	} else {
		location.reload();  
		return false;
	}
}
</script>
<%@include file="/WEB-INF/view/admin/include/headHtml.jsp"%>
</head>
<body> 
<div id="wrap">
	<div id="canvas">
		<%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h3 class="con_title">광고 문의</h3>
				</div>
				<div class="con">
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 ${totCount}개</strong>  ${adQnaVo.page} / ${totPage}</span></p>
							<form name="frm" id="frm" action="delAjax.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col width="2.5%"/>
									<col width="2.5%"/>
									<col width="2.5%"/>
									<col width="5%"/>
									<col width="2.5%"/>
									<col width="20%"/>
									<col width="5%"/>
									<col width="2.5%"/>
									<col width="2.5%"/>
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" /></th>
										<th scope="col">번호</th>
										<th scope="col">분류</th>
										<th scope="col">이메일</th>
										<th scope="col">이름</th>
										<th scope="col">제목</th> 
										<th scope="col">작성일</th> 
										<th scope="col">회원번호</th> 
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
									<tr class="board_tr" data-adqna_no="${vo.adqna_no}" style="cursor:pointer;">
										<td class="first"><input type="checkbox" name="Rchk" id="Rchk" value="${vo.adqna_no}"/></td>
										<td>${vo.adqna_no}</td>
										<td>${vo.checkmain}</td>
										<td>${vo.u_uemail}</td>
										<td>${vo.u_name}</td>   
										<td class="title"><a href="adqnaview.do?adqna_no=${vo.adqna_no}">${vo.aq_title}</a></td>
										<td><fmt:formatDate value="${vo.aq_regdate}" pattern="yyyy-MM-dd"/></td>
										<td>${vo.u_no}</td>
										<td class="last"><c:choose>
										<c:when test="${vo.status == 0}">답변대기</c:when>
										<c:when test="${vo.status >= 1}">답변완료</c:when>
										</c:choose></td>
									</tr>
									</c:forEach>
								</c:if>
								</tbody>
							</table>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a href="javascript:del();" class="btns" ><strong>삭제</strong> </a>
								</div>
							</div>
							${pageArea}
							<form name="searchForm" id="searchForm" action="adqnaindex.do"  method="get">
								<div class="search">
									<select id="stype" name="searchType" title="검색분류 선택">
										<option value="">전체</option>
										<option value="aq_title" <c:if test="${param.searchType == 'aq_title'}">selected</c:if>>제목</option>
										<option value="aq_contents" <c:if test="${param.searchType == 'aq_contents'}">selected</c:if>>내용</option>
									</select>
									<input type="text" id="sval" name="searchWord" value="" title="검색어 입력" />
									<input type="image" src="/res/img/admin/btn_search.gif" class="sbtn" alt="검색" title="검색" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>