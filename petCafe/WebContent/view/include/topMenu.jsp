<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<a href="${pageContext.request.contextPath}/main/Main">홈으로</a>
<c:choose>
	<c:when test="${empty member}">
		<a href="${pageContext.request.contextPath}/login/loginForm">로그인</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
		<a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a>
	</c:otherwise>
</c:choose>
<hr>