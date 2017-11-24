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
/*
out.print("user="+username);
out.print("password="+password);
*/
%>

<input type="hidden" id="user_portlet" name="user_portlet" value="<%=username%>">
<input type="hidden" id="pass_portlet" name="pass_portlet" value="<%=password%>">
<!-- 
<input type="hidden" id="user_portlet" name="user_portlet" value="admin">
<input type="hidden" id="pass_portlet" name="pass_portlet" value="password">
-->
<input type="hidden" id="url_portlet" name="url_portlet" value="<%= renderRequest.getContextPath() %>">

<style>
.aui #breadcrumbs {
    margin-bottom: 0px;
}
.aui .portlet-content, .aui .portlet-minimized .portlet-content-container {
  background-color: #fafafa;
}


.aui input[type="color"], .aui input[type="date"], .aui input[type="datetime"], .aui input[type="datetime-local"], .aui input[type="email"], .aui input[type="month"], .aui input[type="number"], .aui input[type="password"], .aui input[type="search"], .aui input[type="tel"], .aui input[type="text"], .aui input[type="time"], .aui input[type="url"], .aui input[type="week"], .aui select, .aui textarea, .aui .uneditable-input {
 
    margin-bottom: 0;
}
</style>

<table>
	<tr>
		<td>URL</td>
		<td>
		<input type='text' style='width:250px;' name='pentahoURL' id='pentahoURL' value=''>
		</td>
		<td>
		<button id='renderIfame' class='btn btn-info input-sm'>Call Ifame</button>
		</td>
	</tr>
	
</table>

<iframe id="myIframe" name="myIframe"  src="" height="1000px"  width="100%" scrolling="yes" frameborder="0"></iframe>
