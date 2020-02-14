using BusinessProcesses.Designer.ModalDialogs;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.Designer.Data;
using Pages.Designer.ManageLabs;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.ManageLabs
{
    public class ManageLabsUtilities
    {
        public static bool AddLabDictionary(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(ManageLabsPage.AddLabDictionary, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool DeleteLabDictionary(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(ManageLabsPage.DeleteLabDictionary, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickErrorLink()
        {
            try
            {
                return Control_ActionUtilities.Click(ImportLabDictionaryPage.ErrorLink, "Unable to click link");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool LabTestsinTable(List<LabDictData> labtests)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                foreach (LabDictData labtestname in labtests)
                {
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(0, labtestname.LabTestName, TableColumnContentType.Text));
                    IControl processRow = WebTableUtilities.Table_FindRow(ManageLabsPage.ImportLabDictionaryTable, list);
                    IControl proecssCell = WebTableUtilities.GetCell(processRow, 0);
                    if (!Control_PropertyUtilities.Equals(proecssCell, labtestname.LabTestName))
                    {
                        return true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool GetTableRowData(List<ImportLabDictErrorData> errorData)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                foreach (ImportLabDictErrorData data in errorData)
                {
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.WorkSheet, TableColumnContentType.Text));
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.Row, TableColumnContentType.Text));
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Column, TableColumnContentType.Text));
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.Error, TableColumnContentType.Text));
                    IControl processRow = WebTableUtilities.Table_FindRow(ImportLabDictionaryPage.ImportLabDictErrorTable, list);
                    if (!Control_PropertyUtilities.IsControlNull(processRow))
                    {
                        Control_ActionUtilities.Click(ImportLabDictionaryPage.ImportLabDictErrorTableOkButton, String.Empty);
                        BrowserUtilities.SwitchToWindow();
                        return true;
                    }
                }
                Control_ActionUtilities.Click(ImportLabDictionaryPage.ImportLabDictErrorTableOkButton, String.Empty);
                BrowserUtilities.SwitchToWindow();
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool GetTableRowDataForImportLabDictionaryErrors(List<ImportLabDictErrorData> errorData)
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                foreach (ImportLabDictErrorData data in errorData)             
                
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(0, data.WorkSheet, TableColumnContentType.Text));
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(1, data.Row, TableColumnContentType.Text));
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(2, data.Column, TableColumnContentType.Text));
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(3, data.Error, TableColumnContentType.Text));                    
                    if (list.List.Count > 0)
                    {
                        IControl tableRow = WebTableUtilities.Table_FindRow(ImportLabDictionaryPage.ErrorTable, list);
                        if (Control_PropertyUtilities.IsControlNull(tableRow))
                        {
                            Utilities.BrowserUtilities.SwitchToWindow();
                            return false;
                        }
                    }
                    
                }
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SearchInImportLabDictionaryErrors(string SelectDropDownOption, string dropDownList)
        {
            
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ImportLabDictionaryPage.ErrorType.WebElement.Click();                
                IControl dropDownOption= ImportLabDictionaryPage.SelectErrorFromDropDown(SelectDropDownOption, dropDownList);
                Control_ActionUtilities.CheckCheckbox(dropDownOption);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool Uncheckthecheckbox(string SelectDropDownOption, string dropDownList)
        {

            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ImportLabDictionaryPage.ErrorType.WebElement.Click();
                IControl dropDownOption = ImportLabDictionaryPage.SelectErrorFromDropDown(SelectDropDownOption, dropDownList);
                Control_ActionUtilities.UncheckCheckbox(dropDownOption);
                Control_ActionUtilities.MouseClick(dropDownOption, "Unable to click on checkbox");
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool ClickOnFilter()
        {
            BrowserUtilities.DS_SwitchToFrame();
            try
            {
                ImportLabDictionaryPage.FilterOption.WebElement.Click();                
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyImportLabDictErrorMessage(String bodyMessageText_Partial)
        {
            try
            {
                if (VerifyErrorMessage(bodyMessageText_Partial))
                {
                    return true;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;

        }
        public static bool VerifyErrorMessage(String bodyMessageText_Partial)
        {
            try
            {
                return Control_PropertyUtilities.GetText(ImportLabDictionaryPage.ImportLabDictError).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool VerifyDisplayModalPopup()
        {
            return(Control_PropertyUtilities.IsControlVisible(ManageLabsPage.LabDictContinue));
        }
        public static bool ClickLabDict(String process)
        {
            try
            {
                WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                list.AddSearchItem(new WebTable_SearchCriteriaItem(1, process, TableColumnContentType.Text));
                IControl processRow = WebTableUtilities.Table_FindRow(ManageLabsPage.LabDictionaryTable, list);
                IControl proecssCell = WebTableUtilities.GetCell(processRow, 1);
                IControl processLink = ManageLabsUtilities.GetProcessLink(proecssCell, process);
                Thread.Sleep(5000);
                return Control_ActionUtilities.Click(processLink, "Unable to click process link " + process);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
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
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static bool UploadDictFile(String labDictFile)
        {
            try
            {
                DS_UploadLabDictUtilities.ClickChooseFileButton();
                DS_UploadLabDictUtilities.UploadStudyFile(labDictFile);
                return true;
            }

            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool LabDictSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(ManageLabsPage.LabDictionarySave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetLabDictName(String labDictName)
        {
            return Control_ActionUtilities.Textbox_SetText(ManageLabsPage.LabDictionaryName, labDictName, String.Empty);
        }

        public static bool SetLabDictDesc(String labDictDesc)
        {
            return Control_ActionUtilities.Textbox_SetText(ManageLabsPage.LabDictionaryDesc, labDictDesc, String.Empty);
        }

        public static bool LabDictionaryLabel(String labDictLabel)
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                Control_ActionUtilities.Textbox_SetText(ManageLabsPage.LabDictImportLabel, labDictLabel, String.Empty);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ImportLabDictionary(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click(ManageLabsPage.ImportLabDictionary, "Unable to click " + linkName);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }       

        public static bool VerifyDataInTable(String linkName)
        {
            try
            {
                 String text=Control_PropertyUtilities.GetText(ManageLabsPage.LabDictonaryTableRow1);
                return (text.Equals(linkName));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
    }
}
