using Common.WebTable;
using Framework;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using Pages.DataLabs;
using Pages.DataLabs.Patients;
using System;
using System.Collections.ObjectModel;
using System.Threading;
using Utilities;
using System.Collections.Generic;
using Pages.DataLabs.Modal;
using BusinessProcesses.DataLabs.Modal;
using Pages.DataLabs.Data;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_Patient_EventFormUtilities
    {
        public static bool OpenForm(String eventName, String formName)
        {
            try
            {
                IControl crfCell = null;
                IControl formRow = GetFormRow(eventName, formName, out crfCell);
                IControl crfLink = SyncUtilities.FindVisibleElement_Parent(crfCell.WebElement, By.TagName("a"));
                if (!Control_PropertyUtilities.IsControlNull(formRow) &&
                    !Control_PropertyUtilities.IsControlNull(crfLink))
                {
                    return Control_ActionUtilities.Click(crfLink, "Unable to click CRF" + formName + " under the event " + eventName);
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

         /*public static bool OpenForm(String eventName, String formName)
        {
            try
            {
                ReadOnlyCollection<IControl> rows = GetFormsRowsUnderEvent(eventName);
                foreach (IControl row in rows)
                {
                    ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                    if (cells.Count > 0)
                    {
                        IControl crfCell = cells[0];
                        IControl crfLink = SyncUtilities.FindVisibleElement_Parent(crfCell.WebElement, By.TagName("a"));
                        if (!Control_PropertyUtilities.IsControlNull(crfLink))
                        {
                            bool found = false;
                            String innerText = Control_PropertyUtilities.GetAttributeValue(crfLink, "innertext", out found);
                            if (found && !String.IsNullOrEmpty(innerText) && innerText.Equals(formName, StringComparison.InvariantCultureIgnoreCase))
                            {
                                return Control_ActionUtilities.Click(crfLink, String.Empty);
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }*/

        internal static IControl GetFormRow(String eventName,String formName,out IControl crfCell)
        {
            crfCell = null;
            try
            {
                ReadOnlyCollection<IControl> rows = GetFormsRowsUnderEvent(eventName);
                foreach (IControl row in rows)
                {
                    ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                    if (cells.Count > 0)
                    {
                        crfCell = cells[0];
                        IControl crfLink = SyncUtilities.FindVisibleElement_Parent(crfCell.WebElement, By.TagName("a"));
                        if (!Control_PropertyUtilities.IsControlNull(crfLink))
                        {
                            bool found = false;
                            String innerText = Control_PropertyUtilities.GetAttributeValue(crfLink, "innertext", out found);
                            if (found && !String.IsNullOrEmpty(innerText) && innerText.Equals(formName, StringComparison.InvariantCultureIgnoreCase))
                            {
                                return row;
                            }
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return null;
        }
        
        public static bool ExpandEvent(String eventName, out String patientEventKey)
        {
            patientEventKey = String.Empty;
            try
            {
                int i = 0;
                while (i < 5)
                {
                    IControl eventExpandCollapseImage = GetEventExpandCollapseImage(eventName, out patientEventKey);
                    if (eventExpandCollapseImage != null && eventExpandCollapseImage.WebElement != null)
                    {
                        bool found = false;
                        String prop_SRC = Control_PropertyUtilities.GetAttributeValue(eventExpandCollapseImage, "src", out found);
                        if (found && prop_SRC.Contains("menu_expand.gif"))
                        {
                            Control_ActionUtilities.Click(eventExpandCollapseImage, String.Empty);
                        }
                        else if (found && prop_SRC.Contains("menu_collapse.gif"))
                        {
                            return true;
                        }
                    }
                    Thread.Sleep(2000);
                    ++i;
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        public static bool CollapseEvent(String eventName, out String patientEventKey)
        {
            patientEventKey = String.Empty;
            try
            {
                int i = 0;
                while (i < 5)
                {
                    IControl eventExpandCollapseImage = GetEventExpandCollapseImage(eventName, out patientEventKey);
                    if (eventExpandCollapseImage != null && eventExpandCollapseImage.WebElement != null)
                    {
                        bool found = false;
                        String prop_SRC = Control_PropertyUtilities.GetAttributeValue(eventExpandCollapseImage, "src", out found);
                        if (found && prop_SRC.Contains("menu_collapse.gif"))
                        {
                            Control_ActionUtilities.Click(eventExpandCollapseImage, String.Empty);
                        }
                        else if (found && prop_SRC.Contains("menu_expand.gif"))
                        {
                            return true;
                        }
                    }
                    Thread.Sleep(2000);
                    ++i;
                }
            }
            catch (Exception e)
            {
            }
            return false;
        }

        static ReadOnlyCollection<IControl> GetFormsRowsUnderEvent(String eventName)
        {
            try
            {
                String patientEventkey = String.Empty;
                if (ExpandEvent(eventName, out patientEventkey) && !String.IsNullOrEmpty(patientEventkey))
                {
                    String cssSelector = "tr[patienteventkey='" + patientEventkey + "']";
                    return SyncUtilities.FindVisibleElements_Parent(DL_Patient_EventFormsPage.EvetnsTable.WebElement, By.CssSelector(cssSelector));
                }
            }
            catch (Exception e)
            {
            }
            return null;
        }

        static IControl GetEventExpandCollapseImage(String eventName, out String patientEventKey)
        {
            patientEventKey = String.Empty;
            IControl eventRow = GetEventRow(eventName);
            if (eventRow != null)
            {
                patientEventKey = GetPatientEventKey(eventRow);
                IControl eventNameCell = WebTableUtilities.GetCell(eventRow, 0);
                return SyncUtilities.FindVisibleElement_Parent(eventNameCell.WebElement, By.TagName("img"));
            }
            return null;
        }

        static String GetPatientEventKey(IControl eventRow)
        {
            try
            {
                bool found = false;
                String rowId = Control_PropertyUtilities.GetAttributeValue(eventRow, "id", out found);
                if (found && !String.IsNullOrEmpty(rowId))
                {
                    String[] values = rowId.Split("_".ToCharArray());
                    if (values.Length == 2)
                    {
                        String key = values[1];
                        int i = 0;
                        bool isConverted = int.TryParse(key, out i);
                        if (isConverted)
                        {
                            return key;
                        }
                    }
                }
            }
            catch (Exception e)
            {
            }
            return String.Empty;
        }

        static IControl GetEventRow(String eventName)
        {
            try
            {
                IControl eventsTable = DL_Patient_EventFormsPage.EvetnsTable;
                WebTable_SearchCriteriaItem searchItem = new WebTable_SearchCriteriaItem(0, eventName, TableColumnContentType.Link);
                WebTable_SearchCriteriaItemList searhcItemList = new WebTable_SearchCriteriaItemList();
                searhcItemList.AddSearchItem(searchItem);
                return WebTableUtilities.Table_FindRow(eventsTable, searhcItemList, 1);
            }
            catch (Exception e)
            {
            }
            return null;
        }

        public static bool ExpandAllEvents()
        {
            try
            {
                IControl expandCollapseAllIcon = SyncUtilities.FindVisibleElement(By.Id("imgExpandAll"));
                bool found = false;
                String src = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found);
                if (found)
                {
                    if (src.Contains("menu_collapse"))
                    {
                        Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                    }
                    Control_ActionUtilities.Click(expandCollapseAllIcon, String.Empty);
                }
                IControl expandCollapseAllIcon1 = SyncUtilities.FindVisibleElement(By.Id("imgExpandAll"));
                bool found1 = false;
                String src1 = Control_PropertyUtilities.GetAttributeValue(expandCollapseAllIcon, "src", out found1);
                if (found1)
                {
                    return src1.Contains("menu_collapse");
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool IsFormAvailable(String eventName, String formName)
        {
            try
            {
                ReadOnlyCollection<IControl> rows = GetFormsRowsUnderEvent(eventName);
                foreach (IControl row in rows)
                {
                    ReadOnlyCollection<IControl> cells = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                    if (cells.Count > 0)
                    {
                        IControl crfCell = cells[0];
                        IControl crfLink = SyncUtilities.FindVisibleElement_Parent(crfCell.WebElement, By.TagName("a"));
                        if (!Control_PropertyUtilities.IsControlNull(crfLink))
                        {
                            bool found = false;
                            String innerText = Control_PropertyUtilities.GetAttributeValue(crfLink, "innertext", out found);
                            return found && !String.IsNullOrEmpty(innerText) && innerText.Equals(formName, StringComparison.InvariantCultureIgnoreCase);
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }
            return false;
        }

        public static bool IsEventAvailable(string eventName)
        {
            try
            {
                return GetEventRow(eventName) != null;
            }
            catch (Exception e)
            {
            }
            return false;
        }


        public static bool AreFormsAvailable(String eventName, List<String> formList)
        {
            try
            {
                foreach(String form in formList)
                {
                    if(!IsFormAvailable(eventName, form))
                    {
                        return false;
                    }
                }
                return true;
            }
            catch(Exception e)
            {

            }
            return false;
        }

        public static bool ClickEventDateForAnEvent(string EventName, string EventDate)
        {
            try
            {
                IControl DateObject = GetEventDateObjectForEvent(EventName, EventDate);
                if(!Control_PropertyUtilities.IsControlNull(DateObject))
                {
                    return Control_ActionUtilities.Click(DateObject, "Event date is not displayed.");
                }
                else
                {
                    return false;
                }
            }
            catch(Exception e)
            {
                return false;
            }
        }

        static IControl GetEventDateObjectForEvent(String eventName, string EventDate)
        {
            IControl eventRow = GetEventRow(eventName);
            if (eventRow != null)
            {
                IControl eventNameCell = WebTableUtilities.GetCell(eventRow, 0);
                return SyncUtilities.FindVisibleElement_Parent(eventRow.WebElement, By.XPath(".//a[contains(text(), '" + EventDate + "')]"));
            }
            return null;
        }

        public static bool SetNewEventDate(string NewEventDate)
        {
            bool retVal = false;
            try
            {
                BrowserUtilities.SwitchToFrame();
                if (!BP_ModalWindow.IsRadModalExist_CheckHeaderText("Event Actual Date"))
                {
                    IControl eventsTable = DL_Patient_EventFormsPage.NewEventDate;
                    retVal = Control_ActionUtilities.Textbox_SetText(DL_Patient_EventFormsPage.NewEventDate, NewEventDate, String.Empty);
                }
            }
            catch (Exception e)
            {
                
            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
        public static bool VerifyEventDateForAnEvent(string EventDate, string EventName)
        {
            try
            {
                IControl DateObject = GetEventDateObjectForEvent(EventName, EventDate);
                if (!Control_PropertyUtilities.IsControlNull(DateObject))
                {
                    String datevalue= Control_PropertyUtilities.GetText(DateObject);
                    return EventDate.Equals(datevalue);
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public static bool UpdateEventDate(Event_New_EventDate EventDateDetails)
        {
            bool retVal = false;
            try
            {
                BrowserUtilities.SwitchToFrame();
                
                if (!BP_ModalWindow.IsRadModalExist_CheckHeaderText("Event Actual Date"))
                {
                    retVal = Control_ActionUtilities.Textbox_SetText(DL_Patient_EventFormsPage.NewEventDate, EventDateDetails.EnterNewValue, String.Empty) &&
                     Control_ActionUtilities.Dropdown_SelectItem(DL_Patient_EventFormsPage.SelectEventDateReasonForChange, EventDateDetails.ReasonforChange, String.Empty) &&
                     Control_ActionUtilities.Textbox_SetText(DL_Patient_EventFormsPage.EventDateAdditionalNotes, EventDateDetails.AdditionalNotes, String.Empty);
                    
                }
            }
            catch (Exception e)
            {

            }
            BrowserUtilities.SwitchToWindow();
            return retVal;
        }
    }
}
