using Common;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Patients
{
    public class DL_FreezeThawCRFs
    {
        public static IControl selectAllButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnSelectAll")); } }
        public static IControl cleartAllButton { get { return SyncUtilities.FindVisibleElement(By.Id("btnClearAll")); } }
        public static IControl freezeButton { get { return SyncUtilities.FindVisibleElement(By.Id("FormsFreezeThaw_btnFormAction")); } }
        public static IControl cancelButton { get { return SyncUtilities.FindVisibleElement(By.Id("FormsFreezeThaw_btnCancel")); } }
        public static IControl thawButton { get { return SyncUtilities.FindVisibleElement(By.Id("FormsFreezeThaw_btnFormAction")); } }

        public static IControl EventsFormsTable { get { return SyncUtilities.FindVisibleElement(By.Id("CRFList")); } }
   
        public static IControl GetFreezeThawCheckboxForForm1(String eventName, String formName)
        {
            try
            {
                String cssSelector = "tr[eventname='" + eventName + "']";
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(EventsFormsTable.WebElement, By.CssSelector(cssSelector));
                foreach (IControl row in rows)
                {
                    ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                    if (cells.Count >= 4)
                    {
                        String cellText = WebTableUtilities.GetText(cells[0]);
                        if (cellText.Equals(formName, StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[3].WebElement, By.TagName("input"));
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }
        static List<IControl> GetEventFormRowsForFreezeThaw(ReadOnlyCollection<IControl> tableRows, String eventName)
        {
            List<IControl> eventFormRows = new List<IControl>();
            try
            {
                bool isEventMatched = false;
                foreach (IControl row in tableRows)
                {
                    IControl eventNameLabel = null;
                    if (IsEventRowForFreeze(row, eventName, out eventNameLabel))
                    {
                        String actualEventNameOld = Control_PropertyUtilities.GetText(eventNameLabel);
                        String actualEventNameNew = actualEventNameOld.Replace("(Select all in event)", "");
                        isEventMatched = eventName.Equals(actualEventNameNew.Trim(), StringComparison.InvariantCultureIgnoreCase);
                    }
                    else
                    {
                        if (isEventMatched)
                        {
                            IControl formRow = SyncUtilities.FindVisibleElement_Parent(row.WebElement, By.TagName("label"));
                            if (!Control_PropertyUtilities.IsControlNull(formRow))
                            {
                                eventFormRows.Add(row);
                            }
                        }
                    }
                }
                return eventFormRows;
            }
            catch (Exception e)
            {

            }
            return eventFormRows;
        }
        static bool IsEventRowForFreeze(IControl row, string eventName, out IControl eventNameLabel)
        {
            eventNameLabel = null;
            try
            {
                IControl cells = SyncUtilities.FindElement_Parent(row.WebElement, By.TagName("strong"));
                if (!Control_PropertyUtilities.IsControlNull(cells))
                {
                    if (cells.WebElement.Text != "")
                    {
                        eventNameLabel = new Control(cells.WebElement);
                        return !Control_PropertyUtilities.IsControlNull(eventNameLabel);

                    }
                    
                }

            }
            catch (Exception e)
            {

            }
            return false;
        }

        static IControl GetFormCheckboxForFreezeThaw(List<IControl> eventFormRows, String formName, String checkboxName)
        {
            foreach (IControl formRow in eventFormRows)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(formRow.WebElement, By.TagName("td"));
                if (cells.Count > 4)
                {
                    if (formName.Equals(Control_PropertyUtilities.GetText(cells[0]), StringComparison.InvariantCultureIgnoreCase))
                    {
                        if (checkboxName.Equals("Freeze", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[3].WebElement, By.TagName("input"));
                        }
                        if (checkboxName.Equals("Thaw", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[3].WebElement, By.TagName("input"));
                        }
                    }
                }
            }
            return null;
        }
        public static IControl GetFreezeThawCheckboxForForm(String eventName, String formName, String checkboxName)
        {
            try
            {
                IControl table = SyncUtilities.FindVisibleElement(By.Id("CRFList"));
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(table.WebElement, By.CssSelector("tbody > tr"));
                if (rows.Count > 0)
                {
                    List<IControl> eventFormRows = GetEventFormRowsForFreezeThaw(rows, eventName);
                    return GetFormCheckboxForFreezeThaw(eventFormRows, formName, checkboxName);
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }
    }
}
