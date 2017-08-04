<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String irum1 = request.getParameter("irum1");
String nai1 = request.getParameter("nai1");
String irum2 = request.getParameter("irum2");
String nai3 = request.getParameter("nai3");

String result= "";
result += "[";
//result += "{ "|name"|+":"+irum1+"|'"+",|'age|':"+nai1+"},";
result +=  "{\"name\":\""+irum1+"\""+",\"age\":\""+nai1+"\"},";
result +=  "{\"name\":\""+irum2+"\""+",\"age\":\""+nai3+"\"}";
result += "]";
%>