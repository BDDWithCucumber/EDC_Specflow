using Framework.Actions;
using Pages.DataLabs.Common;
using Reports.DebugLog;
using System;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Common
{
    public class BP_UserPreferencesUtilities
    {
        public static bool SetPortal(String portal)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_UserPreferencesPage.PortalDropdown, portal, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickCompleteChangeHistroyRadioButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_UserPreferencesPage.CompleteChangeHistoryRadioButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickBasicChangeHistroyRadioButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_UserPreferencesPage.BasicChangeHistory, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }


        public static bool SetDateTimeFormat(String dateTimeFormat)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_UserPreferencesPage.DateTimeFormatDropdown, dateTimeFormat, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool SetTimeZone(String timeZone)
        {
            try
            {
                return Control_ActionUtilities.Dropdown_SelectItem(DL_UserPreferencesPage.TimeZoneDropdown, timeZone, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool ClickSaveButton()
        {
            try
            {
                return Control_ActionUtilities.Click(DL_UserPreferencesPage.SaveButton, String.Empty);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool VerifySaveSuccessMsg()
        {
            try
            {
                return !Control_PropertyUtilities.IsControlNull(DL_UserPreferencesPage.SaveSuccessMsg);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

    }
}