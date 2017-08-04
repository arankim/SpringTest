<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
</style>
</head>
<body>
<form action="login/logoutaction.jsp" method="post">
	<%
		String id=(String)session.getAttribute("idok");
	%>
	<jsp:useBean id="db" class="db.dao.MemberDao"/>
	<b style="margin-left: 20px; color: blue;">
	<%=db.getName(id) %></b>님이 로그인 했습니다.
	<span style="margin-left: 250px;">
	<input type="button" value="로그아웃"
	class="btn btn-primary btn-lg"
	style="width: 110px;"
	onclick="location.href='login/logoutaction.jsp'">
	
	</span>	
	<img src="image/success.PNG"
	style="margin-left: -150px;width: 970px;"/>
</form>
</body>
</html>