using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Data;
using Pages.DataLabs.Patients;
using Reports.DebugLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_PatientState_FreezePatient
    {

        public static bool clickSaveBtnInFreezePatient()
        {
            IControl saveBtn = DL_FreezePatientPage.SaveBtn;
            return Control_ActionUtilities.Click(saveBtn, "Unable to select save button");
        }

        public static bool clickCancelBtnInFreezePatient()
        {
            IControl cancelBtn = DL_FreezePatientPage.CancelBtn;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click cancel button");
        }

        public static bool clickSelectAllBtnInFreezePatient()
        {
            IControl cancelBtn = DL_FreezePatientPage.SelectAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Select All button");
        }

        public static bool clickClearAllBtnInFreezePatient()
        {
            IControl cancelBtn = DL_FreezePatientPage.ClearAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Clear All button");
        }
        public static bool SelectCheckboxForPatients(List<PatientTableData> PatientList,out List<string> FailedItems)
        {
            bool isSuccess = false;
            FailedItems = new List<string>();
            try
            {
                foreach (PatientTableData Patient in PatientList)
                {
                    
                    if(!Control_PropertyUtilities.IsControlNull(DL_FreezePatientPage.GetFreezeCheckBoxForPatient(Patient.PatientID)))
                    {
                        isSuccess = Control_ActionUtilities.Click(DL_FreezePatientPage.GetFreezeCheckBoxForPatient(Patient.PatientID), "Unable to Select checkbox for - " + Patient.PatientID);
                    }
                    else
                    {
                        FailedItems.Add(Patient.PatientID);
                        isSuccess = false;
                    }
                }
            }
            catch(Exception e)
            {
                new DebugLogGenerator().WriteException(MethodBase.GetCurrentMethod().DeclaringType.Name, MethodBase.GetCurrentMethod().Name, e);

            }
            return isSuccess;
        }
    }
}
