<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="menu/css/menu.css">
<script type="text/javascript" src="menu/js/jquery.js"></script>
<script type="text/javascript" src="menu/js/function.js"></script>
</head>
<body>
<%
String path = request.getContextPath();
%>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="http://www.freshdesignweb.com"><img src="menu/images/logo.png" alt="fresh design web"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="<%=path%>/layoutgaro.jsp">Home</a></li>
					<li class="parent">
						<a href="#l">Member</a>
						<ul class="sub-menu">
							<li><a href="<%=path%>/layoutgaro.jsp?main=login/loginmainjsp"><i class="icon-wrench"></i>로그인</a></li>
							<li><a href="<%=path%>/layoutgaro.jsp?main=member/memberform.jsp"><i class="icon-credit-card">회원가입</i></a></li>
							<li><a href="<%=path%>/layoutgaro.jsp?main=member/memberlist.jsp"><i class="icon-gift"></i>회원명단</a></li>
						</ul>
					</li>
					<li><a href="#">Portfolio</a></li>
						<li class="parent">
						<a href="#">Blog</a>
						<ul class="sub-menu">
							<li><a href="#">Large Image</a></li>
							<li><a href="#">Medium Image</a></li>
							<li><a href="#">Masonry</a></li>
							<li><a href="#">Double Sidebar</a></li>
							<li><a href="#">Single Post</a></li>
						</ul>
					</li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body> 
</body>