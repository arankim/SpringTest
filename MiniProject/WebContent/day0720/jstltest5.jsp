<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<c:set var="s" value="red,blue,black,pink,yellow" />
<c:forTokens items="${s}" delims=","  var = "a">
<b style="color:${a};">${a}</b><br>
</c:forTokens>
<hr>
<c:set var="str" value="Have a good time"></c:set>
${fn:contains(str,"good")}<br>
${fn:contains(str,"nice")}<br>
${fn:length(str)}<br>
${fn:substring(str,5,9) }<br>
${fn:startsWith(str,"Have")}<br>
${fn:endsWith(str,"haha")}<br>
</body>
</html>