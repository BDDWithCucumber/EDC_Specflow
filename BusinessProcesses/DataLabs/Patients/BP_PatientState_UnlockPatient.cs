using Framework.Actions;
using Interfaces;
using Pages.DataLabs.Patients;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BusinessProcesses.DataLabs.Patients
{
    public class BP_PatientState_UnlockPatient
    {

        public static bool clickSaveBtnInUnlockPatient()
        {
            IControl saveBtn = DL_LockPatientPage.SaveBtn;
            return Control_ActionUtilities.Click(saveBtn, "Unable to select save button");
        }

        public static bool clickCancelBtnInUnlockPatient()
        {
            IControl cancelBtn = DL_LockPatientPage.CancelBtn;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click cancel button");
        }

        public static bool clickSelectAllBtnInUnlockPatient()
        {
            IControl cancelBtn = DL_LockPatientPage.SelectAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Select All button");
        }

        public static bool clickClearAllBtnInUnlockPatient()
        {
            IControl cancelBtn = DL_LockPatientPage.ClearAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Clear All button");
        }
    }
}
