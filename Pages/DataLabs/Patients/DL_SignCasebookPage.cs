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
    public class DL_SignCasebookPage
    {
        public static IControl UserNameTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("SignatureName")); } }

        public static IControl PasswordTextbox { get { return SyncUtilities.FindVisibleElement(By.Id("SignaturePassword")); } }

        public static IControl SubmitButton { get { return SyncUtilities.FindClickableElement(By.Id("btnSubmit")); } }

        public static IControl AcceptAllButton { get { return SyncUtilities.FindClickableElement(By.Id("btnAccept")); } }

        public static IControl GetRadioButton(String eventName, String formName, String radioButtonName)
        {
            try
            {
                IControl table = SyncUtilities.FindVisibleElement(By.Id("SignCasebook"));
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(table.WebElement, By.CssSelector("tbody > tr"));
                if (rows.Count > 0)
                {
                    List<IControl> eventFormRows = GetEventFormRows(rows, eventName);
                    return GetFormRadioButton(eventFormRows, formName, radioButtonName);
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }

        static IControl GetFormRadioButton(List<IControl> eventFormRows, String formName, String radioButtonName)
        {
            foreach (IControl formRow in eventFormRows)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(formRow.WebElement, By.TagName("td"));
                if (cells.Count > 6)
                {
                    if (formName.Equals(Control_PropertyUtilities.GetText(cells[0]), StringComparison.InvariantCultureIgnoreCase))
                    {
                        if (radioButtonName.Equals("Skip", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[3].WebElement, By.TagName("input"));
                        }
                        else if (radioButtonName.Equals("Accept", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[4].WebElement, By.TagName("input"));
                        }
                        else if (radioButtonName.Equals("Reject", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[5].WebElement, By.TagName("input"));
                        }
                    }
                }
            }
            return null;
        }
        
        static List<IControl> GetEventFormRows(ReadOnlyCollection<IControl> tableRows, String eventName)
        {
            List<IControl> eventFormRows = new List<IControl>();
            try
            {
                bool isEventMatched = false;
                foreach (IControl row in tableRows)
                {
                    IControl eventNameLabel = null;
                    if (IsEventRow(row, out eventNameLabel))
                    {
                        if (isEventMatched)
                        {
                            return eventFormRows;
                        }
                        String actualEventNameOld = Control_PropertyUtilities.GetText(eventNameLabel);
                        String actualEventNameNew = actualEventNameOld.Replace("(Select all in event)", "");
                        isEventMatched = eventName.Equals(actualEventNameNew.Trim(), StringComparison.InvariantCultureIgnoreCase);
                    }
                    else
                    {
                        if (isEventMatched)
                        {
                            IControl formRow = SyncUtilities.FindElement_Parent(row.WebElement, By.Id("lblFormRow"));
                            if (!Control_PropertyUtilities.IsControlNull(formRow))
                            {
                                eventFormRows.Add(row);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return eventFormRows;
        }

        static bool IsEventRow(IControl row, out IControl eventNameLabel)
        {
            eventNameLabel = null;
            try
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                eventNameLabel = SyncUtilities.FindElement_Parent(cells[0].WebElement, By.Id("lblEventName"));
                return !Control_PropertyUtilities.IsControlNull(eventNameLabel);
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static IControl GetAddReasonLink(String eventName, String formName)
        {
            try
            {
                IControl table = SyncUtilities.FindVisibleElement(By.Id("SignCasebook"));
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(table.WebElement, By.CssSelector("tbody > tr"));
                if (rows.Count > 0)
                {
                    List<IControl> eventFormRows = GetEventFormRows(rows, eventName);
                    return GetFormAddReasonLink(eventFormRows, formName);
                }
            }
            catch (Exception e)
            {

            }
            return null;

        }

        static IControl GetFormAddReasonLink(List<IControl> eventFormRows, String formName)
        {
            foreach (IControl formRow in eventFormRows)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(formRow.WebElement, By.TagName("td"));
                if (cells.Count > 6)
                {
                    if (formName.Equals(Control_PropertyUtilities.GetText(cells[0]), StringComparison.InvariantCultureIgnoreCase))
                    {
                        return SyncUtilities.FindVisibleElement_Parent(cells[6].WebElement, By.TagName("a"));
                    }
                }
            }
            return null;
        }
    }
}