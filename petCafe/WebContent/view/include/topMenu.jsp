<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>topMenu</h1>
<c:choose>
	<c:when test="${empty member}">
<%-- 		<a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a> --%>
		<a href="${pageContext.request.contextPath}/member/authForm">회원가입</a>
		<a href="${pageContext.request.contextPath}/login/loginForm">로그인</a>
		<a href="${pageContext.request.contextPath}/hospital/joinForm">병원등록</a>
		<a href="${pageContext.request.contextPath}/hospital/hospitalInfo">병원정보</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
		<a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a>
		<a href="${pageContext.request.contextPath}/hospital/joinForm">병원등록</a>
		<a href="${pageContext.request.contextPath}/hospital/hospitalInfo">병원정보</a>
	</c:otherwise>
</c:choose>
<hr>