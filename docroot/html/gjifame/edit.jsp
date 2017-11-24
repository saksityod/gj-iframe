<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui"%>
<%@ page import="javax.portlet.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<liferay-theme:defineObjects />
<portlet:defineObjects />

<%
boolean role= request.isUserInRole("Administrator");
if(role){
	//session.setAttribute("checkRole","Admin"); // Create Session
	out.print("<input type='hidden' class='checkRole' name='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' id='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' value='Admin'>");
}else{
	session.setAttribute("checkRole","notAdmin"); // Create Session
	out.print("<input type='hidden' class='checkRole' name='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' id='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' value='notAdmin'>");
}


/*
out.println(session.getAttribute("checkRole"));// Get Session
out.println("ID : " + themeDisplay.getPortletDisplay().getId());
out.println("InstanceID: " + themeDisplay.getPortletDisplay().getInstanceId());
out.println("InstanceID="+session.getAttribute("InstanceID"));// Get Session
out.println("Portlet Name: " + themeDisplay.getPortletDisplay().getPortletName());
*/
session.getAttribute("InstanceID"); // Create Session
String username = themeDisplay.getUser().getScreenName();
String password = (String)request.getSession().getAttribute(WebKeys.USER_PASSWORD);
/*
out.print("user="+username);
out.print("password="+password);
*/
//out.print("InstanceID="+session.getAttribute("InstanceID"));
%>

<input type="hidden" class='instance_id' id="instance_id-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="instance_id-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="<%= themeDisplay.getPortletDisplay().getInstanceId()%>">
<table  style='float:left;margin-bottom:10px;'>
	<tr>
		<td style='width:100px; text-align:right;'>
			URL &nbsp;&nbsp;
		</td>
		<td>
			<input type='text' name='urlGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' id='urlGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' style='width:500px;margin-bottom: 0px;' value=''>
		</td>
		
	</tr>
	
	<tr>
		<td style='width:100px; text-align:right;'>
			Width &nbsp;&nbsp;
		</td>
		<td>
			<input type='text' name='widthGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' id='widthGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' style='width:100px;margin-bottom: 0px;' value=''>
		</td>
		
	</tr>
	<tr>
		<td style='width:100px; text-align:right;'>
			Height &nbsp;&nbsp;
		</td>
		<td>
			<input type='text' name='heightGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' id='heightGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' style='width:100px;margin-bottom: 0px;' value=''>
		</td>
		
	</tr>
	<tr>
		<td style='text-align:right;display:block;'>
			Comment &nbsp;&nbsp;
		</td>
		<td>
			<textarea class='commentGjIFrame' id='commentGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' name='commentGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' style='width: 500px; height: 100px;'></textarea>
			
		</td>
	</tr>
	<tr>	
		<td ></td>
		<td style='text-align:right;'>
			<button id='btnSubmitGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' class='btn btn-info input-sm'><i class='icon-ok'></i> Save</button> 
			<button id='btnDelGjIFrame-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' class='btn btn-danger input-sm'><i class='icon-trash'></i> Clear</button> 
		</td>
	</tr>
	
</table>
<input type='hidden' id='action-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' name='action-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' class='action' value='insertUpdate'>

<br style='clear:both'>

