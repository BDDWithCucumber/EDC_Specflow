using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Export;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.Export
{
    public class BP_ExportUtilities
    {
        public static bool IsLinkAvailable(String linkName)
        {
            try
            {
                if (linkName.Equals("Quick Export", StringComparison.InvariantCultureIgnoreCase))
                {
                    IControl c = DL_ExportPage.QuickExportLink;
                    return !Control_PropertyUtilities.IsControlNull(c);
                }
                else if (linkName.Equals("Archive Export", StringComparison.InvariantCultureIgnoreCase))
                {
                    IControl c = DL_ExportPage.ArchiveExportLink;
                    return !Control_PropertyUtilities.IsControlNull(c);
                }
                else if (linkName.Equals("Advanced Export", StringComparison.InvariantCultureIgnoreCase))
                {
                    IControl c = DL_ExportPage.AdvancedExportLink;
                    return !Control_PropertyUtilities.IsControlNull(c);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickLink(string linkName)
        {
            try
            {
                if (linkName.Equals("Quick Export", StringComparison.InvariantCultureIgnoreCase))
                {
                    return Control_ActionUtilities.Click(DL_ExportPage.QuickExportLink, String.Empty);
                }
                else if (linkName.Equals("Archive Export", StringComparison.InvariantCultureIgnoreCase))
                {
                    return Control_ActionUtilities.Click(DL_ExportPage.ArchiveExportLink, String.Empty);
                }
                else if (linkName.Equals("Advanced Export", StringComparison.InvariantCultureIgnoreCase))
                {
                    return Control_ActionUtilities.Click(DL_ExportPage.AdvancedExportLink, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}