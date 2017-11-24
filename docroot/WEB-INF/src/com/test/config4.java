package com.test;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.LiferayPortlet;

/**
 * Portlet implementation class config4
 */
public class config4 extends LiferayPortlet {

    public void init() {
        aboutTemplate = getInitParameter("about-template");
        configTemplate = getInitParameter("config-template");
        editDefaultsTemplate = getInitParameter("edit-defaults-template");
        editGuestTemplate = getInitParameter("edit-guest-template");
        previewTemplate = getInitParameter("preview-template");
        printTemplate = getInitParameter("print-template");
        editTemplate = getInitParameter("edit-template");
        helpTemplate = getInitParameter("help-template");
        viewTemplate = getInitParameter("view-template");
    }

    public void doAbout(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(aboutTemplate, renderRequest, renderResponse);
    }

    public void doConfig(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(configTemplate, renderRequest, renderResponse);
    }

    public void doEdit(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(editTemplate, renderRequest, renderResponse);
    }

    public void doEditDefaults(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        if (renderRequest.getPreferences() == null) {
            super.doEdit(renderRequest, renderResponse);
        }
        else {
            include(editDefaultsTemplate, renderRequest, renderResponse);
        }
    }

	public void doEditGuest(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        if (renderRequest.getPreferences() == null) {
            super.doEdit(renderRequest, renderResponse);
        }
        else {
            include(editGuestTemplate, renderRequest, renderResponse);
        }
    }

    public void doHelp(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(helpTemplate, renderRequest, renderResponse);
    }

    public void doPreview(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(previewTemplate, renderRequest, renderResponse);
    }

    public void doPrint(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(printTemplate, renderRequest, renderResponse);
    }

    public void doView(
            RenderRequest renderRequest, RenderResponse renderResponse)
        throws IOException, PortletException {

        include(viewTemplate, renderRequest, renderResponse);
    }

    protected void include(
            String path, RenderRequest renderRequest,
            RenderResponse renderResponse)
        throws IOException, PortletException {

        PortletRequestDispatcher portletRequestDispatcher =
            getPortletContext().getRequestDispatcher(path);

        if (portletRequestDispatcher == null) {
            _log.error(path + " is not a valid include");
        }
        else {
            portletRequestDispatcher.include(renderRequest, renderResponse);
        }
    }

    protected String aboutTemplate;
    protected String configTemplate;
    protected String editDefaultsTemplate;
    protected String editGuestTemplate;
    protected String previewTemplate;
    protected String printTemplate; 
    protected String editTemplate;
    protected String helpTemplate;
    protected String viewTemplate;

    private static Log _log = LogFactoryUtil.getLog(config4.class);

}
