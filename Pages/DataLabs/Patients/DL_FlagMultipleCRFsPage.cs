using Common;
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
    public class DL_FlagMultipleCRFsPage
    {
        public static IControl GetRadioButtonForFlag(String eventName, String formName, String radioButtonName)
        {
            try
            {
                IControl table = SyncUtilities.FindVisibleElement(By.Id("tblCRFList"));
                ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(table.WebElement, By.CssSelector("tbody > tr"));
                if (rows.Count > 0)
                {
                    List<IControl> eventFormRows = GetEventFormRowsForFlag(rows, eventName);
                    return GetFormRadioButtonForFlag(eventFormRows, formName, radioButtonName);
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }
        static List<IControl> GetEventFormRowsForFlag(ReadOnlyCollection<IControl> tableRows, String eventName)
        {
            List<IControl> eventFormRows = new List<IControl>();
            try
            {
                bool isEventMatched = false;
                foreach (IControl row in tableRows)
                {
                    IControl eventNameLabel = null;
                    if (IsEventRowForFlag(row, eventName, out eventNameLabel))
                    {
                        String actualEventNameOld = Control_PropertyUtilities.GetText(eventNameLabel);
                        String actualEventNameNew = actualEventNameOld.Replace("(Select all in event)", "");
                        isEventMatched = eventName.Equals(actualEventNameNew.Trim(), StringComparison.InvariantCultureIgnoreCase);
                    }
                    else
                    {
                        if (isEventMatched)
                        {
                            IControl formRow = SyncUtilities.FindVisibleElement_Parent(row.WebElement, By.TagName("span"));
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
        static IControl GetFormRadioButtonForFlag(List<IControl> eventFormRows, String formName, String radioButtonName)
        {
            foreach (IControl formRow in eventFormRows)
            {
                ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(formRow.WebElement, By.TagName("td"));
                if (cells.Count > 6)
                {
                    if (formName.Equals(Control_PropertyUtilities.GetText(cells[0]), StringComparison.InvariantCultureIgnoreCase))
                    {
                        if (radioButtonName.Equals("No Change", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[2].WebElement, By.TagName("input"));
                        }
                        else if (radioButtonName.Equals("Mark Required", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[3].WebElement, By.TagName("input"));
                        }
                        else if (radioButtonName.Equals("Mark All", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[4].WebElement, By.TagName("input"));
                        }
                        else if (radioButtonName.Equals("Unmark All", StringComparison.InvariantCultureIgnoreCase))
                        {
                            return SyncUtilities.FindVisibleElement_Parent(cells[5].WebElement, By.TagName("input"));
                        }
                    }
                }
            }
            return null;
        }
        static bool IsEventRowForFlag(IControl row, string eventName,out IControl eventNameLabel)
        {
            eventNameLabel = null;
            try
            {
                IControl cells = SyncUtilities.FindElement_Parent(row.WebElement, By.TagName("strong"));
                if (!Control_PropertyUtilities.IsControlNull(cells))
                {
                        eventNameLabel = new Control(cells.WebElement);
                        return !Control_PropertyUtilities.IsControlNull(eventNameLabel);
                }
                
            }
            catch (Exception e)
            {

            }
            return false;
        }
        public static IControl SaveButtonFlagMultipleCRFs { get { return SyncUtilities.FindVisibleElement(By.Id("CRF_Flags_btnSave")); } }
    }
}
