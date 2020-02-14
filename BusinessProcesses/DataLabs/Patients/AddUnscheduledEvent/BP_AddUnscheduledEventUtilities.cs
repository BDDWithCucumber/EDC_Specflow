using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients.UnscheduledEvent;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients.AddUnscheduledEvent
{
    public class BP_AddUnscheduledEventUtilities
    {
        public static bool SelectEvent(String eventName)
        {
            try
            {
                IControl eventsListbox = DL_AddUnscheduledEventStep1Page.EventsListbox;
                return Control_ActionUtilities.Dropdown_SelectItem(eventsListbox, eventName, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickNextbuttonOnStep1Page()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_AddUnscheduledEventStep1Page.NextButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SelectForms(List<UnschedueledEventFormsData> dataList)
        {
            try
            {
                foreach (UnschedueledEventFormsData data in dataList)
                {
                    IControl formCheckbox = DL_AddUnscheduledEventStep2Page.GetFormCheckbox(data.FormName);
                    if (!Control_PropertyUtilities.IsControlNull(formCheckbox))
                    {
                        if (!Control_ActionUtilities.CheckCheckbox(formCheckbox))
                        {
                            return false;
                        }
                    }
                    else
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

        public static bool ClickNextbuttonOnStep2Page()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_AddUnscheduledEventStep2Page.NextButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickFinishButtonOnStep3Page()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_AddUnscheduledEventStep3Page.FinishButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}