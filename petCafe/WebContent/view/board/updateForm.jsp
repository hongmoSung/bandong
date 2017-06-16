<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
		<!-- sweet -->
	<script src="${pageContext.request.contextPath}/sweet/sweetalert.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/sweet/sweetalert.css"/>
	
	<style>
	select {
	    width: 150px;
	    height: 20px;
	    padding-left: 10px;
	    font-size: 12px;
	    color: #006fff;
	    border: 1px solid #006fff;
	    border-radius: 3px;
	    -webkit-appearance: none; 
	   -moz-appearance: none;    
	   appearance: none;
	   background: aliceblue no-repeat 95% 50%; /* 화살표 아이콘 추가 */       
	}	
	.topTitle {
		font-size: 40px;
	}
	.reBo, .reset {
		background-color: lavender;
		width: 50px;
		padding: 5px 8px;
		border: 1px solid navy;
		border-radius: 4px;
		margin: 5px;
		float: left;
		font-size: 10px;
		color : navy;
	}
	#file, #title, #content{
		margin: 20px;
	}
	
	</style>
</head>
<body>
<div class="container">

<!-- top -->
	<div><c:import url="/view/include/topMenu.jsp"/> </div>
	<div class="row" id="firstDiv">

<!-- left -->
		<div class="col-md-2"><c:import url="/view/include/leftMenu.jsp"/></div>
	
		<div class="col-md-10 cont">
<!-- 본문 -->
			<div>
			<p class="topTitle"> 게시물 등록 </p>
			<hr>
				<c:set var="type" value="${board.boardType}"/>
				<form name= "bForm" action="boardUpdate" method='post' onsubmit="return chkForm();" enctype="multipart/form-data">
					  <input type='hidden' name='boardNo' value='<c:out value="${board.boardNo}" />'>
					  <input type='hidden' name='boardType' value='<c:out value="${type}" />'>
					  <table>
					  	<tr>
						  	<td>게시판 유형</td>
						  	<td>
						  		<select disabled="disabled" name="boardType" onchange="innerSelect(this.value);">
									<option value='${type}' selected="selected">
										<c:choose>				
											<c:when test="${type eq 'notice'}"><c:out value="공지사항"/></c:when>
											<c:when test="${type eq 'sale'}"><c:out value="분양게시판"/></c:when>
											<c:when test="${type eq 'tip'}"><c:out value="tip 게시판"/></c:when>
											<c:when test="${type eq 'image'}"><c:out value="이미지게시판"/></c:when>
										</c:choose>
									</option>
								</select>
							</td>
					  	</tr>
					  	<tr>
						  	<td id="title">제목</td>
						  	<td><input type='text' name='title' value='<c:out value="${board.title}"/>'/></td>
					  	</tr>
					  	<tr id="content">
						  	<td>내용</td>
						  	<td><textarea name='content' rows="5" cols="70" style="resize: none;"><c:out value="${board.content}"/></textarea></td>
					  	</tr>
				  	</table>
				  	<c:if test="${type eq 'image'}">
					  	기존 이미지 : <img src="${uploadPath}${file.filePath}/${file.systemName}"/><br>
					  <!-- 	<input type='file' name='attachFile'/><c:out value='${uploadPath}${file.filePath}/${file.systemName}'/> <br> -->
						수정할 이미지 : <input type='file' id="file" name='attachFile'/><br>
				  	</c:if>
				  	<span id='file'></span>
				  	<input type="submit" value="수정"/>
				  	<input type='reset' value='재입력'/>
					<c:choose>
						<c:when test="${type eq 'notice'}">
							<a href="noticeList">목록</a>
						</c:when>
						<c:when test="${type eq 'sale'}">
							<a href="saleList">목록</a>
						</c:when>
						<c:when test="${type eq 'tip'}">
							<a href="tipList">목록</a>
						</c:when>
						<c:when test="${type eq 'image'}">
							<a href="imageList">목록</a>
						</c:when>
					</c:choose>
				</form>
				
			</div>
		</div>
	</div>
	<div><c:import url="/view/include/footer.jsp"></c:import> </div>
</div>
<script>
	function chkForm() {
		var f = document.bForm;
		var title = f.title;
		var content = f.content;
		
		if(title.value == "") {
			swal("제목을 입력하세요");
			title.focus();
			return false;
		}
		if(content.value == "") {
			swal("내용을 입력하세요");
			content.focus();
			return false;
		}
	}
</script>
</body>
</html>