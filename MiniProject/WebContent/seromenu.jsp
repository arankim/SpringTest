<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link href="seromenu/images_files/reset000.css" type="text/css" rel="stylesheet" />
<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
}

#navigation {
	width: 145px;
	position: relative;
	z-index: 100;
	border-right: 1px solid #000;
	float: left;	
}
/* float the list to make it horizontal and a relative positon so that you can control the dropdown menu positon */
#navigation li {
	width: 145px;
	position: relative;
}
/* style the links for the top level */
#navigation a, #navigation a:visited {
	display: block;
	height: 47px;
	background: url(seromenu/images_files/navigati.png) top left;
	text-indent: -9000px;
}

/* style the second level background */
#navigation ul ul a.drop, #navigation ul ul a.drop:visited {
	background: #2d3d47
}
/* style the second level hover */
#navigation ul ul a.drop:hover {
	background: #fff;
	color: #202c32;
}

#navigation ul ul :hover>a.drop {
	background: #fff;
	color: #202c32;
}
/* style the third level background */
#navigation ul ul ul a, #navigation ul ul ul a:visited {
	background: #e2dfa8;
}
/* style the third level hover */
#navigation ul ul ul a:hover {
	background: #b2ab9b;
}

/* hide the sub levels and give them a positon absolute so that they take up no room */
#navigation ul ul {
	visibility: hidden;
	position: absolute;
	top: -10px;
	left: 145px;
	padding: 4px;
	background: #2d3d47;
	height: 96px;
	width: 145px;
	border-left: 1px solid #999;
}

/* position the third level flyout menu */
#navigation ul ul ul {
	left: 149px;
	top: -1px;
	width: 149px;
}

/* position the third level flyout menu for a left flyout */
#navigation ul ul ul.left {
	left: -149px;
}

/* style the table so that it takes no ppart in the layout - required for IE to work */
#navigation table {
	position: absolute;
	top: 0;
	left: 0;
	border-collapse: collapse;
}

/* style the second level links */
#navigation ul ul a, #navigation ul ul a:visited {
	background: #2d3d47;
	color: #fff;
	height: auto;
	line-height: 14px;
	text-indent: 0px;
	display: block;
	padding: 5px;
	text-decoration: none;
	font-size: 11px;
}

/* style the top level hover */
#navigation :hover>a, #navigation ul ul :hover>a {
	background: url(seromenu/images_files/navigati.png) top left;
}

/* top level image background placements */
#navigation a.link1:hover {
	background-position: -146px 0px;
}

#navigation a.link2 {
	background-position: 0px -47px;
}
/* DO NOT consolodate next 2 lines into one, this breaks IE6 */
#navigation a.link2:hover {
	background-position: -146px -47px;
}

#navigation :hover>a.link2, #navigation ul ul :hover>a.link2 {
	background-position: -146px -47px;
}

#navigation a.link3 {
	background-position: 0px -94px;
}

#navigation a.link3:hover {
	background-position: -146px -94px;
}

#navigation :hover>a.link3, #navigation ul ul :hover>a.link3 {
	background-position: -146px -94px;
}

#navigation a.link4 {
	background-position: 0px -141px;
}

#navigation a.link4:hover {
	background-position: -146px -141px;
}

#navigation :hover>a.link4, #navigation ul ul :hover>a.link4 {
	background-position: -146px -141px;
}

#navigation a.link5 {
	background-position: 0px -188px;
}

#navigation a.link5:hover {
	background-position: -146px -188px;
}

#navigation a.link6 {
	background-position: 0px -235px;
}

#navigation a.link6:hover {
	background-position: -146px -235px;
}

#navigation a.link7 {
	background-position: 0px -282px;
}

#navigation a.link7:hover {
	background-position: -146px -282px;
}

#navigation a.link8 {
	background-position: 0px -329px;
}

#navigation a.link8:hover {
	background-position: -146px -329px;
}

#navigation a.link9 {
	background-position: 0px -375px;
	height: 65px;
}

#navigation a.link9:hover {
	background-position: -146px -375px;
}

#navigation ul ul a:hover {
	background: #fff;
	color: #202c32;
}
/* make the second level visible when hover on first level list OR link */
#navigation ul li:hover ul, #navigation ul a:hover ul {
	visibility: visible;
}
/* keep the third level hidden when you hover on first level list OR link */
#navigation ul :hover ul ul {
	visibility: hidden;
}
/* make the third level visible when you hover over second level list OR link */
#navigation ul :hover ul :hover ul {
	visibility: visible;
}
</style>
</head>
<body>
<%
String path = request.getContextPath();
%>
	<div id="navigation">
		<ul>
			<li><a href="<%=path%>/layoutsero.jsp" class="link1">Home</a>
			</li>
			<li><a href="#l" class="drop link2">Member</a>
				<ul>
					<li><a href="<%=path%>/layoutsero.jsp?main=login/loginmain.jsp">로그인</a></li>
					<li><a href="<%=path%>/layoutsero.jsp?main=member/memberform.jsp">회원가입</a></li>
					<li><a href="<%=path%>/layoutsero.jsp?main=member/memberlist.jsp">회원명단</a></li>
				</ul>
			</li>
			<li><a href="<%=path %>/layoutsero.jsp?main=guest/guestlist.jsp" class="drop link3">방명록</a></li>
			<li><a href="#" class="drop link4">Board</a>
				<ul style="height: 240px; top: -40px;">
					<li><a href="<%=path%>/layoutsero.jsp?main=upload/testupload.jsp">업로드연습</a></li>
					<li><a href="<%=path%>/layoutsero.jsp?main=upload/uploadform.jsp">상품업로드</a></li>
					<li><a href="<%=path%>/layoutsero.jsp?main=upload/uploadlist.jsp">상품목록</a></li>
					<li><a href="#">게시판문제</a></li>
					<li><a href="<%=path%>/layoutsero.jsp?main=reply/replylist.jsp">답변형게시판</a></li>
				</ul></li>
			<li><a href="<%=path%>/layoutsero.jsp?main=smartboard/smartpagelist.jsp" class="link5">게시판</a></li>

			<li><a href="http://jorenrapini.com/posts/css-rollovers/catalog.php" class="link6">Catalog</a></li>
			<li><a href="http://jorenrapini.com/posts/css-rollovers/about.php" class="link7">About
					Us</a></li>
			<li><a href="http://jorenrapini.com/posts/css-rollovers/contact.php" class="link8">Contact</a></li>
			<li><a href="http://jorenrapini.com/posts/css-rollovers/users.php" class="link9">Registered
					Users</a></li>
		</ul>
	</div>

</body>
</html>