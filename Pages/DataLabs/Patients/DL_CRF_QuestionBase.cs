using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_CRF_QuestionBase
    {
        protected static IControl GetQuestionHost(String questionNumber, String questionPrompt)
        {
            IControl crfTabContent = SyncUtilities.FindVisibleElement(By.Id("divCRFTab"));
            ReadOnlyCollection<IControl> questionList = SyncUtilities.FindVisibleElements_Parent(crfTabContent.WebElement, By.ClassName("table100pct"));
            foreach (IControl question in questionList)
            {
                ReadOnlyCollection<IControl> questionParts = SyncUtilities.FindVisibleElements_Parent(question.WebElement, By.TagName("td"));
                if (IsQuestionNumberAndPromptAvailable(questionParts, questionNumber, questionPrompt))
                {
                    return question;
                }
            }
            return null;
        }

        protected static IControl GetFlatQuestionHost(String questionPrompt)
        {
            IControl crfTabContent = SyncUtilities.FindVisibleElement(By.Id("divCRFTab"));
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindElements_Parent(crfTabContent.WebElement, By.CssSelector("span > table > tbody > tr"));
            foreach (IControl row in rows)
            {
                ReadOnlyCollection<IControl> questionParts = SyncUtilities.FindElements_Parent(row.WebElement, By.CssSelector("td > .table100pct td"));
                if (IsQuestionPromptAvailable(questionParts, questionPrompt))
                {
                    return row;
                }
            }
            return null;
        }

        protected static bool IsQuestionPromptAvailable(ReadOnlyCollection<IControl> questionParts, String questionPrompt)
        {
            foreach (IControl c in questionParts)
            {
                String text = Control_PropertyUtilities.GetText(c);
                if (text.Equals(questionPrompt))
                {
                    return true;
                }
            }
            return false;
        }

        protected static bool IsQuestionNumberAndPromptAvailable(ReadOnlyCollection<IControl> questionParts, String questionNumber, String questionPrompt)
        {
            for (int i = 0; i < questionParts.Count; ++i)
            {
                String text = Control_PropertyUtilities.GetText(questionParts[i]);
                if (!String.IsNullOrEmpty(text) && text.Equals(questionNumber, StringComparison.InvariantCultureIgnoreCase))
                {
                    ++i;
                    String questionText = Control_PropertyUtilities.GetText(questionParts[i]);
                    return !String.IsNullOrEmpty(questionText) && questionText.Equals(questionPrompt, StringComparison.InvariantCultureIgnoreCase);
                }
            }
            return false;
        }

        protected static IControl GetTableHost(String tableName, int rowNumber, out IControl tableNameHost)
        {
            IControl tableHost_BeforePagination = GetTableHost_Page(tableName, out tableNameHost);
            NavigateToPage(tableHost_BeforePagination, rowNumber);
            return GetTableHost_Page(tableName, out tableNameHost); 
        }

        static IControl GetTableHost_Page(String tableName, out IControl tableNameHost)
        {
            tableNameHost = null;
            IControl crfTabContent = SyncUtilities.FindVisibleElement(By.Id("divCRFTab"));
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(crfTabContent.WebElement, By.CssSelector("span > table > tbody > tr"));
            foreach (IControl row in rows)
            {
                IControl tableColumnHeaderRow = SyncUtilities.FindElement_Parent(row.WebElement, By.CssSelector("td > .ucQTable"));
                if (tableColumnHeaderRow != null && tableColumnHeaderRow.WebElement != null)
                {
                    tableNameHost = SyncUtilities.FindVisibleElement_Parent(row.WebElement, By.CssSelector("td > table:nth-child(1)"));
                    ReadOnlyCollection<IControl> tdList = SyncUtilities.FindVisibleElements_Parent(tableNameHost.WebElement, By.TagName("td"));
                    foreach (IControl td in tdList)
                    {
                        if (Control_PropertyUtilities.GetText(td).Equals(tableName, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return row;
                        }
                    }
                }
            }
            return null;
        }

        public static IControl GetCollapsedTableRow(String tableName, int rowNumber, out bool alreadyExpanded)
        {
            alreadyExpanded = false;
            IControl tableNameHost = null;
            IControl tableHost = GetTableHost(tableName, rowNumber, out tableNameHost);
            IReadOnlyCollection<IControl> rows = SyncUtilities.FindElements_Parent(tableHost.WebElement, By.ClassName("HeaderRowOff"));
            foreach (IControl row in rows)
            {
                IReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(row.WebElement, By.ClassName("tdCollapseRowNum"));
                foreach (IControl cell in cells)
                {
                    String cellText = Control_PropertyUtilities.GetText(cell);
                    if (cellText.EndsWith("." + rowNumber + "."))
                    {
                        if (Control_ActionUtilities.IsClickable(row.WebElement))
                        {
                            return row;
                        }
                        else
                        {
                            alreadyExpanded = true;
                            return null;
                        }
                    }
                }
            }
            return null;
        }

        public static IControl GetCollapsedTableRow(String tableName, int rowNumber)
        {
            IControl tableNameHost = null;
            IControl tableHost = GetTableHost(tableName, rowNumber, out tableNameHost);
            IReadOnlyCollection<IControl> rows = SyncUtilities.FindElements_Parent(tableHost.WebElement, By.ClassName("HeaderRowOff"));
            foreach (IControl row in rows)
            {
                IReadOnlyCollection<IControl> cells = SyncUtilities.FindElements_Parent(row.WebElement, By.ClassName("tdCollapseRowNum"));
                foreach (IControl cell in cells)
                {
                    String cellText = Control_PropertyUtilities.GetText(cell);
                    if (cellText.EndsWith("." + rowNumber + "."))
                    {
                        if (Control_ActionUtilities.IsClickable(row.WebElement))
                        {
                            return row;
                        }
                        else
                        {
                            return null;
                        }
                    }
                }
            }
            return null;
        }

        public static ReadOnlyCollection<IControl> GetStrikeCells(IControl tableRow)
        {
            return SyncUtilities.FindElements_Parent(tableRow.WebElement, By.TagName("strike"));
        }

        public static IControl GetTableRowButton(String tableName, String buttonName)
        {
            IControl tableNameHost = null;
            IControl tableHost = GetTableHost(tableName, -1, out tableNameHost);
            String selector = "[type='button'][value='" + buttonName + "'][class='btnNormal']";
            IControl button = SyncUtilities.FindVisibleElement_Parent(tableHost.WebElement, By.CssSelector(selector));
            //IControl button = SyncUtilities.FindVisibleElement(By.CssSelector(selector));
            return button;
            //String selector = "input[type='button'][value='" + buttonName + "'][class='btnNormal']";

        }

        protected static IControl GetTableQuestionHost(String tableName, String questionPrompt)
        {
            IControl tableNameHost = null;
            IControl tableHost = GetTableHost(tableName, 0, out tableNameHost);
            if (tableHost != null && tableHost.WebElement != null)
            {
                ReadOnlyCollection<IControl> tableQuestionHostList = SyncUtilities.FindElements_Parent(tableHost.WebElement, By.ClassName("table100pct"));
                foreach (IControl questionHost in tableQuestionHostList)
                {
                    ReadOnlyCollection<IControl> questionParts = SyncUtilities.FindElements_Parent(questionHost.WebElement, By.CssSelector("td"));
                    if (IsQuestionPromptAvailable(questionParts, questionPrompt))
                    {
                        return questionHost;
                    }
                }
            }
            return null;
        }

        protected static void NavigateToPage(IControl tableHost, int rowNumber)
        {
            try
            {
                if (rowNumber > 0)
                {
                    int rowsPerPage = 15;
                    int pageNumber = ((rowNumber - 1) / rowsPerPage) + 1;
                    IControl paginationControl = SyncUtilities.FindVisibleElement_Parent(tableHost.WebElement, By.ClassName("pagination"));
                    String pageTitle = "li[title='Page :" + pageNumber + "']";
                    IControl pageLi = SyncUtilities.FindVisibleElement_Parent(paginationControl.WebElement, By.CssSelector(pageTitle));
                    if (!Control_PropertyUtilities.IsControlNull(pageLi))
                    {
                        IControl pageNumberControl = SyncUtilities.FindElement_Parent(pageLi.WebElement, By.TagName("a"));
                        if (!Control_PropertyUtilities.IsControlNull(pageNumberControl))
                        {
                            Control_ActionUtilities.Click(pageLi, String.Empty);
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }
        }

        public static IControl GetTableHistoryIcon(String tableName)
        {
            IControl tableNameHost = null;
            IControl tableHost = GetTableHost(tableName, 0, out tableNameHost);
            if(tableHost != null && tableNameHost != null && tableNameHost.WebElement != null)
            {
                ReadOnlyCollection<IControl> images = SyncUtilities.FindVisibleElements_Parent(tableNameHost.WebElement, By.TagName("img"));
                foreach (IControl image in images)
                {
                    bool found = false;
                    String imageSrc = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);
                    if(found && imageSrc.EndsWith("changeHistory.gif"))
                    {
                        return image;
                    }
                }
            }
            return null;
        }

        public static bool IsTableHistoryIconAvailable(String tableName)
        {
            try
            {
                IControl tableNameHost = null;
                IControl tableHost = GetTableHost(tableName, 0, out tableNameHost);
                if (tableHost != null && tableNameHost != null && tableNameHost.WebElement != null)
                {
                    ReadOnlyCollection<IControl> images = SyncUtilities.FindVisibleElements_Parent(tableNameHost.WebElement, By.TagName("img"));
                    foreach (IControl image in images)
                    {
                        bool found = false;
                        String imageSrc = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);
                        if (found && imageSrc.EndsWith("changeHistory.gif"))
                        {
                            return true;
                        }
                    }
                }
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool IsTableHistoryIconAvailable_WithoutWait(String tableName)
        {
            try
            {
                IControl tableNameHost = null;
                IControl tableHost = GetTableHost(tableName, 0, out tableNameHost);
                if (tableHost != null && tableNameHost != null && tableNameHost.WebElement != null)
                {
                    ReadOnlyCollection<IControl> images = SyncUtilities.FindElements_Parent(tableNameHost.WebElement, By.TagName("img"));
                    foreach (IControl image in images)
                    {
                        bool found = false;
                        String imageSrc = Control_PropertyUtilities.GetAttributeValue(image, "src", out found);
                        if (found && imageSrc.EndsWith("changeHistory.gif"))
                        {
                            return true;
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}