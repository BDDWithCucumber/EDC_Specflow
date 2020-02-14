using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_DCFs_PaletteUtilities
    {
        public static bool ExpandSearchPalette()
        {
            try
            {
                IControl c = DL_DCFs_SearchPalette.SearchPalette_ExpandCollapseIcon;
                bool found = false;
                String imageSource = Control_PropertyUtilities.GetAttributeValue(c, "src", out found);
                if (found)
                {
                    if (imageSource.Contains("menuDown"))
                    {
                        return Control_ActionUtilities.Click(c, String.Empty);
                    }
                    else
                    {
                        return true;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetDropdownValueForSearchCriteria(String dropdownName, String dropdownValue)
        {
            try
            {
                IControl dropdown = DL_DCFs_SearchPalette.GetDropdown_SearchPalette(dropdownName);
                return Control_ActionUtilities.Dropdown_SelectItem(dropdown, dropdownValue, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetTextboxValueForSearchCriteria(String textboxName, String valueToSet)
        {
            try
            {
                IControl textbox = DL_DCFs_SearchPalette.GetTextbox_SearchPalette(textboxName);
                return Control_ActionUtilities.Textbox_SetText(textbox, valueToSet, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickGoButtonOfSearchPalette()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_DCFs_SearchPalette.GoButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
