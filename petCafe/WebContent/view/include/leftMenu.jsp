<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<ul class="nav nav-tabs">
	<li class="active"><a href="#cafe" data-toggle="tab">카페정보</a></li>
	<li><a href="#member" data-toggle="tab">회원정보</a></li>
</ul>
<div class="tab-content">
	<div class="tab-pane active fade in" id="cafe">
		매니저 : <c:out value="${master}"/>
		<br>
		게시글 수 : <c:out value="${allBoardCount}"/>
		<br>
		회원 수 : <c:out value="${memberCount}"/>
	</div>
	<div class="tab-pane fade" id="member">
		<c:choose>
			<c:when test="${not empty member}">
				닉네임 : <c:out value="${member.nickName}"/>
				<br>
				가입일 : <fmt:formatDate value="${member.regDate}" pattern="yyyy.MM.dd"/>
				<br>
				작성글 수 : <c:out value="${myBoardCount}"/>
				<br>
				작성 댓글 수 : <c:out value="${myReplyCount}"/>
				<br>
			</c:when>
			<c:otherwise>
				회원 가입 후 이용해주세요 :)
				<br>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div>
	<c:choose>
		<c:when test="${not empty member}">
			<a href="${pageContext.request.contextPath}/board/write">카페 글쓰기</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/member/authForm">카페 가입하기</a>
		</c:otherwise>
	</c:choose>
</div>

<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<a data-toggle="collapse" data-parent="#accordion" href="#boardList">
				게시판 
			</a>
		</div>
		<div id="boardList" class="panel-collapse collapse in">
			<div class="panel-body">
				<a href="${pageContext.request.contextPath}/board/noticeList">공지사항</a><br>
				<a href="${pageContext.request.contextPath}/board/saleList">분양 게시판</a><br>
				<a href="${pageContext.request.contextPath}/board/tipList">tip 게시판</a><br>
				<a href="${pageContext.request.contextPath}/board/imageList">사진 게시판</a>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<a data-toggle="collapse" data-parent="#accordion" href="#hospitalList">
				병원
			</a>
		</div>
		<div id="hospitalList" class="panel-collapse collapse">
			<div class="panel-body">
				<a href="${pageContext.request.contextPath}/hospital/joinForm">우리 병원 등록</a><br>
				<a href="${pageContext.request.contextPath}/hospital/hospitalInfo">병원 정보 확인</a><br>
				<a href="${pageContext.request.contextPath}/hospital/hospitalList">모든병원</a><br>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<a data-toggle="collapse" data-parent="#accordion" href="#reservationList">
				예약
			</a>
		</div>
		<div id="reservationList" class="panel-collapse collapse">
			<div class="panel-body">
				<a href="${pageContext.request.contextPath}/reservation/insert">예약하기</a><br>
				<a href="${pageContext.request.contextPath}/reservation/reservationList">예약 확인</a>
			</div>
		</div>
	</div>
</div>