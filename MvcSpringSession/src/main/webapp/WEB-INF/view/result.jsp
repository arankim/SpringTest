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
	<h2>Session 영역의 id 값 : ${sessionScope.id}</h2>
	<h2>Request 영역의 id 값 : ${requestScope.id}</h2>
	<br>
	<input type="button" value="세션 제거"
	  onclick="location.href='sessionclear.do'">
	</body>
</html>





