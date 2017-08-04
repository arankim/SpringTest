<%@page import="db.dao.MemberDao"%>
<%@page import="db.dto.MemberDto"%>
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
	#cl-dashboard{display: none;}
</style>
</head>
<body>
<%
	//1. id, pass,idsave 를 읽는다
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String idsave=request.getParameter("idsave");
	
	//dao 선언후 getLoginStatus 호출
	//MemberDto dto=new MemberDto();
	MemberDao db=new MemberDao();
	
	int n=db.getLoginStatus(id, pass);
	if(n==2)//모두 맞는경우
	{
		
	session.setMaxInactiveInterval(60*60*8);//8시간
	session.setAttribute("idok", id);
	session.setAttribute("saveok", idsave==null?"no":"yes");
	session.setAttribute("loginok", "yes");

	response.sendRedirect("../layoutsero.jsp?main=login/logoutform.jsp");
	}else if(n==1)
	{%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않아요");
	history.back();
	</script>
	<%}else if(n==3)
	{%>
	<script type="text/javascript">
	alert("아이디가 존재하지 않아요.");
	history.back();
	</script>
	<%}
	//반환값이 1이면 세션:idok(아이디저장),
	//saveok(yes/no),loginok(yes) 저장한후 loginmain으로 이동
	//2 : '비밀번호가 맞지 않습니다'-->back
	//3 :'아이디가 존재하지 않습니다. 회원가입을 한후 로그인해주세요'-->back

%>
</body>
</html>