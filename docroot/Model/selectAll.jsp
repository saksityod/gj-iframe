<%@ page import="com.test.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  String checkRole = request.getParameter("checkRole");
  
  if(checkRole.equals("Admin")){  
	connectionJndi jndi = new connectionJndi();
	String  query=" SELECT * FROM gj_ifame_tbl"; 
	query+="";
	//out.print(query);
	String columns="1,2,3,4,5";
	jndi.selectByIndexDwh(query, columns);
	out.println(jndi.getData());
 }else{
	 out.println("[\"you do not have permission to access.\"]");
 }
 
          
%>