<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml.jsp" %>
<script>
var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "n_content", // textarea ID
		sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function(){
				
			} 
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
});
function goSave4() {
	if($("#n_title").val()==''){
		alert("제목을 입력하세요");
		$("#n_title").focus();
		return;
	}
	oEditors.getById['n_content'].exec("UPDATE_CONTENTS_FIELD",[]);
	$("#frm").submit();	
}
$(function(){
	$("#frm").ajaxForm({
		url:'noticeupdate.do',
		success:function(res) {
			alert('정상적으로 수정되었습니다.');
			location.href='noticeview.do?n_no=${data.n_no}';
		}
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
		<!-- E N D :: headerArea--> 
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>공지사항 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="noticeupdate.do" enctype="multipart/form-data">
							<input type="hidden" name="n_no" value="${data.n_no }">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="n_title">*제목</label></th>
										<td colspan="10">
											<input type="text" id="n_title" name="n_title" class="w100" title="제목을 입력해주세요" value="${data.n_title }"/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="n_content">*내용</label></th>
										<td colspan="10">
											<textarea id="n_content" name="n_content" title="내용을 입력해주세요" style="width:100%;">${data.n_content }</textarea>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="file">첨부파일</label></th>
										<td colspan="10">
			                            	<input type="checkbox" name="delCheck" value="1">기존파일삭제(${data.n_fileorg })<br>
											<input type="file" id="file" name="file" class="w100" title="첨부파일을 업로드 해주세요." value="${data.n_fileorg }"/>	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write" />
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="noticeindex.do"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" href="javascript:goSave4();"><strong>저장</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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