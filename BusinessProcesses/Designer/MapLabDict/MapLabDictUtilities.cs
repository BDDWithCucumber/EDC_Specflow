using BusinessProcesses.Designer.ModalDialogs;
using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using Pages.Designer;
using Pages.Designer.MapLabDictionary;
using Pages.Designer.ModelDialog;
using Pages.Designer.Pager;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Utilities;

namespace BusinessProcesses.Designer.MapLabDict
{
    public class MapLabDictUtilities
    {

        public static bool SelectLabTestCodeValueItem(String itemName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabTestCodeValueDropDown, itemName, "Unable to select " + itemName);
                //Thread.Sleep(5000);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectLabTestCodeValueSecondItem(String itemName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectSecondLabTestCodeValueDropDown, itemName, "Unable to select " + itemName);
                //Thread.Sleep(5000);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectLabUnitCodeValueItem(String itemName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabUnitCodeValueDropDown, itemName, "Unable to select " + itemName);
                //Thread.Sleep(5000);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool VerifyTheLabUnitMapping(String labUnit)
        {
            try
            {
                string text = Control_PropertyUtilities.GetText(MapLabDictionary.LabValue);
                text.Equals(labUnit);
                //Thread.Sleep(5000);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SingleRecordSave()
        {
            //Thread.Sleep(3000);
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.RecordSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static bool RecordSave()
        {
            //Thread.Sleep(3000);
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.SingleRecordSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectLabUnitCodeValueSecondItem(String itemName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabUnitCodeValueSecondDropDown, itemName, "Unable to select " + itemName);
                //Thread.Sleep(5000);
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        //public static bool ClickLabUnitTab()
        //{
        //    try
        //    {
        //        return Control_ActionUtilities.Click(MapLabDictionary.LabUnitLink, String.Empty);
        //    }
        //    catch (Exception e)
        //    {
        //        new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
        //    }
        //    return false;
        //}

        public static bool UnCheckDisplayInRRThirdCheckBox()
        {
            try
            {
                return Control_ActionUtilities.UncheckCheckbox(MapLabDictionary.DisplayInRRCheckBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckDisplayInRRCheckBox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(MapLabDictionary.DisplayInRRCheckBoxOfATest);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckDisplayInRRFirstCheckBox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(MapLabDictionary.DisplayInRRFirstTestCheckBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckDisplayInRRThirdCheckBox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(MapLabDictionary.DisplayInRRThirdTestCheckBox);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckAllLabTestCheckBox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(MapLabDictionary.CheckAllLabTest);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckAllLabUnitCheckBox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(MapLabDictionary.CheckAllLabUnit);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool StudyPublishLabel(String studyLabel)
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                Control_ActionUtilities.Textbox_SetText(MapLabDictionary.StudyPublishLabel, studyLabel, String.Empty);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickLabTestEditLink(String labTest)
        {
            try
            {
                Control_ActionUtilities.Click(DS_PagerControl.FirstPageImage, "Unable to click the link");
                do
                {
                    WebTable_SearchCriteriaItemList list = new WebTable_SearchCriteriaItemList();
                    list.AddSearchItem(new WebTable_SearchCriteriaItem(1, labTest, TableColumnContentType.Text));
                    IControl processRow = WebTableUtilities.Table_FindRow(MapLabDictionary.LabTestsListTable, list);
                    if (!Control_PropertyUtilities.IsControlNull(processRow))
                    {
                        IControl proecssCell = WebTableUtilities.GetCell(processRow, 8);
                        IControl cellImage = WebTableUtilities.GetInputControl(proecssCell);
                        return Control_ActionUtilities.Click(cellImage, "Unable to click Image" + labTest);
                    }
                }
                while (Control_ActionUtilities.Click(DS_PagerControl.NextPageImage, String.Empty));
                
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool ClickContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.PublishContinue);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickModelContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToConfirmationFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.SavePopupWarningContinueButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool LMSModelContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToConfirmationFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.LMSPopupContinueButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ModelPopupUpdateContinueButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToConfirmationFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.UpdatePopupWarningContinueButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickLabUnitTab(String linkName)
        {
            try
            {
                return Control_ActionUtilities.Click_PerssEnterKey(MapLabDictionary.LabUnitLink(linkName), "Unable to find link " + linkName + " in Designer Home Page");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool labDictSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.MapLabDictSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool labDictUpdateSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.MapLabDictUpdateSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool labDictUpdateUnitSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.MapLabDictUpdateUnitSave, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ModelDialog_OkButton()
        {

            BrowserUtilities.DS_SwitchToConfirmationFrame();
            bool isClicked = false;
            try
            {
                isClicked = Control_ActionUtilities.ClickModalButton(DS_ModelDialog.SavePopupErrorOkButton);
                BrowserUtilities.SwitchToWindow();
                return isClicked;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool EditSelectedOkButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToConfirmationFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.EditSelectedOkButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool DuplicateRecordErrorPopupOkButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToConfirmationFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.EditSelectedOkButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ChangingLabDictPopupOkButton()
        {
            try
            {
                BrowserUtilities.DS_SwitchToConfirmationFrame();
                Control_ActionUtilities.ClickModalButton(DS_ModelDialog.ChangingLabDictOkButton);
                BrowserUtilities.SwitchToWindow();
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyHeaderAndErrorMessage(String titleText, String bodyMessageText_Partial)
        {
            BrowserUtilities.DS_SwitchToConfirmationFrame();
            if (IsModalExist_CheckHeaderAndErrorMessage(titleText, bodyMessageText_Partial))
            {
                return true;
            }
            BrowserUtilities.SwitchToWindow();
            return false;
        }

        public static bool IsModalExist_CheckHeaderAndErrorMessage(String titleText, String bodyMessageText_Partial)
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

        public static bool VerifyHeaderAndMessage(String titleText, String bodyMessageText_Partial)
        {
            if (BrowserUtilities.DS_SwitchToFrame())
            {
                if (IsModalExist_CheckHeaderAndMessage(titleText, bodyMessageText_Partial))
                {
                    return true;
                }
                BrowserUtilities.SwitchToWindow();
            }
            return false;
        }

        public static bool IsModalExist_CheckHeaderAndMessage(String titleText, String bodyMessageText_Partial)
        {
            try
            {
                return titleText.Equals(Control_PropertyUtilities.GetText(CodeListsItemDeleteDialog.Header).Trim()) &&
                Control_PropertyUtilities.GetText(CodeListsItemDeleteDialog.LMSPopup).Contains(bodyMessageText_Partial);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickLabsButton()
        {
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.Labs, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickLabMappingTab(String linkName)
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

        public static bool SelectLabDictItem(String itemName)
        {
            try
            {
                Control_ActionUtilities.Dropdown_SelectItem(MapLabDictionary.SelectLabDictDropDown, itemName, "Unable to select " + itemName);
                if (BP_DS_Labs_MapLabDictionry_DictionayChageDialog.ISDialogExist("Confirm", "Changing Lab Dictionary will remove existing mappings."))
                {
                    Control_ActionUtilities.Click(DS_Labs_StudySaveConfirmationDialog.ContinueButton, "Unable to click continue button");
                }
                return true;
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }        

        public static bool VerifyDesignerPageHeader()
        {
            try
            {
                return Control_PropertyUtilities.IsControlVisible(MapLabDictionary.HeaderText_H1());
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        
        public static bool ClickOnLabUnitTab()
        {
            try
            {
                return Control_ActionUtilities.Click(MapLabDictionary.LabUnitTab, "Not able to click on Lab Unit");
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
