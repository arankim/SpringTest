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
<h2>dto로 읽은 데이타 출력</h2>
이름 : ${dto.name }<br>
나이 : ${dto.age }<br>
주소 : ${dto.addr }<br>
<hr>
<h2>@ModelAttribute에 담긴 데이타 출력</h2>
이름 : ${testDto.name }<br>
나이 : ${testDto.age }<br>
주소 : ${testDto.addr }<br>
<hr>
<h2>@ModelAttribute("my")에 담긴 데이타 출력</h2>
이름 : ${my.name }<br>
나이 : ${my.age }<br>
주소 : ${my.addr }<br>
</body>
</html>