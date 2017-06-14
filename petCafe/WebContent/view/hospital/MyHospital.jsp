<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
			<c:forEach items="${hospitals}" var="h">
				<table>
					<tr>
						<th>id</th>
						<td id="hospitalId">${h.hospitalId}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td id="name">
							<a href="${pageContext.request.contextPath}/hospital/detail?hospitalId=${h.hospitalId}">${h.name}</a>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td id="address">${h.address}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td id="telNumber">${h.telNumber}</td>
					</tr>
					<tr>
						<th>위도</th>
						<td id="latitude">${h.latitude}</td>
					</tr>
					<tr>
						<th>경도</th>
						<td id="longitude">${h.longitude}</td>
					</tr>
					<tr>
						<th>원장</th>
						<td id="memberId">${h.memberId}</td>
					</tr>
				</table>
				<hr>
			</c:forEach>
			
			<div id="map" style="width:100%;height:350px;"></div>
		
			<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=b3aef8f92a8bdd9510a7905608389df3"></script>
			<script>
				var hospitalId = document.querySelectorAll("#hospitalId");
				var hospitalName = document.querySelectorAll("#name");
				var address = document.querySelectorAll("#address");
				var telNumber = document.querySelectorAll("#telNumber");
				var latitude = document.querySelectorAll("#latitude");
				var longitude = document.querySelectorAll("#longitude");
				var memberId = document.querySelectorAll("#memberId");
			    
				var hospital = [{}];
				for (var i = 0; i < hospitalId.length; i++) {
					hospital[i] = {
							hospitalId : hospitalId[i].innerHTML,
							hospitalName : hospitalName[i].innerHTML,
							address : address[i].innerHTML,
							telNumber : telNumber[i].innerHTML,
							latitude : latitude[i].innerHTML,
							longitude : longitude[i].innerHTML,
							memberId : memberId[i].innerHTML
					}
				}
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new daum.maps.LatLng(35.5549272063, 129.3204590667), // 지도의 중심좌표
				        level: 12 // 지도의 확대 레벨
				    };
				
				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				var positions = [{}];
				var infos = [{}];
		// 		마커를 표시할 위치와 title 객체 배열입니다 
				for(var i = 0; i < hospital.length; i++) {
					positions[i] = {
						        title: hospital[i].hospitalId, 
						        latlng: new daum.maps.LatLng(hospital[i].latitude, hospital[i].longitude)
						    	}
				}
				//
				for(var i = 0; i < hospital.length; i++) {
					infos[i] = {
					        title: hospital[i].hospitalId,
					        hospitalName: hospital[i].hospitalName,
					        address: hospital[i].address
				    	}
				}
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				
				var iwContent = "";
				var marker = [{}];
				for (var i = 0; i < positions.length; i ++) {
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new daum.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    marker[i] = new daum.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage, // 마커 이미지 
				        clickable: true
				    });
				
				}
				for(var i = 0; i < marker.length; i++) {
					console.log(marker[i].dg);
				}
				var infowindow = [{}];
				for(var i = 0; i < infos.length; i++) {
				    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
					// 인포윈도우를 생성합니다
					infowindow[i] = new daum.maps.InfoWindow({
		// 			    content : "<div>" + infos[i].title + "<br>" + infos[i].hospitalName + "<br>" + infos[i].address + "</div>",
					    content : '<div style="padding:5px;"><a href=${pageContext.request.contextPath}/hospital/CareTypeForm?hospitalId=' + infos[i].title +'>진료분야 등록하기</a><br><p>병원이름 : ' + infos[i].hospitalName + '</p><p>주소 : ' + infos[i].address + '</p><br></div>',
					    removable : iwRemoveable
					});
					// 마커에 클릭이벤트를 등록합니다
				}
				console.dir(infowindow.content);
				// 클로저
				for(let i = 0; i < infowindow.length; i++) {
		// 			console.log(infowindow[i].content);
					daum.maps.event.addListener(marker[i], 'click', function() {
		// 			      // 마커 위에 인포윈도우를 표시합니다
					      infowindow[i].open(map, marker[i]);  
					});
				}
			</script>
	</div>
	</div>
</div>
<div>
	<jsp:include page="/view/include/footer.jsp"/>
</div>
</body>
</html>