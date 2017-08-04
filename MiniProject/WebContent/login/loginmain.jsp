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
<!-- 세션으로부터 loginok 값을 얻어서 null 이면 로그인폼을
null 이 아니고 'yes' 면 로그아웃폼을 나타낸다 -->
<%
	String loginok=(String)session.getAttribute("loginok");
	if(loginok==null)
	{%>
		<jsp:include page="loginform.jsp"/>
	<%}else
	{%>
		<jsp:include page="logoutform.jsp"/>
	<%}
%>
</body>
</html>






