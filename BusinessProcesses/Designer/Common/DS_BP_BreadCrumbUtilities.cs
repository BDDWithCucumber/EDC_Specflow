using Framework.Actions;
using Interfaces;
using Pages.Designer.Common;
using Pages.Designer.Data;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.Designer.Common
{
    public class DS_BP_BreadCrumbUtilities
    {
        public static bool ClickBreadCrumbItem(String breadCrumbItemName)
        {
            try
            {
                IControl breadCrumbItem = DS_CommonObjects.GetClickableBreadCrumbItem(breadCrumbItemName);
                return Control_ActionUtilities.Click(breadCrumbItem, "Unable to click breadcruemb item" + breadCrumbItemName);
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool ClickHomeButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_CommonObjects.Home, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool ClickLocalLabs()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_CommonObjects.LocalLabs, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VersionChangeModelContinueButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DS_CommonObjects.ContinueButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyBreadCrumbFullPath(List<BreadCrumbData> breadCrumbItemList)
        {
            try
            {
                int i = 1;
                foreach (BreadCrumbData item in breadCrumbItemList)
                {
                    if (i == breadCrumbItemList.Count)
                    {
                        IControl breadCrumbHost = DS_CommonObjects.BreadCrumbHost;
                        if (!Control_PropertyUtilities.IsControlNull(breadCrumbHost))
                        {
                            String breadCrumbText = Control_PropertyUtilities.GetText(breadCrumbHost);
                            if (!breadCrumbText.EndsWith(item.BreadCrumb, StringComparison.InvariantCultureIgnoreCase))
                            {
                                return false;
                            }
                        }
                    }
                    else
                    {
                        IControl breadCrumbItem = DS_CommonObjects.GetBreadCrumbLink(i);
                        if (!Control_PropertyUtilities.IsControlNull(breadCrumbItem))
                        {
                            String actualText = Control_PropertyUtilities.GetText(breadCrumbItem);
                            if (!item.BreadCrumb.Equals(actualText, StringComparison.InvariantCultureIgnoreCase))
                            {
                                return false;
                            }
                            ++i;
                        }
                    }
                }
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }
    }
}
