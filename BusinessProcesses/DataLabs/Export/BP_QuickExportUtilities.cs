using Framework.Actions;
using Pages.DataLabs.Data;
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
    public class BP_QuickExportUtilities
    {
        public static bool SetQuickExportData(QuickExportData data)
        {
            try
            {
                if (!String.IsNullOrEmpty(data.Site))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_QuickExportPage.SiteDropdown, data.Site, String.Empty);
                }
                if (!String.IsNullOrEmpty(data.Patient))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_QuickExportPage.PatientDropdown, data.Patient, String.Empty);
                }
                if (!String.IsNullOrEmpty(data.Event))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_QuickExportPage.EventDropdown, data.Event, String.Empty);
                }
                if (!String.IsNullOrEmpty(data.Form))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_QuickExportPage.FormsDropdown, data.Form, String.Empty);
                }
                if (!String.IsNullOrEmpty(data.Format))
                {
                    Control_ActionUtilities.Dropdown_SelectItem(DL_QuickExportPage.FormatDropdown, data.Format, String.Empty);
                }
                return true;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickExportButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_QuickExportPage.ExportButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
