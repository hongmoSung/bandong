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
</head>
<body>
<div>
	<jsp:include page="/view/include/topMenu.jsp"/>
</div>
<div class="container">
	<div class="row" id="firstDiv">
		<div class="col-md-2">
			<jsp:include page="/view/include/leftMenu.jsp"/>
		</div>
		<div class="col-md-10">
			<div class="center-block text-center" style="width: 500px; margin-bottom: 25px;">
				<h1>병원 정보 등록</h1>
			</div>
			<c:set value="${hospital}" var="h"/>
			<div class="center-block" style="width: 500px;">
				<form method="post">
					<div class="form-group">
						<label class="control-label col-sm-3">병원 아이디</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.hospitalId}" name="hospitalId" id="hospitalId" readonly="readonly">
						</div>
						<label class="control-label col-sm-3">병원명</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.name}" name="hospitalName" id="hospitalName" readonly="readonly">
						</div>
						<label class="control-label col-sm-3">전화번호</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.telNumber}" name="telNumber" id="telNumber" readonly="readonly">
						</div>
						<label class="control-label col-sm-3">병원 주소</label>
						<div class="col-sm-9">
							<input class="form-control" type="hidden" value="${h.address}" name="address" id="address" readonly="readonly">
						</div>
<!-- 						<label class="control-label col-sm-3">위도</label> -->
						<div class="col-sm-9">
							<input class="form-control" type="hidden" value="${h.latitude}" name="latitude" id="latitude" readonly="readonly">
						</div>
<!-- 						<label class="control-label col-sm-3">경도</label> -->
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.longitude}" name="longitude" id="longitude" readonly="readonly">
						</div>
						<label class="control-label col-sm-3">회원ID</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" value="${h.memberId}" name="memberId" id="memberId" readonly="readonly">
						</div>
					</div>
					<div>
						<h1>진료분야</h1>
						<label>진료분야</label><input type="text" name="typeName" id="typeName">
						<button type="button" id="careBtn">등록</button>
<!-- 						<div id="result"></div> -->
						<c:forEach items="${careList}" var="c">
								<div id="careDiv">
									<input type="hidden" value="${c.careTypeId}" id="careTypeId" name="careTypeId"/>
									<input type="hidden" value="${c.hospitalId}" id="hospitalId" name="hospitalId"/>
									<input type="text" value="${c.typeName}"><button id="careDelBtn"><a href="careDelete?careTypeId=${c.careTypeId}&hospitalId=${c.hospitalId}">삭제</a></button><br>
								</div>
						</c:forEach>
					</div>
					<div>
						<h1>휴일등록</h1>
						<label>휴일등록</label><input type="text" name="offDay" id="offDay" placeholder="yyyy-MM-dd">
						<button type="button" id="dayOffBtn">등록</button>
						<c:forEach items="${dayOffList}" var="d">
								<div id="result">
									<input type="text" value="${d.dayoffId}" hidden="true" id="dayoffId" name="dayoffId">
									<input type="text" value="${d.hospitalId}" hidden="true" id="hospitalId" name="hospitalId">
									<input type="text" value="${d.offDay}" id="offDay" name="offDay"><button id="offDay"><a href="offDayDelete?dayoffId=${d.dayoffId}&hospitalId=${d.hospitalId}">삭제</a></button><br>
								</div>
						</c:forEach>
					</div>
					<script type="text/javascript">
					$("#dayOffBtn").on("click", function() {
						swal("버튼클릭");
						var offDay = document.querySelector("#offDay");
						var hospitalId = document.querySelector("#hospitalId");
						$.ajax({
							type : "post",
							data : {offDay : offDay.value, hospitalId : hospitalId.value},
							url : "ajaxDayOffInsert",
							dataType : "json",
							success : function (data) {}
						});
					});
						
					$("#careBtn").on("click", function() {
						var typeName = document.querySelector("#typeName");
						var hospitalId = document.querySelector("#hospitalId");
						var result = document.querySelector("#careDiv");
						var idNum = 0;
						$.ajax({
							type : "post",
							data : {
								"typeName" : typeName.value, "hospitalId" : hospitalId.value, "result" : careDiv.value, "idNum" : idNum++
							},
							url : "ajaxCareInsert",
// 							dataType : "json",
							success : function (data) {
// 								var care = data;
// 								var html = "";
// 									for(var i = 0; i < care.length; i++) {
// 										var m = care[i];
// 										html += "<p> 진료분야 :" + m.typeName + "</p>";
// 										html += "<input type='text' value='" + m.dayoffId + "hidden='true' id='dayoffId' name='dayoffId'><input type='text' value='" + m.hospitalId + "hidden='true' id='hospitalId' name='hospitalId'><input type='text' value='" + m.offDay + "id='offDay' name='offDay'><button id='offDay'><a href='offDayDelete?dayoffId=" + m.dayoffId + "&hospitalId=" + m.hospitalId + ">삭제</a></button><br>";
// 										html += "<input type='hidden' value='" + m.hospitalId + "' name='hospitalId' id='hospitalId'/>"
// 										      + "<input type='hidden' value='" + m.careTypeId + "' name='careTypeId' id='careTypeId'/>"
// 										      + "<input type='text' value='" + m.typeName + "'/><button>삭제</button><br>";
// 									}
									$("#careDiv").html($("#careDiv").html() + data);
									typeName.value="";
								swal("등록되었습니다.", "success!!","success");
							}
						});
					});
					
					function deleteBtn(delNo) {
						$.ajax({
							type : "post",
							data : {
								"typeName" : typeName.value, "hospitalId" : hospitalId.value, "result" : result.value, "idNum" : idNum++
							},
							url : "ajaxCareInsert",
							success : function (data) {
								$("#careDiv > input#careName" + delNo).html("");
								swal("삭제되었습니다.", "success!!","success");
							}
						});
					}
					</script>
				</form>
			</div>
		</div>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>