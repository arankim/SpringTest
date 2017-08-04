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
#table{
border : 1px solid black;
}

tr,th,td{
border: 1px solid black;
}
</style>
</head>
<body>
<b>총 ${totalCount }개의 데이타가 있습니다.</b>
<table>
<tr>
<th>일련번호</th>
<th>이름</th>
<th>핸드폰번호</th>
<th>등록시간</th>
</tr>
<c:forEach var = "dd" items ="${list}" varStatus="i">
<tr>
<td>${i.count }
<td>${dd.name}</td>
<td>${dd.hp }</td>
<td><fmt:formatDate value="${dd.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>