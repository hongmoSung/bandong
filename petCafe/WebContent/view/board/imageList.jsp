<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이미지 목록</title>
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<style>
	/*
		#top {
			float: left;
		}
	*/
		li {
			float: left;
		}
		img{
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
		div > .write {
			margin-top:20px;
			float: right;
			background: lightcyan;
			border-radius: 4px;
			padding: 6px 12px;
			color : navy;
			border: 1px solid navy;
		}
		.topTitle {
			font-size: 40px;
		}
		/* 	<!-- 화살표--> */
		.css-arrow {
			float:left;
		    display: inline-block;
		    position: relative;
		    margin: 0 0 0 10px;
		    margin-top:13px;
		    padding: 0;
		    width: 0;
		    height: 0;
		    border: 10px solid transparent;
		    border-left-color: #000;
		}
		.css-arrow:before, .css-arrow:after {
		    display: block;
		    content: "";
		    position: absolute;
		    top: 0;
		    width: 0;
		    height: 0;
		}
		.css-arrow:before {
		    left: -30px;
		    margin-top: -10px;
		    border: 10px solid transparent;
		    border-right-color: #000;
		}
		.css-arrow:after {
		    left: -20px;
		    margin-top: -14px;
		    border: 14px solid transparent;
		    border-left-color: white;
		}
	</style>
</head>
<body>
<div class="container">
<!-- top -->
	<div id="top">
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	
	<div class="row" id="firstDiv">
<!-- left-->
	<div class="col-md-2">
		<c:import url="/view/include/leftMenu.jsp"/>
	</div>
		
	<div class="col-md-10 cont">
<!-- 본문-->
		<div>
			<a href="boardInsertForm" class="write">글쓰기</a>
		</div>
		<p class="css-arrow"></p>
		<p class="topTitle">이미지 게시판</p>
		
			<c:set var="file" value="${fileList}"/>
			<c:set var="board" value="${boardList}"/>
			<c:choose>
				<c:when test="${not empty board}">
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
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4"><c:out value="등록된 게시물이 없습니다"/></td></tr>
				</c:otherwise>
			</c:choose>
			<div>
				<a href="boardInsertForm" class="write">글쓰기</a>
			</div>
		</div>
	</div>
	<div><c:import url="/view/include/footer.jsp"/> </div>
</div>
</body>
</html>