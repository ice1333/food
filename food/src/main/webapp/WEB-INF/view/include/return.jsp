<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	<c:if test="${!empty msg}">alert('${msg}');</c:if>
	
	<c:if test="${empty url}">history.back();</c:if>
	<c:if test="${!empty url}">location.href='${url}';</c:if>
</script>