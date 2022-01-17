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
		<script>	
		</script>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
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
									<col class="w6" />
									<col class="w8" />
									<col class="w8" />
									<col class="w*" />
									<col class="w15" />
									<col class="w6" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">회원번호</th>
										<th scope="col">상호번호</th>
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
										<c:forEach var="vo" items="${list}" varStatus="status" >
												<tr>									
													<td class="first"><input type="checkbox" name="checkbox" id="checkbox" value=""/></td>
													<td>${vo.u_no}</td>
													<td>${vo.r_no}</td>
													<td>${vo.u_name }</td>										
													<td>${vo.c_contents }</td>
													<td>${vo.c_regdate}</td>
													<td class="last">${vo.c_stars }</td>
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
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							${pageArea }							
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do"  method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all">전체</option>
										<option value="title">이름</option>
										<option value="contents">댓글내용</option>
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