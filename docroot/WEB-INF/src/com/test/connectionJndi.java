package com.test;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.apache.log4j.Logger;
import java.sql.Connection;
import java.sql.DriverManager;

public class connectionJndi {
	private static Logger logger=Logger.getLogger("connectionJndi");


  Object dataObject="";
 
  

   
  
  public void selectByIndexDwh(String query,String columns) { 		
/*
	  Context initContext = new InitialContext();
	  Context envContext  = (Context)initContext.lookup("java:/comp/env");
	  DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
	  Connection conn = ds.getConnection();
*/
	  
	    try{
	      Context initContext = new InitialContext();
	      if(initContext == null ) 
	          throw new Exception("Boom - No Context");
	      Context envContext  = (Context)initContext.lookup("java:/comp/env");
	      DataSource ds = 
	            (DataSource)envContext.lookup(
	               "jdbc/jndiDB2");

	      if (ds != null) {
	        Connection conn = ds.getConnection();
	              
	        if(conn != null)  {
	        	dataObject="";
	            Statement stmt = conn.createStatement();
	            ResultSet rst = 
	                stmt.executeQuery(query);
	            String[] fieldSplit=columns.split(",");
	            
	            JSONArray obj_json = new JSONArray();
	            
	            	
	            while(rst.next()) {
	            	
	            	JSONArray sub_obj_json = new JSONArray();
	            	for(int i=0;i<fieldSplit.length;i++){
	            		
	            		sub_obj_json.put(rst.getString(Integer.parseInt(fieldSplit[i])));
	            		
	            	}
	            	obj_json.put(sub_obj_json);

	            }
	            dataObject=obj_json;
	            conn.close();
	        }
	      }
	    }catch(Exception e) {
	      e.printStackTrace();
	      logger.error("erorr"+e);
	    }
	 }
  
  public void queryDwh(String query){
	  try{
	      Context initContext = new InitialContext();
	      if(initContext == null ) 
	          throw new Exception("Boom - No Context");
	      Context envContext  = (Context)initContext.lookup("java:/comp/env");
	      DataSource ds = 
	            (DataSource)envContext.lookup(
	               "jdbc/jndiDB2");

	      if (ds != null) {
	        Connection conn = ds.getConnection();
	              
	        if(conn != null)  {
	        	dataObject="";
	            Statement stmt = conn.createStatement();
	            int rst=0;
	            try{
	            	  rst = stmt.executeUpdate(query);
	            }catch(Exception e){
	            	e.printStackTrace();
	            	System.out.println(e);
	            	//System.out.println("insert error1");
	            }
	           
	          
	            if(rst>0) {
	            	System.out.println("ok");
	            	dataObject="[\"success\"]";

	            }else{
	            	System.out.println("error2");
	            	dataObject="[\"notSuccess\"]";
	            	
	            }
	            
	            conn.close();
	        }
	      }
	    }catch(Exception e) {
	      e.printStackTrace();
	      logger.error("erorr"+e);
	    }
  }
  public void updateDwh(){
	  
  }
  public void deleteDwh(){
	  
  }
  
  


 
 public Object getData() { return dataObject;}

}
