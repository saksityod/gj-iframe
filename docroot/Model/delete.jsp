<%@ page import="com.test.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String instance_id = request.getParameter("instance_id");
String checkRole = request.getParameter("checkRole");

if(checkRole.equals("Admin")){  
	
  
  connectionJndi jndi = new connectionJndi();

  String  query="delete from gj_iframe_tbl where instance_id='"+instance_id+"'"; 
		    	 
  jndi.queryDwh(query);
  out.println(jndi.getData());
  
}else{
	  out.println("[\"you do not have permission to access.\"]");
}
%>