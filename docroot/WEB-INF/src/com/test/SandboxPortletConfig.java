package com.test;

import com.liferay.portal.kernel.portlet.ConfigurationAction;
import javax.portlet.*;

public class SandboxPortletConfig implements ConfigurationAction {
@Override
public void processAction(PortletConfig portletConfig, 
    ActionRequest actionRequest, ActionResponse actionResponse) 
        throws Exception {

    }

@Override
public String render(PortletConfig portletConfig, RenderRequest renderRequest, 
    RenderResponse renderResponse) throws Exception {
    return "/html/sandboxPortlet/config.jsp";
    }
}