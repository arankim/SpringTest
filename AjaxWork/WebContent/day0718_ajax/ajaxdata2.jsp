<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String irum1 = request.getParameter("irum1");
String irum2 = request.getParameter("irum2");
%>
<server>
<serverdata>
<irum><%=irum1%></irum>
</serverdata>
<serverdata>
<irum><%=irum2%></irum>
</serverdata>
</server>
