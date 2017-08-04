<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
<!-- 가져올 xml데이타가 크로스도메인이라서 아래 js파일을 두개 더 추가함. -->
<script type="text/javascript" src="../js/xml2json.js"></script>
<script type="text/javascript" src="../js/jquery.xdomainajax.js"></script>

<script type="text/javascript">
	//<![CDATA[
	function searchWeather() {
		var url = "http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
		var local = $("#local").val();
		var flag;
		var rowHtml = "";
		console.log(local);
		$.ajax({
			url : url,
			type : 'GET',
			success : function(res) {
				var myXML = res.responseText;
				myXML = $.parseXML(myXML)
		;		$(myXML).find("local").each(function(no) {

					if (local == $(this).text()) {
						flag = "true";
						rowHtml += "<br>"+"기온 : "+$(this).attr("ta")+"<br>";
						rowHtml += "날씨: "+$(this).attr("desc");
						rowHtml += $(this).attr("icon")
						return false;
					} else {
						flag = "false";
					}
				});
				console.log(flag);
				
				if (flag=="true") {
					$(myXML).find("weather").each(function() {
								var firstrowHtml = $(this).attr("year") + "-"
										+ $(this).attr("month") + "-"
										+ $(this).attr("day") + "&nbsp;&nbsp;"
										+ $(this).attr("hour") + "시 " + local +"의 현재 날씨";
								$("#result").append(firstrowHtml);
							});
				

						$("#result").append(rowHtml);

				} else {
					$("#result").text("해당지역이 없습니다.");
				}
			}
		});

	}

	$(function() {
		$("#result").hide();
		$("#ok").click(function() {
			$("#result").text("");
			searchWeather();
			$("#result").show();
		});
	});
</script>
</head>
<body>
	<input type="text" id="local">
	<input type="button" id="ok" value="확인">
	<div id="result"></div>
</body>
</html>