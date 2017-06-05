
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom2.css" rel="stylesheet">
 
</head>

<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="row">
	<div class="col-md-2">
		<c:choose>
			<c:when test="${not empty member}">
				<c:out value="${member.nickName} 님 환영합니다 ^^"/>
			</c:when>
			<c:otherwise>
				<c:out value="로그인해주세요"/>
			</c:otherwise>
		</c:choose>
		<c:import url="/view/include/leftMenu.jsp"/>
	</div>

	<div class="col-md-5 cont">
		<div>
			공지사항<br>
			<table class="table table-condensed">
				<c:forEach var="board" items="${boardListNotice}">
					<tr>
						<td>
							<c:out value="${board.title}"/>
						</td>
						<td>
							<c:out value="${board.nickName}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-md-5 cont">
		<div>
			분양 게시판<br>
			<table class="table table-condensed">
				<c:forEach var="board" items="${boardListSale}">
					<tr>
						<td>
							<c:out value="${board.title}"/>
						</td>
						<td>
							<c:out value="${board.nickName}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-md-5 cont">
		<div>
			양육 TIP 게시판<br>
			<table>
				<c:forEach var="board" items="${boardListTip}">
					<tr>
						<td>
							<c:out value="${board.title}"/>
						</td>
						<td>
							<c:out value="${board.nickName}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="col-md-5 cont">
		<div>
			이미지 게시판<br>
			<table>
				<c:forEach var="board" items="${boardListImage}">
					<tr>
						<td>
							<c:out value="${board.title}"/>
						</td>
						<td>
							<c:out value="${board.nickName}"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>