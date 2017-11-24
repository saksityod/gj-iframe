<%@ page import="com.test.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


	
	String instance_id = request.getParameter("instance_id");
	String url = request.getParameter("url");
	String comment = request.getParameter("comment");
	String checkRole = request.getParameter("checkRole");
	 String height = request.getParameter("height");
	  String width = request.getParameter("width");
	 if(checkRole.equals("Admin")){  
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	String create_dttm = df.format(new java.util.Date());
	//create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	//updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	
	
	connectionJndi jndi = new connectionJndi();
	String  query=""; 
	
	query+="insert into gj_iframe_tbl values('"+instance_id+"','"+url+"',SYSDATE(),SYSDATE(),'"+comment+"','"+height+"','"+width+"')";
	
	//out.print(query);
	jndi.queryDwh(query);
	out.println(jndi.getData());

}else{
	  out.println("[\"you do not have permission to access.\"]");
}

 
  
  
%>
