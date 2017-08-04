<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
	<%
		String root = request.getContextPath();
	%>
	<a href="<%=root%>/index.jsp"> <img src="<%=root%>/image/btn09.gif" align="left"
		hspace="20"> <b style="font-size: 23pt;">JSP 미니 프로젝트</b>
	</a>
</body>
</html>