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
#cl-dashboard {
	display: none;
}
</style>
<script type="text/javascript">
function check(){
	window.open("emailaction.jsp","","width=400px, height=250px, left=600px, top=100px");
}

$(function(){
	$("#email").change(function(){
		alter("확인");
		System.out.prinltln($(this).val());
		if($(this).val()=='-'){
			$("#email2").val('');
			$("#email2").focus();
		}else{
			$("#email2").val($(this).val());
		}			
	});
});
</script>
</head>
<body>
이메일인증
<form action="emailaction.jsp" method="post" onsubmit="check()">
<input type="text" id="email1" name="email1">
@
<input type="text" id="email2" name="email2">
<select id="email">
<option value="-">직접입력</option>
<option value="네이버">naver.com</option>
<option value="구글">google.com</option>
<option value="다음">hanmail.net</option>
</select>
<input type="submit" value="이메일인증">
</form>
</body> 
</html>