using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.Designer.CodeLists;
using Pages.Designer.ModelDialog;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.CodeLists
{
    public class CodeListsUtilities
    {
        public static bool AllCodeListItemsCheck()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(CodeListsPage.CheckAllCodeListItems);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCodeListsButton(String var)
        {
            try
            {
                
                    IControl pageObj=CodeListsPage.CodeList(var);
                return Control_ActionUtilities.Click(pageObj, "Page not found");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CodelistPage()
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsPage.CodeLists, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DeleteItesmLink(String deleteItemslinkName)
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsPage.ClickDeleteItems, "Unable to click " + deleteItemslinkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickCodeListItemsCheckBox(String Codelistitem)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(2, Codelistitem, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CodeListsPage.CodeListItemsTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 0);
                Control_ActionUtilities.Click(proecssCell, "Unable to click find" + Codelistitem);
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickYes(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.DS_SwitchToFrame();
            bool isClicked = false;
            if (IsModalExist_CheckHeaderTextAndBodyMessage(titleText, bodyMessageText_Partial))
            {
                isClicked = Control_ActionUtilities.ClickModalButton(CodeListsItemDeleteDialog.ClickYesButton);
            }
            BrowserUtilities.SwitchToWindow();
            return isClicked;
        }

        public static bool IsModalExist_CheckHeaderTextAndBodyMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(CodeListsItemDeleteDialog.Header).Trim()) &&
                Control_PropertyUtilities.GetText(CodeListsItemDeleteDialog.CodeListsItemsDeleteMessage).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCodeListsLink(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl codeListRow = WebTableUtilities.Table_FindRow(CodeListsPage.CodeListsTable, list);
                IControl codeListCell = WebTableUtilities.GetCell(codeListRow, 1);
                IControl codeListLink = CodeListsPage.GetCodeListLink(codeListCell, process);
                return Control_ActionUtilities.Click(codeListLink, "Unable to click process link " + process);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool CodeListSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsPage.CodeListSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CodeListItemSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsPage.CodeListItemSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetCodeListName(String codeListName)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsPage.CodeListName, codeListName, String.Empty);
        }

        public static bool SetCodeListDesc(String codeListDesc)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsPage.CodeListDesc, codeListDesc, String.Empty);
        }

        public static bool AddCodeList(String codeList)
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsPage.AddCodeList, "Unable to click " + codeList);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool AddCodeListItem(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(CodeListsPage.AddCodeListItem, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickCodelist(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(CodeListsPage.CodelistsTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 1);
                IControl processLink = CodeListsUtilities.GetProcessLink(proecssCell, process);
                return Control_ActionUtilities.Click(processLink, "Unable to click process link " + process);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static IControl GetProcessLink(IControl proecssCell, string processText)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(proecssCell.WebElement, By.LinkText(processText));
            }
            catch (Exception e)
            {

            }
            return null;
        }

        public static bool CodePrefix(int p0)
        {

            try
            {
                return Control_ActionUtilities.Textbox_SetText(CodeListsPage.SetCodePrefix, p0.ToString(), String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool SetCodeDesc(String codeDesc)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsPage.CodeListItemDesc, codeDesc, String.Empty);
        }

        public static bool SetCodeValue(String codeValue)
        {
            return Control_ActionUtilities.Textbox_SetText(CodeListsPage.CodeListItemValue, codeValue, String.Empty);
        }

    }
}
