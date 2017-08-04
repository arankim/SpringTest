<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
<div style="margin-left: 300px; font-size: 22pt;">
<b>${id}님! 회원가입되었습니다.</b>
<br><br>
<input type="button" class="btn btn-sucess btn-sm" value="로그인" style="width: 80px; float: left;" onclick="location.href='../login/loginform.do'">

<input type="button" class="btn btn-sucess btn-sm" value="Home" style="width:80px;" onclick="location.href='login/loginmain.do'">
</div>
</body>
</html>