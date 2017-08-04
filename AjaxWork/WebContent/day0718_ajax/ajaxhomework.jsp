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

#out {
	position: absolute;
	left: 500px;
	top: 50px;
	width: 500px;
	height: 800px;
	border: 1px solid black;
}

#in{
	top: 50px;
}
#likeimg{
cursor: pointer;
}

.likechu{
font-size: 8pt;
color: red;
}
</style>
<script type="text/javascript">

	function chat() {
		var mes = $("#mes").val();
		
		$.ajax({
			type : 'GET',
			url : 'ajaxhomework_xml.jsp',
			dataType : 'xml',
			data : {"mes":mes},
			success : function(redata) {
				var str = "";
				$(redata).find("chatlist").each(function() {
					var r = $(this);
					str += "익명님의 메세지 :  " + r.find("msg").text() +"&nbsp;&nbsp;&nbsp;"+ r.find("writeday").text();
					str += "&nbsp;&nbsp;&nbsp;"+"<img src='../image4/like_2.png' width='20' id='likeimg'>";
					str += "<span id='chu"+r.find("num").text()+"' class='likechu'>";
					str += "&nbsp;"+ r.find("chu").text()+"</span>";
					str += "<br>"
				});
				$("#out").append(str);
			},
			statusCode : {
				404 : function() {
					alert("해당 파일이 없어요");
				},
				505 : function() {
					alert("서버 오류에요");
				}
			}
		});
	}

	$(function() {
		$("#ok").click(function() {
			chat();
		});

		$("#mes").keyup(function(e) {
			if (e.keyCode == 13) {
				chat();
				$("#mes").val('');
			}
		});
		
		$(document).on("click","#likeimg",function(){
			var imgname = $(this).attr("src");
			var lik = 0;
			if(imgname == '../image4/like_2.png'){
				var chu = parseInt($(this).next().text());
				chu++;
				$(this).next().text(chu);
				imgname = "../image4/like_1.png";
				like = 1;
			} else {
				imgname = "../image4/like_2.png";
				var chu = parseInt($(this).next().text());
				chu--;
				$(this).next().text(chu);
				like = 0;
			}
			$(this).attr("src",imgname);
		});
	});
</script>
</head>
<body>
<div id = "in">
	<b>익명으로 메세지를 남겨보세요.</b>
	<input type="text" id="mes">
	<input type="button" value="ok" id="ok">
</div>
	<div id="out" align="left"></div>
</body>
</html>