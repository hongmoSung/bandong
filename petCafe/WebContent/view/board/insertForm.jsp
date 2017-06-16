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
			background-color: #CFFFEE;
			width: 50px;
			padding: 5px 5px;
			border: 0.5px solid navy;
			border-radius: 4px;
			margin: 5px;
			float: left;
			font-size: 13px;
			font-weight: 600;
			color : navy;
	}
	#file, #title, #content{
		margin: 20px;
	}
	input, textarea {
	-webkit-appearance: none;
	-moz-appearance: none;

		padding:5px 0px 0px 10px;
		border-radius: 4px;
	}
	input:focus, textarea:focus {
		outline: none;
	}
</style>
</head>
<body>
<div class="container">
	
<!-- top -->
	<div><c:import url="/view/include/topMenu.jsp"></c:import> </div>
	
<div class="row" id="firstDiv">
<!--  left -->
		<div class="col-md-2"><c:import url="/view/include/leftMenu.jsp"/></div>

<div class="col-md-10 cont">
<!-- 본문 -->

	<div>
		<p class="topTitle"> 게시물 등록 </p>
		<hr>
		<form name='bForm' action="boardInsert" method="post" enctype="multipart/form-data" onsubmit="return chkForm();">
			<c:set var="member" value="${member.memberId}"/>		
				게시판 유형    <select name="boardType" onchange="innerSelect(this.value);">
							<option value='0' >선택하세요</option>
							<c:if test="${member eq 'admin'}">
								<option value='notice'>공지사항</option>
							</c:if>		
							<option value='sale'>분양게시판</option>
							<option value='tip'>tip 게시판</option>
							<option value='image'>이미지게시판</option>
						</select><br>
	
				제목 <br>	
				<textarea id="title" name="title" rows="1" cols="20" style="resize: none;"></textarea><br>
				내용  <br>
				<textarea id="content" name="content" rows="7" cols="100" style="resize: none;"></textarea><br>
				<div id='file'></div>
	
				<input class="reBo" type="submit" value="등록" />
				<input class="reset" type='reset' value='재입력'/>
		</form>

	</div>
</div>

<!-- footer -->
<div><c:import url="/view/include/footer.jsp"></c:import> </div>
</div>
</div>
<script>
	function chkForm() {
		var f = document.bForm;
		var title = f.title;
		var content = f.content;
		var file = document.querySelector('#file');
		
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
		if(f.boardType.selectedIndex == 0){
			swal("게시판 유형을 선택하세요");
			return false;
		}
		if(f.attachFile.value == ""){
			swal("이미지를 첨부하세요");
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