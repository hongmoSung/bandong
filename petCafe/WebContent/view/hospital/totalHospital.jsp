<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${hospitals}" var="h">
		<table>
			<tr>
				<th>id</th>
				<td id="hospitalId">${h.hospitalId}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td id="name">${h.name}</td>
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
		var name = document.querySelectorAll("#name");
		var address = document.querySelectorAll("#address");
		var telNumber = document.querySelectorAll("#telNumber");
		var latitude = document.querySelectorAll("#latitude");
		var longitude = document.querySelectorAll("#longitude");
		var memberId = document.querySelectorAll("#memberId");
// 		console.dir(hospitalId);
	    
		var hospital = [{}];
		for (var i = 0; i < hospitalId.length; i++) {
			hospital[i] = {
					hospitalId : hospitalId[i].innerHTML,
					name : name[i].innerHTML,
					address : address[i].innerHTML,
					telNumber : telNumber[i].innerHTML,
					latitude : latitude[i].innerHTML,
					longitude : longitude[i].innerHTML,
					memberId : memberId[i].innerHTML
			}
		}
		console.log(hospital);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new daum.maps.LatLng(35.5549272063, 129.3204590667), // 지도의 중심좌표
		        level: 16 // 지도의 확대 레벨
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
		for(var i = 0; i < hospital.length; i++) {
			infos[i] = {
			        title: hospital[i].hospitalId, 
			    	}
			}
		console.log(positions);				
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		
		var iwContent = "";
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new daum.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage, // 마커 이미지 
		        clickable: true
		    });
		
		}
		for(var i = 0; i < infos.length; i++) {
// 			var iwContent = '<div style="padding:5px;">ㅜㅜ</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
			//
			
			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
			    content : infos[i].title,
			    removable : iwRemoveable
			});
			// 마커에 클릭이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindow.open(map, marker);  
			});
		}
		
	</script>
</body>
</html>