<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>꼬리 카페</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom2.css" rel="stylesheet">

<style>
	.row {
  		margin-bottom: 4px;
		margin-top: 10px;
	}
	.thumbnail {
		border: none; 
		font-size: 12px;
		width: 120px;
		height: 160px;
		margin-botton: 0px;
	}
	.imgList {
		width: 140px;
		height: auto;
	}

	#main-carousel {
		margin-top: 40px;
	}
	.carousel-control {
		text-shadow: none;
		opacity: 0;
	}
	.col-sm-8.col-md-4 {
		padding-right: 4px;
		padding-left: 4px;
	}
	
</style>

</head>

<body>
<div class="container">
	<div>
		<c:import url="/view/include/topMenu.jsp"/>
	</div>
	
	<div class="row">
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
	
		<div class="col-md-5 cont">
			<div>
				<a href="${pageContext.request.contextPath}/board/noticeList">공지사항</a><br>
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
		
				이미지 게시판<br>
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
										<img class="imgList" src="${uploadPath}${fileList[index].filePath}/${fileList[index].systemName}"/>
										<div class="caption">
											<c:out value="${boardListImage[index].title}"/><br>
											<c:out value="${boardListImage[index].nickName}"/>
										</div>
									</c:when>
									<c:otherwise>
										<img class="imgList" src="${pageContext.request.contextPath}/images/no-image.jpg"/>
										<div class="caption">
											<p><c:out value="등록된 이미지가 없습니다"/></p>
											<p></p>
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