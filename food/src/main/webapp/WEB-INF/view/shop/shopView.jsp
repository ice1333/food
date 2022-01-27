<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml2.jsp" %>
</head>
<script>
	function del3(){
		if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
			url: 'noticedelete.do',
			type: 'get',
			data:{n_no:${data.n_no}},
			success:function(){
				alert('정상적으로 삭제되었습니다.');
				location.href="noticeindex.do";
			}
		}); 
	
		}
	} 	 
	
</script>
<body>
    <div class="wrap">
    
    <%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
        	<div class="sub">
	            <div class="size">
	            	<div class="con_tit">
	                	<h3 class="sub_title">공지사항</h3>
	                </div>
	                <div class="bbs">
					
	                    <div class="view">
	                        <div class="title">
	                            <dl>
	                                <dt>${data.n_title}</dt>
	                                <dd><fmt:formatDate  value="${data.n_regdate}" pattern="yyyy-MM-dd"/></dd>
	                                
	                            </dl>
	                        </div>
	                        <div class="cont"><p>${data.n_content}</p> </div>
	                        <dl class="file">
	                            <dt>첨부파일 </dt>
	                            <dd>
	                            <a href="/res/common/download.jsp?path=/upload/&org=${data.n_fileorg}&real=${data.n_filereal}" 
									target="_blank">${data.n_fileorg } </a></dd>
	                        </dl>
	                       
	                        </div>
	                        <div class="btnSet clear">
	                            <div class="fl_l">
	                          <a href="noticeindex.do" class="btn">목록</a>
	                          <a href="noticeedit.do?n_no=${data.n_no }" class="btn">수정</a>
	                          <a href="javascript:del3();" class="btn">삭제</a>
	                          	</div>
	                        </div>
	                		<div>
	                			
			                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
			                    <input type="hidden" name="tablename" value="notice">
			                    
			                        <table class="board_write">
			                            <colgroup>
			                                <col width="*" />
			                                <col width="100px" />
			                            </colgroup>
			                        </table>
			                        </form>
							
                    		</div>
	                    </div>
	                    
	                </div>
	            </div>
	           
        </div>
    
</body>
</html>