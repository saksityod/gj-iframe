<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui"%>
<%@ page import="javax.portlet.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<liferay-theme:defineObjects />
<portlet:defineObjects />
<style>
/*

  iframe {
		    display: block;      
		    border: none;        
		    height: 100vw;       
		    width: 100%;
		}
*/
</style>
<%
boolean role= request.isUserInRole("Administrator");
if(role){
	session.setAttribute("checkRole","Admin"); // Create Session
	out.print("<input type='hidden' class='checkRole' name='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' id='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' value='Admin'>");
}else{
	session.setAttribute("checkRole","notAdmin"); // Create Session
	out.print("<input type='hidden'  class='checkRole' name='checkRole-"+themeDisplay.getPortletDisplay().getInstanceId()+"' id='checkRole"+themeDisplay.getPortletDisplay().getInstanceId()+"' value='notAdmin'>");
}


/*
out.println(session.getAttribute("checkRole"));// Get Session
out.println("ID : " + themeDisplay.getPortletDisplay().getId());
out.println("InstanceID: " + themeDisplay.getPortletDisplay().getInstanceId());
out.println("InstanceID="+session.getAttribute("InstanceID"));// Get Session
out.println("Portlet Name: " + themeDisplay.getPortletDisplay().getPortletName());
*/
session.setAttribute("InstanceID",themeDisplay.getPortletDisplay().getInstanceId()); // Create Session
String username = themeDisplay.getUser().getScreenName();
String password = (String)request.getSession().getAttribute(WebKeys.USER_PASSWORD);
/*
out.print("user="+username);
out.print("password="+password);
*/
%>

<input type="hidden" class='user_portlet' id="user_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="user_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="<%=username%>">
<input type="hidden" class='pass_portlet' id="pass_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="pass_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="<%=password%>">

 <!-- 
<input type="hidden" class='user_portlet' id="user_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="user_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="Admin">
<input type="hidden" class='pass_portlet' id="pass_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="pass_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="password">
 -->
 
<input type="hidden" class='url_portlet' id="url_portlet-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="url_portlet<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="<%= renderRequest.getContextPath() %>">
<input type="hidden" class='instance_id' id="instance_id-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="instance_id-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" value="<%= themeDisplay.getPortletDisplay().getInstanceId()%>">


<img style='cursor:pointer;' src='<%=renderRequest.getContextPath()%>/imgs/6621241758327.jpg' title="" data-original-title="Comment" class="fa fa-cog font-gear popover-comment" id="popoverComment-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" data-html="true" data-toggle="popover" data-placement="right" data-content=""  tabindex="<%= themeDisplay.getPortletDisplay().getInstanceId()%>" data-trigger="focus" >
 
        
<input type='hidden' id='action-<%= themeDisplay.getPortletDisplay().getInstanceId()%>' name='action<%= themeDisplay.getPortletDisplay().getInstanceId()%>' class='action' value='show'>
<iframe id="myIframe-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" name="myIframe-<%= themeDisplay.getPortletDisplay().getInstanceId()%>"  src="" height="1000px;"  width="100%" scrolling="yes" frameborder="0"></iframe>

<!-- Modal Confirm Start -->
<div aria-hidden="true" role="dialog" tabindex="-1" id="confrimModal-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" class="modal inmodal " style="display: none;">
    <div class="modal-dialog ">
    <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only"></span></button>
                <h5 class="modal-title">Confirm Dialog</h5>
            </div>
            <div class="modal-body">
                <!-- content start -->
                <!-- <h2><i class="fa fa fa-pencil-square-o icon-title"></i> ADD NEW GRADE</h2>
                <hr>
                 -->
                <!-- form start -->
                <div class="form-kpi-mangement">
	                <div class="form-kpi-label" align="center">
	                
	                 		<label>Confirm to Delete Data?</label>
	                </div>
                </div>
                               
                <!-- form start -->
                <!-- content end -->
            </div>
            <div class="modal-footer">
            	<div align="center">
	                <button class="btn btn-success" id="btnConfirmOK-<%= themeDisplay.getPortletDisplay().getInstanceId()%>" type="button">&nbsp;&nbsp;<i class="fa fa-check-circle"></i>&nbsp;&nbsp;Yes&nbsp;&nbsp;</button>&nbsp;&nbsp;
	                <button data-dismiss="modal" class="btn btn-danger" type="button"><i class="fa fa-times-circle"></i>&nbsp;Cancel</button>
            	</div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Confirm End -->
