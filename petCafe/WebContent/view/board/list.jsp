<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>목록</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	
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
		.num {
			width : 60px;
		}
		.title {
			width : 200px;
		}		
		.writer {
			width : 100px;
		}	
		div > .write {
			float: right;
			background: lightcyan;
			border-radius: 4px;
			padding: 6px 12px;
			color : navy;
			border: 1px solid navy;
		}
	</style>
</head>
<body>
<div class="container">

<!-- topMenu -->
	<div>
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	
	<div class="row" id="firstDiv">
<!-- leftMenu -->
		<div class="col-md-2">
			<c:import url="/view/include/leftMenu.jsp"/>
		</div>
<!-- 리스트 -->
	<div class="col-md-5 cont">
		<table class="table table-condensed table-hover">
			<jsp:useBean id="now" class="java.util.Date"/>
			<fmt:formatDate value="${now}" var="today" pattern="d"/>
			<thead>
				<tr>
					<th class="num">번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">등록일</th>
				</tr>
			</thead>
				<c:choose>
					<c:when test="${not empty list}">
					<c:forEach var="board" items="${list}">
						<tr>
							<td><c:out value='${board.boardNo}'/></td>
							<td id="title">
								<c:set var="type" value="${board.boardType}"/>
								<!-- 타입별 리스트 뿌리기 -->
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
								</c:choose>
							</td>
							<td><c:out value='${board.nickName}'/></td>
							<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4"><c:out value="등록된 게시물이 없습니다"/></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<hr>
			<div>
				<a href="boardInsertForm" class="write">글쓰기</a>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<div><c:import url="/view/include/footer.jsp"/> </div>
</div>
</body>
</html>