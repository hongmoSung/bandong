<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
</head>
<body>
<div>
<div><c:import url="/view/include/topMenu.jsp"/> </div>
<div>
	<table>
		<tr>
			<td>타입</td>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>등록일</td>
		</tr>
		<c:forEach var="board" items="${list}">
		<tr>
			<td><c:out value='${board.boardType}'/></td>
			<td><c:out value='${board.boardNo}'/></td>
			<td>
				<c:set var="type" value="${board.boardType}"/>
				<c:choose>
				<c:when test="${type eq 'notice'}">
				<a href='NoticeDetail?boardNo=<c:out value="${board.boardNo}"/>'><c:out value='${board.title}'/></a>
				</c:when>
				<c:when test="${type eq 'sale'}">
				<a href='SaleDetail?boardNo=<c:out value="${board.boardNo}"/>'><c:out value='${board.title}'/></a>
				</c:when>
				<c:when test="${type eq 'tip'}">
				<a href='TipDetail?boardNo=<c:out value="${board.boardNo}"/>'><c:out value='${board.title}'/></a>
				</c:when>
				<c:when test="${type eq 'image'}">
				<a href='ImageDetail?boardNo=<c:out value="${board.boardNo}"/>'><c:out value='${board.title}'/></a>
				</c:when>
				</c:choose>
			</td>
			<td><c:out value='${board.nickName}'/></td>
			<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</table>
	<a href="BoardInsertForm">글쓰기</a>
</div>
<div><c:import url="/view/include/footer.jsp"/> </div>
</div>
</body>
</html>