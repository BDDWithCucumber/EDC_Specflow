using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;
using System.Collections.ObjectModel;
using Framework;
using Framework.Actions;
using Interfaces;
using Common;
using System.Reflection;
using Reports.DebugLog;

namespace Pages.DataLabs.FlagManagement
{
    public class DL_CreateFlagDataGroupPage
    {
        public static IControl FlagDataGroupName { get { return SyncUtilities.FindVisibleElement(By.Id("txtDataGroupName")); } }
        public static IControl FlagDataGroupLabel { get { return SyncUtilities.FindVisibleElement(By.Id("txtDataGroupLabel")); } }
        public static IControl SaveNCloseButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnFinish")); } }
        public static IControl ExpandAllIcon { get { return SyncUtilities.FindClickableElement(By.XPath("//a[@id='ancExpandAll']//img")); } }
        public static IControl ExpandFormIcon(string FormName)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//span[text()='" + FormName + "']//parent::td/preceding-sibling::td//a"));
        }
        public static int GetProtocolVersionChkBoxIndex(string ProtocolVer)
        {
            try
            {
                int counter = 0;
                ReadOnlyCollection<IControl> headers = SyncUtilities.FindElements(By.XPath("//th//span"));
                foreach(IControl header in headers)
                {
                    if(header.WebElement.Text == ProtocolVer)
                    {
                        return counter;
                    }
                    else
                    {
                        counter++;
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);                
            }
            return 0;
        }
        public static IControl GetProtocolChkBoxForForm(string FormName, string ProtocolVer)
        {
            try
            {
                int ChkBoxIndex = GetProtocolVersionChkBoxIndex(ProtocolVer);
                if(ChkBoxIndex == 0)
                {
                    return null;
                }
                IControl row = GetRowOfFormInCreateDatGroupTable(FormName);
                if(Control_PropertyUtilities.IsControlNull(row))
                {
                    return null;
                }
                return new Control(row.WebElement.FindElement(By.XPath("./td[" + (ChkBoxIndex + 2) + "]//input")));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }
        public static IControl GetRowOfFormInCreateDatGroupTable(string formName)
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//span[text()='"+formName+"']/parent::td/parent::tr"));
        }
        public static IControl GetProtocolChkBoxForFormQuestion(string FormName, string QuestionNum, string QuestionPrompt, string ProtocolVer)
        {
            try
            {
                int ChkBoxIndex = GetProtocolVersionChkBoxIndex(ProtocolVer);
                if (ChkBoxIndex == 0)
                {
                    return null;
                }
                IControl row = GetRowOfFormInCreateDatGroupTable(FormName);
                if (Control_PropertyUtilities.IsControlNull(row))
                {
                    return null;
                }
                ReadOnlyCollection<IControl> Checkboxes = SyncUtilities.FindElements(By.XPath("//span[text()='" + FormName + "']/parent::td/parent::tr/following-sibling::tr//span[contains(text(), '" + QuestionNum + "') and contains(text(),'" + QuestionPrompt + "')]/parent::td/following-sibling::td//input"));
                return Checkboxes[0];
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static bool SampleHdr()
        {
            /*ReadOnlyCollection<IControl> obj = SyncUtilities.FindElements(By.XPath("//table[@id='tblEventHead']//th/span[@title='Unscheduled']"));
            foreach (IControl oj in obj)
            {
                oj.WebElement.Click();
            }*/
            IControl obj1 = GetChkboxTableInEventFormRelation;
            return true;
        }

        public static int GetColumnIndexForEvent(string EventName)
        {
            try
            {
                int Col = 1;
                IControl table = GetEventsTableInEventFormRelation;
                if(Control_PropertyUtilities.IsControlNull(table))
                {
                    return 0;
                }
                ReadOnlyCollection<IWebElement> Headers = table.WebElement.FindElements(By.XPath(".//th//span"));
                foreach(IWebElement Hdr in Headers)
                {
                    if(Hdr.Displayed && Hdr.Size.Width > 0 && Hdr.Size.Height > 0)
                    {
                        if(Hdr.Text == EventName)
                        {
                            return Col;
                        }
                        else
                        {
                            Col++;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return 0;
        }

        public static int GetRowIndexForForm(string FormName)
        {
            try
            {
                int FormRow = 1;
                IControl table = GetFormsTableInEventFormRelation;
                if (Control_PropertyUtilities.IsControlNull(table))
                {
                    return 0;
                }
                ReadOnlyCollection<IWebElement> Rows = table.WebElement.FindElements(By.XPath(".//tr//b"));
                foreach (IWebElement Row in Rows)
                {
                    if (Row.Displayed && Row.Size.Width > 0 && Row.Size.Height > 0)
                    {
                        if (Row.Text == FormName)
                        {
                            return FormRow;
                        }
                        else
                        {
                            FormRow++;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return 0;
        }

        public static IControl GetChkBoxInFormEventRelation(string EventName, string FormName)
        {
            try
            {
                int FormRow = GetRowIndexForForm(FormName);
                int EventCol = GetColumnIndexForEvent(EventName);
                if(FormRow > 0 && EventCol > 0)
                {
                    IControl ChkBoxRow = GetChkBoxRowInEventFormRelation(FormRow);
                    if(Control_PropertyUtilities.IsControlNull(ChkBoxRow))
                    {
                        return null;
                    }
                    return new Control(ChkBoxRow.WebElement.FindElement(By.XPath(".//td[" + EventCol + "]//input")));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static IControl GetSelectAllChkBoxForEventInEventFormRelation(string EventName)
        {
            try
            {
                int EventCol = GetColumnIndexForEvent(EventName);
                if(EventCol > 0)
                {
                    IControl table = GetEventsTableInEventFormRelation;
                    if (Control_PropertyUtilities.IsControlNull(table))
                    {
                        return null;
                    }
                    return new Control(table.WebElement.FindElement(By.XPath("./tbody/tr/td[" + EventCol + "]/input")));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static IControl GetSelectAllChkBoxForFormInEventFormRelation(string FormName)
        {
            try
            {
                int FormRow = GetRowIndexForForm(FormName);
                if (FormRow > 0)
                {
                    IControl table = GetFormsTableInEventFormRelation;
                    if (Control_PropertyUtilities.IsControlNull(table))
                    {
                        return null;
                    }
                    return new Control(table.WebElement.FindElement(By.XPath("./tbody/tr[" + FormRow + "]//input")));
                }
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

        public static IControl GetSelectAllChkBoxInEventFormRelation { get { return SyncUtilities.FindVisibleElement(By.XPath("//table[@id='tblSelAll']//input")); } }
        public static IControl GetEventsTableInEventFormRelation { get { return SyncUtilities.FindVisibleElement(By.Id("tblEventHead")); } }
        public static IControl GetFormsTableInEventFormRelation { get { return SyncUtilities.FindVisibleElement(By.Id("tblFormHead")); } }
        public static IControl GetChkboxTableInEventFormRelation { get { return SyncUtilities.FindVisibleElement(By.XPath("//table[contains(@id,'tblChild')]")); } }
        public static IControl GetChkBoxRowInEventFormRelation(int RowNum)
        {
            IControl TableObj = GetChkboxTableInEventFormRelation;
            if(Control_PropertyUtilities.IsControlNull(TableObj))
            {
                return null;
            }
            return new Control(TableObj.WebElement.FindElement(By.XPath(".//tr[" + RowNum + "]")));
        }

        public static IControl StudyVersionTab(string StudyVersionName)
        {
            try
            {
                return SyncUtilities.FindVisibleElement(By.LinkText(StudyVersionName));
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return null;
        }

    }
}
