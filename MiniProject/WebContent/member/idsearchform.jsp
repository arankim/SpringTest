<%@page import="db.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 입력</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}

body {
	text-align: center;
}
</style>
<script type="text/javascript">

/* 	$("#btnclose").click(function(){
		alter("확인")
		var id = $(this).attr("id"); //id속성에 저장된 아이디를 읽어온다.
		alter(id);
		opener.frm.id.value=id; //부모창으로 아이디를 보낸다
		window.close();
	}); */

function btnclose(){
		alter("확인");
		var id = $(this).attr("id"); //id속성에 저장된 아이디를 읽어온다.
		opener.frm.id.value=id; //부모창으로 아이디를 보낸다
		window.close();
		return false;
	}

function check(){	
		if($("#id").val().length < 4 ){
			$("#msg").show();
			$("#msg").text("아이디는 4글자 이상으로 입력해 주세요.");
			setTimeout(function(){
				$("#msg").hide();
			}, 1000);
			return false;
		} 
		
		var s = $("#id").val().trim();
		if(s.indexOf(' ') > 0){
			$("#msg").show();
			$("#msg").text("아이디에 공백이 있습니다.");
			setTimeout(function(){
				$("#msg").hide();
			}, 1000);
			return false;
		}
		
		for(var i = 0; i<$("#id").val().length; i++){
		  	if( (!($("#id").val().charAt(i) >= 'A' && $("#id").val().charAt(i)<='Z')) && (!($("#id").val().charAt(i) >= 'a' && $("#id").val().charAt(i)<='z')) &&
					(!($("#id").val().charAt(i) >= 0) && !($("#id").val().charAt(i)<=9))){ 
				$("#msg").show();
				$("#msg").text("아이디는 숫자와 대소문자만 가능합니다.");
				setTimeout(function(){
					$("#msg").hide();
				}, 1000); 
				return false;
			}
		}
}

</script>
</head>
<body>
	<%
String key = request.getParameter("key");
MemberDao dao = new MemberDao();
boolean result;
if(key == null){
%>
	<form action="idsearchform.jsp" method="post" onsubmit="return check()" name="frm" id="frm">
		<fieldset style="width: 220px;">
			<legend>아이디 중복 체크</legend>
			<b id="msg" style="color: blue;"></b> <b style="color: red;">아이디를 입력해주세요</b> <br>
			<br>
			<div class="form-inline">
				<input type="text" class="form-control" placeholder="아이디입력" required="required" maxlength="12" name="id" id="id"> 
				<input type="hidden" name="key" value="result" class="form-control" >
				<input type="submit" value="아이디 중복 검사" class="btn btn-warning btn-sm form-control">
			</div>
		</fieldset>
	</form>
	<%
} else {
	String id = request.getParameter("id");
	result = dao.isEqualId(id);
	if(result==false){
		%>
		<img src="../image3/c5.png" width="80" align="left" hspace="10"> <%=id %>는 사용 가능한 아이디입니다.
		<br><br>
		<input type="button" class="btn btn-danger btn-xs" value="아이디 입력" onclick="location.href='idsearchform.jsp'">
		<%
	} else {
		%>
	   <img src="../image3/c2.png"  width="80" align="left" hspace="10"><%=id %>는 이미 가입된 아이디입니다.
	   <br><br>
	   <input type="button" class="btn btn-danger btn-xs" value="닫기" onclick="btnclose()">
	   <% 
	}
}
	   %>
</body>
</html>