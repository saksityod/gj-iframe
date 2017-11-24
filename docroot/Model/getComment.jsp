<%@ page import="com.test.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String instance_id = request.getParameter("instance_id");
  String checkRole = request.getParameter("checkRole");
  
  //if(checkRole.equals("Admin")){  
	  
	connectionJndi jndi = new connectionJndi();
	String  query=" SELECT comment FROM gj_iframe_tbl where instance_id='"+instance_id+"';"; 
	query+="";
	//out.print(query);
	String columns="1";
	jndi.selectByIndexDwh(query, columns);
	out.println(jndi.getData());
 /*
  }else{
	 out.println("[\"you do not have permission to access.\"]");
 }
  */
 
          
%>