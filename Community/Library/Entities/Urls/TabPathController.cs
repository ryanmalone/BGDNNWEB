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
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

using DotNetNuke.Collections.Internal;
using DotNetNuke.Entities.Portals;
using DotNetNuke.Entities.Tabs;
using DotNetNuke.Services.Localization;

#endregion

namespace DotNetNuke.Entities.Urls
{
    /// <summary>
    /// The TabPathHelper class provides helper methods for working with tab urls
    /// </summary>
    public class TabPathHelper
    {
        #region Private Methods

        private static string AppendToTabPath(string path, TabInfo tab, FriendlyUrlOptions options, out bool modified)
        {
            string tabName = tab.TabName;
            var result = new StringBuilder(tabName.Length);
            //922 : change to harmonise cleaning of tab + other url name items
            tabName = FriendlyUrlController.CleanNameForUrl(tabName, options, out modified);
            if (!modified
                && string.IsNullOrEmpty(options.PunctuationReplacement) == false
                && tab.TabName.Contains(" ")
                && tabName.Contains(" ") == false)
            {
                modified = true;
                //spaces replaced - the modified parameter is for all other replacements but space replacements
            }
            result.Append(tabName);
            result.Insert(0, "//");
            result.Insert(0, path); //effectively adds result to the end of the path
            return result.ToString();
        }

        #endregion

        #region Internal Methods

        /// <summary>
        /// Get the tab path for the supplied Tab
        /// </summary>
        /// <param name="tab"></param>
        /// <param name="options"></param>
        /// <param name="parentTraceId"></param>
        /// <returns></returns>
        internal static string GetFriendlyUrlTabPath(TabInfo tab, FriendlyUrlOptions options, Guid parentTraceId)
        {
            string baseTabPath = tab.TabPath.Replace("//", "/").TrimStart('/');
            if (options.CanGenerateNonStandardPath)
            {
                //build up a non-space version of the tab path 
                baseTabPath = BuildTabPathWithReplacement(tab, options, parentTraceId);
                baseTabPath = baseTabPath.Replace("//", "/");

                //automatic diacritic conversion
                if (options.ConvertDiacriticChars)
                {
                    bool diacriticsChanged;
                    baseTabPath = ReplaceDiacritics(baseTabPath, out diacriticsChanged);
                }
            }
            return baseTabPath;
        }

        /// <summary>
        /// Finds a culture-specific homepage tabid for a non-default language
        /// </summary>
        /// <param name="defaultCulture">The default culture of the portal</param>
        /// <param name="cultureCode"></param>
        /// <param name="defaultHomeTabId">The default home page tab id</param>
        /// <param name="portalId"></param>
        /// <returns>THe valid home page tabid for the portalid and culture</returns>
        /// <remarks>Note if no specific home page found for the culture, will return defaultHomeTabId back</remarks>
        internal static int GetHomePageTabIdForCulture(string defaultCulture, int portalId, string cultureCode,
                                                       int defaultHomeTabId)
        {
            int homeTabId = defaultHomeTabId;
            if (String.Compare(defaultCulture, cultureCode, StringComparison.OrdinalIgnoreCase) != 0)
            {
                //not the default culture, so there could be a different home page for the different cultulre in 5.5+ builds
                var tc = new TabController();
                var cultureLocale = new Locale { Code = cultureCode, Fallback = cultureCode, Text = cultureCode };
                TabInfo tab = tc.GetTabByCulture(defaultHomeTabId, portalId, cultureLocale);
                if (tab != null)
                {
                    //this is the culture specific tab of the home page
                    homeTabId = tab.TabID;
                }
            }
            return homeTabId;
        }

        internal static string GetTabAliasSkinForTabAndAlias(int portalId, string httpAlias, string culture)
        {
            string skin = null;
            Hashtable homePageSkins = CacheController.GetHomePageSkinsFromCache(portalId);
            if (homePageSkins != null)
            {
                string key = httpAlias + "::" + culture;
                string key2 = httpAlias;
                if (homePageSkins.ContainsKey(key))
                {
                    skin = (string)homePageSkins[key];
                }
                else if (homePageSkins.ContainsKey(key2))
                {
                    skin = (string)homePageSkins[key2];
                }
            }
            return skin;
        }

        /// <summary>
        /// For the supplied options, return a tab path for the specified tab
        /// </summary>
        /// <param name="tab">TabInfo object of selected tab</param>
        /// <param name="settings">FriendlyUrlSettings</param>
        /// <param name="options"></param>
        /// <param name="ignoreCustomRedirects">Whether to add in the customised Tab redirects or not</param>
        /// <param name="homePageSiteRoot"></param>
        /// <param name="isHomeTab"></param>
        /// <param name="cultureCode"></param>
        /// <param name="isDefaultCultureCode"></param>
        /// <param name="hasPath"></param>
        /// <param name="dropLangParms"></param>
        /// <param name="customHttpAlias"></param>
        /// <param name="isCustomPath"></param>
        /// <param name="parentTraceId"></param>
        /// <remarks>751 : include isDefaultCultureCode flag to determine when using the portal default language
        /// 770 : include custom http alias output for when the Url uses a specific alias due to custom Url rules
        ///  : include new out parameter 'isCustomPath' to return whether the Url was generated from Url-Master custom url
        /// </remarks>
        /// <returns>The tab path as specified</returns>
        internal static string GetTabPath(TabInfo tab,
                                            FriendlyUrlSettings settings,
                                            FriendlyUrlOptions options,
                                            bool ignoreCustomRedirects,
                                            bool homePageSiteRoot,
                                            bool isHomeTab,
                                            string cultureCode,
                                            bool isDefaultCultureCode,
                                            bool hasPath,
                                            out bool dropLangParms,
                                            out string customHttpAlias,
                                            out bool isCustomPath,
                                            Guid parentTraceId)
        {
            string newTabPath;
            dropLangParms = false;
            customHttpAlias = null;
            isCustomPath = false;
            if (homePageSiteRoot && isHomeTab && !hasPath)
            // && !isDefaultCultureCode - not working for non-language specifc custom root urls
            {
                newTabPath = "/"; //site root for home page
            }
            else
            {
                //build the tab path and check for space replacement
                string baseTabPath = TabIndexController.GetTabPath(tab, options, parentTraceId);

                //this is the new tab path
                newTabPath = baseTabPath;
                //871 : case insensitive compare for culture code, all lookups done on lower case
                string cultureCodeKey = "";
                if (cultureCode != null)
                {
                    cultureCodeKey = cultureCode.ToLower();
                }

                bool checkForCustomHttpAlias = false;
                //get a custom tab name if redirects are being used
                SharedDictionary<string, string> customAliasForTabs = null;
                SharedDictionary<int, SharedDictionary<string, string>> urlDict;
                //886 : don't fetch custom urls for host tabs (host tabs can't have redirects or custom Urls)
                if (tab.PortalID > -1)
                {
                    urlDict = CustomUrlDictController.FetchCustomUrlDictionary(tab.PortalID, false, false, settings, out customAliasForTabs, parentTraceId);
                }
                else
                {
                    urlDict = new SharedDictionary<int, SharedDictionary<string, string>>();
                    //create dummy dictionary for this tab
                }

                if (ignoreCustomRedirects == false)
                {
                    //if not ignoring the custom redirects, look for the Url of the page in this list
                    //this will be used as the page path if there is one.

                    using (urlDict.GetReadLock())
                    {
                        if (urlDict.ContainsKey(tab.TabID))
                        {
                            //we want the custom value
                            string customTabPath = null;
                            SharedDictionary<string, string> tabpaths = urlDict[tab.TabID];

                            using (tabpaths.GetReadLock())
                            {
                                if (tabpaths.ContainsKey(cultureCodeKey))
                                {
                                    customTabPath = tabpaths[cultureCodeKey];
                                    dropLangParms = true;
                                    //the url is based on a custom value which has embedded language parms, therefore don't need them in the url
                                }
                                else
                                {
                                    if (isDefaultCultureCode && tabpaths.ContainsKey(""))
                                    {
                                        customTabPath = tabpaths[""];
                                        //dropLangParms = true;//drop the language parms if they exist, because this is the default language
                                    }
                                }
                            }
                            if (customTabPath != null)
                            {
                                //770 : pull out custom http alias if in string
                                int aliasSeparator = customTabPath.IndexOf("::", StringComparison.Ordinal);
                                if (aliasSeparator > 0)
                                {
                                    customHttpAlias = customTabPath.Substring(0, aliasSeparator);
                                    newTabPath = customTabPath.Substring(aliasSeparator + 2);
                                }
                                else
                                {
                                    newTabPath = customTabPath;
                                }
                            }
                            if (newTabPath == "" && hasPath)
                            {
                                //can't pass back a custom path which is blank if there are path segments to the requested final Url
                                newTabPath = baseTabPath; //revert back to the standard DNN page path
                            }
                            else
                            {
                                isCustomPath = true; //we are providing a custom Url 
                            }
                        }
                        else
                        {
                            checkForCustomHttpAlias = true;
                        }
                    }
                }
                else
                {
                    checkForCustomHttpAlias = true;
                    //always want to check for custom alias, even when we don't want to see any custom redirects
                }

                //770 : check for custom alias in these tabs
                if (checkForCustomHttpAlias && customAliasForTabs != null)
                {
                    string key = tab.TabID.ToString() + ":" + cultureCodeKey;
                    using (customAliasForTabs.GetReadLock())
                    {
                        if (customAliasForTabs.ContainsKey(key))
                        {
                            //this tab uses a custom alias
                            customHttpAlias = customAliasForTabs[key];
                            isCustomPath = true; //using custom alias
                        }
                    }
                }

                if (!dropLangParms)
                {
                    string tabCultureCode = tab.CultureCode;
                    if (!string.IsNullOrEmpty(tabCultureCode))
                    {
                        dropLangParms = true;
                        //if the tab has a specified culture code, then drop the language parameters from the friendly Url
                    }
                }
                //make lower case if necessary
                newTabPath = AdvancedFriendlyUrlProvider.ForceLowerCaseIfAllowed(tab, newTabPath, settings);
            }
            return newTabPath;
        }

        internal static bool IsTabHomePage(TabInfo tab, PortalSettings portalSettings)
        {
            bool isTabHomePage = (tab.TabID == portalSettings.HomeTabId);
            if (!isTabHomePage)
            {
                //756: check if content localization is switched on before checking for other languages 
                if (Host.Host.EnableBrowserLanguage)
                {
                    //check the localised versions of the tab
                    TabInfo defaultLangTab = tab.DefaultLanguageTab;
                    if (defaultLangTab != null)
                    {
                        //is the default language tab the home tab?
                        if (defaultLangTab.TabID == portalSettings.HomeTabId)
                        {
                            isTabHomePage = true;
                        }
                        else
                        {
                            //iterate through the other localised versions of this tab and check if they are the same
                            //as the home tabid
                            Dictionary<string, TabInfo> localizedTabs = tab.LocalizedTabs;
                            if (localizedTabs.Values.Any(localTab => localTab.TabID == portalSettings.HomeTabId))
                            {
                                isTabHomePage = true;
                            }
                        }
                    }
                    else
                    {
                        //check if this tab belongs to the default language, in which case it is already the default language tab
                        string cultureCode = tab.CultureCode;
                        if (String.Compare(cultureCode, portalSettings.DefaultLanguage, StringComparison.OrdinalIgnoreCase) == 0)
                        {
                            //get the localized versions and see if this matches
                            Dictionary<string, TabInfo> localizedTabs = tab.LocalizedTabs;
                            if (localizedTabs.Values.Any(localTab => localTab.TabID == portalSettings.HomeTabId))
                            {
                                isTabHomePage = true;
                            }
                        }
                    }
                }
            }
            return isTabHomePage;
        }

        #endregion

        #region Public Methods

        public static string BuildTabPathWithReplacement(TabInfo tab, FriendlyUrlOptions options, Guid parentTraceId)
        {
            string path = "";
            if ((tab.ParentId > -1))
            {
                var tc = new TabController();
                TabInfo parentTab = tc.GetTab(tab.ParentId, tab.PortalID, false);
                //822 : don't assume parent tab is going to exist - database might be corrupted
                //896 : check to make sure tabid and parentid are different - or stack overflow occurs with terminal loop
                if (parentTab != null && parentTab.TabID != tab.TabID)
                {
                    path = BuildTabPathWithReplacement(parentTab, options, parentTraceId);
                }
            }
            bool modified;
            path = AppendToTabPath(path, tab, options, out modified);

            return path;
        }

        /// <summary>
        /// Replaces the diacritic characters in a path with other values
        /// </summary>
        /// <param name="tabPath"></param>
        /// <param name="replacedDiacritic"></param>
        /// <returns></returns>
        public static string ReplaceDiacritics(string tabPath, out bool replacedDiacritic)
        {
            string nmTabPath = tabPath.Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();
            for (int i = 0; i < nmTabPath.Length; i++)
            {
                char c = nmTabPath[i];
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }
            string result = sb.ToString();
            replacedDiacritic = String.CompareOrdinal(tabPath, result) != 0;
            return sb.ToString();
        }

        #endregion

    }
}