<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>목록</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/custom2.css" rel="stylesheet">
	
	<style>
		.table > tbody > tr > td {
			text-align: center;
		}
		.table > tbody > tr > #title {
			text-align: left;
		}
		.table > thead > tr > th {
			text-align: center;
		}
	</style>
</head>
<body>
<div class="container">
	<div>
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<c:import url="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-5 cont">
			<table class="table table-condensed table-hover">
				<jsp:useBean id="now" class="java.util.Date"/>
				<fmt:formatDate value="${now}" var="today" pattern="d"/>
				<tr>
					<th>타입</th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				<c:forEach var="board" items="${list}">
				<tr>
					<td><c:out value='${board.boardType}'/></td>
					<td><c:out value='${board.boardNo}'/></td>
					<td id="title">
						<c:set var="type" value="${board.boardType}"/>
						<c:choose>
							<c:when test="${type eq 'notice'}">
								<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="d"/>
								<a href='noticeDetail?boardNo=<c:out value="${board.boardNo}"/>'>
									<c:out value='${board.title}'/>
									<c:if test="${today-writeDate == 0}">
										<span class="new">new</span>
									</c:if>
								</a>
							</c:when>
							<c:when test="${type eq 'sale'}">
								<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="d"/>
								<a href='saleDetail?boardNo=<c:out value="${board.boardNo}"/>'>
									<c:out value='${board.title}'/>
									<c:if test="${today-writeDate == 0}">
										<span class="new">new</span>
									</c:if>
								</a>
							</c:when>
							<c:when test="${type eq 'tip'}">
								<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="d"/>
								<a href='tipDetail?boardNo=<c:out value="${board.boardNo}"/>'>
									<c:out value='${board.title}'/>
									<c:if test="${today-writeDate == 0}">
										<span class="new">new</span>
									</c:if>
								</a>
							</c:when>
							<c:when test="${type eq 'image'}">
								<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="d"/>
								<a href='imageDetail?boardNo=<c:out value="${board.boardNo}"/>'>
									<c:out value='${board.title}'/>
									<c:if test="${today-writeDate == 0}">
										<span class="new">new</span>
									</c:if>
								</a>
							</c:when>
						</c:choose>
					</td>
					<td><c:out value='${board.nickName}'/></td>
					<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				</c:forEach>
			</table>
			<div>
				<a href="boardInsertForm">글쓰기</a>
			</div>
		</div>
	</div>
	<div><c:import url="/view/include/footer.jsp"/> </div>
</div>
</body>
</html>