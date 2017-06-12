<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원정보</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row" id="firstDiv">
		<div>
			<jsp:include page="/view/include/topMenu.jsp"/>
		</div>
	</div>
	<div class="col-md-2">
		<c:import url="/view/include/leftMenu.jsp"/>
	</div>
	<div>
		<c:forEach items="${hospitals}" var="hospital">
				<input type="text" value="${hospital.hospitalId}" hidden="true"><br>
				<input type="text" value="${hospital.longitude}" id="longitude" hidden="true"><br>
				<input type="text" value="${hospital.latitude}" id="latitude" hidden="true"><br>
		</c:forEach>
			<div class="center-block text-center" style="width: 500px;">
				<h1>나의 병원정보</h1>
			</div>
			<div class="center-block text-center" style="width: 500px;">
				<table style="width: 100%">
					<tr>
						<th>이름</th>
						<td>
							<input type="text" value="${hospital.name}"><br>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" value="${hospital.telNumber}"><br>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" value="${hospital.address}"><br>
						</td>
					</tr>
				</table>
			</div>
			
			
			<div class="center-block" id="map" style="width:1000px;height:350px;"></div>
			
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b3aef8f92a8bdd9510a7905608389df3"></script>
			<script>
			
			var latitude = document.querySelector("#latitude");
			var longitude = document.querySelector("#longitude");
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
		// 	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        center: new daum.maps.LatLng(latitude.value, longitude.value), // 내 병원위치
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(latitude.value, longitude.value); 
			
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
			
			//
			var iwContent = '<div style="padding:5px;">"${hospital.name}"병원입니다.<br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new daum.maps.LatLng(latitude.value, longitude.value); //인포윈도우 표시 위치입니다
			
			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			</script>
		</div>
	</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
	
</body>
</html>
</body>
</html>