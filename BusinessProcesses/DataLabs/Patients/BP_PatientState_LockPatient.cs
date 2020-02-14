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
    public class BP_PatientState_LockPatient
    {

        public static bool clickSaveBtnInLockPatient()
        {
            IControl saveBtn = DL_LockPatientPage.SaveBtn;
            return Control_ActionUtilities.Click(saveBtn, "Unable to select save button");
        }

        public static bool clickCancelBtnInLockPatient()
        {
            IControl cancelBtn = DL_LockPatientPage.CancelBtn;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click cancel button");
        }

        public static bool clickSelectAllBtnInLockPatient()
        {
            IControl cancelBtn = DL_LockPatientPage.SelectAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Select All button");
        }

        public static bool clickClearAllBtnInLockPatient()
        {
            IControl cancelBtn = DL_LockPatientPage.ClearAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Clear All button");
        }
    }
}
