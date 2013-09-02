#region Copyright

// 
// DotNetNuke� - http://www.dotnetnuke.com
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
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Common.Utils;
using DotNetNuke.ComponentModel;
using DotNetNuke.Data;
using DotNetNuke.Entities.Users;
using DotNetNuke.Instrumentation;
using DotNetNuke.Services.Log.EventLog;

#endregion

namespace DotNetNuke.Entities.Host
{
    public class IPFilterController : ComponentBase<IIPFilterController, IPFilterController>, IIPFilterController
    {
        #region Private

        private static readonly ILog Logger = LoggerSource.Instance.GetLogger(typeof (IPFilterController));
        
        private enum FilterType
        {
            Allow=1,
            Deny=2
        }
        #endregion

        #region Constructor

        internal IPFilterController()
        {
        }

        #endregion

        #region IIPFilterController Members

        public int AddIPFilter(IPFilterInfo ipFilter)
        {
            Requires.NotNull("ipFilter", ipFilter);
            int id = DataProvider.Instance().AddIPFilter(ipFilter.IPAddress, ipFilter.SubnetMask, ipFilter.RuleType, UserController.GetCurrentUserInfo().UserID);
            return id;
        }

        public void UpdateIPFilter(IPFilterInfo ipFilter)
        {
            Requires.NotNull("ipFilter", ipFilter);
            DataProvider.Instance().UpdateIPFilter(ipFilter.IPFilterID, ipFilter.IPAddress, ipFilter.SubnetMask, ipFilter.RuleType, UserController.GetCurrentUserInfo().UserID);
        }

        public void DeleteIPFilter(IPFilterInfo ipFilter)
        {
            Requires.PropertyNotNegative("ipFilter", "ipFilter.IPFilterID", ipFilter.IPFilterID);
            DataProvider.Instance().DeleteIPFilter(ipFilter.IPFilterID);
        }

        public IPFilterInfo GetIPFilter(int ipFilter)
        {
            return CBO.FillObject<IPFilterInfo>(DataProvider.Instance().GetIPFilter(ipFilter));       
        }
    
        IList<IPFilterInfo> IIPFilterController.GetIPFilters()
        {
            return CBO.FillCollection<IPFilterInfo>(DataProvider.Instance().GetIPFilters());
        }

        [Obsolete("deprecated with 7.1.0 - please use IsIPBanned instead to return the value and apply your own logic")]
        public void IsIPAddressBanned(string ipAddress)
        {
            if (CheckIfBannedIPAddress(ipAddress))
            {//should throw 403.6
            throw new HttpException(403, "");
            }
        }

        public bool IsIPBanned(string ipAddress)
        {

            return CheckIfBannedIPAddress(ipAddress);
        }

        private bool CheckIfBannedIPAddress(string ipAddress)
        {
            IList<IPFilterInfo> filterList = IPFilterController.Instance.GetIPFilters();

            foreach (var ipFilterInfo in filterList)
            {
                if (ipFilterInfo.RuleType == 2)
                {
                    if (NetworkUtils.IsIPInRange(ipAddress, ipFilterInfo.IPAddress, ipFilterInfo.SubnetMask))
                    {
                        //log
                        LogBannedIPAttempt(ipAddress);
                        return true;

                    }
                }
            }
            return false;
        }

        

        private void LogBannedIPAttempt(string ipAddress)
        {
            var controller = new LogController();
            var log = new LogInfo
            {
                LogTypeKey = EventLogController.EventLogType.IP_LOGIN_BANNED.ToString()
            };
            log.LogProperties.Add(new LogDetailInfo("HostAddress", ipAddress));
            controller.AddLog(log);
        }

        public bool CanIPStillAccess(string myip,IList<IPFilterInfo> filterList)
        {
            var allowAllIPs = false;
            var globalAllow = (from p in filterList
                               where p.IPAddress == "*"
                               select p).ToList();

            if (globalAllow.Count > 0)
            {
                allowAllIPs = true;
            }

            var allowRules = (from p in filterList
                              where p.RuleType == (int)FilterType.Allow
                              select p).ToList();

            var denyRules = (from p in filterList
                             where p.RuleType == (int)FilterType.Deny
                             select p).ToList();
            //if global allow and no deny
            if (allowAllIPs & denyRules.Count==0)
            {
                return true;
            }

            //if global allow, check if a deny rule would override
            if (allowAllIPs & denyRules.Count>0)
            {
                if (denyRules.Any(ipf => NetworkUtils.IsIPInRange(myip, ipf.IPAddress, ipf.SubnetMask)))
                {
                    return false;
                }
            }

            //if no global allow, check if a deny rule would apply
            if (allowAllIPs==false & denyRules.Count > 0)
            {
                if (denyRules.Any(ipf => NetworkUtils.IsIPInRange(myip, ipf.IPAddress, ipf.SubnetMask)))
                {
                    return false;
                }
            }

            //if no global allow, and no deny rules check if an allow rule would apply
            if (allowAllIPs == false & denyRules.Count == 0)
            {
                if (allowRules.Any(ipf => NetworkUtils.IsIPInRange(myip, ipf.IPAddress, ipf.SubnetMask)))
                {
                    return true;
                }
            }

            return false;
        }


        public bool IsAllowableDeny(string currentIP, IPFilterInfo ipFilter)
        {
            if (ipFilter.RuleType==(int)FilterType.Allow)
            {
                return true;
            }

            if (NetworkUtils.IsIPInRange(currentIP, ipFilter.IPAddress, ipFilter.SubnetMask))
            {
                return false;
            }
            return true;
        }

        #endregion
    }
}