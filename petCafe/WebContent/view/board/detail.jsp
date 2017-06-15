<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상세페이지</title>
	<style>
		.table > thead > tr > th {
			text-align: center;
		}
		button > a {
			text-decoration:none;
		}
	</style>
</head>
<body>
<div>
<div><c:import url="/view/include/topMenu.jsp"></c:import> </div>

<div>
	<c:set var="file" value="${file}"/>
	<c:set var="type" value="${board.boardType}"/>
	<c:set var="boardList" value="${boardList}"/>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>	
			</thead>
			<tr>
				<td><c:out value="${board.boardNo}"/></td>
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
		<div align="center">
			<c:out value="${board.content}"/>
		</div>
	
	<c:if test="${member.memberId eq board.memberId}">
	<button><a href='boardUpdateForm?boardType=${board.boardType}&boardNo=<c:out value="${board.boardNo}" />'>수정</a></button>
	<button><a href='boardDelete?boardType=${board.boardType}&boardNo=<c:out value="${board.boardNo}" />'>삭제</a></button>
	</c:if>
		
				<c:choose>
					<c:when test="${type eq 'notice'}">
						<button><a href="noticeList">목록</a></button>
					</c:when>
					<c:when test="${type eq 'sale'}">
						<button><a href="saleList">목록</a></button>
					</c:when>
					<c:when test="${type eq 'tip'}">
						<button><a href="tipList">목록</a></button>
					</c:when>
					<c:when test="${type eq 'image'}">
						<button><a href="imageList">목록</a></button>
					</c:when>
				</c:choose>
				
				
	
	<h5>댓글</h5>
	<hr>
	<div id="reply">
			<form name='registForm' method="post" action="replyRegist" onsubmit="return regChk();">
				<input type="hidden" name="boardNo" value="${board.boardNo}" />	
				<input type="hidden" name="boardType" value="${board.boardType}" />
				<table width="70%">
				<tr>
					<td><input type="text" name="nickName" value="${member.nickName}" /></td>
					<td><textarea name="content" rows="2" cols="60"></textarea></td>
					<td><input type="submit" value="등록" /></td>
				</tr>	
				</table>
			</form>
		</div>
			
		<form name='updateForm' action="replyUpdate" method="post" onsubmit="return upChk();">
			<input type="hidden" name="boardNo" value="${board.boardNo}" />
			<input type="hidden" name="boardType" value="${board.boardType}" />
			<input type="hidden" name="replyId" value="${replyId}" />
		
		<div id="replyList">
		<table>
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
		  			m : ${member.nickName}
		  			r: ${reply.nickName}
						<tr>
							<td><c:out value="${reply.replyId}"/></td>
					 	 	<td><c:out value="${reply.nickName}" /></td>
					 	 	<td><textarea name="content" rows="2" cols="60"><c:out value="${reply.content}" /></textarea></td>
						  	<td><fmt:formatDate var="regDate" value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						  		<c:out value="${regDate}" /></td>
						<c:if test="${member.nickName eq reply.nickName}">
				  			<td colspan="2">
				  			 <input type="submit" value="수정" />	
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
<div><c:import url="/view/include/footer.jsp"/> </div>
</div>


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