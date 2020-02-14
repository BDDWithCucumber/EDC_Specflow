using Framework.Actions;
using Pages.DataLabs.Main;
using Pages.DataLabs.Common;
using Interfaces;

namespace BusinessProcesses.DataLabs.Main
{
    public class BP_MainNavigationUtilities
    {
        public static bool SelectPrimaryTabOnMenu(string PrimaryTabName)
        {
            Control_ActionUtilities.Click(DL_PrimaryTabs.ViewMoreButton, "Unable to click ViewMoreButton(...)");
            return Control_ActionUtilities.Click(DL_PrimaryTabs.GetPrimaryTab(PrimaryTabName), "Unable to click " + PrimaryTabName + " tab.");
        }

        public static bool SelectSiteFromSiteDropdown(string SiteName)
        {
            return Control_ActionUtilities.Dropdown_SelectItemOld(DL_CommonObjects.SiteSelectionDropDown, SiteName, "Unable to select site '" + SiteName + "' from Site selection dropdown.");
        }


    }
}