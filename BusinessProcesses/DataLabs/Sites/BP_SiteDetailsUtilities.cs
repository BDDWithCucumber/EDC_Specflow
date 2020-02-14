
using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Sites;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_SiteDetailsUtilities
    {
        public static bool IsSiteDetailsPageOpened(String site)
        {
            try
            {
                IControl siteLabel = DL_SiteDetailsPage.Site;
                return Control_PropertyUtilities.GetText(siteLabel).Equals(site, StringComparison.InvariantCultureIgnoreCase);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
