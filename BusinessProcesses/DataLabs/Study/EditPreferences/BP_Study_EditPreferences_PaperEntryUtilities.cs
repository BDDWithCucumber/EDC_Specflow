using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Study.EditPreferences;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcesses.DataLabs.Study.EditPreferences
{
    public class BP_Study_EditPreferences_PaperEntryUtilities
    {
        public static bool CheckEnablePaperDataEntryCheckbox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(DL_Study_EditPreferences_PaperEntryPage.Checkbox_EnablePaperDataEntry);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool CheckAllowOneUserBothTheEntriesCheckbox()
        {
            try
            {
                return Control_ActionUtilities.CheckCheckbox(DL_Study_EditPreferences_PaperEntryPage.Checkbox_AllowOneUserToComplete);
            }
            catch (Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }

        public static bool UncheckAllowOneUserBothTheEntriesCheckbox()
        {
            try
            {
                return Control_ActionUtilities.UncheckCheckbox(DL_Study_EditPreferences_PaperEntryPage.Checkbox_AllowOneUserToComplete);
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
                return Control_ActionUtilities.Click(DL_Study_EditPreferences_PaperEntryPage.SaveButton, String.Empty);
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);
            }
            return false;
        }
    }
}
