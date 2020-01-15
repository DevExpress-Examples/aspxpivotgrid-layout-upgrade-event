
<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="ViewSwitcher.ascx.vb" Inherits="ASPxPivotGridLayoutUpgradeEvent.ViewSwitcher" %>
<div id="viewSwitcher">
<%
	  :
%>
	   view | <a href="
<%
	  CurrentView :
%>
		 " data-ajax="false">Switch to 
<%
	  SwitchUrl :
%>
		   </a>
</div>