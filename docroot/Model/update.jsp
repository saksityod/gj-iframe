<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.test.*" %>
<%

  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
  String instance_id = request.getParameter("instance_id");
  String url = request.getParameter("url");
  String comment = request.getParameter("comment");
  String checkRole = request.getParameter("checkRole");
  String height = request.getParameter("height");
  String width = request.getParameter("width");
  if(checkRole.equals("Admin")){  
	  String paramUpdatedDttm = df.format(new java.util.Date());
	  connectionJndi jndi = new connectionJndi();
	  String  query=""; 
	  query+="update gj_iframe_tbl set"; 
	  query+="	  url='"+url+"',";
	  query+="	  comment='"+comment+"',";
	  query+="	  height='"+height+"',";
	  query+="	  width='"+width+"',";
	  query+="	  updated_dttm=SYSDATE()";
	  query+="	  where instance_id='"+instance_id+"'";
	
			    	 
	  jndi.queryDwh(query);
	  out.println(jndi.getData());
  }else{
	  out.println("[\"you do not have permission to access.\"]");
  }
%>