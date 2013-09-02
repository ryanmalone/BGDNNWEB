﻿#region Copyright
// 
// DotNetNuke® - http://www.dotnetnuke.com
// Copyright (c) 2002-2013
// by DotNetNuke Corporation
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
// to permit persons to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial portions 
// of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
#endregion
#region Usings

using System;
using System.Collections;
using System.Linq;
using System.Web.Caching;

using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Data;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Portals.Internal;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Security;
using DotNetNuke.Security.Permissions;
using DotNetNuke.Services.Search.Entities;

#endregion

namespace DotNetNuke.Services.Search.Controllers
{
    /// <summary>
    /// Search Result Controller for Module Crawler
    /// </summary>
    /// <remarks></remarks>
    public class ModuleResultController : BaseResultController
    {
        #region Abstract Class Implmentation

        public override bool HasViewPermission(SearchResult searchResult)
        {
            var viewable = false;
            if (searchResult.ModuleId > 0)
            {
                //Get All related tabIds from moduleId (while minimizing DB access; using caching)
                var tabController = new TabController();
                var moduleId = searchResult.ModuleId;
                // The next call has over 30% performance enhancement over the above one
                var tabModules = tabController.GetTabsByPortal(searchResult.PortalId).Values
                    .SelectMany(tabinfo => tabinfo.ChildModules.Where(kv => kv.Key == moduleId)).Select(m => m.Value);

                foreach (ModuleInfo module in tabModules)
                {
                    var tab = tabController.GetTab(module.TabID, searchResult.PortalId, false);
                    if (!module.IsDeleted && !tab.IsDeleted && TabPermissionController.CanViewPage(tab))
                    {
                        //Check If authorised to View Module
                        if (ModulePermissionController.CanViewModule(module))
                        {
                            //Verify against search document permissions
                            if (string.IsNullOrEmpty(searchResult.Permissions) || PortalSecurity.IsInRoles(searchResult.Permissions))
                            {
                                viewable = true;
                                if (string.IsNullOrEmpty(searchResult.Url))
                                    searchResult.Url = Globals.NavigateURL(module.TabID, string.Empty, searchResult.QueryString);
                                break;
                            }
                        }
                    }
                }
            }
            else
            {
                viewable = true;
            }

            return viewable;
        }

        // Returns the URL to the first instance of the module the user has access to view
        public override string GetDocUrl(SearchResult searchResult)
        {
            if (!string.IsNullOrEmpty(searchResult.Url))
                return searchResult.Url;

            var url = Localization.Localization.GetString("SEARCH_NoLink");
            var tabController = new TabController();
            //Get All related tabIds from moduleId
            var tabModules = GetModuleTabs(searchResult.ModuleId);

            foreach (ModuleInfo module in tabModules)
            {
                var tab = tabController.GetTab(module.TabID, searchResult.PortalId, false);
                if (TabPermissionController.CanViewPage(tab) && ModulePermissionController.CanViewModule(module))
                {
	                var portalSettings = new PortalSettings(searchResult.PortalId);
	                portalSettings.PortalAlias = TestablePortalAliasController.Instance.GetPortalAlias(portalSettings.DefaultPortalAlias);
                    url = Globals.NavigateURL(module.TabID, portalSettings, string.Empty, searchResult.QueryString);
                    break;
                }
            }

            return url;
        }

        private const string ModuleByIdCacheKey = "ModuleById{0}";
        private const CacheItemPriority ModuleByIdCachePriority = CacheItemPriority.Normal;
        private const int ModuleByIdCacheTimeOut = 20;

        private static ArrayList GetModuleTabs(int moduleID)
        {
            // no manual clearing of the cache exists; let is just expire
            var cacheKey = string.Format(ModuleByIdCacheKey, moduleID);
            return CBO.GetCachedObject<ArrayList>(
                new CacheItemArgs(cacheKey, ModuleByIdCacheTimeOut, ModuleByIdCachePriority, moduleID),
                (args) => CBO.FillCollection(DataProvider.Instance().GetModule(moduleID, Null.NullInteger), typeof(ModuleInfo)));
        }

        #endregion
    }
}
