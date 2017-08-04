<%@page import="db.email.RandomMethod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="db.email.sendEmail"%>
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
#cl-dashboard {
	display: none;
}
</style>
<script type="text/javascript">
function check(){
	var num = $("#button").val();
	alter(num);
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
boolean result;
int authNum = 0;

sendEmail se = new sendEmail();
RandomMethod rm = new RandomMethod();


String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String email = email1+"@"+email2;
authNum = rm.RandomNum();

result = se.send(email, authNum);
%>
<input type="text" id="authNumInput">
<input type="button" value="확인" id="button" onclick="check()" value="<%=authNum%>">
<div id ="result"><b></b></div>
</body>
</html>