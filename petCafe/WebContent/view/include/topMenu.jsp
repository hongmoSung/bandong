<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default navbar-fixed-top " role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
	</div>
     
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/main/Main">홈으로</a></li>			
			<c:choose>
				<c:when test="${empty member}">
					<li><a href="${pageContext.request.contextPath}/login/loginForm">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/login/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/member/myPage">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<form class="navbar-form navbar-right" role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
		</form>
	</div>
</nav>