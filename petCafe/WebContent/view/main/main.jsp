<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div>
	<c:choose>
		<c:when test="${not empty member}">
			<c:out value="${member.nickName} 님 환영합니다 ^^"/>
		</c:when>
		<c:otherwise>
			<c:out value="로그인해주세요"/>
		</c:otherwise>
	</c:choose>
</div>

<div>
	<c:import url="/view/include/leftMenu.jsp"/>
</div>

<div>
	<div>
		공지사항<br>
		<table>
			<c:forEach var="board" items="${boardListNotice}">
				<tr>
					<td>
						<c:out value="${board.title}"/>
					</td>
					<td>
						<c:out value="${board.memberId}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		분양 게시판<br>
		<table>
			<c:forEach var="board" items="${boardListSale}">
				<tr>
					<td>
						<c:out value="${board.title}"/>
					</td>
					<td>
						<c:out value="${board.memberId}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		양육 TIP 게시판<br>
		<table>
			<c:forEach var="board" items="${boardListTip}">
				<tr>
					<td>
						<c:out value="${board.title}"/>
					</td>
					<td>
						<c:out value="${board.memberId}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		이미지 게시판<br>
		<table>
			<c:forEach var="board" items="${boardListImage}">
				<tr>
					<td>
						<c:out value="${board.title}"/>
					</td>
					<td>
						<c:out value="${board.memberId}"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>