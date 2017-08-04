<%@page import="java.text.SimpleDateFormat"%>
<%@page import="homework.HomeworkDto"%>
<%@page import="java.util.Vector"%>
<%@page import="homework.HomeworkDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");
String mes = request.getParameter("mes");
HomeworkDao dao = new HomeworkDao();
dao.insertGuest(mes);


Vector<HomeworkDto> list = dao.getAllGuest(mes);
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<chat>
<%
for(HomeworkDto dto : list){
	%>
<chatlist>
<msg><%=dto.getContent()%></msg>
<writeday><%=sdf.format(dto.getWriteday())%></writeday>
<chu><%=dto.getChu()%></chu>
</chatlist>
<%
}
%>
</chat>
    