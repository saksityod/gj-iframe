<%@ page import="com.test.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String link_id = request.getParameter("link_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  
	  
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_LINK ";
    	  query+=" WHERE \"link_id\" = '"+link_id+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4,5,6,7,8";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          

%>