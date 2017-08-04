<%@page import="db.dao.MemberDao"%>
<%@page import="db.dto.ZipcodeDto"%>
<%@page import="java.util.Vector"%>
<%@page import="db.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 검색</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
#wrap{
 width:400px;
 height: 100px;
 overflow:scroll;
}
#selectResult{
padding-top: 10px;
width: 400px;
height: 30px;
}

#writeResult{
padding-top: 15px;
width: 400px;
height: 30px;
}

#bottom{
padding-top: 30px;
}

#title{
height:30px;
width:400px;
padding-bottom: 20px;
}
</style>
<script type="text/javascript">
function addressClick(obj){
	alert(obj);
	$("#selectResult>#selectResult").val(obj);
	$("#writeResult").focus();
	
}
$(function(){
	var addr = $("#selectResult").val() + " " + $("#writeResult").val();
	opener.frm.address.value = addr;
	window.close();
});
</script>
</head>
<body>
	<%
request.setCharacterEncoding("UTF-8");
String key = request.getParameter("key");
MemberDao dao = new MemberDao();
if(key == null){
%>
	<form action="postsearchform.jsp" method="post" name="frm">
		<fieldset>
			<legend>주소 검색하기</legend>
			<img src="../image3/c8.png" width="80" hspace="10" align="left"> <b>검색할 주소를
				입력하세요</b> <br> <b>검색단어 :</b> 
				<input type="text" name="dong" required="required"
				class="form-control" style="width: 150px;"> 
				<input type="hidden" name="key" value="result" class="form-control" >
				<input type="submit" value="주소검색"
				class="btn btn-primary btn-sm" style="width: 110px;">
		</fieldset>
	</form>

	<%	
} else {
request.setCharacterEncoding("UTF-8");
String dong = request.getParameter("dong");
Vector<ZipcodeDto> list = dao.getsearchDong(dong);
%>
<div id = "title">
주소 결과
</div>
<div id="wrap">
<%
for(int i = 0; i<list.size(); i++){
	ZipcodeDto zdto = list.get(i);
%>
<a onclick="addressClick('<%=zdto.toString()%>')"><%=zdto.toString()%></a><br>
<%
}
%>
</div>
<div id="selectResult">
<input type="text" name="selectResult" id="selectResult" readonly="readonly">
</div>
<div id = "writeResult">
<input type="text" name="writeAddress" id = "writeAddress">
</div>
<div id = "bottom">
<input type="button" value="확인" id="ok" name="ok">
</div>
<%
}
%>
</body>
</html>