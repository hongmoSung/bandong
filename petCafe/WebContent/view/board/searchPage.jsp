<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>검색 페이지</title>
		
		<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		
		<style>
			.content {
				text-align: center;
			}
			.contentTr:hover, .tableHeader:hover {
				background-color: #FFFFFF;
			}
			#searchWord {
				color: red;
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
				<div class="col-md-10">
					<div class="row">
						'<c:out value="${searchTxt}"/>'로 검색한 결과
					</div>
					<div class="row">
						<div>
							공지사항
						</div>
						<table class="table table-hover">
							<tr class="tableHeader">
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
							</tr>
							<c:if test="${empty noticeList}">
								<tr>
									<td colspan="3" class="contentTr content">검색된 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="board" items="${noticeList}">
								<tr>
									<td>
										<c:out value="${board.boardNo}"/>
									</td>
									<td id="title">
										<a href="${pageContext.request.contextPath}/board/noticeDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
										</a>
									</td>
									<td>
										<c:out value="${board.nickName}"/>
									</td>
								</tr>
								<tr class="contentTr">
									<th>내용</th>
									<td colspan="2" class="content">
										<c:set value="${fn:indexOf(board.content, searchTxt)}" var="startIndex"/>
										<c:set value="${fn:length(searchTxt) + startIndex}" var="endIndex"/>
										<c:out value="${fn:substring(board.content, 0, startIndex)}"/>
										<span id="searchWord"><c:out value="${searchTxt}"/></span>
										<c:out value="${fn:substring(board.content, endIndex, fn:length(board.content))}"/>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="row">
						<div>
							분양 게시판
						</div>
						
						<table class="table table-hover">
							<tr class="tableHeader">
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
							</tr>
							<c:if test="${empty saleList}">
								<tr>
									<td colspan="3" class="contentTr content">검색된 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="board" items="${saleList}">
								<tr>
									<td>
										<c:out value="${board.boardNo}"/>
									</td>
									<td id="title">
										<a href="${pageContext.request.contextPath}/board/saleDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
										</a>
									</td>
									<td>
										<c:out value="${board.nickName}"/>
									</td>
								</tr>
								<tr class="contentTr">
									<th>내용</th>
									<td colspan="2" class="content">
										<c:set value="${fn:indexOf(board.content, searchTxt)}" var="startIndex"/>
										<c:set value="${fn:length(searchTxt) + startIndex}" var="endIndex"/>
										<c:out value="${fn:substring(board.content, 0, startIndex)}"/>
										<span id="searchWord"><c:out value="${searchTxt}"/></span>
										<c:out value="${fn:substring(board.content, endIndex, fn:length(board.content))}"/>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="row">
						<div>
							양육TIP
						</div>
						<table class="table table-hover">
							<tr class="tableHeader">
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
							</tr>
							<c:if test="${empty tipList}">
								<tr>
									<td colspan="3" class="contentTr content">검색된 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="board" items="${tipList}">
								<tr>
									<td>
										<c:out value="${board.boardNo}"/>
									</td>
									<td id="title">
										<a href="${pageContext.request.contextPath}/board/tipDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
										</a>
									</td>
									<td>
										<c:out value="${board.nickName}"/>
									</td>
								</tr>
								<tr class="contentTr">
									<th>내용</th>
									<td colspan="2" class="content">
										<c:set value="${fn:indexOf(board.content, searchTxt)}" var="startIndex"/>
										<c:set value="${fn:length(searchTxt) + startIndex}" var="endIndex"/>
										<c:out value="${fn:substring(board.content, 0, startIndex)}"/>
										<span id="searchWord"><c:out value="${searchTxt}"/></span>
										<c:out value="${fn:substring(board.content, endIndex, fn:length(board.content))}"/>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="row">
						<div>
							이미지 게시판
						</div>
						<table class="table table-hover">
							<tr class="tableHeader">
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
							</tr>
							<c:if test="${empty imageList}">
								<tr>
									<td colspan="3" class="contentTr content">검색된 결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="board" items="${imageList}">
								<tr>
									<td>
										<c:out value="${board.boardNo}"/>
									</td>
									<td id="title">
										<a href="${pageContext.request.contextPath}/board/imageDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
										</a>
									</td>
									<td>
										<c:out value="${board.nickName}"/>
									</td>
								</tr>
								<tr class="contentTr">
									<th>내용</th>
									<td colspan="2" class="content">
										<c:set value="${fn:indexOf(board.content, searchTxt)}" var="startIndex"/>
										<c:set value="${fn:length(searchTxt) + startIndex}" var="endIndex"/>
										<c:out value="${fn:substring(board.content, 0, startIndex)}"/>
										<span id="searchWord"><c:out value="${searchTxt}"/></span>
										<c:out value="${fn:substring(board.content, endIndex, fn:length(board.content))}"/>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>