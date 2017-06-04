<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>topMenu</h1>

<ul>
<%-- 	<a href="${pageContext.request.contextPath}/member/joinForm">회원가입</a> --%>
	<c:choose>
		<c:when test="${empty member}">
			<li>
				<a href="${pageContext.request.contextPath}/login/loginForm">로그인</a>
			</li>
		</c:when>
		<c:otherwise>
			<li>
				<a href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
			</li>
			<li>
				<a href="${pageContext.request.contextPath}/login/logout">마이 페이지</a>
			</li>
		</c:otherwise>
	</c:choose>
	<li>
		<a href="${pageContext.request.contextPath}/login/logout">전체 글 보기</a>
	</li>
	<li>
		<a href="${pageContext.request.contextPath}/board/notice">공지 사항</a>
	</li>
</ul>

<hr>