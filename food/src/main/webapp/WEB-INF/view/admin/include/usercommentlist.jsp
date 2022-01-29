 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="<%=request.getContextPath()%>/css/user/usercomment.css" rel="stylesheet" type="text/css" />
 <table class="list">
    <colgroup>
        <col width="*" />
        <col width="100px" />
        <col width="100px" />
    </colgroup>
    <tbody>
		<c:if test="${empty list}"> 
            <tr>
                <td class="first" colspan="4" style="text-align:center;">등록된 답변이 없습니다.</td>
            </tr>
		</c:if>

                     <c:if test="${!empty list}">   
                     	<c:forEach var="vo" items="${list}" >     
                       <tr> <!-- 사용자할때는 가리고 그래야 번호가 안나오니깐-->
                           <td class="txt_l" style="text-align:left;">
                               ${vo.content}
                           </td>
                           <td class="writer">
                           <c:if test="${vo.a_no>0}">
                              	관리자
                           </c:if>
                           </td>
                           <td class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
                       </tr>
                     	</c:forEach>
                     </c:if>
                     
                     
                </tbody>
             </table>