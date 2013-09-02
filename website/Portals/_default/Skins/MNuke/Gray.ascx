<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>

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


<script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
<script type="text/javascript">
    function displaybutton() {
        var el = document.getElementById("mj-pos-mainnav");
        el.style.display = (el.style.display == 'block') ? 'none' : 'block';
        el.style.height = (el.style.height == 'auto') ? '0' : 'auto';
    }
</script>

<script type="text/javascript">
    //<![CDATA[
    try { $Gavick; } catch (e) { $Gavick = {}; };
    $Gavick["nsp-nsp_167"] = {
        "animation_speed": 400,
        "animation_interval": 5000,
        "animation_function": Fx.Transitions.Expo.easeIn,
        "news_column": 3,
        "news_rows": 1,
        "links_columns_amount": 1,
        "links_amount": 3,
        "counter_text": '<strong>Page:</strong>'
    };
    //]]>
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
                    <form action="/demo/mj_simple/index.php" method="post">
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

    <div id="contentPane" runat="server">
    </div>
    <div id="mj-featured1">
        <div class="mj-subcontainer">
            <div id="rightPane_1" class="contentPane" runat="server">
            </div>
        </div>
    </div>

    <div id="mj-featured2">
        <div class="mj-subcontainer">
            <div>

                <div id="rightPane_b_1" class="contentPane mj-grid16" runat="server">
                </div>
                <div id="rightPane_b_2" class="contentPane mj-grid16" runat="server">
                </div>
                <div id="rightPane_b_3" class="contentPane mj-grid16" runat="server">
                </div>
                <div id="rightPane_b_4" class="contentPane mj-grid16" runat="server">
                </div>
                <div id="rightPane_b_5" class="contentPane mj-grid16" runat="server">
                </div>
                <div id="rightPane_b_6" class="contentPane mj-grid16" runat="server">
                </div>
            </div>


        </div>
    </div>
    <div id="mj-maincontent">
        <div class="mj-subcontainer">
            <div id="mj_maincontent_a" class="mj-grid72 contentPane" runat="server"></div>
            <div id="mj_maincontent_b" class="contentPane mj-grid24" runat="server"></div>
        </div>
    </div>

    <div id="mj-featured3">
        <div class="mj-subcontainer">
            <div id="featured3_a" class="moduletable mj-grid24 mtop30 contentPane" runat="server"></div>
            <div id="featured3_b" class="contentPane mj-grid72" runat="server"></div>
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






