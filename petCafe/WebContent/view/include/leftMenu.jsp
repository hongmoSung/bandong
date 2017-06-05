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
				가입일 : <fmt:formatDate value="${member.regDate}" pattern="yyyy/MM/dd"/>
				<br>
				작성글 수 : <c:out value="${myBoardCount}"/>
				<br>
				작성 댓글 수 : <c:out value="${myReplyCount}"/>
				<br>
				<a href="">카페 글쓰기</a>
			</c:when>
			<c:otherwise>
				회원 가입 후 이용해주세요 :)
				<br>
				<a href="${pageContext.request.contextPath}/member/join">카페 가입하기</a>
			</c:otherwise>
		</c:choose>
	</div>
	
</div>

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

 
<!-- 
    <h2>토글되는 탭 </h2>
    
    <ul class="nav nav-tabs">
      <li><a href="#cafe" data-toggle="tab">카페정보</a></li>
      <li class="active"><a href="#tab1" data-toggle="tab">탭 1</a></li>
      <li><a href="#member" data-toggle="tab">회원정보</a></li>
      <li><a href="#tab3" data-toggle="tab">탭 3</a></li>
    </ul>
   
  <div class="tab-content">
  	<div class="tab-pane active fade" id="cafe">
		매니저 : <c:out value="${master}"/>
		<br>
		게시글 수 : <c:out value="${allBoardCount}"/>
		<br>
		회원 수 : <c:out value="${memberCount}"/>
	</div>
    <div class="tab-pane active fade in" id="tab1">
      <h3>탭 1</h3>
      Vivamus congue iaculis ante sed iaculis. In consectetur elit sed sapien pulvinar malesuada. Aliquam sed ligula a nibh convallis elementum non nec odio. Phasellus dapibus, libero non facilisis congue, ligula diam varius lorem, a sodales felis turpis nec ligula. Nunc volutpat convallis felis eget elementum. Aliquam viverra ante in mollis porta. Etiam nec posuere felis. Donec massa nisi, facilisis non placerat eget, ornare quis neque. Integer in massa interdum, tincidunt tellus a, volutpat velit.</div>
      
    <div class="tab-pane fade" id="member">
    	ㄴㄴㄴㄴㄴ
    </div>  
    <div class="tab-pane fade" id="tab3">
      <h3>탭 3</h3>
      Duis suscipit a ipsum sed fringilla. Vivamus sit amet urna id urna faucibus blandit. Fusce at urna vel arcu scelerisque ultrices. Vivamus congue scelerisque tortor non condimentum. Phasellus eu suscipit felis. Praesent tincidunt venenatis laoreet. Duis non leo hendrerit, facilisis ligula id, mollis ligula. Sed vitae magna ante. Cras pellentesque tempor rhoncus. Sed bibendum, neque non euismod ultrices, lorem leo facilisis diam, ornare posuere sapien dui et velit. Morbi a nibh nec nulla feugiat egestas ac vel purus. Aliquam dignissim bibendum interdum. Vestibulum vel mi condimentum, ullamcorper lectus at, scelerisque nunc.</div>
</div>

 -->