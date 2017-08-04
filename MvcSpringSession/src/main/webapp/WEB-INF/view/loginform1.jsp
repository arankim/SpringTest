<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

	</head> 
	<body>
	<form action="loginaction1.do" method="post">
		아이디 : <input type="text" name="id" size="8">
		<br>
		비밀번호 : <input type="password" name="pass" size="8">
		<br>
		<input type="submit" value="로그인">
		
	</form>	
	</body>
</html>