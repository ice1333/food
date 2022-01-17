<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/admin/include/headHtml2.jsp" %>
</head>
<script>
	function del2(){
		if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
			url: 'delete.do',
			type: 'get',
			data:{adqna_no:${vo.adqna_no}},
			success:function(){
				alert('정상적으로 삭제되었습니다.');
				location.href="adqnaindex.do";
			}
		});
	
		}
	} 	 
	
	 function goSave(){
		$.ajax({
			url:'/ad/comment/adqcominsert.do',
			type:'get',
			data:$("#frm").serialize(), // serialize() 값을 넣어준다
			success:function(){
					alert("답변이 완료되었습니다."); //댓글이 등록되었을때
					$("#content").val("");
					commentList('adqna',${vo.adqna_no});
			
			}
		})
	}
	function commentList(tablename, adqna_no){
	$.ajax({
		url:'/ad/comment/adqlist.do',
		data:{tablename:tablename, adqna_no:adqna_no},
			success:function(res) {
				$("#commentArea").html(res);
			}
		})
	}
	$(function(){ //페이지가 열리자마자
		commentList('adqna',${vo.adqna_no});
	})
	function goDel(c_no){
		if(confirm('댓글을 삭제하시겠습니까?')){
			$.ajax({
				url:"/ad/comment/adqdelete.do",
				data:{c_no:c_no},
				success:function(res){
					if(res.trim()=='1'){
						alert('정상적으로 삭제되었습니다.');
						commentList('adqna', ${vo.adqna_no});
					} else {
						alert('삭제 오류입니다. 확인하세요');
					}
				}
			})
		}
	} 
</script>
<body>
    <div class="wrap">
    
    <%@ include file="/WEB-INF/view/admin/include/top.jsp" %>
        	<div class="sub">
	            <div class="size">
	            	<div class="con_tit">
	                	<h3 class="sub_title">광고 문의</h3>
	                </div>
	                <div class="bbs">
						<p1></p1>
	                    <div class="view">
	                        <div class="title">
	                            <dl>
	                                <dt>${vo.aq_title}</dt>
	                                <dd class="date">${vo.aq_regdate}</dd>
	                            </dl>
	                        </div>
	                        <div class="cont"><p>${vo.aq_contents}</p> </div>
	                        <dl class="file">
	                            <dt>첨부파일 </dt>
	                            <dd>
	                            <a href="/ad/common/download.jsp?path=/upload/&org=${vo.aq_filename_org}&real=${vo.aq_filename_real}" 
	                            target="_blank">${vo.aq_filename_org} </a></dd>
	                        </dl>
	                       
	                        </div>
	                        <div class="btnSet clear">
	                            <div class="fl_l">
	                          <a href="adqnaindex.do" class="btn">목록</a>
	                          <a href="javascript:del2();" class="btn">삭제</a>
	                          	</div>
	                        </div>
	                		<div>
	                			
			                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
			                    <input type="hidden" name="tablename" value="adqna">
			                    <!--<input type="hidden" name="a_no" value="${vo.a_no}"> 여기현수형이 -->
			                    <input type="hidden" name="adqna_no" value="${vo.adqna_no}">
			                        <table class="board_write">
			                            <colgroup>
			                                <col width="*" />
			                                <col width="100px" />
			                            </colgroup>
			                            <tbody>
			                            <tr>
			                                <td>
			                                    <textarea name="content" id="content" style="height:50px;"></textarea>
			                                </td>
			                                <td>
			                                    <div class="btnSet"  style="text-align:right;">
			                                        <a class="btn" href="javascript:goSave();">저장 </a>
			                                    </div>
			                                </td>
			                            </tr>
			                            </tbody>
			                        </table>
			                        </form>
							
			                    <div id="commentArea"></div>
			                   
                    		</div>
	                    </div>
	                    
	                </div>
	            </div>
	           
        </div>
    
</body>
</html>