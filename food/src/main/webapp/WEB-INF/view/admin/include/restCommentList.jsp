 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


 <table class="list">
    <colgroup>
        <col width="150" />
        <col width="700px" />
        <col width="150px" />
        <col width="100px"/>
        <col width="100px"/>
    </colgroup>
    <tbody>
		<c:if test="${empty list}"> 
            <tr>
                <td class="first" colspan="4">등록된 댓글이 없습니다.</td>
            </tr>
		</c:if>

                     <c:if test="${!empty list}">   
                     	<c:forEach var="vo" items="${list}" >     
                       <tr>
                            <!-- 사용자할때는 가리고 그래야 번호가 안나오니깐-->
                           <td class="writer">${vo.u_name}</td>
                           <td class="txt_l" style="text-align:left;">
                               ${vo.content}
                           </td>
                           <td class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
                           <td>${vo.r_stars}</td>
                           <%--<c:if test="${vo.u_no == userInfo.u_no }"> --%>
                           <td>
                           <a class="btn" href="javascript:goDel();">삭제</a>
                           </td>
                       </tr>
                     	</c:forEach>
                     </c:if>
                     
                     
                </tbody>
             </table>