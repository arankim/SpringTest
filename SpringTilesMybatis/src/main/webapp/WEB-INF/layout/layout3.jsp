<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style type="text/css">
#cl-dashboard {
	display: none;
}
div.a {
	border: 0px solid gray;
}
#bottom {
	position: absolute;
	left: 300px;
	top: 870px;
	width: 700px;
	height: 80px;
	text-align: center;
}

#body {
	position: absolute;
	left: 300px;
	top: 250px;
	width: 1200px;
	height: 450px;
	padding-left: 200px;
}

</style>
</head>
<body>
	<%-- <div class="a" id="top">
		<tiles:insertAttribute name="header" />
	</div> --%>
	<div class="a" id="menu">
		<tiles:insertAttribute name="menu" />
	</div>

	<div class="a" id="body">
		<tiles:insertAttribute name="body" />
	</div>
	<%-- <div class="a" id="bottom">
		<tiles:insertAttribute name="footer" />
	</div> --%>

</body>
</html>