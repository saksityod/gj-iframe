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

%>

