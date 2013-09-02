<%@ Control Language="C#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>


<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="NAV" Src="~/Admin/Skins/Nav.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOMOBILE" Src="~/Admin/Skins/LinkToMobileSite.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>

<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
<script type="text/javascript">
    function displaybutton() {
        var el = document.getElementById("mj-pos-mainnav");
        el.style.display = (el.style.display == 'block') ? 'none' : 'block';
        el.style.height = (el.style.height == 'auto') ? '0' : 'auto';
    }
    var viewPortTag = document.createElement('meta');
    viewPortTag.id = "viewport";
    viewPortTag.name = "viewport";
    viewPortTag.content = "width=device-width, initial-scale=1";
    document.getElementsByTagName('head')[0].appendChild(viewPortTag);
</script>
<div id="mj-container">
    <div id="mj-topbar">
        <div class="mj-subcontainer">
            <div class="moduletable mj-grid16 mj_call">


                 <div class="custom mj-grid16 mj_call">
                     <div id="contactno" class="contentPane" runat="server" >
                </div>
            </div>
                </div>
            <div class="moduletable mj-grid8 mj_headmenum mj-rspace">

                <ul class="menu">
                    <li class="item-118"><a href="#">|</a></li>
                    <li class="item-103"><a href="#">
                        <dnn:LOGIN runat="server" ID="dnnLOGIN" />
                    </a></li>
                    <li class="item-119"></li>
                </ul>
            </div>
            <div class="moduletable mj-search mj-grid12 mj-rspace">




                <div class="mainsearch">
                    <form action="Home.aspx" method="post">
                        <div class="leftsearch slidingDiv">
                       
                            <dnn:SEARCH ID="search" runat="server" ShowSite="false" ShowWeb="false" Submit="Go" />

                        </div>

                    </form>
                </div>


            </div>

        </div>
    </div>

    <div id="mj-header">
        <div class="mj-subcontainer">
            <div id="mj-logo">
                <dnn:LOGO runat="server" ID="dnnLOGO" />
            </div>
            <div id="mj-righttop">
                <div class="moduletable mj-menu1">
                    <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz' rel="stylesheet" type="text/css" />


                    <div class="mj-mainnav navbar">
                        <div class="mj-mainnav-inner navbar-inner">
                            <div class="container cleardiv">
                                <div class="mainnav-toggle cleardiv">
                                    <button data-toggle="collapse" class="btn btn-navbar" type="button" onclick="displaybutton()">
                                        <span>Main Menu</span>
                                    </button>
                                </div>

                                <div class="collapse nav-collapse cleardiv" id="mj-pos-mainnav">
                                    <dnn:MENU runat="server" ID="dnnMENU" MenuStyle="TopMenu" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>


</div>

<div id="mj-slidetitle">
    <div class="mj-subcontainer">
        <div id="mj_slidetitle" runat="server" class="contentPane">
        </div>
    </div>

</div>

<div id="mj-featured1">
    <div class="mj-subcontainer">
        <div class="moduletable mj-grid96 breadcrumb">
            <div class="breadcrumbs mj-grid96 breadcrumb">
                <dnn:BREADCRUMB runat="server" ID="dnnBREADCRUMB" RootLevel="0" Separator="&lt;img src=&quot;images/breadcrumb_sep.png&quot;&gt;" CssClass="" />
            </div>
        </div>
    </div>
</div>
<div id="mj-maincontent">
    <div class="mj-subcontainer">
        <div id="mj-contentarea" class="mj-grid96">
            <div id="mj-content">
                <div id="maincontent" runat="server" class="contentPane"></div>
            </div>


        </div>
    </div>

    <div id="mj-footer">
        <div class="mj-subcontainer">


            <div id="mj_footer_a" class="moduletable mj-grid24 mj-dotted contentPane" runat="server"></div>
           
            <div id="mj_footer_c" class="moduletable mj-grid24 mj-dotted contentPane" runat="server"></div>
            <div id="mj_footer_d" class="moduletable mj-grid24 mj-dotted contentPane" runat="server">
                <h3>Navigation</h3>
                <dnn:MENU runat="server" ID="MENU2" MenuStyle="BottomMenu" />
            </div>
             <div id="mj_footer_b" class="moduletable mj-grid24 mj-dotted contentPane" runat="server"></div>


        </div>
    </div>
    <div id="mj-copyright">
        <div class="mj-subcontainer">
            <div class="moduletable mj-grid80 copyright">


                <div class="custom mj-grid80 copyright">
                    <p>
                        <dnn:COPYRIGHT ID="dnnCopyright" runat="server" />
                    </p>
                </div>
            </div>
            <div class="moduletable mj-grid16">


                <div class="custom mj-grid16">
                    <p></p>
                </div>
            </div>

        </div>
    </div>
</div>






