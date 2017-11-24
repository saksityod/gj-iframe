<%@ page import="com.test.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  //out.println(session.getAttribute("checkRole"));
 
    String instance_id = request.getParameter("instance_id"); 
    String checkRole = request.getParameter("checkRole");
    
  //out.println(checkRole);
  

 
	connectionJndi jndi = new connectionJndi();
	 
	
	String  query="SELECT * FROM gj_iframe_tbl where instance_id='"+instance_id+"';"; 
	//String  query="SELECT * FROM gj_ifame_tbl"; 
    String columns="1,2,3,4,5,6,7";
    jndi.selectByIndexDwh(query, columns);
    out.println(jndi.getData());

%>