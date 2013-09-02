<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>

<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKTOMOBILE" Src="~/Admin/Skins/LinkToMobileSite.ascx" %>
<%@ Register TagPrefix="dnn" TagName="MENU" Src="~/DesktopModules/DDRMenu/Menu.ascx" %>




<script type="text/javascript">

    window.addEvent("load", function () {



        $$('.nspMain').each(function (module) {


            if (!module.hasClass('activated')) {
                module.addClass('activated');
                var $G = $Gavick[module.getProperty('id')];
                var arts_actual = 0;
                var list_actual = 0;
                var arts_block_width = 0;
                var links_block_width = 0;
                var arts = module.getElements('.nspArt');
                var links = (module.getElement('.nspLinkScroll1')) ? module.getElement('.nspLinkScroll1').getElements('li') : [];
                var nspArtWidth = module.getElement('.nspArt') ? arts[0].getStyle('width') : null;
                var arts_per_page = $G['news_column'] * $G['news_rows'];
                var pages_amount = Math.ceil(arts.length / arts_per_page);
                var links_pages_amount = Math.ceil(Math.ceil(links.length / $G['links_amount']) / $G['links_columns_amount']);
                var hover_anim = module.hasClass('hover');
                var animation = true;
                var art_scroller;
                var link_scroller;

                var modInterface = {
                    top: module.getElement('.nspTopInterface'),
                    bottom: module.getElement('.nspBotInterface')
                };


                // arts
                if (arts.length > 0) {
                    arts_block_width = 100;

                    art_scroller = new Fx.Tween(
                        module.getElement('.nspArtScroll2'),
                        {
                            duration: $G['animation_speed'],
                            wait: false,
                            property: 'margin-left',
                            unit: '%',
                            transition: $G['animation_function']
                        }
                    );
                }

                // links
                if (links.length > 0) {
                    links_block_width = 100;

                    link_scroller = new Fx.Tween(
                        module.getElement('.nspLinkScroll2'),
                        {
                            duration: $G['animation_speed'],
                            wait: false,
                            property: 'margin-left',
                            unit: '%',
                            transition: $G['animation_function']
                        }
                    );
                }


                module.getElement('.nspPrev').addEvent("click", function () {

                    if (arts_actual == 0) arts_actual = pages_amount - 1;
                    else arts_actual--;
                    art_scroller.start(-1 * arts_actual * arts_block_width);
                    nsp_art_list(arts_actual, module, modInterface.top, pages_amount);
                    animation = false;
                    (function () { animation = true; }).delay($G['animation_interval'] * 0.8);
                });
                module.getElement('.nspNext').addEvent("click", function () {
                    if (arts_actual == pages_amount - 1) arts_actual = 0;
                    else arts_actual++;
                    art_scroller.start(-1 * arts_actual * arts_block_width);
                    nsp_art_list(arts_actual, module, modInterface.top, pages_amount);
                    animation = false;
                    (function () { animation = true; }).delay($G['animation_interval'] * 0.8);
                });



                // top interface
                nsp_art_list(0, module, modInterface.top, pages_amount);
                nsp_art_list(0, module, modInterface.bottom, links_pages_amount);
                if (modInterface.top && modInterface.top.getElement('.nspPagination')) {
                    modInterface.top.getElement('.nspPagination').getElements('li').each(function (item, i) {
                        item.addEvent(hover_anim ? 'mouseenter' : 'click', function () {
                            art_scroller.start(-1 * i * arts_block_width);
                            arts_actual = i;

                            nsp_art_list(i, module, modInterface.top, pages_amount);
                            animation = false;
                            (function () { animation = true; }).delay($G['animation_interval'] * 0.8);
                        });
                    });
                }




                if (modInterface.top && modInterface.top.getElement('.nspPrev')) {
                    modInterface.top.getElement('.nspPrev').addEvent("click", function () {
                        alert("Pre event add");
                        if (arts_actual == 0) arts_actual = pages_amount - 1;
                        else arts_actual--;
                        art_scroller.start(-1 * arts_actual * arts_block_width);
                        nsp_art_list(arts_actual, module, modInterface.top, pages_amount);
                        animation = false;
                        (function () { animation = true; }).delay($G['animation_interval'] * 0.8);
                    });
                    modInterface.top.getElement('.nspNext').addEvent("click", function () {
                        if (arts_actual == pages_amount - 1) arts_actual = 0;
                        else arts_actual++;
                        art_scroller.start(-1 * arts_actual * arts_block_width);
                        nsp_art_list(arts_actual, module, modInterface.top, pages_amount);
                        animation = false;
                        (function () { animation = true; }).delay($G['animation_interval'] * 0.8);
                    });
                }
                // bottom interface
                if (modInterface.bottom && modInterface.bottom.getElement('.nspPagination')) {
                    modInterface.bottom.getElement('.nspPagination').getElements('li').each(function (item, i) {
                        item.addEvent(hover_anim ? 'mouseenter' : 'click', function () {
                            link_scroller.start(-1 * i * links_block_width);
                            list_actual = i;

                            nsp_art_list(i, module, modInterface.bottom, links_pages_amount);
                        });
                    });
                }
                if (modInterface.bottom && modInterface.bottom.getElement('.nspPrev')) {
                    modInterface.bottom.getElement('.nspPrev').addEvent("click", function () {

                        alert("Hellooooo");

                        if (list_actual == 0) list_actual = links_pages_amount - 1;
                        else list_actual--;

                        link_scroller.start(-1 * list_actual * links_block_width);

                        nsp_art_list(list_actual, module, modInterface.bottom, links_pages_amount);
                    });

                    modInterface.bottom.getElement('.nspNext').addEvent("click", function () {
                        if (list_actual == links_pages_amount - 1) list_actual = 0;
                        else list_actual++;
                        link_scroller.start(-1 * list_actual * links_block_width);

                        nsp_art_list(list_actual, module, modInterface.bottom, links_pages_amount);
                    });
                }
                if (module.hasClass('autoanim')) {
                    (function () {
                        if (modInterface.top && modInterface.top.getElement('.nspNext')) {
                            if (animation) modInterface.top.getElement('.nspNext').fireEvent("click");
                        } else {
                            if (arts_actual == pages_amount - 1) arts_actual = 0;
                            else arts_actual++;

                            art_scroller.start(-1 * arts_actual * arts_block_width);

                            nsp_art_list(arts_actual, module, modInterface.top, pages_amount);
                        }
                    }).periodical($G['animation_interval']);
                }
            }
        });
        function nsp_art_list(i, module, position, num) {
            if (position && position.getElement('.nspPagination')) {
                var pagination = position.getElement('.nspPagination');
                pagination.getElements('li').setProperty('class', '');
                pagination.getElements('li')[i].setProperty('class', 'active');
            }
            if (position && position.getElement('.nspCounter')) {
                position.getElement('.nspCounter').getElement('span').innerHTML = (i + 1) + ' / ' + num;
            }
        }
    });

</script>


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

    <div style="width: 1024px; margin: 0 auto;">
        <div id="contentPane" class="contentPane" runat="server">
        </div>

    </div>
    <div id="rightPane" class="rightPane" runat="server">
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






