<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.util.Vector"%>
<%@page import="db.GuestDao,db.GuestDto"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%
GuestDao dao = new GuestDao();
Vector<GuestDto> list = dao.getAllGuest();

%>
<guest>
<%
for(GuestDto dto : list){
%>
<guestlist>
<num><%=dto.getNum()%></num>
<name><%=dto.getName()%></name>
<id><%=dto.getId()%></id>
<avata><%=dto.getAvata()%></avata>
<content><%=dto.getContent()%></content>
<writeday><%=dto.getWriteday()%></writeday>
</guestlist>
<%
}
%>
</guest>