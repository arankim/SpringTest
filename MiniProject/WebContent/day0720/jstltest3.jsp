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
<fmt:requestEncoding value="UTF-8" />
<form action="jstltest3.jsp" method="post">
		나라명 : <input type="text" name="nara" size="8"> <br>  
		<input type="submit" value="출력">
</form>

	<c:set var="nara" value="${param.nara }"></c:set>
	<c:if test="${!empty nara }">
	<!-- 여러개의 조건문을 사용하고자 할 경우 choose -->
	<c:choose>
	<c:when test="${nara == '스위스' }">
	<b style="color: orange;">${nara }에는 아름다운 알프스산이 있어요.</b><br>
	</c:when>
    <c:when test="${nara == '영국' }">
	<b style="color: black;">${nara }에는 해리포터가 있어요.</b><br>
	</c:when>
	 <c:when test="${nara == '캐나다' }">
	<b style="color: red;">${nara }에는 퀘백이 있어요.</b><br>
	</c:when>
    <c:when test="${nara == '독일' }">
	<b style="color: brown;">${nara }에는 맛있는 맥주가 있어요.</b><br>
	</c:when>
	</c:choose>
	</c:if>
</body>
</html>