using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.Designer;
using Pages.Designer.CodeLists;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.CodeLists
{
    public class CodelistsGroupUtilities
    {
        public static bool AddGroupCodelistItems(String countryName, String countryDesc)
        {
            String CodelistItem = countryName + " (" + countryDesc + ")";
            BrowserUtilities.DS_SwitchToFrame();
            if (!AssociatedCodelistDropdownItem(CodelistItem))
            {
                if (ClickAvailableCodelistDropdownItem(CodelistItem))
                {
                    if (Control_ActionUtilities.Click(CodeListsGroupPage.AddButton, String.Empty))
                    {
                        Control_ActionUtilities.Click(CodeListsGroupPage.SaveButton, "Codelist Item successfully added to the group");
                        BrowserUtilities.SwitchToWindow();
                        return true;
                    }
                }
            }
            else
            {
                return Control_ActionUtilities.Click(CodeListsGroupPage.CancelButton, "Codelist Item already associated to the group");
            }
            return false;
        }

        public static bool AssociatedCodelistDropdownItem(String itemName)
        {
            try
            {
                ReadOnlyCollection<IControl> cList = CodelistsGroupUtilities.GetAssociatedCodelistDropdownItems();
                foreach (IControl c in cList)
                {
                    if (Control_PropertyUtilities.GetText(c).Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        IControl link = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("span"));
                        return Control_ActionUtilities.Click(link, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickAvailableCodelistDropdownItem(String itemName)
        {
            try
            {
                ReadOnlyCollection<IControl> cList = CodelistsGroupUtilities.GetAvailableCodelistDropdownItems();
                foreach (IControl c in cList)
                {
                    if (Control_PropertyUtilities.GetText(c).Equals(itemName, StringComparison.InvariantCultureIgnoreCase))
                    {
                        IControl link = SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.TagName("span"));
                        return Control_ActionUtilities.Click(link, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static ReadOnlyCollection<IControl> GetAvailableCodelistDropdownItems()
        {
            try
            {
                String dropdonwItemsHostCSSSelector = "#ctl00_ContentBody_RadListBoxSource > div.rlbTemplate > div > div.rlbBody > div > ul";
                IControl host = SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindElements_Parent(host.WebElement, By.TagName("li"));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return null;
        }

        public static ReadOnlyCollection<IControl> GetAssociatedCodelistDropdownItems()
        {
            try
            {
                String dropdonwItemsHostCSSSelector = "#ctl00_ContentBody_RadListBoxDestination > div.rlbTemplate > div > div.rlbBody > div > ul";
                IControl host = SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
                if (!Control_PropertyUtilities.IsControlNull(host))
                {
                    return SyncUtilities.FindElements_Parent(host.WebElement, By.TagName("li"));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return null;
        }

        public static bool SaveButton()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                Control_ActionUtilities.Click(CodeListsGroupPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
            BrowserUtilities.SwitchToWindow();
            return true;

        }

        public static bool SelectCodelist(String itemName)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                if (!String.IsNullOrEmpty(itemName))
                {
                    if (Control_ActionUtilities.Click(CodeListsGroupPage.CodelistGroupDropdownInvokerButton, "Unable to click the link"))
                    {
                        Control_ActionUtilities.Click(CodeListsGroupPage.GetCodelistGroupItem(itemName), "Unable to click the link");
                        BrowserUtilities.SwitchToWindow();
                        return true;
                    }
              }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }

            return false;
        }

        public static bool GroupsTab(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public  static string SetGroupName(String GroupName)
        {
            // string GroupName1 = GroupName + Guid.NewGuid().ToString().Replace("-", string.Empty);
            string GroupName1 = GroupName + new Random().Next(100).ToString();
            bool vari= Control_ActionUtilities.Textbox_SetText(CodeListsGroupPage.GroupName, GroupName1, String.Empty);
            return GroupName1; 
         
         }

        public static bool SetGroupDesc(String GroupDesc)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsGroupPage.GroupDesc, GroupDesc, String.Empty);
        }

        public static bool CodeListGroupItemSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsGroupPage.CodelistGroupItemSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickGrouplink(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetLinkageName(String linkageName)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsGroupPage.LinkageName, linkageName, String.Empty);
        }

        public static bool SetLinkageDesc(String linkageDesc)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsGroupPage.LinkageDesc, linkageDesc, String.Empty);
        }

        public static bool SelectPrimaryCodelist(String PriCodeList)
        {
            return Control_ActionUtilities.Dropdown_SelectItem(CodeListsGroupPage.PrimarySelectionDropDown, PriCodeList, String.Empty);
        }

        public static bool SelectSecondaryCodelist(String SecCodelist)
        {
            return Control_ActionUtilities.Dropdown_SelectItem(CodeListsGroupPage.SecondarySelectionDropDown, SecCodelist, String.Empty);
        }

        public static bool LinkageSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsGroupPage.LinkageSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool AddNewCodelistGroup(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsGroupPage.AddNewCodelistGroup, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool RemoveGroupCodelistItems(String countryName, String countryDesc)
        {
            String CodelistItem = countryName + " (" + countryDesc + ")";
            BrowserUtilities.DS_SwitchToFrame();
            if (AssociatedCodelistDropdownItem(CodelistItem))
            {
                if (Control_ActionUtilities.Click(CodeListsGroupPage.RemoveButton, String.Empty))
                {
                    Control_ActionUtilities.Click(CodeListsGroupPage.SaveButton, "Codelist Item successfully added to the group");
                    BrowserUtilities.SwitchToWindow();
                    return true;
                }
            }
            return false;
        }

        public static bool AddEditSecondaryCodelistItems(String primary)
        {
            IControl row = WebTableUtilities.Table_FindRow(CodeListsGroupPage.PrimarySecondaryCodeListItemsTable, GetSearchItemList(primary), 0);
            IControl proecssCell = WebTableUtilities.GetCell(row, 2);
            IControl link = WebTableUtilities.GetLink(proecssCell);
            return Control_ActionUtilities.Click(link, "Unable to find to click" + primary);
        }

        static WebTable_SearchCriteriaItemList GetSearchItemList(String cellText)
        {
            WebTable_SearchCriteriaItem item = new WebTable_SearchCriteriaItem(0, cellText, TableColumnContentType.Text);
            WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
            list.AddSearchItem(item);
            return list;
        }

        public static bool ClickLinkageLink(String process)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(DS_HomePage.GetLink(process), "Unable to find link " + process + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyTheGroupLink(String process)
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsGroupPage.CheckTheCheckBox, "Unable to find link " + process + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
