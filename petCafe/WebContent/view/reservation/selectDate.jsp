<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>풀캘린더</title>
<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
    
    .fc-day-top.fc-sat.fc-past { color:#0000FF; }
    .fc-day-top.fc-sat.fc-future { color:#0000FF; }
    .fc-day-top.fc-sun.fc-past { color:#FF0000; }
    .fc-day-top.fc-sun.fc-future { color:#FF0000; }
</style>
<link href="../../css/fullcalendar.css" rel="stylesheet"/>
<link href="../../css/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="../../css/moment.min.js"></script>
<script type="text/javascript" src="../../css/jquery.min.js"></script>
<script type="text/javascript" src="../../css/fullcalendar.js"></script>
<script type="text/javascript" src="../../css/locale-all.js"></script>
<script type="text/javascript">
// 	$(function () {
// 		calendarEvent();
// 	});
// 	function calendarEvent(eventData) {
// 		$("#calendar").html("");
// 		var date = new Date();
// 		var d = date.getDate();
// 		var m = date.getMonth();
// 		var y =  date.getFullYear();
// 		var calendar = $('#calendar').fullCalendar({
// 			header: {
// 				left: "",
// 				center: "title",
// 				right: "today prev,next"
// 			},
// 			titleFormat: {
// 				month: "yyyy년 MMMM",
// 				week: "[yyyy] MMM dd일{[yyyy] MMM dd일}",
// 				day: "yyyy년 MMM d일 dddd"
// 			},
// 			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
// 			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
// 		    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
// 		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
// 			buttonText: {
// 				today: "오늘",
// 				month: "월별",
// 				week: "주별",
// 				day: "일별"
// 			},
// 			events: eventData,
// 			timeFormat: "HH:mm"
// 		});
// 		alert("test");
// 	}

	var testObj = {
		"title": "testtesttest",
		"start": "2017-06-20"
	};
// 	testObj["backgroundColor"] = "#99CCFF";
// 	testObj["rendering"] = "background";
	testObj["end"] = "2017-06-22";
	
	
	
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
            ]
        });
    });
</script>
<body>
    <div id="calendar"></div>
</body>
</html>