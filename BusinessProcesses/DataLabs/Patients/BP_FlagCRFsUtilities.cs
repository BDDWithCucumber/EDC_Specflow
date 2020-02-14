using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_FlagCRFsUtilities
    {
        public static bool SelectFormForFlag(List<FlagMultipleCRFsData> dataList)
        {
            try
            {
                foreach (FlagMultipleCRFsData data in dataList)
                {
                    if (!SelectFormForFlag(data))
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
        static bool SelectFormForFlag(FlagMultipleCRFsData data)
        {
            try
            {
                IControl radioButton = DL_FlagMultipleCRFsPage.GetRadioButtonForFlag(data.EventName, data.FormName, data.RadioButton);
                if (!Control_PropertyUtilities.IsControlNull(radioButton))
                {
                    return Control_ActionUtilities.Click(radioButton, String.Empty);
                }
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
                if(Control_ActionUtilities.Click(DL_FlagMultipleCRFsPage.SaveButtonFlagMultipleCRFs,"Unable to select Save button"))
                {
                    return true;
                }

            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);

            }
            return false;
        }
    }
    
}
