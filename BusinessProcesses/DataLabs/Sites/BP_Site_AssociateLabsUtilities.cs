using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Sites;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Threading;

namespace BusinessProcesses.DataLabs.Sites
{
    public class BP_Site_AssociateLabsUtilities
    {
        public static bool AssociateLab(String labId, String labName)
        {
            String lab = labId + " - " + labName;
            if (!IsLabInAssociatedLabsList(lab))
            {
                if (Control_ActionUtilities.Dropdown_SelectItem(DL_Site_AssociateLabsPage.AvailableLabsListBox, lab, String.Empty))
                {
                    if (Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.AddButton, String.Empty))
                    {
                        return Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.SaveButton, String.Empty);
                    }
                }
            }
            else
            {
                return Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.CancelButton, String.Empty);
            }
            return false;
        }

        public static bool DissociateLab(String labId, String labName)
        {
            try
            {
                String lab = labId + " - " + labName;
                if (IsLabInAssociatedLabsList(lab))
                {
                    int count = 0;
                    while (count < 5)
                    {
                        if (Control_ActionUtilities.SelectItemInDualSelectDropdown(DL_Site_AssociateLabsPage.AssociatedLabsListBox, lab, String.Empty))
                        {
                            Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.RemoveButton, String.Empty);
                            bool isItemExist = Control_ActionUtilities.Dropdown_VerifyItems(DL_Site_AssociateLabsPage.AssociatedLabsListBox, new List<String> { lab }, String.Empty);
                            if (!isItemExist)
                            {
                                break;
                            }
                        }
                        Thread.Sleep(1000);
                    }
                    return Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.SaveButton, String.Empty);
                }
                else
                {
                    return Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.CancelButton, String.Empty);
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool IsLabInAssociatedLabsList(String lab)
        {
            return Control_ActionUtilities.Dropdown_IsItemAvailable(DL_Site_AssociateLabsPage.AssociatedLabsListBox, lab, String.Empty);
        }

        public static bool IsAssociateLabsToSiteInViewMode()
        {
            return !Control_PropertyUtilities.IsEnabled(DL_Site_AssociateLabsPage.AvailableLabs) &&
            !Control_PropertyUtilities.IsEnabled(DL_Site_AssociateLabsPage.AssociatedLabs) &&
            !Control_PropertyUtilities.IsEnabled(DL_Site_AssociateLabsPage.AddButton) &&
            !Control_PropertyUtilities.IsEnabled(DL_Site_AssociateLabsPage.RemoveButton) &&
            !Control_PropertyUtilities.IsEnabled(DL_Site_AssociateLabsPage.SaveButton);

            //String disableAttribute = "disabled";
            //String disableAttributeValue = "true";
            //bool found = false;
            //String value1 = Control_PropertyUtilities.GetAttributeValue(DL_Site_AssociateLabsPage.AvailableLabs, disableAttribute, out found);
            //String value2 = Control_PropertyUtilities.GetAttributeValue(DL_Site_AssociateLabsPage.AssociatedLabs, disableAttribute, out found);
            //String value3 = Control_PropertyUtilities.GetAttributeValue(DL_Site_AssociateLabsPage.AddButton, disableAttribute, out found);
            //String value4 = Control_PropertyUtilities.GetAttributeValue(DL_Site_AssociateLabsPage.RemoveButton, disableAttribute, out found);
            //String value5 = Control_PropertyUtilities.GetAttributeValue(DL_Site_AssociateLabsPage.SaveButton, disableAttribute, out found);


            //return !String.IsNullOrEmpty(value1) && value1.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value2) && value2.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value3) && value3.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value4) && value4.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase) &&
            //    !String.IsNullOrEmpty(value5) && value5.Equals(disableAttributeValue, StringComparison.InvariantCultureIgnoreCase);
        }

        public static bool SetSearchText_AvailableLabs(String searchText)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Site_AssociateLabsPage.AvailableLabs_SearchBox, searchText, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetSearchText_AssociatedLabs(String searchText)
        {
            try
            {
                return Control_ActionUtilities.Textbox_SetText(DL_Site_AssociateLabsPage.AssociatedLabs_SearchBox, searchText, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySearchedItems_AvailableLabs(String searchText)
        {
            try
            {
                return VerifySearchedItems(DL_Site_AssociateLabsPage.AvailableLabsListBox, searchText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySearchedItems_AssociatedLabs(String searchText)
        {
            try
            {
                return VerifySearchedItems(DL_Site_AssociateLabsPage.AssociatedLabsListBox, searchText);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        internal static bool VerifySearchedItems(IControl listbox, String searchText)
        {
            try
            {
                bool found = false;
                List<String> items = Control_ActionUtilities.Dropdown_GetItems(listbox, out found);
                if (found)
                {
                    foreach (String item in items)
                    {
                        if (!item.Contains(searchText))
                        {
                            return false;
                        }
                    }
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DissociateAllLabs()
        {
            try
            {
                bool noItemsFound = false;
                Control_ActionUtilities.Dropdown_SelectAllItems(DL_Site_AssociateLabsPage.AssociatedLabsListBox, out noItemsFound);
                if (noItemsFound)
                {
                    return Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.CancelButton, String.Empty);
                }
                else
                {
                    Control_ActionUtilities.MouseClick(DL_Site_AssociateLabsPage.RemoveButton, String.Empty);
                    return Control_ActionUtilities.Click(DL_Site_AssociateLabsPage.SaveButton, String.Empty);
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