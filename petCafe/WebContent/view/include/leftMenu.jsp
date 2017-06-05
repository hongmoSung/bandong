<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	매니저 : <c:out value="${master}"/>
	<br>
	게시글 수 : <c:out value="${allBoardCount}"/>
	<br>
	회원 수 : <c:out value="${memberCount}"/>
</div>

<c:choose>
	<c:when test="${not empty member}">
		<div>
			닉네임 : <c:out value="${member.nickName}"/>
			<br>
			가입일 : <c:out value="${member.regDate}"/>
			<br>
			작성글 수 : <c:out value="${myBoardCount}"/>
			<br>
			작성 댓글 수 : <c:out value="${myReplyCount}"/>
		</div>
		<div>
			<a href="">카페 글쓰기</a>
		</div>
	</c:when>
	<c:otherwise>
		<div>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/join">카페 가입하기</a>
		</div>
	</c:otherwise>
</c:choose>

<ul>
	<li>게시판
		<ul>
			<li>공지사항</li>
			<li>분양 게시판</li>
			<li>tip 게시판</li>
			<li>사진 게시판</li>
		</ul>
	</li>
	<li>병원
		<ul>
			<li>우리 병원 등록</li>
			<li>병원 정보 확인</li>
		</ul>
	</li>
	<li>예약
		<ul>
			<li>예약하기</li>
			<li>예약 확인</li>
		</ul>
	</li>
</ul>