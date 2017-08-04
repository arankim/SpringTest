<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
	table{
		border: 2px groove gray;
	}
	tr,th,td{
		font-size: 10pt;
		border-bottom: 1px solid gray;
		border-right: 1px dotted green;
	}
	a:LINK {
		text-decoration: none;
		font-size: 10pt;
		color: black;
	}
	a:HOVER {
		text-decoration: underline;
		color: red;
	} 
</style>
</head>
<body>
<%
	String id=(String)session.getAttribute("idok");
%>
<jsp:useBean id="db" class="spring.dao.MemberDao"/>
<b style="margin-left: 20px; color: blue;">
</b> ${name }님이 로그인하였습니다
<span style="margin-left: 250px;">
	<input type="button" value="로그아웃"
	 class="btn btn-primary btn-lg"
	 style="width: 110px;"
	 onclick="location.href='logoutaction.do'">
</span>

<img src="../image/success2.PNG" 
style="margin-left: -150px;width: 970px;"/>
</body>
</html>