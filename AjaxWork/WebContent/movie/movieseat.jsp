<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.OracleConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OracleConnect db=new OracleConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
%>
<seats>
<%
	request.setCharacterEncoding("UTF-8");
	String myno=request.getParameter("myno");
	String data="";
	try{
		String sql="select * from movietb where no="+myno;
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		if(rs.next()){ //해당 번호가 존재할경우 seat 만 수정
			data=rs.getString("seat");
		%>
			<seat><%=data%></seat>  	
		<%}else{%>
			<seat>no</seat>
		<%}
	%>	
	<%}catch(SQLException e){
		System.out.println("error:"+e.getMessage());
	}finally{
		db.dbClose(pstmt, conn);		
	}
%>
</seats>
