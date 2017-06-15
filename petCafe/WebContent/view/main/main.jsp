<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>꼬리 카페</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="../css/custom2.css" rel="stylesheet"> -->

<style>
	body {
		background-color: #EEEEEE
	}
	.carousel-control {
		text-shadow: none;
		opacity: 0;
	}
	.col-sm-8.col-md-4 {
		padding-right: 4px;
		padding-left: 4px;
	}
	.table > tbody > tr > td {
		text-align: center;
	}
	.table > tbody > tr > #title {
		text-align: left;
	}
	.more > a {
		font-size: 12px;
	}
	span.captionTitle {
		width: 80px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		display: inline-block;
	}
	p.captionP {
		margin-bottom: 0px;
	}
	div.mainBoardFour {
	    width: 450px;
    	height: 350px;
    	border-radius: 20px;
    	background: #FFFFFF;
    	margin: 10px;
	}
</style>

</head>

<body>
<div class="container">
	<div>
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	
	<div class="row" id="firstDiv">
		<div id="main-carousel" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#main-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#main-carousel" data-slide-to="1"></li>
				<li data-target="#main-carousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/images/Two-dogs-and-cat.jpg" >
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/images/Two-dogs.jpg" >
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/images/cat.jpg" >
				</div>
			</div>
			<a class="left carousel-control" href="#main-carousel" data-slide="prev">
				<span class="icon-prev"></span>
			</a>
			<a class="right carousel-control" href="#main-carousel" data-slide="next">
				<span class="icon-next"></span>
			</a>
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
			<c:import url="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10">
			<div class="row">
				<div class="col-md-5 cont mainBoardFour">
					<jsp:useBean id="now" class="java.util.Date"/>
					<fmt:formatDate value="${now}" var="today" pattern="yyyyMMddHH"/>
					<div class="row">
						<div class="col-xs-4 boardType">
							<a href="${pageContext.request.contextPath}/board/noticeList">공지사항</a>
						</div>
						<div class="col-xs-6"></div>
						<div class="col-xs-2 more">
							<a href="${pageContext.request.contextPath}/board/noticeList">더보기</a>
						</div>
					</div>
					<div>
						<table class="table table-condensed table-hover">
							<c:forEach var="board" items="${boardListNotice}">
								<tr>
									<td id="title">
										<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="yyyyMMddHH"/>
										<a href="${pageContext.request.contextPath}/board/noticeDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
											<c:if test="${today-writeDate <= 3}">
												<span class="new">new</span>
											</c:if>
										</a>
									</td>
									<td>
										<c:out value="${board.nickName}"/>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="col-md-5 cont mainBoardFour">
					<div class="row">
						<div class="col-xs-4 boardType">
							<a href="${pageContext.request.contextPath}/board/saleList">분양 게시판</a>
						</div>
						<div class="col-xs-6"></div>
						<div class="col-xs-2 more">
							<a href="${pageContext.request.contextPath}/board/saleList">더보기</a>
						</div>
					</div>
					<div>
						<table class="table table-condensed table-hover">
							<c:forEach var="board" items="${boardListSale}">
								<tr>
									<td id="title">
										<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="yyyyMMddHH"/>
										<a href="${pageContext.request.contextPath}/board/saleDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
											<c:if test="${today-writeDate <= 3}">
												<span class="new">new</span>
											</c:if>
										</a>
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
			<div class="row">
				<div class="col-md-5 cont mainBoardFour">
					<div class="row">
						<div class="col-xs-4 boardType">
							<a href="${pageContext.request.contextPath}/board/tipList">양육TIP</a>
						</div>
						<div class="col-xs-6"></div>
						<div class="col-xs-2 more">
							<a href="${pageContext.request.contextPath}/board/tipList">더보기</a>
						</div>
					</div>
					<div>
						<table class="table table-condensed table-hover">
							<c:forEach var="board" items="${boardListTip}">
								<tr>
									<td id="title">
										<fmt:formatDate value="${board.regDate}" var="writeDate" pattern="yyyyMMddHH"/>
										<a href="${pageContext.request.contextPath}/board/tipDetail?boardNo=<c:out value='${board.boardNo}'/>">
											<c:out value="${board.title}"/>
											<c:if test="${today-writeDate <= 3}">
												<span class="new">new</span>
											</c:if>
										</a>
									</td>
									<td>
										<c:out value="${board.nickName}"/>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="col-md-5 cont mainBoardFour">
					<div class="row">
						<div class="col-xs-5 boardType">
							<a href="${pageContext.request.contextPath}/board/imageList">이미지 게시판</a>
						</div>
						<div class="col-xs-4"></div>
						<div class="col-xs-3 more">
							<a href="${pageContext.request.contextPath}/board/imageList">더보기</a>
						</div>
					</div>
					<div class="row">
						<c:forEach var="index" begin="0" end="5">
							<c:if test="${index == 3}">
								</div>
								<div class="row">
							</c:if>
							<div class="col-sm-8 col-md-4">
								<div class="thumbnail">
									<c:choose>
										<c:when test="${not empty fileList[index]}">
											<a href="${pageContext.request.contextPath}/board/imageDetail?boardNo=<c:out value='${boardListImage[index].boardNo}'/>">
												<img class="imgList" src="${uploadPath}${fileList[index].filePath}/${fileList[index].systemName}"/>
											</a>
											<div class="caption">
											<%--
												<c:choose>
													<c:when test="${fn:length(title) >= 8}">
														<c:set value="${fn:substring(title, 0, 8)}..." var="subTitle"/>
														<c:out value="${subTitle}"/>
													</c:when>
													<c:otherwise>
														<c:out value="${title}"/>
													</c:otherwise>
												</c:choose>
											 --%>
												<c:set value="${boardListImage[index].title}" var="title"/>
												<fmt:formatDate value="${boardListImage[index].regDate}" var="writeDate" pattern="yyyyMMddHH"/>
												<p class="captionP">
													<a href="${pageContext.request.contextPath}/board/imageDetail?boardNo=<c:out value='${boardListImage[index].boardNo}'/>">
													 	<span class="captionTitle">
															<c:out value="${title}"/>
													 	</span>
												 	</a>
													<c:if test="${today-writeDate <= 3}">
														<span class="new">new</span>
													</c:if>
												</p>
											 	<p class="captionP">
													<span class="captionWriter"><c:out value="${boardListImage[index].nickName}"/></span>
											 	</p>
											</div>
										</c:when>
										<c:otherwise>
											<img class="imgList" src="${pageContext.request.contextPath}/images/no-image.jpg"/>
											<div class="caption">
												<p><c:out value="등록된 이미지가 없습니다"/></p>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div>
		<c:import url="/view/include/footer.jsp"/>
	</div>
</div>

<script>
	var divObj = $(".thumbnail");
	var imgObj = $(".imgList");
	var divAspect = 110 / 140;
	for(var index = 0; index < imgObj.length; index++) {
		var imgAspect = imgObj[index].height / imgObj[index].width;
		var imgWidthActual = divObj.offsetHeight / imgAspect;
	    var imgWidthToBe = divObj.offsetHeight / divAspect;
	    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
	    imgObj[index].style.cssText = 'width: auto; height: 110px; margin-left: '
	                      + marginLeft + 'px;';
	}
</script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>