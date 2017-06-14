<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
<div>
<div><c:import url="/view/include/topMenu.jsp"></c:import> </div>
<div>
<table>
		<tr>
		<td>번호</td>
		<td><c:out value="${board.boardNo}"/></td>
		</tr>
		<tr>
		<td>제목</td>
		<td><c:out value="${board.title}"/></td>
		</tr>
		<tr>
		<td>작성자</td>
		<td><c:out value="${board.memberId}"/></td>
		</tr>
		<tr>
		<td>내용</td>
		<td><c:out value="${board.content}"/></td>
		</tr>
		<tr>
		<td>등록일</td>
		<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
		</tr>
		<tr>
		<td>이미지</td>
		<td>		
 			<a href="${pageContext.request.contextPath}/servlet/DownloadServlet?path=${file.filePath}&sName=${file.sysName}&dName=${file.oriName}">${file.oriName}</a>
				(<c:out value='${file.fileSize}'/> byte)
		</td>
		</tr>
	</table>
	<c:out value="${board.boardNo}"/>
	<c:out value="${board.boardType}"/>
	<a href='boardUpdateForm?boardType=${board.boardType}&boardNo=<c:out value="${board.boardNo}" />'>수정</a>
	<a href='boardDelete?boardType=${board.boardType}&boardNo=<c:out value="${board.boardNo}" />'>삭제</a>
	
	
		<c:set var="type" value="${board.boardType}"/>
				<c:choose>
					<c:when test="${type eq 'notice'}">
						<a href="noticeList">목록</a>
					</c:when>
					<c:when test="${type eq 'sale'}">
						<a href="saleList">목록</a>
					</c:when>
					<c:when test="${type eq 'tip'}">
						<a href="tipList">목록</a>
					</c:when>
					<c:when test="${type eq 'image'}">
						<a href="imageList">목록</a>
					</c:when>
					</c:choose>
	
	<h5>댓글</h5>
	<hr>
	<div id="reply">
			<form method="post" action="replyRegist">
				<input type="hidden" name="boardNo" value="${board.boardNo}" />	
				<input type="hidden" name="boardType" value="${board.boardType}" />
				<input type="hidden" name="replyId" value="${reply.replyId}" />
				<table width="70%">
				<tr>
					<td><input type="text" name="nickName" value="${member.nickName}" /></td>
					<td><textarea name="content" rows="2" cols="60"></textarea></td>
					<td><input type="submit" value="등록" /></td>
				</tr>	
				</table>
			</form>
		</div>
			
		<form action="replyUpdate" method="post">
			<input type="hidden" name="boardNo" value="${board.boardNo}" />

			<input type="hidden" name="boardType" value="${board.boardType}" />
		
		<div id="replyList">
		<table>
		  <tr>
		  			<tr>
		  			<td>댓글번호</td>
		  			<td>닉네임</td>
		  			<td>내용</td>
		  			<td>등록일</td>
		  			<td></td>
		  			</tr>
		<c:set var="replyId" value="${reply.memberId}"/>
		<c:choose>
  		<c:when test="${member.memberId eq replyId}">	
			<c:forEach var="reply" items="${replyList}">
						<tr>
							<td><input type="hidden" name="replyId" value="${reply.replyId}" /><c:out value="${reply.replyId}"/></td>
					 	 	<td><c:out value="${reply.memberId}" /></td>
					 	 	<td><textarea name="content" rows="2" cols="60"><c:out value="${reply.content}" /></textarea></td>
						  	<td><fmt:formatDate var="regDate" value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						  		<c:out value="${regDate}" /></td>
						  	<td colspan="2">
						  		<input type="submit" value="수정" />
						  		<input type="button" name="버튼" value="삭제" onclick="window.open('replyDelete?boardType=${board.boardType}&replyId=${reply.replyId}&boardNo=${board.boardNo}')">
						 	</td>                  
						 </tr>
		 	</c:forEach>	
	 	</c:when>
		 <c:otherwise>
		  		<c:forEach var="reply" items="${replyList}">
					<tr>
					  <td><input type="hidden" name="replyId" value="${reply.replyId}" /><c:out value="${reply.replyId}"/></td>
					  <td><c:out value="${reply.memberId}" /></td>
					  <td><textarea name="content" rows="2" cols="60"><c:out value="${reply.content}" /></textarea></td>
					  <td><fmt:formatDate var="regDate" value="${reply.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
						  		<c:out value="${regDate}" /></td>
					 </tr>
		 		 </c:forEach>
	 	</c:otherwise>
		</c:choose>	
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
</body>
</html>