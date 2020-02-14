using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using Utilities;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using System.Collections.ObjectModel;
using Framework;
using Framework.Actions;

namespace Pages.DataLabs
{
    public class DL_CRFPage : DL_CRF_QuestionBase
    {
        public static IControl CRFNameObject { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(text(), 'CRF')]/b")); } }
        public static IControl CheckOutButton_CRF { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_btnCheckOut")); } }
        public static IControl ShowHiddednFields_CRF { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_btnShow")); } }
        public static IControl CancelButton_CRF { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_btnCancel")); } }
        public static IControl SaveButton_CRF { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_btnCheckIn")); } }
        public static IControl SaveNCloseButton_CRF { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_btnCheckInAndClose")); } }
        public static IControl SaveNNextButton_CRF { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_btnSaveAndNext")); } }
        public static IControl EntryCompleteChkBox { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_chkComplete")); } }
        public static IControl CRFSaveSuccessMsg { get { return SyncUtilities.FindVisibleElement(By.Id("tdConfirmMsg")); } }
        public static IControl CRFHeaderTable
        {
            get
            {
                try
                {
                    IControl header = SyncUtilities.FindVisibleElement(By.Id("CRF_PTHeader"));
                    return SyncUtilities.FindVisibleElement_Parent(header.WebElement, By.TagName("table"));
                }
                catch (Exception e)
                {
                }
                return null;
            }
        }

        public static IControl GetTableInCRF(String TableName, int rowNumber)
        {
            //NavigateToPage(rowNumber);
            IControl tableNameHost = null;
            return GetTableHost(TableName, rowNumber, out tableNameHost);
            //return SyncUtilities.FindVisibleElement(By.XPath("//td[contains(text(), '" + TableName + "')]/ancestor::tr[@class='gRow' or @class='body']"));
        }

        public static IControl GetAddNewRowButtonForTableInCRF(IControl Table)
        {
            return SyncUtilities.FindVisibleElement_Parent(Table.WebElement, By.XPath(".//input[@name='btnAddNewRows']"));
        }

        //Pagination needs to be implemented
        public static IControl GetRowOfTableInCRF(IControl Table, string RowNum)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(Table.WebElement, By.XPath(".//div[contains(@id, 'r" + RowNum + "_RowHtml')]"));
            }
            catch (Exception e)
            {
                return null;
            }

        }
 
        public static IControl GetAnswerFieldFromTableRow(IControl TableRow, CRFTableQuestionsData QuestionData)
        {
            IWebElement Field = null;
            try
            {
                IControl QElement = GetTableQuestionElement(TableRow, QuestionData.QuestionPrompt.Replace("&#x20", " "));
                if(QElement == null || QElement.WebElement == null)
                {
                    return null;
                }
                switch (QuestionData.AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX": case "TEXT BOX":
                        Field = QElement.WebElement.FindElement(By.XPath("./descendant::input"));
                        break;
                    case "LISTBOX": case "LIST BOX":
                        if (QuestionData.CurrentAnswerValue == null)
                        {
                            IWebElement ListBox = QElement.WebElement.FindElement(By.XPath("./descendant::select"));
                            return new Control(ListBox, new SelectElement(ListBox));
                        }
                        else
                        {
                            IWebElement ListBox = QElement.WebElement.FindElement(By.XPath("./descendant::select[1]"));
                            return new Control(ListBox, new SelectElement(ListBox));
                        }
                    case "RADIOBUTTON": case "RADIO BUTTON": case "RADIO":
                    case "CHECKBOX": case "CHECK BOX":
                        if (!String.IsNullOrEmpty(QuestionData.AnswerValue))
                        {
                            Field = QElement.WebElement.FindElement(By.XPath(".//label[text()='" + QuestionData.AnswerValue + "']/preceding-sibling::input"));
                        }
                        else if(!String.IsNullOrEmpty(QuestionData.NewAnswerValue))
                        {
                            Field = QElement.WebElement.FindElement(By.XPath(".//label[text()='" + QuestionData.NewAnswerValue + "']/preceding-sibling::input"));
                        }
                        else
                        {
                            Field = QElement.WebElement.FindElement(By.TagName("input"));
                        }
                        break;
                    case "TEXTAREA": case "TEXT AREA":
                        Field = QElement.WebElement.FindElement(By.XPath("./descendant::textarea"));
                        break;
                    case "LINK":
                        if (QuestionData.AnswerValue != null)
                        {
                            Field = QElement.WebElement.FindElement(By.XPath("./descendant::a[contains(text(), '" + QuestionData.AnswerValue + "') or @id]"));
                        }
                        else
                        {
                            Field = QElement.WebElement.FindElement(By.XPath("./descendant::a[contains(text(), '" + QuestionData.NewAnswerValue + "') or @id]"));
                        }
                        break;
                    case "TEXT":
                        Field = QElement.WebElement.FindElement(By.XPath("./descendant::span"));
                        break;                    
                    case "DISABLEDTEXT1":
                        Field = QElement.WebElement.FindElement(By.XPath("//descendant::input[contains(@class, 'disabled')]"));                        
                        break;

                    case "IMAGE":
                        if (QuestionData.AnswerValue != null)
                        {
                            Field = QElement.WebElement.FindElement(By.XPath("./descendant::img[contains(@src,'" + QuestionData.AnswerValue + "')]"));
                        }
                        else
                        {
                            Field = QElement.WebElement.FindElement(By.XPath("./descendant::img[contains(@src,'" + QuestionData.NewAnswerValue + "')]"));
                        }
                        break;
                }
            }
            catch (Exception e)
            {
                //fail case
            }
            return new Control(Field);
        }

        public static IControl GetTableQuestionElement(IControl TableRow, string QuestionPrompt)
        {
            try
            {
                return SyncUtilities.FindVisibleElement_Parent(TableRow.WebElement, By.XPath(".//td[text()='" + QuestionPrompt + "']/parent::tr"));
            }
            catch(Exception e)
            {
                return null;
            }
        }

        public static IControl GetAnswerFieldFromTableRow(IControl tableRow, string questionPrompt, string answerFieldType, string answerValue)
        {
            try
            {
                switch (answerFieldType.ToUpper())
                {
                    case "TEXTBOX":
                    case "TEXT BOX":
                        return SyncUtilities.FindElement_Parent(tableRow.WebElement, By.XPath(".//td[contains(text(), '" + questionPrompt + "')]/parent::tr/descendant::input"));
                    case "LISTBOX":
                    case "LIST BOX":
                        IControl ListBox = SyncUtilities.FindElement_Parent(tableRow.WebElement, By.XPath(".//td[contains(text(), '" + questionPrompt + "')]/parent::tr/descendant::select"));
                        return new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                    case "RADIOBUTTON":
                    case "RADIO BUTTON":
                    case "RADIO":
                    case "CHECKBOX":
                    case "CHECK BOX":
                        return SyncUtilities.FindElement_Parent(tableRow.WebElement, By.XPath(".//label[contains(text(), '" + answerValue + "')]/preceding-sibling::input"));
                    case "TEXTAREA":
                    case "TEXT AREA":
                        return SyncUtilities.FindElement_Parent(tableRow.WebElement, By.XPath(".//td[contains(text(), '" + questionPrompt + "')]/parent::tr/descendant::textarea"));
                    case "LINK":
                        return SyncUtilities.FindElement_Parent(tableRow.WebElement, By.XPath(".//td[contains(text(), '" + questionPrompt + "')]/parent::tr/descendant::a[contains(text(), '" + answerValue + "')]"));
                    case "TEXT":
                        return SyncUtilities.FindElement_Parent(tableRow.WebElement, By.XPath(".//td[contains(text(), '" + questionPrompt + "')]/parent::tr/descendant::span"));
                }
            }
            catch (Exception e)
            {
            }
            return null;
        }

        public static IControl GetRowActionButtonFromTableRow(IControl TableRow, string ButtonName)
        {
            IWebElement Button = TableRow.WebElement.FindElement(By.XPath(".//input[contains(@value, '" + ButtonName + "')]"));
            return new Control(Button);
        }
        public static bool isTableRowCollapsedInCRF(IControl TableRow)
        {
            IControl c = SyncUtilities.FindVisibleElement_Parent(TableRow.WebElement, By.XPath(".//div[contains(@style, 'display: none')]"));
            return !Control_PropertyUtilities.IsControlNull(c);
        }
        public static IControl GetTableRowExpandCollapseElement(IControl TableRow)
        {
            return SyncUtilities.FindElement_Parent(TableRow.WebElement, By.XPath(".//tr[contains(@id, 'lnk_rowHeader')]"));
        }

        public static IControl GetReasonForChangeField(CRFFlatQuestionsData Data)
        {
            string parentPath = DL_PatientsPage.GetFlatQuestionAnswerCellXpath(Data.QuestionPrompt);
            try
            {
                if (Data.AnswerFieldType.ToUpper() == "LISTBOX")
                {
                    IControl ListBox = SyncUtilities.FindElement(By.XPath(parentPath + "/descendant::select[2]"));
                    return new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                }
                else
                {
                    IControl ListBox = SyncUtilities.FindElement(By.XPath(parentPath + "/descendant::select"));
                    return new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                }
            }
            catch (Exception e)
            {
                //Fail statements
                return null;
            }
        }

        //To do
        public static IControl GetReasonForChangeField(CRFTableQuestionsData Data, IControl TableRow)
        {
            string parentPath = DL_PatientsPage.GetFlatQuestionAnswerCellXpath(Data.QuestionPrompt);
            try
            {
                if (Data.AnswerFieldType.ToUpper() == "LISTBOX")
                {
                    IWebElement ListBox = TableRow.WebElement.FindElement(By.XPath(".//td[text()='" + Data.QuestionPrompt + "']/parent::tr/descendant::select[2]"));
                    return new Control(ListBox, new SelectElement(ListBox));
                }
                else
                {
                    IWebElement ListBox = TableRow.WebElement.FindElement(By.XPath(".//td[text()='" + Data.QuestionPrompt + "']/parent::tr/descendant::select"));
                    return new Control(ListBox, new SelectElement(ListBox));
                }
            }
            catch (Exception e)
            {
                //Fail statements
                return null;
            }
        }

        public static IControl GetAnswerFieldOfFlatQuestion(CRFFlatQuestionsData QuestionData)
        {
            string parentPath = DL_PatientsPage.GetFlatQuestionAnswerCellXpath(QuestionData.QuestionPrompt.Replace("&#x20", " "));
            try
            {
                switch (QuestionData.AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX":
                    case "TEXT BOX":
                        return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::input"));
                    case "LISTBOX":
                    case "LIST BOX":
                        if (QuestionData.CurrentAnswerValue == null)
                        {
                            IControl ListBox = SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::select"));
                            return new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                        }
                        else
                        {
                            IControl ListBox = SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::select[1]"));
                            return new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                        }
                    case "RADIOBUTTON":
                    case "RADIO BUTTON":
                    case "RADIO":
                    case "CHECKBOX":
                    case "CHECK BOX":
                        if (QuestionData.AnswerValue != null)
                        {
                            return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::label[contains(text(), '" + QuestionData.AnswerValue + "')]/preceding-sibling::input"));
                        }
                        else
                        {
                            return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::label[contains(text(), '" + QuestionData.NewAnswerValue + "')]/preceding-sibling::input"));
                        }
                    case "TEXTAREA":
                    case "TEXT AREA":
                        return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::textarea"));
                    case "TEXT":
                        return SyncUtilities.FindElement(By.XPath(parentPath + "/descendant::span"));
                    case "LINK":
                        if (QuestionData.AnswerValue != null)
                        {
                            return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::a[contains(text(), '" + QuestionData.AnswerValue + "')]"));
                        }
                        else
                        {
                            return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::a[contains(text(), '" + QuestionData.NewAnswerValue + "')]"));
                        }
                    default:
                        return null;
                }
            }
            catch (Exception e)
            {
                //fail case
                return null;
            }
        }

        public static IControl GetAnswerFieldOfFlatQuestion(string QuestionPrompt, string AnswerFieldType, string AnswerValue)
        {
            string parentPath = DL_PatientsPage.GetFlatQuestionAnswerCellXpath(QuestionPrompt);
            try
            {
                switch (AnswerFieldType.ToUpper())
                {
                    case "TEXTBOX":
                    case "TEXT BOX":
                        return SyncUtilities.FindElement(By.XPath(parentPath + "/descendant::input"));
                    case "LISTBOX":
                    case "LIST BOX":
                        IControl ListBox = SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::select"));
                        return new Control(ListBox.WebElement, new SelectElement(ListBox.WebElement));
                    case "RADIOBUTTON":
                    case "RADIO BUTTON":
                    case "RADIO":
                    case "CHECKBOX":
                    case "CHECK BOX":
                        return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::label[contains(text(), '" + AnswerValue + "')]/preceding-sibling::input"));
                    case "TEXTAREA":
                    case "TEXT AREA":
                        return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::textarea"));
                    case "TEXT":
                        return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::span"));
                    case "LINK":
                        return SyncUtilities.FindVisibleElement(By.XPath(parentPath + "/descendant::a[contains(text(), '" + AnswerValue + "')]"));
                    default:
                        return null;
                }
            }
            catch (Exception e)
            {
                //fail case
                return null;
            }
        }

        public static IControl GetActionButtonsOfFlatQuestion(string QuestionPrompt, string ButtonName)
        {
            IControl ActButton = null;
            try
            {
                IControl QuestionRow = SyncUtilities.FindVisibleElement(By.XPath("//*[contains(text(), '" + QuestionPrompt + "')]/ancestor::tr[@class='gRow' or @class='body']"));
                if (QuestionRow != null && QuestionRow.WebElement != null)
                {
                    IWebElement Button = QuestionRow.WebElement.FindElement(By.XPath("./following-sibling::tr[1]//input[contains(@name, '" + ButtonName + "')]"));
                    ActButton = new Control(Button);
                }
            }
            catch (Exception e)
            {
                //fail case
            }
            return ActButton;
        }

        public static IControl GetActionButtonsOfTableQuestion(IControl TableRow, string ButtonName)
        {
            IControl ActButton = null;
            try
            {
                IWebElement Button = TableRow.WebElement.FindElement(By.XPath(".//tr[@style='']//input[@value='" + ButtonName + "']"));
                ActButton = new Control(Button);
            }
            catch (Exception e)
            {
                //fail case
            }
            return ActButton;
        }

        public static IControl GetActionButtonOfTableQuestion(IControl TableRow, string QuestionPrompt, string ButtonName)
        {
            try
            {
                IWebElement Button = TableRow.WebElement.FindElement(By.XPath(".//tr[@style='']//input[@value='" + ButtonName + "']"));
                return new Control(Button);
            }
            catch (Exception e)
            {
                return null;
                //fail statements
            }
        }

        public static IControl GetArrowIconForAQuestion(string QuestionPrompt)
        {
            try
            {
                return SyncUtilities.FindElement(By.XPath("//*[contains(text(), '" + QuestionPrompt + "')]/parent::tr/descendant::img[@name='arrow']/parent::a"));
            }
            catch (Exception e)
            {
                //fail statement
                return null;
            }
        }

        public static IControl GetArrowIconForAQuestion(IControl TableRow, string QuestionPrompt)
        {
            try
            {
                IWebElement Icon = TableRow.WebElement.FindElement(By.XPath(".//td[contains(text(), '" + QuestionPrompt + "')]/parent::tr/descendant::img[@name='arrow']/parent::a"));
                return new Control(Icon);
            }
            catch (Exception e)
            {
                //fail statement
                return null;
            }
        }

        public static IControl GetAddCommentElement { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[@class='flagMenuRow' and contains(text(), 'Add Comment')]")); } }
        public static IControl GetClearItemElement { get { return SyncUtilities.FindVisibleElement(By.XPath("//td[@class='flagMenuRow' and contains(text(), 'Clear Item')]")); } }
        public static IControl GetCRFNameOnAddCommentModal { get { return SyncUtilities.FindVisibleElement(By.XPath("//form[@name='aspnetForm']//td[contains(text(), 'CRF:')]/span")); } }
        public static IControl GetQuestionOnAddCommentModal { get { return SyncUtilities.FindVisibleElement(By.XPath("//form[@name='aspnetForm']//span[contains(@id, 'QuestionText')]")); } }
        public static IControl GetTextAreaOnAddCommentModal { get { return SyncUtilities.FindVisibleElement(By.XPath("//form[@name='aspnetForm']//textarea")); } }
        public static IControl GetButtonOnAddCommentModal(string ButtonName)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//form[@name='aspnetForm']//input[@value='" + ButtonName + "']"));
        }

        public static IControl GetPDEP_MismatchedFlatQuestionRadioButton(String questionPrompt, String radioButton)
        {
            IControl flatQuestionHost = GetFlatQuestionHost(questionPrompt);
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(flatQuestionHost.WebElement, By.TagName("tr"));
            foreach (IControl row in rows)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                if (cells.Count == 2)
                {
                    String text = WebTableUtilities.GetText(cells[1]);
                    if (text.Equals(": " + radioButton))
                    {
                        return WebTableUtilities.GetInputControl_RadioButton(cells[0]);
                    }
                }
            }
            return null;
        }

        public static IControl GetPDEP_MismatchedFlatQuestionTextbox(String questionPrompt, String radioButton)
        {
            IControl flatQuestionHost = GetFlatQuestionHost(questionPrompt);
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(flatQuestionHost.WebElement, By.TagName("tr"));
            foreach (IControl row in rows)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                if (cells.Count == 2)
                {
                    IControl textbox = WebTableUtilities.GetInputControl_Textbox(cells[1]);
                    if (!Control_PropertyUtilities.IsControlNull(textbox))
                    {
                        return textbox;
                    }
                }
            }
            return null;
        }
        public static IControl GetVisualIndicatorImage(string TableName,string questionPrompt)
        {
            IControl tableQuestion = GetTableQuestionHost(TableName, questionPrompt);
            
            //ReadOnlyCollection<IControl> icons = SyncUtilities.FindVisibleElements_Parent(flatQuestionHost.WebElement, By.TagName("td"));
            IWebElement visualIndicator = tableQuestion.WebElement.FindElement(By.XPath(".//img[contains(@src,'visualindicator.png')]"));
            return new Control(visualIndicator);
        }
        public static IControl GetLowVisualIndicatorImage(string TableName, string questionPrompt)
        {
            IControl tableQuestion = GetTableQuestionHost(TableName, questionPrompt);

            //ReadOnlyCollection<IControl> icons = SyncUtilities.FindVisibleElements_Parent(flatQuestionHost.WebElement, By.TagName("td"));
            IWebElement visualIndicator = tableQuestion.WebElement.FindElement(By.XPath(".//img[contains(@src,'LowVisualIndicator.png')]"));
            return new Control(visualIndicator);
        }
        
    }
    
}