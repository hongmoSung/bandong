<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이미지 목록</title>
	<style>
		#top {
			float: left;
		}
		li {
			float: left;
		}
		img{
			margin: 10px;
			margin-bottom: 0px;
			width: 150px;
			height: auto;
			overflow:hidden;
		}
		#nickName, #title {
			margin : 5px;
			width: 150px;
			text-align: center;
		}
		div {
			clear: both;
		}
		div > ul {
			list-style: none;
		}
		#dl {
			padding: 0;
			position:relative;
		}
		#img{
			position:relative;
			padding: 0;
			width: 150px;
			height: 180px;
		}
		#title { font-size: 20px;}
		#nickName {
			font-size: 15px;
		}
	</style>
</head>
<body>
<div>
	<div id="top">
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	<div>
	<c:set var="file" value="${fileList}"/>
	<c:set var="board" value="${boardList}"/>
		<c:forEach var="index" begin="0" end="${fn:length(file)-1}">
			
			<ul>
				<li>
					<table id="img">
						<tbody>
							<tr>
								<td>
									<a href='imageDetail?boardNo=<c:out value="${file[index].boardNo}"/>'><img src="${uploadPath}${file[index].filePath}/${file[index].systemName}"/></a>
								</td>
							</tr>
						</tbody>
					</table>
					<dl id="dl">
						<dt id="title">
							<c:out value="${board[index].title}"></c:out>
						</dt>
						<dd id="nickName">
							<c:out value="${board[index].nickName}"></c:out>
						</dd>
					</dl>
				</li>
						
			</ul>
		</c:forEach>
	</div>
	<div>
	<a href="boardInsertForm">글쓰기</a>
	</div>
	<div><c:import url="/view/include/footer.jsp"/> </div>
</div>
</body>
</html>