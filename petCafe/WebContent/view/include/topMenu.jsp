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
			<c:if test="${not empty member}">
				<img src="${pageContext.request.contextPath}/userImage/${member.memberId}"/>
			</c:if>
			<div class="form-group">
				<div class="input-group">
					<input type="text" class="form-control" id="searchTxt" placeholder="검색" aria-describedby="searchBtn">
	  				<span class="input-group-addon" id="searchBtn">검색</span>
	  			</div>
			</div>
		</form>
	</div>
</nav>