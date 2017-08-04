<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.dto.ReplyDto"%>
<%@page import="db.dao.ReplyDao"%>
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
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
String key = request.getParameter("key");  //목록에서 들어왔다는 것을 알기 위해 list라는 key를 받음(조회주 증가를 위해 사용하는 key)
ReplyDao db = new ReplyDao();

if(key != null && key.equals("list")){
	db.updateReadCount(num);
}

ReplyDto dto = db.getData(num);

SimpleDateFormat sdf=
new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<table class="table table-striped" style="width: 500px;">
	<tr>
		<td width="350">
			<b><%=dto.getSubject() %></b>
		</td>
		<td>
			<span style="color: #ccc;font-size: 9pt;">
			<%=sdf.format(dto.getWriteday()) %></span>
		</td>
	</tr>
	<tr height="350">
		<td colspan="2" valign="top">
			<img src="image/chr15.gif" width="30">
			<b><%=dto.getWriter()%></b>
			<br><br>			
			<pre><%=dto.getContent()%></pre>	
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<span style="color: gray;font-size: 9pt;">
			조회수&nbsp; <%=dto.getReadcount() %>
			</span>			
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="button" class="btn btn-default btn-xs"
			  value="글쓰기" style="width: 60px;"
			  onclick="location.href='layoutsero.jsp?main=reply/replyform.jsp'">
			  <input type="button" class="btn btn-default btn-xs"
			  value="답글" style="width: 60px;"
			  onclick="location.href='layoutsero.jsp?main=reply/replyform.jsp?num=<%=dto.getNum() %>&PageNum=<%=pageNum%>'">
			<input type="button" class="btn btn-default btn-xs"
			  value="글목록" style="width: 60px;"
			  onclick="location.href='layoutsero.jsp?main=reply/replylist.jsp?pageNum=<%=pageNum%>'">			
		</td>
	</tr>	
</table>

</body>
</html>