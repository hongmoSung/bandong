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
<div><c:import url="/view/include/topMenu.jsp"></c:import> </div>
<div>
<form name='bForm' action="boardInsert" method="post" enctype="multipart/form-data" onsubmit="return chkForm();">

	<c:set var="member" value="${member.memberId}"/>
	
	게시판 유형<select name="boardType" onchange="innerSelect(this.value);">
		<option value='0'>선택</option>
		<c:if test="${member eq 'admin'}">
		<option value='notice'>공지사항</option>
		</c:if>		
		<option value='sale'>분양게시판</option>
		<option value='tip'>tip 게시판</option>
		<option value='image'>이미지게시판</option>
	</select><br>
	
		
	제목 : <input type="text" name="title"/><br>
	내용 : <textarea name="content" rows="5" cols="70"></textarea><br>
	<div id='file'></div>
	
<input type="submit" value="등록" />
<input type='reset' value='재입력'/>
</form>
<c:set var="type" value="${board.boardType}"/>
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

</div>
<div><c:import url="/view/include/footer.jsp"></c:import> </div>
</div>
<script>
	function chkForm() {
		var f = document.bForm;
		var title = f.title;
		var content = f.content;
		
		if(title.value == "") {
			alert("제목을 입력하세요");
			title.focus();
			return false;
		}
		if(content.value == "") {
			alert("내용을 입력하세요");
			content.focus();
			return false;
		}
		if(f.boardType.selectedIndex == 0){
			alert("게시판 유형을 선택하세요");
			return false;
		}
	}
	
	function innerSelect(val){
		var imgFile = document.querySelector("#file");
		if (val == "image") {
			imgFile.innerHTML = "첨부파일 : <input type='file' name='attachFile'/> <br>";
		}else {
			imgFile.innerHTML = "";
		}
	}


</script>

</body>
</html>