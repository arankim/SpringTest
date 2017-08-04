<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}

/*레이아웃*/
div {
	border: 0px solid black;
}

#title {
	position: absolute;
	left: 350px;
	top: 20px;
	width: 400px;
	height: 55px;
}

#count {
	position: absolute;
	left: 50px;
	top: 20px;
	width: 180px;
	height: 50px;
}

#garomenu {
	position: absolute;
	left: 150px;
	top: 80px;
	width: 800px;
	height: 60px;
	text-align: center;
}

#main{
position: absolute;
left: 150px;
top: 179px;
width: 800px;
height: 500px;
}
</style>
</head>
<body>
	<%
		String main = request.getParameter("main");
		if (main == null) {
			main = "main.jsp";
		}
	%>
	<div id="title">
		<jsp:include page="title.jsp" />
	</div>
	<div id="count">
		<jsp:include page="count.jsp" />
	</div>

	<div id="garomenu">
		<jsp:include page="garomenu.jsp" />
	</div>
	<div id="main">
		<jsp:include page="<%=main%>" />
	</div>
</body>
</html>