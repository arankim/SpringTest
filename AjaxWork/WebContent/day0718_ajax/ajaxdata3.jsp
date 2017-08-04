<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String irum1 = "강호동";
String nai1 = "23";
String irum2 = "유재석";
String nai3 = "35";

String result= "";

result += "[";
//result += "{ "|name"|+":"+irum1+"|'"+",|'age|':"+nai1+"},";
result +=  "{\"name\":\""+irum1+"\""+",\"age\":\""+nai1+"\"},";
result +=  "{\"name\":\""+irum2+"\""+",\"age\":\""+nai3+"\"}";
result += "]";
out.write(result);
%>