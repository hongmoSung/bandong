<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀캘린더</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom2.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/fullcalendar.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/fullcalendar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/locale-all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/gcal.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<style type="text/css">
    body {
        margin : 40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
    img {
    	width : 120px;
    	height : 80px;
    }
    
    .fc-day-top.fc-sat.fc-past { color:#0000FF; }
    .fc-day-top.fc-sat.fc-future { color:#0000FF; }
    .fc-day-top.fc-sun.fc-past { color:#FF0000; }
    .fc-day-top.fc-sun.fc-future { color:#FF0000; }
</style>

<script type="text/javascript">
	var testObj = [{
			  start : "2017-06-16"
			, title : "휴원일"
			, color : "#FF0000"
	}];
	
	var testArr = [
		<c:forEach var="index" begin="0" end="${fn:length(list) - 1}" varStatus="loop">
			<c:if test="${not loop.first}">,</c:if>
			{
				<c:if test="${not empty list[index].reserDate}">
					"start":"<c:out value='${list[index].reserDate}'/>T<c:out value='${list[index].reserTime}'/>",
				</c:if>
				"title": "테스트 중임"
			}
		</c:forEach>
	];
	
// 	testObj["backgroundColor"] = "#99CCFF";
// 	testObj["rendering"] = "background";

/*
	jQuery(document).ready(function() {
		jQuery("#calendar").fullCalendar({
			  locale : "ko"
			, editable : true
            , eventLimit : true
            , events: [
//                 {
//                       title : "All Day Event"
//                     , start : "2016-05-01"
//                 },
//                 {
//                       title : "Long Event"
//                     , start : "2016-05-07"
//                     , end : "2016-05-10"
//                 },
//                 {
//                       id : 999
//                     , title : "Repeating Event"
//                     , start : "2016-05-09T16:00:00"
//                 },
//                 {
//                       id : 999
//                     , title : "Repeating Event"
//                     , start : "2016-05-16T16:00:00"
//                 },
//                 {
//                       title : "Conference"
//                     , start : "2016-05-11"
//                     , end : "2016-05-13"
//                 },
//                 {
//                       title : "Meeting"
//                     , start : "2016-05-12T10:30:00"
//                     , end : "2016-05-12T12:30:00"
//                 },
//                 {
//                       title : "Lunch"
//                     , start : "2016-05-12T12:00:00"
//                 },
//                 {
//                       title : "Meeting"
//                     , start : "2016-05-12T14:30:00"
//                 },
//                 {
//                       title : "Happy Hour"
//                     , start : "2016-05-12T17:30:00"
//                 },
//                 {
// 					  backgroundColor : "#99CCFF"
// 					, start : "2017-06-13"
// 					, end : "2017-06-15"
// 					, rendering : "background"
//                 },
//                 {
//                       title : "Birthday Party"
//                     , start : "2016-05-13T07:00:00"
//                 },
//                 {
//                       title : "Click for Google"
//                     , url : "http://google.com/"
//                     , start : "2016-05-28"
//                 },
                testObj
                
//                 if(true) {
//                 	console.log("console test");
//                 }
                
//                 if(testArr.length != 0) {
//                 	console.log("if enter");
//                 	for(var arrIndex = 0; arrIndex < testArr.length; arrIndex++) {
//                 		console.log("arrIndex", arrIndex);
//                 	}
//                 }
            ]
        });
*/
	var selectedDate;
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate value="${now}" var="todayYear" pattern="yyyy"/>
	<fmt:formatDate value="${now}" var="todayMonth" pattern="MM"/>
	<fmt:formatDate value="${now}" var="todayDate" pattern="dd"/>
	jQuery(document).ready(function() {
		jQuery("#calendar").fullCalendar({
			  locale : "ko"
			, editable : false
	        , eventLimit : true
	        , eventSources : [
				{	
					  events : testArr
				},
				{
					  events : testObj
// 				 	, imageurl : "${pageContext.request.contextPath}/images/no-diagnosis.jpg"
// 				 	, backgroundColor : "#99CCFF"
// 					, rendering : "background"
				},
				{
					  events : [{
							imageurl : "${pageContext.request.contextPath}/images/no-diagnosis.jpg"
							, start : "2017-06-23"
							, color : "#FFFFFF"
					  }]
				},
// 				{
// 					  events : [{
// 						  start : "2017-06-20"
// 						  , title : "aaaaa"
// 					  }]
					  
// 				},
				{
					  googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
					, className : "koHolidays"
					, color : "#FF0000"
				}
	        ]
			, eventRender : function (event, eventElement) {
				if(event.imageurl) {
					eventElement.find("span.fc-title").prepend("<center><img src='" + event.imageurl + "'><center>");
				}
			}
			, eventMouseover : function (event, jsEvent) {
// 				$(this).attr("title", "Popover title");
// 				$(this).attr("data-container", "body"); 
// 				$(this).attr("data-toggle", "popover");
// 				$(this).attr("data-placement", "right"); 
// 				$(this).attr("data-content", "test Text");
// 				$(this).attr("data-trigger", "hover");
				
// 				$('[data-toggle="popover"]').popover({container: "body"});
			}
			, dayClick : function(date, jsEvent, view) {
				if(selectedDate) {
					$(selectedDate).css('background-color', '#FFFFFF');
					$(selectedDate).popover("destroy");
				}
				selectedDate = this;
				document.getElementById("reserBtn").disabled = true;
				if(!$(this)["data-toggle"]) {
					$(this).attr("title", date.format("YYYY-MM-DD"));
					$(this).attr("data-container", "body"); 
					$(this).attr("data-toggle", "popover");
					$(this).attr("data-placement", "right"); 
	
					var todayReser;
					var reserOK = false;
					var reserCount = 0;
					for(i = 0; i < testArr.length; i++) {
						var testing = testArr[i].start;
						var testing2 = "test";
						if(${todayYear} - date.format("YYYY") < 0) {
							document.getElementById("reserBtn").disabled = false;
							reserOK = true;
						}
						else if(${todayYear} - date.format("YYYY") == 0) {
							if(${todayMonth} - date.format("MM") <= 0) {
								if(${todayDate} - date.format("DD") < 0) {
				// 					$("#reserBtn").disabled = false;
									document.getElementById("reserBtn").disabled = false;
									reserOK = true;
								}
							}
						}
						if(reserOK) {
							if(testing.substring(0, 10) == date.format("YYYY-MM-DD")) {
								reserCount++;
								if(!todayReser) {
									todayReser = testing.substring(11, 16) + " " + testArr[i].title;
								}
								else {
									todayReser += testing.substring(11, 16) + " " + testArr[i].title;
								}
							}
						}
						else {
							todayReser = "지난 날짜에는 예약할 수 없습니다. T_T";
						}
						$(this).attr("data-content", todayReser);
					}
					if(reserCount >= 2) {
						$(this).attr("data-content", "더이상 예약 할 수 없습니다");
						document.getElementById("reserBtn").disabled = true;
					}
					$('[data-toggle="popover"]').popover({container: "body"});
				}
				$(this).css('background-color', '#99CCFF');
				
			}
			, googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE" 
    	});
    });
</script>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover({container: "body"});
	});
</script>
<body>
	<div class="container">
		<div>
			<c:import url="/view/include/topMenu.jsp"/>
		</div>
		<div class="row" id="firstDiv">
			<div class="col-md-2">
				<c:import url="/view/include/leftMenu.jsp"/>
			</div>
			<div id="calendar" class="col-md-10 cont">
				<div>
					<button class="btn btn-primary btn-xl page-scroll" disabled="true" id="reserBtn">예약하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>