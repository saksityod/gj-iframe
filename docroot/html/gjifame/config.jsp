<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui"%>
<%@ page import="javax.portlet.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<liferay-theme:defineObjects />
<portlet:defineObjects />

<%



out.println("ID : " + themeDisplay.getPortletDisplay().getId());
out.println("InstanceID: " + themeDisplay.getPortletDisplay().getInstanceId());
out.println("Portlet Name: " + themeDisplay.getPortletDisplay().getPortletName());

String username = themeDisplay.getUser().getScreenName();
String password = (String)request.getSession().getAttribute(WebKeys.USER_PASSWORD);

out.print("user="+username);
out.print("password="+password);

out.println("InstanceID="+session.getAttribute("InstanceID"));// Get Session

%>

<style>
.aui input[type="color"], .aui input[type="date"], .aui input[type="datetime"], .aui input[type="datetime-local"], .aui input[type="email"], .aui input[type="month"], .aui input[type="number"], .aui input[type="password"], .aui input[type="search"], .aui input[type="tel"], .aui input[type="text"], .aui input[type="time"], .aui input[type="url"], .aui input[type="week"], .aui select, .aui textarea, .aui .uneditable-input{
	margin-bottom: 0px;
}
</style>
<table>
	<tr>
		<td>
			URL
		</td>
		<td>
			<input type='text' name='urlGjIFrame' id='urlGjIFrame' style='width:500px;' value=''>
			<input type="hidden" id="config_instance_id" name="config_instance_id" value="">
		</td>
		
			
		
		<td>
			<button id='btnSubmitGjIFrame' class='btn btn-info input-sm'>Save</button> 
		</td>
	</tr>
	
</table>




