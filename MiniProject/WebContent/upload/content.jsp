<%@page import="db.dao.AnswerUploadDao"%>
<%@page import="db.dto.AnswerUploadDto"%>
<%@page import="java.util.Vector"%>
<%@page import="java.io.File"%>
<%@page import="db.dao.MemberDao"%>
<%@page import="db.dao.UploadDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.dto.UploadDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
<script type="text/javascript">
$(function(){

	$("#answer").hide();
	//댓글부분을 클릭하면 
	//그부분의 댓글목록과 폼이 보이도록
	$("a").click(function(){
		$("#answer").toggle();
	})

});
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String loginok = (String) session.getAttribute("loginok");
		String id = (String) session.getAttribute("idok");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String key = request.getParameter("key");
		UploadDao db = new UploadDao();
		//key값이 널 값이 아니면서 list인 경우
		//조회수 증가

		UploadDto dto = db.getData(num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		MemberDao mdb = new MemberDao();
		String name = mdb.getName(id);
		String realFolder = getServletContext().getRealPath("/save");

		//댓글 가져오기
		AnswerUploadDao adb = new AnswerUploadDao();
		AnswerUploadDto andto = new AnswerUploadDto();
		Vector<AnswerUploadDto> alist = adb.getAnswerList(dto.getNum());
		int answerCount = adb.getAnswerCount(num);
		
		File imgFile = new File(realFolder + "\\" + dto.getFilename());
		String myimg = "";
		if (imgFile.exists())
			myimg = dto.getFilename();
		else
			myimg = "empty.jpg";

		//번호에 해당하는 dto가져오기
	%>
	<table class="table table-striped" style="width: 500px;">
		<tr>
			<td width="350"><b><%=dto.getSubject()%></b></td>
			<td><span style="color: #ccc; font-size: 9pt;"><%=sdf.format(dto.getWriteday())%></span>
		</tr>
		<tr height="400">
			<td colspan="2"><img src="image/chr05.gif" width="20"> <b><%=name%>(<%=dto.getId().substring(0, 4)%>****)</b>
				<br> <br> <img src="save/<%=myimg%>" style="max-width: 400px;"> <br>
				<br> <pre><%=dto.getContent()%></pre></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="button" class="btn btn-default btn-xs"
				value="글쓰기" style="width: 60px;"
				onclick="location.href='layoutsero.jsp?main=uploadform.jsp'"> <input
				type="button" class="btn btn-default btn-xs" value="글목록" style="width: 60px;"
				onclick="location.href='layoutsero.jsp?main=uploadlist?PageNum=<%=pageNum%>.jsp'">
				<%
					if (loginok != null && id.equals(dto.getId())) {
				%> <input type="button" value="수정" class="btn btn-default btn-xs" value="수정"
				style="width: 60px;"
				onclick="location.href='layoutsero.jsp?main=upload/updateform.jsp'"> <input
				type="button" value="삭제" class="btn btn-default btn-xs" value="삭제"
				style="width: 60px;" onclick="location.href='upload/delete.jsp?num=<%=dto.getNum()%>'">
<%
}
%>
</td>
</tr>
	</table>
		
	<a href="#" style="cusro: pointer; font-size: 9pt; color: black;" >댓글<%=answerCount %>&nbsp;&nbsp;&nbsp;조회수<%=alist.get(0).getReadcount() %></a>
	<div style="margin-left: 10px; margin-top:5pt; font-size: 9pt;" id="answer">
		<%
						for (AnswerUploadDto adto : alist) {
		%>
		<b><%=adto.getName()%>(<%=adto.getId()%>)</b> &nbsp;&nbsp;
		<%=sdf.format(adto.getSdate()) %>
		<br> <span style="margin-left: 20px;"> <%=adto.getContent()%></span> <br>
		<%
						}
					%>
			<form action="upload/answeruploadaction.jsp" method="post">
				<span style="color: gray; font-size: 9pt; width: 800px;"> <input type="text"
					name="content" id="content" width="800"> <input type="hidden" name="id"
					value="<%=dto.getId()%>"> <input type="hidden" name="num"
					value="<%=dto.getNum()%>"> <input type="hidden" name="name" value="<%=name%>">
					<input type="hidden" name="pageNum" value="<%=pageNum%>"> <input
					type="submit" value="저장">
				</span>
			</form>
</div>
</body>
</html>