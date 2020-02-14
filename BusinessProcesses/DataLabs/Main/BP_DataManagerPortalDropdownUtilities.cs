using Framework.Actions;
using Pages.DataLabs.Main;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Main
{
    public class BP_DataManagerPortalDropdownUtilities
    {
        public static bool SelectPortalDropdownItem(String dataManagerPortalItem)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItemOld(DL_MainPage.PortalSelectionDropDown, dataManagerPortalItem, "Unable to select " + dataManagerPortalItem);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}