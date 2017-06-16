<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세페이지</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	<style>
		.table > thead > tr > th, td {
			margin-left:10px;
			text-align: left;
		}
		.dot {
			border-bottom: dotted 0.5px;  
		}
		button > a {
			text-decoration:none;
		}
		div > #bt{
			background-color: lightcyan;
			padding: 6px 12px;
			border: 1px solid navy;
			border-radius: 4px;
			margin: 5px;
			float: right;
		}
		div > button > a{
			margin: -10px -5px;
			font-size: 15px;
			color : navy;
		}
		
		.replyPo{
			font-weight:bold;
			clear: right;
		}
		#replyPo{
			padding:10px;
		}
		.bContent{
			margin-top: 50px;
			margin-bottom: 100px;
			margin-left: 50px;
			font-size: "20px"; 
		}
		#reply{
			padding:10px;
			position:relative;
			margin-left:10px;
		}
		.sub {
			background-color: lavender;
			width: 80px;
			padding: 6px 12px;
			border: 1px solid navy;
			border-radius: 4px;
			margin: 5px;
			float: right;
			font-size: 10px;
			color : navy;
		}
		.reUp {
			background-color: lavender;
			width: 50px;
			padding: 5px 8px;
			border: 1px solid navy;
			border-radius: 4px;
			margin: 5px;
			float: right;
			font-size: 10px;
			color : navy;
		}
		#replyCo{
			background: azure;
		}
	</style>
</head>
<body>
<div class="container">
<!-- top -->
	<div>
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	
	<div class="row" id="firstDiv">
<!--  left -->
		<div class="col-md-2">
			<c:import url="/view/include/leftMenu.jsp"/>
		</div>
		
		<div class="col-md-10 cont">
<!-- 본문 -->		
			<c:set var="file" value="${file}"/>
			<c:set var="type" value="${board.boardType}"/>
			<c:set var="boardList" value="${boardList}"/>
				<table class="table table-condensed table-hover">
					<thead>
						<tr>
							<th class="title">제목</th>
							<th class="writer">작성자</th>
							<th class="date">등록일</th>
						</tr>	
					</thead>
					<tr class="dot">
						<td><c:out value="${board.title}"/></td>
						<td><c:out value="${boardList[0].nickName}"/></td>
						<td><fmt:formatDate value="${board.regDate}" pattern="yy/MM/dd hh:mm:ss"/></td>
					</tr>
				</table>
				<c:if test="${type eq 'image'}">
					<c:forEach var="file" items="${file}">
						<img src="${uploadPath}${file.filePath}/${file.systemName}"/>
					</c:forEach>
				</c:if>
				<div class="bContent">
					<c:out value="${board.content}"/>
				</div>
				<div>
					<c:choose>
						<c:when test="${type eq 'notice'}">
							<button  class="btn btn-primary btn-lg" id="bt"><a href="noticeList">목록</a></button>
						</c:when>
						<c:when test="${type eq 'sale'}">
							<button  class="btn btn-primary btn-lg" id="bt"><a href="saleList">목록</a></button>
						</c:when>
						<c:when test="${type eq 'tip'}">
							<button  class="btn btn-primary btn-lg" id="bt"><a href="tipList">목록</a></button>
						</c:when>
						<c:when test="${type eq 'image'}">
							<button  class="btn btn-primary btn-lg" id="bt"><a href="imageList">목록</a></button>
						</c:when>
					</c:choose>
					<c:if test="${member.memberId eq board.memberId}">
						<button  class="btn btn-primary btn-lg" id="bt"><a href='boardDelete?boardType=${board.boardType}&boardNo=<c:out value="${board.boardNo}" />'>삭제</a></button>
						<button class="btn btn-primary btn-lg" id="bt"><a href='boardUpdateForm?boardType=${board.boardType}&boardNo=<c:out value="${board.boardNo}" />'>수정</a></button>
					</c:if>
			</div>
<!-- 댓글 -->
			<h5 class="replyPo">댓글</h5>
			<div id="replyCo">
				<hr>
				
				<!-- 댓글 등록 -->
				<div id="reply">
					<form name='registForm' method="post" action="replyRegist" onsubmit="return regChk();">
						<input type="hidden" name="boardNo" value="${board.boardNo}" />	
						<input type="hidden" name="boardType" value="${board.boardType}" />
						<table width="100%">
							<tr id="replyPo">
								<td><input type="text" name="nickName" value="${member.nickName}" disabled="disabled"/></td>
								<td><textarea name="content" rows="2" cols="60"></textarea></td>
								<td><button class="sub" type="submit">등록</button></td>
							</tr>	
						</table>
					</form>
				</div>
				
				<!-- 댓글 수정 -->
				<form name='updateForm' action="replyUpdate" method="post" onsubmit="return upChk();">
					<input type="hidden" name="boardNo" value="${board.boardNo}" />
					<input type="hidden" name="boardType" value="${board.boardType}" />
					<input type="hidden" name="replyId" value="${replyId}" />

					<div id="replyList">
						<table class="table table-condensed table-hover">
			  				<thead>
							  	<tr>
					  				<th>번호</th>
					  				<th>닉네임</th>
					  				<th>내용</th>
					  				<th>등록일</th>
				  				</tr>
			  				</thead>
							<c:set var="replymember" value="${reply.memberId}"/>
							<c:forEach var="reply" items="${replyList}">
								<c:choose>
					  			<c:when test="${replyId eq reply.replyId}">	
									<tr>
										<td><c:out value="${reply.replyId}"/></td>
								 	 	<td><c:out value="${reply.nickName}" /></td>
								 	 	<td><textarea name="content" rows="2" cols="60"><c:out value="${reply.content}" /></textarea></td>
									  	<td><fmt:formatDate var="regDate" value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								  		<c:out value="${regDate}" /></td>
										<c:if test="${member.nickName eq reply.nickName}">
								  			<td colspan="2">
								  			 	<button class="reUp" type="submit">수정</button>
								 			</td>    
							 			</c:if>
							 		</tr>
							 	</c:when>
						 		<c:otherwise>
							 		<tr>
										<td><c:out value="${reply.replyId}"/></td>
								 	 	<td><c:out value="${reply.nickName}" /></td>
								 	 	<td><c:out value="${reply.content}" /></td>
									  	<td><fmt:formatDate var="regDate" value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
								  		<c:out value="${regDate}" /></td>
										<c:if test="${member.nickName eq reply.nickName}">
								  			<td colspan="2">
									  			<a href="${board.boardType}Detail?replyId=${reply.replyId}&boardNo=${board.boardNo}">수정</a>
									  			<a href="replyDelete?boardType=${board.boardType}&replyId=${reply.replyId}&boardNo=${board.boardNo}">삭제</a>
								 			</td>
							 			</c:if>
						 			</tr>
							 	</c:otherwise>
						 	</c:choose>              
						 </c:forEach>
	 		
						 <c:if test="${empty replyList}">
							 <tr>
							    <td colspan='4'>댓글이 존재하지 않습니다.</td>
							 </tr>
					 	</c:if>
					</table>
				</div>
			</form>
			</div>
		</div>
		</div>
		
<!-- footer -->	
	<div><c:import url="/view/include/footer.jsp"/> </div>
</div>
<!-- script -->
	<script>
		function regChk() {
			var reg = document.registForm;
			var content = reg.content;
			
			if(content.value == "") {
				alert("댓글을 입력하세요");
				content.focus();
				return false;
			}
		}
		function upChk() {
			var update = document.updateForm;
			var content = update.content;
			
			if(content.value == "") {
				alert("댓글을 입력하세요");
				content.focus();
				return false;
			}
		}
	</script>
</body>
</html>