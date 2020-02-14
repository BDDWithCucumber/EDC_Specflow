using Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium.Support.UI;
using Pages.DataLabs;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Threading;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_CRFUtilities
    {
        public static bool SetValueInTextBox_FlatQuestion(string QuestionPrompt, string AnswerValue)
        {
            IControl TextBox = DL_PatientsPage.GetTextBoxOfFlatQuestion(QuestionPrompt);
            if (TextBox != null)
            {
                return Control_ActionUtilities.Textbox_SetText(TextBox, AnswerValue, "Unable to set value for question " + QuestionPrompt + " in the CRF.");
            }
            return false;
        }

        public static bool SelectValueFromRadioOptions_FlatQuestion(string QuestionPrompt, string AnswerValue)
        {
            IControl RadioOption = DL_PatientsPage.GetRadioButtonOfFlatQuestion(QuestionPrompt, AnswerValue);
            if (RadioOption != null)
            {
                return Control_ActionUtilities.Click(RadioOption, "Unable to select radio option " + AnswerValue + " for the question " + QuestionPrompt + " in the CRF.");
            }
            return false;
        }

        public static bool IsCheckedOutMessageDisplayed(string formCheckedoutMessage)
        {
            try
            {
                IControl statusBar = DL_PatientsPage.StatusBar;
                return Control_PropertyUtilities.CompareCSSValue(statusBar, "background-color", "#FF9830") &&
                Control_PropertyUtilities.CompareCSSValue(statusBar, "color", "#ffffff") &&
                Control_PropertyUtilities.GetText(statusBar).Contains(formCheckedoutMessage);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsSignedByMessageDisplayed(String message)
        {
            try
            {
                IControl signedByBar = DL_PatientsPage.SignedByBar;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectValueFromList_FlatQuestion(string QuestionPrompt, string AnswerValue)
        {
            try
            {
                IControl ListBox = DL_PatientsPage.GetListBoxOfFlatQuestion(QuestionPrompt);
                if (ListBox != null)
                {
                    IControl ListBoxDropDown = new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                    return Control_ActionUtilities.Dropdown_SelectItem(ListBoxDropDown, AnswerValue, "Unable to select " + AnswerValue + " from the listbox for the question " + QuestionPrompt + " in the CRF.");
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FillValueForAFlatQuestionInCRF(string QuestionPrompt, string AnswerFieldType, string AnswerValue)
        {
            try
            {
                IControl AnswerField = DL_CRFPage.GetAnswerFieldOfFlatQuestion(QuestionPrompt, AnswerFieldType, AnswerValue);
                if (AnswerField == null || AnswerField.WebElement == null)
                {
                    //Fail statement
                    return false;
                }
                switch (AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX": case "TEXT BOX":
                    case "TEXT AREA": case "TEXTAREA":
                        return Control_ActionUtilities.Textbox_SetText(AnswerField, AnswerValue, "Unable to set value for question " + QuestionPrompt + " in the CRF.");
                    case "LISTBOX": case "LIST BOX":
                        return Control_ActionUtilities.Dropdown_SelectItem(AnswerField, AnswerValue, "Unable to select " + AnswerValue + " from the listbox for the question " + QuestionPrompt + " in the CRF.");
                    case "RADIOBUTTON": case "RADIO BUTTON": case "RADIO":
                    case "CHECKBOX": case "CHECK BOX": 
                        return Control_ActionUtilities.Click(AnswerField, "Unable to select option " + AnswerValue + " for the question " + QuestionPrompt + " in the CRF.");
                    default:
                        return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ExpandTableRow(String tableName, int rowNumber)
        {
            try
            {
                bool isRowAlreadyExpanded = false;
                IControl tableRowToExpand = DL_CRFPage.GetCollapsedTableRow(tableName, rowNumber, out isRowAlreadyExpanded);
                if (!isRowAlreadyExpanded)
                {
                    if (!Control_PropertyUtilities.IsControlNull(tableRowToExpand))
                    {
                        //return Control_ActionUtilities.MouseClick(tableRowToExpand, String.Empty);
                        return Control_ActionUtilities.Click(tableRowToExpand, String.Empty);
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

        public static bool IsTableRowDeleted(string tableName, int rowNumber)
        {
            try
            {
                IControl tableRow = DL_CRF_QuestionBase.GetCollapsedTableRow(tableName, rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(tableRow))
                {
                    ReadOnlyCollection<IControl> cList = DL_CRF_QuestionBase.GetStrikeCells(tableRow);
                    return cList.Count > 0;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool IsTableRowRestored(String tableName, int rowNumber)
        {
            try
            {
                IControl tableRow = DL_CRF_QuestionBase.GetCollapsedTableRow(tableName, rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(tableRow))
                {
                    ReadOnlyCollection<IControl> cList = DL_CRF_QuestionBase.GetStrikeCells(tableRow);
                    return cList.Count == 0;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickTableButtonForExpandedRow(String tableName,String buttonName)
        {
            try
            {
                IControl button = DL_CRF_QuestionBase.GetTableRowButton(tableName, buttonName);
                if(Control_PropertyUtilities.IsControlNull(button))
                {

                }
                bool found = false;
                String value = Control_PropertyUtilities.GetAttributeValue(button, "value", out found);
                return Control_ActionUtilities.Click_PerssEnterKey(button,String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool FillFlatQuestionsInCRF(List<CRFFlatQuestionsData> CRFData, out List<string> UnfilledQuestions)
        {
            bool isFilled = true;
            UnfilledQuestions = new List<string>();
            foreach (CRFFlatQuestionsData DataItem in CRFData)
            {
                if (DataItem.CurrentAnswerValue != null)
                {
                    string FldType = DataItem.AnswerFieldType;
                    DataItem.AnswerFieldType = "Link";
                    DataItem.AnswerValue = DataItem.CurrentAnswerValue;
                    IControl AnsLink = DL_CRFPage.GetAnswerFieldOfFlatQuestion(DataItem);
                    DataItem.AnswerFieldType = FldType;
                    DataItem.AnswerValue = null;
                    if (AnsLink != null && AnsLink.WebElement != null)
                    {
                        Control_ActionUtilities.Click(AnsLink, "Unable to fill answer value in " + DataItem.QuestionPrompt + " as current answer link is not clicked.");
                    }
                    else
                    {
                        return false;
                    }
                }
                IControl AnswerField = DL_CRFPage.GetAnswerFieldOfFlatQuestion(DataItem);
                if(!FillFlatQuestionInCRF(AnswerField, DataItem))
                {
                    UnfilledQuestions.Add(DataItem.QuestionPrompt);
                    isFilled = false;
                }
                Thread.Sleep(3000);
                HandleReasonAndNotesForQuestion(DataItem, "OK");
            }
            return isFilled;
        }

        public static void HandleReasonAndNotesForQuestion(CRFFlatQuestionsData DataItem, string ButtonToClick)
        {
            if (DataItem.CurrentAnswerValue != null)
            {
                /*
                string ActFieldType = DataItem.AnswerFieldType;
                DataItem.AnswerFieldType = "ListBox";
                if(ActFieldType.ToUpper() != "LISTBOX")
                {
                    DataItem.CurrentAnswerValue = null;
                } */               
                IControl ReasonField = DL_CRFPage.GetReasonForChangeField(DataItem);
                Control_ActionUtilities.Dropdown_SelectItem(ReasonField, DataItem.ReasonForChange, "Unable to select reason for change for question prompt " + DataItem.QuestionPrompt);
                if (DataItem.AdditionalNotes != null)
                {
                    DataItem.AnswerFieldType = "TextArea";
                    IControl NotesField = DL_CRFPage.GetAnswerFieldOfFlatQuestion(DataItem);
                    Control_ActionUtilities.Textbox_SetText(NotesField, DataItem.AdditionalNotes, "Unable to set additional notes for question prompt " + DataItem.QuestionPrompt);
                }
                ClickActionButtonForFlatQuestion(DataItem.QuestionPrompt, ButtonToClick);
            }
        }

        public static void ClickActionButtonForFlatQuestion(string QuestionPrompt, string ButtonName)
        {
            IControl Button = DL_CRFPage.GetActionButtonsOfFlatQuestion(QuestionPrompt, ButtonName);
            if(Button != null && Button.WebElement != null)
            {
                Control_ActionUtilities.Click(Button, "Unable to click " + ButtonName + " for the question " + QuestionPrompt);
            }
        }

        public static void ClickActionButtonForTableQuestion(IControl TableRow, string ButtonName)
        {
            IControl Button = DL_CRFPage.GetActionButtonsOfTableQuestion(TableRow, ButtonName);
            if (Button != null && Button.WebElement != null)
            {
                Control_ActionUtilities.Click(Button, "Unable to click " + ButtonName + " for the question.");
            }
        }

        public static bool FillFlatQuestionInCRF(IControl AnswerField, CRFFlatQuestionsData Item)
        {
            string Answer = "";
            if(AnswerField == null)
            {
                Control_ActionUtilities.LogException("Fill value to question " + Item.QuestionPrompt, "Answer field is not displayed.", string.Empty);
                return false;
            }
            if(Item.NewAnswerValue != null)
            {
                Answer = Item.NewAnswerValue;
            }
            else
            {
                Answer = Item.AnswerValue;
            }
            switch (Item.AnswerFieldType.ToUpper())
            {
                case "TEXTBOX": case "TEXT BOX":
                case "TEXT AREA": case "TEXTAREA":
                    return Control_ActionUtilities.Textbox_SetText(AnswerField, Answer, "Unable to set value for question " + Item.QuestionPrompt + " in the CRF.");
                case "LISTBOX": case "LIST BOX":
                    return Control_ActionUtilities.Dropdown_SelectItem(AnswerField, Answer, "Unable to select " + Answer + " from the listbox for the question " + Item.QuestionPrompt + " in the CRF.");
                case "RADIOBUTTON": case "RADIO BUTTON": case "RADIO":
                case "CHECKBOX": case "CHECK BOX":
                    return Control_ActionUtilities.Click(AnswerField, "Unable to select option " + Answer + " for the question " + Item.QuestionPrompt + " in the CRF.");
                default:
                    return false;
            }
        }
/*
        public static bool FillFlatQuestionsInCRF(List<CRFFlatQuestionsData> CRFData, out List<string> UnfilledQuestions)
        {
            bool isCRFDataEntered = true;
            UnfilledQuestions = new List<string>();
            foreach (CRFFlatQuestionsData Item in CRFData)
            {
                switch (Item.AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX":
                        if (!SetValueInTextBox_FlatQuestion(Item.QuestionPrompt, Item.AnswerValue))
                        {
                            UnfilledQuestions.Add(Item.QuestionPrompt);
                            isCRFDataEntered = false;
                        }
                        break;
                    case "LISTBOX":
                        if (!SelectValueFromList_FlatQuestion(Item.QuestionPrompt, Item.AnswerValue))
                        {
                            UnfilledQuestions.Add(Item.QuestionPrompt);
                            isCRFDataEntered = false;
                        }
                        break;
                    case "RADIOBUTTON":
                    case "CHECKBOX":
                        if (!SelectValueFromRadioOptions_FlatQuestion(Item.QuestionPrompt, Item.AnswerValue))
                        {
                            UnfilledQuestions.Add(Item.QuestionPrompt);
                            isCRFDataEntered = false;
                        }
                        break;
                }
            }
            return isCRFDataEntered;
        }
        */
        public static bool SelectButtonOnCRF(string CRFName, string ButtonName)
        {
            if(CRFName != "")
            {
                string SelectedCRFName = Control_PropertyUtilities.GetText(DL_CRFPage.CRFNameObject);
                if (SelectedCRFName != CRFName)
                {
                    Control_ActionUtilities.LogException("Verification of selected CRF Name.", "CRF Name on selected patient CRF page is displayed as " + SelectedCRFName + " instead of " + CRFName + ".", string.Empty);
                    return false;
                }
            }            
            string Button = ButtonName.ToUpper();
            switch (Button)
            {
                case "SAVE":
                    return Control_ActionUtilities.Click(DL_CRFPage.SaveButton_CRF, "Unable to click on " + ButtonName + " on " + CRFName + " CRF page.");
                case "SAVE & CLOSE":
                    return Control_ActionUtilities.Click(DL_CRFPage.SaveNCloseButton_CRF, "Unable to click on " + ButtonName + " on " + CRFName + " CRF page.");
                case "SAVE & NEXT":
                    return Control_ActionUtilities.Click(DL_CRFPage.SaveNNextButton_CRF, "Unable to click on " + ButtonName + " on " + CRFName + " CRF page.");
                case "CANCEL":
                    return Control_ActionUtilities.Click(DL_CRFPage.CancelButton_CRF, "Unable to click on " + ButtonName + " on " + CRFName + " CRF page.");
                case "CHECK OUT": case "CHECKOUT":
                    return Control_ActionUtilities.Click(DL_CRFPage.CheckOutButton_CRF, "Unable to click on " + ButtonName + " on " + CRFName + " CRF page.");
                case "SHOW HIDDEN FIELDS":
                    return Control_ActionUtilities.Click(DL_CRFPage.ShowHiddednFields_CRF, "Unable to click on " + ButtonName + " on " + CRFName + " CRF page.");
                default:
                    Control_ActionUtilities.LogException("Click button on " + CRFName + " CRF.", "Inavalid button name '" + ButtonName + "' is passed to be clicked on CRF.", string.Empty);
                    return false;
            }
        }

        public static bool VerifyButtonOnCRF(string ButtonName)
        {
            bool ControlNotExist = true;
            string Button = ButtonName.ToUpper();
            switch (Button)
            {
                case "SAVE":
                    ControlNotExist = Control_PropertyUtilities.IsControlNull(DL_CRFPage.SaveButton_CRF);
                    break;
                case "SAVE & CLOSE":
                    ControlNotExist = Control_PropertyUtilities.IsControlNull(DL_CRFPage.SaveNCloseButton_CRF);
                    break;
                case "SAVE & NEXT":
                    ControlNotExist = Control_PropertyUtilities.IsControlNull(DL_CRFPage.SaveNNextButton_CRF);
                    break;
                case "CANCEL":
                    ControlNotExist = Control_PropertyUtilities.IsControlNull(DL_CRFPage.CancelButton_CRF);
                    break;
                case "CHECK OUT":
                case "CHECKOUT":
                    ControlNotExist = Control_PropertyUtilities.IsControlNull(DL_CRFPage.CheckOutButton_CRF);
                    break;
                default:
                    Control_ActionUtilities.LogException("Verify button on CRF.", "Inavalid button name '" + ButtonName + "' is passed to be clicked on CRF.", string.Empty);
                    return false;
            }
            return !ControlNotExist;
        }
        public static bool ClickButtonOnCRF(string ButtonName)
        {
            bool ControlClick = false;
            string Button = ButtonName.ToUpper();
            switch (Button)
            {
                case "SAVE":
                    ControlClick = Control_ActionUtilities.Click(DL_CRFPage.SaveButton_CRF,"Unable to click save button");
                    break;
                case "SAVE & CLOSE":
                    ControlClick = Control_ActionUtilities.Click(DL_CRFPage.SaveNCloseButton_CRF, "Unable to click save & close button");
                    break;
                case "SAVE & NEXT":
                    ControlClick = Control_ActionUtilities.Click(DL_CRFPage.SaveNNextButton_CRF, "Unable to click save & Next button");
                    break;
                case "CANCEL":
                    ControlClick = Control_ActionUtilities.Click(DL_CRFPage.CancelButton_CRF, "Unable to click Cancel button");
                    break;
                case "CHECK OUT":
                case "CHECKOUT":
                    ControlClick = Control_ActionUtilities.Click(DL_CRFPage.CheckOutButton_CRF, "Unable to click checkout button");
                    break;
                default:
                    Control_ActionUtilities.LogException("Verify button on CRF.", "Inavalid button name '" + ButtonName + "' is passed to be clicked on CRF.", string.Empty);
                    return false;
            }
            return ControlClick;
        }
        public static bool SelectEntryCompleteChkBox()
        {
            return Control_ActionUtilities.CheckCheckbox(DL_CRFPage.EntryCompleteChkBox);
        }

        public static bool DeselectEntryCompleteChkBox()
        {
            return Control_ActionUtilities.UncheckCheckbox(DL_CRFPage.EntryCompleteChkBox);
        }

        public static bool VerifyCRFSavedSuccessfully()
        {
            bool IsVisible = false;
            IsVisible = Control_PropertyUtilities.IsControlVisible(DL_CRFPage.CRFSaveSuccessMsg);
            return IsVisible;
        }

        public static bool ClickAddNewRowButtonForTable(IControl TableObject)
        {
            bool isButtonClicked = false;
            IControl Button = DL_CRFPage.GetAddNewRowButtonForTableInCRF(TableObject);
            if(Button != null)
            {
                isButtonClicked = Control_ActionUtilities.Click(Button, string.Empty);
            }
            return isButtonClicked;
        }

        public static bool ClickAddNewRowButtonForTable(string TableName)
        {
            IControl TableObj = DL_CRFPage.GetTableInCRF(TableName, 1);
            if (TableObj.WebElement == null)
            {
                return false;
            }
            return ClickAddNewRowButtonForTable(TableObj);
        }

        public static bool FillTableRowQuestionInCRF(IControl TableRow, CRFTableQuestionsData QuestionData)
        {
            bool Success = false;
            if (QuestionData.CurrentAnswerValue != null)
            {
                string FldType = QuestionData.AnswerFieldType;
                QuestionData.AnswerFieldType = "Link";
                QuestionData.AnswerValue = QuestionData.CurrentAnswerValue;
                IControl AnsLink = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                QuestionData.AnswerFieldType = FldType;
                QuestionData.AnswerValue = null;
                if (AnsLink != null && AnsLink.WebElement != null)
                {
                    Control_ActionUtilities.Click(AnsLink, "Unable to fill answer value in " + QuestionData.QuestionPrompt + " as current answer link is not clicked.");
                }
                else
                {
                    return false;
                }
            }
            string FieldType = QuestionData.AnswerFieldType.ToUpper();
            IControl AnswerField = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
            if(QuestionData.AnswerValue == null)
            {
                QuestionData.AnswerValue = QuestionData.NewAnswerValue;
            }
            switch (FieldType)
            {
                case "TEXTBOX": case "TEXT BOX":
                    //IControl TextBox = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                    Success = Control_ActionUtilities.Textbox_SetText(AnswerField, QuestionData.AnswerValue, "Unable to set value '" + QuestionData.AnswerValue + "' for '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    break;
                case "LISTBOX": case "LIST BOX":
                    //IControl ListBox = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                    Success = Control_ActionUtilities.Dropdown_SelectItem(AnswerField, QuestionData.AnswerValue, "Unable to select '" + QuestionData.AnswerValue + "' for '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    break;
                case "RADIO": case "RADIOBUTTON": case "RADIO BUTTON":
                case "CHECK BOX": case "CHECKBOX":
                    //IControl RadioButton = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                    //Success = Control_ActionUtilities.Click(AnswerField, "Unable to select radio option '" + QuestionData.AnswerValue + "' for '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    Success = Control_ActionUtilities.Click(AnswerField, "Unable to select radio option '" + QuestionData.AnswerValue + "' for '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    break;
                case "TEXTAREA": case "TEXT AREA":
                    //IControl TextArea = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                    Success = Control_ActionUtilities.Textbox_SetText(AnswerField, QuestionData.AnswerValue, "Unable to set value '" + QuestionData.AnswerValue + "' for '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    break;
                default:
                    break;
            }
            QuestionData.AnswerValue = null;
            HandleReasonAndNotesForQuestion(TableRow, QuestionData, "OK");
            return Success;
        }

        public static void HandleReasonAndNotesForQuestion(IControl TableRow, CRFTableQuestionsData QuestionData, string ButtonToClick)
        {
            if (QuestionData.CurrentAnswerValue != null)
            {
                IControl reasonFld = DL_CRFPage.GetReasonForChangeField(QuestionData, TableRow);
                Control_ActionUtilities.Dropdown_SelectItem(reasonFld, QuestionData.ReasonForChange, "Unable to select reason for change value for " + QuestionData.QuestionPrompt);
                if (QuestionData.AdditionalNotes != null)
                {
                    if(QuestionData.AdditionalNotes != string.Empty)
                    {
                        QuestionData.AnswerFieldType = "TextArea";
                        IControl NotesField = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                        Control_ActionUtilities.Textbox_SetText(NotesField, QuestionData.AdditionalNotes, "Unable to set additional notes for question prompt " + QuestionData.QuestionPrompt);
                    }                    
                }
                ClickActionButtonForTableQuestion(TableRow, ButtonToClick);
            }
        }

        public static bool ClickButtonOnTableRow(IControl TableRow, string ButtonToClick)
        {
            IControl RowButton = DL_CRFPage.GetRowActionButtonFromTableRow(TableRow, ButtonToClick);
            return Control_ActionUtilities.Click(RowButton, "Unable to click " + ButtonToClick + " for the row on CRF.");
        }

        public static void FillTableQuestionsNSaveInCRF(string TableName, List<CRFTableQuestionsData> QuestionsData, out List<string> UnfilledQuestions)
        {
            string prevRowNumm = "";
            UnfilledQuestions = new List<string>();
            foreach (CRFTableQuestionsData Question in QuestionsData)
            {
                int rowNumber = Convert.ToInt32(Question.RowNumber);
                IControl TableInCRF = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(TableInCRF))
                {
                    bool newRow = false;
                    if (Question.AddNewRow.Equals("Yes",StringComparison.InvariantCulture))
                    {
                        if (!ClickAddNewRowButtonForTable(TableInCRF))
                        {
                            Control_ActionUtilities.LogException("Click Add New Row button for " + TableName + ".", "Unable to click Add New Row button.", string.Empty);
                        }
                        newRow = true;
                    }
                    IControl TblRow = DL_CRFPage.GetRowOfTableInCRF(TableInCRF, Question.RowNumber);
                    if (TblRow == null)
                    {
                        Control_ActionUtilities.LogException("Row# " + Question.RowNumber + " for " + TableName + " table in CRF.", "Unable to find the table row in CRF.", string.Empty);
                    }
                    if (!newRow && prevRowNumm != Question.RowNumber)
                    {
                        //ExpandOrCollapseATableRow(TblRow, "Collapsed");
                        ExpandTableRow(TableName, rowNumber);
                    }
                    if (!FillTableRowQuestionInCRF(TblRow, Question))
                    {
                        UnfilledQuestions.Add(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                    }
                    if (Question.RowButtonToClick != string.Empty)
                    {
                        ClickTableRowButtonAndVerify(TableInCRF, TblRow, Question.RowNumber, Question.RowButtonToClick);
                    }
                }
                else
                {
                    UnfilledQuestions.Add(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                }
                prevRowNumm = Question.RowNumber;
                Thread.Sleep(3000);
            }
        }

        public static bool ClickTableRowButtonAndVerify(IControl Table, IControl TableRow, string RowNum, string ButtonToClick)
        {
            bool Verification = true;
            if(!ClickButtonOnTableRow(TableRow, ButtonToClick))
            {
                return false;
            }
            if (ButtonToClick.ToUpper() == "CANCEL ROW")
            {
                TableRow = DL_CRFPage.GetRowOfTableInCRF(Table, RowNum);
                return (TableRow == null);
                /*
                if (TableRow != null)
                {
                    Control_ActionUtilities.LogException("Cancel Table Row", "Table row is not removed on cancelling the row.", string.Empty);
                    Verification = false;
                }*/
            }
            /* Commented as this verification is failing when table row save is resulting in queries
            else
            {
                //To do... why?, TableRow object may recreate
                if (!DL_CRFPage.isTableRowCollapsedInCRF(TableRow))
                {
                    Control_ActionUtilities.LogException("Save Table Row", "Table row is not saved.", string.Empty);
                    Verification = false;
                }
            }
            */
            return Verification;
        }
        
        public static void FillAutoBuildTableQuestionsNSaveInCRF(string TableName, List<CRFTableQuestionsData> QuestionsData, out List<string> UnfilledQuestions)
        {
            string PrevRowNum = "";
            UnfilledQuestions = new List<string>();
            foreach (CRFTableQuestionsData Question in QuestionsData)
            {
                int rowNumber = Convert.ToInt32(Question.RowNumber);
                IControl TableInCRF = DL_CRFPage.GetTableInCRF(TableName,rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(TableInCRF))
                {
                    bool newRow = false;
                    if (Question.AddNewRow.Equals("Yes",StringComparison.InvariantCulture))
                    {
                        if (!ClickAddNewRowButtonForTable(TableInCRF))
                        {
                            Control_ActionUtilities.LogException("Click Add New Row button for " + TableName + ".", "Unable to click Add New Row button.", string.Empty);
                        }
                        newRow = true;
                    }
                    IControl TblRow = DL_CRFPage.GetRowOfTableInCRF(TableInCRF, Question.RowNumber);
                    if (TblRow == null)
                    {
                        Control_ActionUtilities.LogException("Row# " + Question.RowNumber + " for " + TableName + " table in CRF.", "Unable to find the table row in CRF.", string.Empty);
                    }
                    if (!newRow && PrevRowNum != Question.RowNumber)
                    {
                        //ExpandOrCollapseATableRow(TblRow, "Collapsed");
                        ExpandTableRow(TableName, rowNumber);
                    }
                    if (!FillTableRowQuestionInCRF(TblRow, Question))
                    {
                        UnfilledQuestions.Add(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                    }
                    if (Question.RowButtonToClick != string.Empty)
                    {
                        ClickTableRowButtonAndVerify(TableInCRF, TblRow, Question.RowNumber, Question.RowButtonToClick);
                    }
                }
                PrevRowNum = Question.RowNumber;
            }
        }

        public static bool ExpandOrCollapseATableRow(IControl TableRow, string CurrState)
        {
            return false;
            bool isVerified = false;
            IControl ExpandElement = DL_CRFPage.GetTableRowExpandCollapseElement(TableRow);
            if(ExpandElement != null && ExpandElement.WebElement != null)
            {
                Control_ActionUtilities.Click(ExpandElement, "Unable to expand/collapse the table row.");
                string style = ExpandElement.WebElement.GetAttribute("style");
                if(CurrState.ToUpper() == "EXPANDED")
                {
                    isVerified = style == "";
                }
                else
                {
                    isVerified = style == "display: none;";
                }
            }
            return isVerified;
        }

        public static bool ExpandTableRowIfItIsClosed(IControl TableRow)
        {
            try
            {
                IControl ExpandElement = DL_CRFPage.GetTableRowExpandCollapseElement(TableRow);
                if (ExpandElement != null && ExpandElement.WebElement != null)
                {
                    string style = ExpandElement.WebElement.GetAttribute("style");
                    if (style != "display: none;")
                    {
                        Control_ActionUtilities.Click(ExpandElement, "Unable to expand the table row.");
                    }
                }
                string newstyle = ExpandElement.WebElement.GetAttribute("style");
                return newstyle == "display: none;";
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyFlatQuestionsDataInCRF(List<CRFFlatQuestionsData> QuestionData, out List<string> UnVerifiedQuestions)
        {
            bool isVerified = true;
            UnVerifiedQuestions = new List<string>();
            foreach (CRFFlatQuestionsData DataItem in QuestionData)
            {
                IControl AnswerField = DL_CRFPage.GetAnswerFieldOfFlatQuestion(DataItem);
                if (!VerifyFlatQuestionDataInCRF(AnswerField, DataItem))
                {
                    UnVerifiedQuestions.Add(DataItem.QuestionPrompt);
                    isVerified = false;
                }
                AnswerField = null;
            }
            return isVerified;
        }

        public static bool VerifyFlatQuestionsAnswerStatusInCRF(List<CRFFlatQuestionsData> QuestionData, out List<string> UnVerifiedQuestions)
        {
            bool isVerified = true;
            UnVerifiedQuestions = new List<string>();
            foreach (CRFFlatQuestionsData DataItem in QuestionData)
            {
                IControl AnswerField = DL_CRFPage.GetAnswerFieldOfFlatQuestion(DataItem);
                if (!VerifyFlatQuestionAnswerStatusInCRF(AnswerField, DataItem))
                {
                    UnVerifiedQuestions.Add(DataItem.QuestionPrompt);
                    isVerified = false;
                }
                AnswerField = null;
            }
            return isVerified;
        }

        public static bool VerifyFlatQuestionDataInCRF(IControl AnswerField, CRFFlatQuestionsData Item)
        {
            if (AnswerField == null)
            {
                Control_ActionUtilities.LogException("Fill value to question " + Item.QuestionPrompt, "Answer field is not displayed.", string.Empty);
                return false;
            }
            string Text;
            bool Temp;
            try
            {
                switch (Item.AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX": case "TEXT BOX":
                    case "TEXT AREA": case "TEXTAREA":
                        //Control_ActionUtilities.Textbox_GetText(AnswerField, "Unable to verify value in '" + Item.QuestionPrompt + "'.", out Text);
                        Text = Control_PropertyUtilities.GetAttributeValue(AnswerField, "value", out Temp);
                        return Text.Equals(Item.AnswerValue);
                    case "LISTBOX": case "LIST BOX":
                        return Control_ActionUtilities.Dropdown_VerifySelectedItem(AnswerField, Item.AnswerValue, "Unable to verify selected item from " + Item.QuestionPrompt + "' in the CRF.");
                    case "RADIOBUTTON": case "RADIO BUTTON": case "RADIO":
                    case "CHECKBOX": case "CHECK BOX":
                        Text = Control_PropertyUtilities.GetAttributeValue(AnswerField, "checked", out Temp);
                        if (Temp)
                        {
                            return Text.Equals("true");
                        }
                        else
                        {
                            return false;
                        }

                    case "LINK":
                        return (AnswerField != null);
                    case "TEXT":
                        Text = Control_PropertyUtilities.GetText(AnswerField);
                        return Text.Equals(Item.AnswerValue);
                    case "TEXT_CONTAINS":
                        Text = Control_PropertyUtilities.GetText(AnswerField);
                        return Text.Contains(Item.AnswerValue);
                    default:
                        return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyFlatQuestionAnswerStatusInCRF(IControl AnswerField, CRFFlatQuestionsData Item)
        {
            if (AnswerField == null)
            {
                Control_ActionUtilities.LogException("Fill value to question " + Item.QuestionPrompt, "Answer field is not displayed.", string.Empty);
                return false;
            }
            bool Text;
            bool Temp;
            try
            {
                switch (Item.AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX":
                    case "TEXT BOX":
                    case "TEXT AREA":
                    case "TEXTAREA":
                        //Control_ActionUtilities.Textbox_GetText(AnswerField, "Unable to verify value in '" + Item.QuestionPrompt + "'.", out Text);
                        if(Item.State.Equals("Enabled"))
                        {
                             Text = Control_PropertyUtilities.IsEnabled(AnswerField);
                             return Text;
                        }
                        else if(Item.State.Equals("Disabled"))
                        {
                            Text = Control_PropertyUtilities.IsControlDisabled(AnswerField);
                            return Text;
                        }
                        return false;                       
                        break;                         
                       
                    case "LISTBOX":
                    case "LIST BOX":
                        // return Control_ActionUtilities.Dropdown_VerifySelectedItem(AnswerField, Item.AnswerValue, "Unable to verify selected item from " + Item.QuestionPrompt + "' in the CRF.");
                        if (Item.State.Equals("Enabled"))
                        {
                            Text = Control_PropertyUtilities.IsEnabled(AnswerField);
                            return Text;
                        }
                        else if (Item.State.Equals("Disabled"))
                        {
                            Text = Control_PropertyUtilities.IsControlDisabled(AnswerField);
                            return Text;
                        }
                        return false;
                        break;
                    case "RADIOBUTTON":
                    case "RADIO BUTTON":
                    case "RADIO":
                    case "CHECKBOX":
                    case "CHECK BOX":
                        //Text = Control_PropertyUtilities.GetAttributeValue(AnswerField, "checked", out Temp);
                    //    if (Temp)
                    //    {
                    //        return Text.Equals("true");
                    //    }
                    //    else
                    //    {
                    //        return false;
                    //    }

                    //case "LINK":
                    //    return (AnswerField != null);
                    //case "TEXT":
                    //    Text = Control_PropertyUtilities.GetText(AnswerField);
                    //    return Text.Equals(Item.AnswerValue);
                    //case "TEXT_CONTAINS":
                    //    Text = Control_PropertyUtilities.GetText(AnswerField);
                    //    return Text.Contains(Item.AnswerValue);
                    default:
                        return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool VerifyAnswerItemsOfFlatQuestionInCRF(string QuestionPrompt, string AnswerFieldType, List<string> AnswerValues, bool AnswersExist)
        {
            switch (AnswerFieldType.ToUpper())
            {
                case "LISTBOX": case "LIST BOX":
                    IControl ListBox = DL_CRFPage.GetAnswerFieldOfFlatQuestion(QuestionPrompt, AnswerFieldType, "");
                    return Control_ActionUtilities.Dropdown_VerifyItems(ListBox, AnswerValues, AnswersExist, "Unable to verify items in list box of '" + QuestionPrompt + "' in CRF.");
                case "CHECKBOX": case "CHECK BOX":
                case "RADIO": case "RADIO BUTTON": case "RADIOBUTTON":
                    int ItemsCnt = AnswerValues.Count();
                    int ActAvCnt = 0;
                    int ActUnAvCnt = 0;
                    foreach (string Answer in AnswerValues)
                    {
                        IControl Field = DL_CRFPage.GetAnswerFieldOfFlatQuestion(QuestionPrompt, AnswerFieldType, Answer);
                        if(!Control_PropertyUtilities.IsControlNull(Field))
                        {
                            ActAvCnt = ActAvCnt + 1;
                        }
                        else
                        {
                            ActUnAvCnt = ActUnAvCnt + 1;
                        }
                    }
                    return ((AnswersExist && ActAvCnt == ItemsCnt) || (!AnswersExist && ActUnAvCnt == ItemsCnt));
                default:
                    return false;
            }
        }

        public static bool AnswerMismatchedFlatQuestions(IEnumerable<PDEP_MismatchedFlatQuestionData> dataList)
        {
            try
            {
                foreach (PDEP_MismatchedFlatQuestionData data in dataList)
                {
                    if (!AnswerMismatchedFlatQuestion(data))
                    {
                        return false;
                    }
                }
                return true;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        static bool AnswerMismatchedFlatQuestion(PDEP_MismatchedFlatQuestionData data)
        {
            try
            {
                if (!String.IsNullOrEmpty(data.QuestionPrompt))
                {
                    if (!String.IsNullOrEmpty(data.RadioButton))
                    {
                        IControl radioButton = DL_CRFPage.GetPDEP_MismatchedFlatQuestionRadioButton(data.QuestionPrompt, data.RadioButton);
                        return Control_ActionUtilities.Click(radioButton, String.Empty);
                    }
                    else if (!String.IsNullOrEmpty(data.Text))
                    {
                        IControl textBox = DL_CRFPage.GetPDEP_MismatchedFlatQuestionTextbox(data.QuestionPrompt, data.RadioButton);
                        return Control_ActionUtilities.Textbox_SetText(textBox, data.Text, String.Empty);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifyAnswerItemsOfTableQuestionInCRF(string TableName, string RowNumber, string QuestionPrompt, string AnswerFieldType, List<string> AnswerValues, bool AnswersExist)
        {
            int rowNumber = Convert.ToInt32(RowNumber);
            IControl Table = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
            if(Table.WebElement == null)
            {
                //LogException
                return false;
            }
            IControl TableRow = DL_CRFPage.GetRowOfTableInCRF(Table, RowNumber);
            if(TableRow.WebElement == null)
            {
                return false;
            }
            switch (AnswerFieldType.ToUpper())
            {
                case "LISTBOX": case "LIST BOX":
                    //IControl ListBox = DL_CRFPage.GetAnswerFieldOfFlatQuestion(QuestionPrompt, AnswerFieldType, "");
                    IControl ListBox = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionPrompt, AnswerFieldType, "");
                    return Control_ActionUtilities.Dropdown_VerifyItems(ListBox, AnswerValues, AnswersExist, "Unable to veirfy items in list box of '" + QuestionPrompt + "' in CRF.");
                case "CHECKBOX": case "CHECK BOX":
                case "RADIO": case "RADIO BUTTON": case "RADIOBUTTON":
                    int ItemsCnt = AnswerValues.Count();
                    int ActAvCnt = 0;
                    int ActUnAvCnt = 0;
                    foreach (string Answer in AnswerValues)
                    {
                        IControl Field = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionPrompt, AnswerFieldType, Answer);
                        if (Field.WebElement != null)
                        {
                            ActAvCnt = ActAvCnt + 1;
                        }
                        else
                        {
                            ActUnAvCnt = ActUnAvCnt + 1;
                        }
                    }
                    return ((AnswersExist && ActAvCnt == ItemsCnt) || (!AnswersExist && ActUnAvCnt == ItemsCnt));
                case "TEXT":
                    string answerExpected = AnswerValues[0];
                    IControl answerActual = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionPrompt, AnswerFieldType,answerExpected);
                    if (!Control_PropertyUtilities.IsControlNull(answerActual))
                    {
                        if (!answerExpected.Equals(answerActual.WebElement.Text, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return false;
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
                    
                default:
                    return false;
            }
        }


        public static void VerifyTableQuestionsDataInCRF(string TableName, List<CRFTableQuestionsData> QuestionsData, out List<string> UnVerifiedQuestions)
        {
            string PrevRowNum = "";
            UnVerifiedQuestions = new List<string>();
            foreach (CRFTableQuestionsData Question in QuestionsData)
            {
                int rowNumber = Convert.ToInt32(Question.RowNumber);
                IControl TableInCRF = DL_CRFPage.GetTableInCRF(TableName,rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(TableInCRF))
                {
                    IControl TblRow = DL_CRFPage.GetRowOfTableInCRF(TableInCRF, Question.RowNumber);
                    if (TblRow == null)
                    {
                        Control_ActionUtilities.LogException("Row# " + Question.RowNumber + " for " + TableName + " table in CRF.", "Unable to find the table row in CRF.", string.Empty);
                    }
                    if (PrevRowNum != Question.RowNumber)
                    {
                        ExpandTableRow(TableName, rowNumber);
                        //ExpandOrCollapseATableRow(TblRow, "Collapsed");
                    }
                    if (!VerifyTableRowQuestionInCRF(TblRow, Question))
                    {
                        UnVerifiedQuestions.Add(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                    }
                    if (Question.RowButtonToClick != string.Empty)
                    {
                        //ClickButtonOnTableRow(TblRow, Question.RowButtonToClick);
                        ClickTableButtonForExpandedRow(TableName, Question.RowButtonToClick);
                    }
                }
                PrevRowNum = Question.RowNumber;
            }
        }
        
        public static void VerifyQuestionsThatAreNotDisplayedInCRF(string TableName, List<CRFTableQuestionsData> QuestionsData, out List<string> UnVerifiedQuestions)
        {
            string PrevRowNum = "";
            UnVerifiedQuestions = new List<string>();
            foreach (CRFTableQuestionsData Question in QuestionsData)
            {
                int rowNumber = Convert.ToInt32(Question.RowNumber);
                IControl TableInCRF = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(TableInCRF))
                {
                    IControl TblRow = DL_CRFPage.GetRowOfTableInCRF(TableInCRF, Question.RowNumber);
                    if (TblRow == null)
                    {
                        Control_ActionUtilities.LogException("Row# " + Question.RowNumber + " for " + TableName + " table in CRF.", "Unable to find the table row in CRF.", string.Empty);
                    }
                    if (PrevRowNum != Question.RowNumber)
                    {
                        ExpandTableRow(TableName, rowNumber);
                        //ExpandOrCollapseATableRow(TblRow, "Collapsed");
                    }
                    if (!VerifyTableRowQuestionInCRF(TblRow, Question))
                    {
                        //UnVerifiedQuestions.Add(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                        UnVerifiedQuestions.Equals(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                        UnVerifiedQuestions.Equals(Question.QuestionPrompt);
                    }
                    if (Question.RowButtonToClick != string.Empty)
                    {
                        //ClickButtonOnTableRow(TblRow, Question.RowButtonToClick);
                        ClickTableButtonForExpandedRow(TableName, Question.RowButtonToClick);
                    }
                }
                PrevRowNum = Question.RowNumber;
            }
        }

        public static void VerifyTableQuestionsAnswerStateInCRF(string TableName, List<CRFTableQuestionsData> QuestionsData, out List<string> UnVerifiedQuestions)
        {
            string PrevRowNum = "";
            UnVerifiedQuestions = new List<string>();
            foreach (CRFTableQuestionsData Question in QuestionsData)
            {
                int rowNumber = Convert.ToInt32(Question.RowNumber);
                IControl TableInCRF = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
                if (!Control_PropertyUtilities.IsControlNull(TableInCRF))
                {
                    IControl TblRow = DL_CRFPage.GetRowOfTableInCRF(TableInCRF, Question.RowNumber);
                    if (TblRow == null)
                    {
                        Control_ActionUtilities.LogException("Row# " + Question.RowNumber + " for " + TableName + " table in CRF.", "Unable to find the table row in CRF.", string.Empty);
                    }
                    if (PrevRowNum != Question.RowNumber)
                    {
                        if(String.IsNullOrEmpty(Question.SkipRowExpand) || !Question.SkipRowExpand.Equals("Yes", StringComparison.InvariantCultureIgnoreCase))
                        {
                            ExpandTableRow(TableName, rowNumber);
                        }                        
                        //ExpandOrCollapseATableRow(TblRow, "Collapsed");
                    }
                    if (!VerifyTableRowQuestionAnswerStateInCRF(TblRow, Question))
                    {
                        UnVerifiedQuestions.Add(Question.QuestionPrompt + " in " + TableName + " row " + Question.RowNumber);
                    }
                    if (Question.RowButtonToClick != string.Empty)
                    {
                        //ClickButtonOnTableRow(TblRow, Question.RowButtonToClick);
                        ClickTableButtonForExpandedRow(TableName, Question.RowButtonToClick);
                    }
                }
                PrevRowNum = Question.RowNumber;
            }
        }
        public static bool VerifyTableRowQuestionInCRF(IControl TableRow, CRFTableQuestionsData QuestionData)
        {
            string FieldType = QuestionData.AnswerFieldType.ToUpper();
            IControl AnswerField = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
                        
            try
            {
                if (Control_PropertyUtilities.IsControlNull(AnswerField))
                {
                    new DebugLogGenerator().WriteLog(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, "Unable to find the Answer Field for Question - " + QuestionData.QuestionPrompt);
                    return false;
                }
                switch (FieldType)
                {
                    case "TEXTBOX": case "TEXT BOX":
                    case "TEXTAREA": case "TEXT AREA":
                        return VerifyTextboxValue(QuestionData, AnswerField);
                    case "LISTBOX": case "LIST BOX":
                        return VerifyListBoxValue(QuestionData, AnswerField);
                        //return Control_ActionUtilities.Dropdown_VerifySelectedItem(AnswerField, QuestionData.AnswerValue, "Unable to verify selected item from '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    case "RADIO": case "RADIOBUTTON": case "RADIO BUTTON":
                    case "CHECK BOX": case "CHECKBOX":
                        return VerifyCheckboxOrRadioButtonValue(QuestionData, AnswerField);
                        //return !Control_PropertyUtilities.IsControlNull(AnswerField);
                    case "LINK":
                        return (AnswerField != null);
                    case "TEXT":
                        string Text = Control_PropertyUtilities.GetText(AnswerField);
                        String ansValue = QuestionData.AnswerValue.Replace("\\r", "\r");
                        return Text.Equals(ansValue);
                    case "IMAGE":
                        return VerifyImageSRCValue(QuestionData, AnswerField);
                    default:
                        return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        static bool VerifyTextboxValue(CRFTableQuestionsData questionData, IControl answerField)
        {
            bool found = false;
            String actualValue = String.Empty;
            if (!String.IsNullOrEmpty(questionData.QuestionStatus))
            {
                if(questionData.QuestionStatus.Equals("Unsaved", StringComparison.InvariantCultureIgnoreCase))
                {
                    return Control_PropertyUtilities.IsControlDisabled(answerField);
                }
            }
            else
            {
                actualValue = Control_PropertyUtilities.GetAttributeValue(answerField, "value", out found);
            }
            return found && questionData.AnswerValue.Equals(actualValue, StringComparison.InvariantCultureIgnoreCase);
        }

        static bool VerifyListBoxValue(CRFTableQuestionsData questionData, IControl answerField)
        {
            if (!String.IsNullOrEmpty(questionData.QuestionStatus))
            {
                if (questionData.QuestionStatus.Equals("Unsaved", StringComparison.InvariantCultureIgnoreCase))
                {
                    return Control_PropertyUtilities.IsControlDisabled(answerField);
                }
            }
            else
            {
                return Control_ActionUtilities.Dropdown_VerifySelectedItem(answerField, questionData.AnswerValue, "Unable to verify selected item from '" + questionData.QuestionPrompt + "' in CRF table.");
            }
            return false;
        }
        static bool VerifyImageSRCValue(CRFTableQuestionsData questionData, IControl answerField)
        {
            try
            {
                if (!String.IsNullOrEmpty(questionData.QuestionStatus))
                {
                    return Control_PropertyUtilities.IsControlDisabled(answerField);
                }
                else
                {
                    return Control_PropertyUtilities.VerifyAttributeValueContains(answerField, "src", questionData.AnswerValue);
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
        static bool VerifyCheckboxOrRadioButtonValue(CRFTableQuestionsData questionData, IControl answerField)
        {
            if (!String.IsNullOrEmpty(questionData.QuestionStatus))
            {
                if (questionData.QuestionStatus.Equals("Unsaved", StringComparison.InvariantCultureIgnoreCase))
                {
                    return Control_PropertyUtilities.IsControlDisabled(answerField);
                }
            }
            else
            {
                return !Control_PropertyUtilities.IsControlNull(answerField);
            }
            return false;
        }

        public static bool VerifyTableRowQuestionAnswerStateInCRF(IControl TableRow, CRFTableQuestionsData QuestionData)
        {
            string FieldType = QuestionData.AnswerFieldType.ToUpper();
            IControl AnswerField = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionData);
            bool Text;
            bool Temp;
            try
            {
                switch (FieldType)
                {
                    case "TEXTBOX":
                    case "TEXT BOX":
                    case "TEXTAREA":
                    case "TEXT AREA":
                    case "TEXT":
                    case "DISABLEDTEXT1":
                        if (QuestionData.State.Equals("Enabled"))
                        {
                            Text = Control_PropertyUtilities.IsEnabled(AnswerField);
                            return Text;
                        }
                        else if (QuestionData.State.Equals("Disabled"))
                        {
                            Text = Control_PropertyUtilities.IsControlDisabled(AnswerField);
                            return Text;
                        }
                         return false;
                    case "LISTBOX":
                    case "LIST BOX":
                        if (QuestionData.State.Equals("Enabled"))
                        {
                            Text = Control_PropertyUtilities.IsEnabled(AnswerField);
                            return Text;
                        }
                        else if (QuestionData.State.Equals("Disabled"))
                        {
                            Text = Control_PropertyUtilities.IsControlDisabled(AnswerField);
                            return Text;
                        }
                        
                        return false;
                    // return Control_ActionUtilities.Dropdown_VerifySelectedItem(AnswerField, QuestionData.AnswerValue, "Unable to verify selected item from '" + QuestionData.QuestionPrompt + "' in CRF table.");
                    case "RADIO":
                    case "RADIOBUTTON":
                    case "RADIO BUTTON":
                    case "CHECK BOX":
                    case "CHECKBOX":
                        //bool found = false;
                        //Text = Control_PropertyUtilities.GetAttributeValue(AnswerField, "checked", out found);
                        //if (found)
                        //{
                        //    return true;
                        //}
                        //return false;
                        return !Control_PropertyUtilities.IsControlNull(AnswerField);
                    case "LINK":
                        return (AnswerField != null);
                    //case "TEXT":
                    //    Text = Control_PropertyUtilities.GetText(AnswerField);
                    //    String ansValue = QuestionData.AnswerValue.Replace("\\r", "\r");
                    //    return Text.Equals(ansValue);
                    default:
                        return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickAnswerLinkOfFlatQuestion(string QuestionPrompt, string AnswerValue)
        {
            try
            {
                IControl AnsLink = DL_CRFPage.GetAnswerFieldOfFlatQuestion(QuestionPrompt, "Link", AnswerValue);
                if(AnsLink != null && AnsLink.WebElement != null)
                {
                    return Control_ActionUtilities.Click(AnsLink, "Unable to click on " + AnswerValue + " link for the flat question " + QuestionPrompt + ".");
                }
                else
                {
                    //fail statement
                    return false;
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }

        public static bool ClickAnswerLinkOfTableQuestion(string TableName, string RowNum, string QuestionPrompt, string AnswerValue)
        {
            try
            {
                int rowNumber = Convert.ToInt32(RowNum);
                IControl Table = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
                if(Table == null || Table.WebElement == null)
                {
                    //fail statement
                    return false;
                }
                IControl TableRow = DL_CRFPage.GetRowOfTableInCRF(Table, RowNum);
                if(TableRow == null || TableRow.WebElement == null)
                {
                    //fail statement
                    return false;
                }
                ExpandTableRowIfItIsClosed(TableRow);
                IControl AnsLink = DL_CRFPage.GetAnswerFieldFromTableRow(TableRow, QuestionPrompt, "Link", AnswerValue);
                if (AnsLink != null && AnsLink.WebElement != null)
                {
                    return Control_ActionUtilities.Click(AnsLink, "Unable to click on " + AnswerValue + " link for the table question " + QuestionPrompt + ".");
                }
                else
                {
                    //fail statement
                    return false;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                return false;
            }
        }
        public static bool SetFlagsForFlatQuestionInCRF(List<CRFFlatQuestionsData> Questions,out List<string> FailedItems)
        {
            bool isSuccess=true;
            FailedItems = new List<string>();
            try
            {
                foreach (CRFFlatQuestionsData Question in Questions)
                {
                    if (Question.SDVerify != "")
                    { 
                        if(!BP_CRF_IconUtilities.InvokeIcon_FaltQuestion(Question.QuestionPrompt, "SD-Verify","SD-Verify"))
                        {
                            isSuccess = false;
                            FailedItems.Add(Question.QuestionPrompt + " - SD-Verify");
                        }
                    }
                    if (Question.MReview != "")
                    {
                        if (!BP_CRF_IconUtilities.InvokeIcon_FaltQuestion(Question.QuestionPrompt, "M-Review", "M-Review"))
                        {
                            isSuccess = false;
                            FailedItems.Add(Question.QuestionPrompt + " - M-Review");
                        }
                    }
                    if (Question.DReview != "")
                    {
                        if (!BP_CRF_IconUtilities.InvokeIcon_FaltQuestion(Question.QuestionPrompt, "D-Review", "D-Review"))
                        {
                            isSuccess = false;
                            FailedItems.Add(Question.QuestionPrompt + " - D-Review");
                        }
                    }

                }
                return isSuccess;
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
        public static bool SetFlagsForTableQuestionsInCRF(string TableName, List<CRFTableQuestionsData> QuestionList,out List<string> FailedItems)
        {
            bool isSuccess = true;
            FailedItems = new List<string>();
            try
            {
                foreach (CRFTableQuestionsData Question in QuestionList)
                {
                    int rowNumber = Convert.ToInt32(Question.RowNumber);
                    IControl TableInCRF = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
                    if (!Control_PropertyUtilities.IsControlNull(TableInCRF))
                    {

                        IControl TblRow = DL_CRFPage.GetRowOfTableInCRF(TableInCRF, Question.RowNumber);
                        if (TblRow == null)
                        {
                            Control_ActionUtilities.LogException("Row# " + Question.RowNumber + " for " + TableName + " table in CRF.", "Unable to find the table row in CRF.", string.Empty);
                            return false;
                        }
                        else
                        {
                            ExpandTableRow(TableName, rowNumber);
                            Thread.Sleep(5);
                            if (Question.SDVerify != "")
                            {
                                if (!BP_CRF_IconUtilities.InvokeIcon_TableQuestion(TableName, Question.QuestionPrompt, "SD-Verify", "SD-Verify"))
                                {
                                    isSuccess = false;
                                    FailedItems.Add(Question.QuestionPrompt + " - SD-Verify");
                                }
                            }
                            if (Question.MReview != "")
                            {
                                if (!BP_CRF_IconUtilities.InvokeIcon_TableQuestion(TableName, Question.QuestionPrompt, "M-Review","M-Review"))
                                {
                                    isSuccess = false;
                                    FailedItems.Add(Question.QuestionPrompt + " - M-Review");
                                }
                            }
                            if (Question.DReview != "")
                            {
                                if (!BP_CRF_IconUtilities.InvokeIcon_TableQuestion(TableName, Question.QuestionPrompt, "D-Review","D-Review"))
                                {
                                    isSuccess = false;
                                    FailedItems.Add(Question.QuestionPrompt + " - D-Review");
                                }
                            }
                            if (Question.RowButtonToClick != string.Empty)
                            {
                                ClickTableRowButtonAndVerify(TableInCRF, TblRow, Question.RowNumber, Question.RowButtonToClick);
                            }
                        }

                        return isSuccess;
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}
