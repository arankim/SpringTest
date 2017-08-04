<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
<fmt:requestEncoding value="UTF-8" />
	<form action="jstltest2.jsp" method="post">
		이름 : <input type="text" name="name" size="8"> <br> 나이 : <input type="text"
			name="age" size="8"> <br> <input type="submit" value="출력">
	</form>
	<c:set var="myname" value="${param.name}"></c:set>
	<c:set var="myage" value="${param.age}"></c:set>
	<c:if test="${!empty myname}">
		<b style="color: red;">${myname}</b>님은
  &nbsp;
<c:if test="${myage>=20}">
			<b style="color: blue">성인</b>입니다
</c:if>
		<c:if test="${myage< 20}">
			<b style="color: blue">미성년자</b>입니다.
</c:if>
	</c:if>

</body>
</html>