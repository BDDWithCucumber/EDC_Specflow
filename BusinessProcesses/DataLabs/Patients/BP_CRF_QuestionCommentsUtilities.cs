using Framework.Actions;
using Interfaces;
using Pages.DataLabs;
using Pages.DataLabs.Data;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;
using Utilities;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_CRF_QuestionCommentsUtilities : BP_CRFUtilities
    {
        public static bool AddCommentsToFlatQuestionsInCRF(List<AddCommentsForQuestion> QuestionData)
        {
            try
            {
                foreach (AddCommentsForQuestion Data in QuestionData)
                {
                    if (!AddCommentsToAFlatQuestion(Data.QuestionPrompt, Data.CommentsToAdd))
                    {
                        return false;
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

        public static bool AddCommentsToAFlatQuestion(string QuestionPrompt, string Comments)
        {
            try
            {
                if (SelectAddCommentElementForFlatQuestion(QuestionPrompt))
                {
                    BrowserUtilities.SwitchToFrame();
                    string QuestText = Control_PropertyUtilities.GetText(DL_CRFPage.GetQuestionOnAddCommentModal);
                    if (!QuestText.Contains(QuestionPrompt))
                    {
                        Control_ActionUtilities.LogException("Verify question prompt on add comments modal.", "Question is not displayed correctly", string.Empty);
                        return false;
                    }
                    IControl CommentsTextBox = DL_CRFPage.GetTextAreaOnAddCommentModal;
                    Control_ActionUtilities.Textbox_SetText(CommentsTextBox, Comments, "Unable to set comments for the question " + QuestionPrompt);
                    IControl SaveButton = DL_CRFPage.GetButtonOnAddCommentModal("Save");
                    Control_ActionUtilities.ClickModalButton(SaveButton);
                    BrowserUtilities.SwitchToWindow();
                    return true;
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectAddCommentElementForFlatQuestion(string QuestionPrompt)
        {
            bool success = false;
            try
            {
                IControl ArrowIcon = DL_CRFPage.GetArrowIconForAQuestion(QuestionPrompt);
                if (ArrowIcon != null && ArrowIcon.WebElement != null)
                {
                    Control_ActionUtilities.Click(ArrowIcon, "Unable to click on Arrow icon for the question " + QuestionPrompt);
                    IControl AddComment = DL_CRFPage.GetAddCommentElement;
                    if (AddComment != null && AddComment.WebElement != null)
                    {
                        success = Control_ActionUtilities.Click(AddComment, "Unable to click on Add Comment element for question " + QuestionPrompt);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return success;
        }

        public static bool InvokeClearItem(string QuestionPrompt)
        {
            bool success = false;
            try
            {
                IControl ArrowIcon = DL_CRFPage.GetArrowIconForAQuestion(QuestionPrompt);
                if (ArrowIcon != null && ArrowIcon.WebElement != null)
                {
                    Control_ActionUtilities.Click(ArrowIcon, "Unable to click on Arrow icon for the question " + QuestionPrompt);
                    IControl clearItem = DL_CRFPage.GetClearItemElement;
                    if (clearItem != null && clearItem.WebElement != null)
                    {
                        success = Control_ActionUtilities.Click(clearItem, "Unable to click on Clear Item element for question " + QuestionPrompt);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return success;
        }

        public static void AddCommentsToTableQuestionsInCRF(string TableName, List<AddCommentsForQuestion> QuestionData)
        {
            string PrevRow = "";
            foreach (AddCommentsForQuestion Data in QuestionData)
            {
                int rowNumber = Convert.ToInt32(Data.RowNumber);
                IControl Table = DL_CRFPage.GetTableInCRF(TableName, rowNumber);
                if (Table != null && Table.WebElement != null)
                {
                    IControl TableRow = DL_CRFPage.GetRowOfTableInCRF(Table, Data.RowNumber);
                    if (TableRow != null && TableRow.WebElement != null)
                    {
                        if (PrevRow != Data.RowNumber)
                        {
                            ExpandTableRow(TableName, rowNumber);
                            //ExpandOrCollapseATableRow(TableRow, "Collapsed");
                        }
                        AddCommentsToATableQuestion(TableRow, Data);
                        if (Data.RowButtonToClick != string.Empty)
                        {
                            //ClickButtonOnTableRow(TableRow, Data.RowButtonToClick);
                            ClickTableButtonForExpandedRow(TableName, Data.RowButtonToClick);
                        }
                        PrevRow = Data.RowNumber;
                    }
                    else
                    {
                        Control_ActionUtilities.LogException("Table row #" + Data.RowNumber + " not found.", "", "");
                    }
                }
                else
                {
                    Control_ActionUtilities.LogException("Table with name " + TableName + " is not found.", "", "");
                }
            }
        }

        public static void AddCommentsToATableQuestion(IControl TableRow, AddCommentsForQuestion QuestionData)
        {
            if (SelectAddCommentElementForTableQuestion(TableRow, QuestionData.QuestionPrompt))
            {
                try
                {
                    BrowserUtilities.SwitchToFrame();
                    string QuestText = Control_PropertyUtilities.GetText(DL_CRFPage.GetQuestionOnAddCommentModal);
                    if (!QuestText.Contains(QuestionData.QuestionPrompt))
                    {
                        Control_ActionUtilities.LogException("Verify question prompt on add comments modal.", "Question is not displayed correctly", string.Empty);
                        return;
                    }
                    IControl CommentsTextBox = DL_CRFPage.GetTextAreaOnAddCommentModal;
                    Control_ActionUtilities.Textbox_SetText(CommentsTextBox, QuestionData.CommentsToAdd, "Unable to set comments for the question " + QuestionData.QuestionPrompt);
                    IControl SaveButton = DL_CRFPage.GetButtonOnAddCommentModal("Save");
                    Control_ActionUtilities.ClickModalButton(SaveButton);
                    BrowserUtilities.SwitchToWindow();
                }
                catch (Exception e)
                {
                    new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
                }
            }
        }

        public static bool SelectAddCommentElementForTableQuestion(IControl TableRow, string QuestionPrompt)
        {
            bool success = false;
            try
            {
                IControl ArrowIcon = DL_CRFPage.GetArrowIconForAQuestion(TableRow, QuestionPrompt);
                if (ArrowIcon != null && ArrowIcon.WebElement != null)
                {
                    Control_ActionUtilities.Click(ArrowIcon, "Unable to click on Arrow icon for the question " + QuestionPrompt);
                    IControl AddComment = DL_CRFPage.GetAddCommentElement;
                    if (AddComment != null && AddComment.WebElement != null)
                    {
                        success = Control_ActionUtilities.Click(AddComment, "Unable to click on Add Comment element for question " + QuestionPrompt);
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return success;
        }

    }
}
