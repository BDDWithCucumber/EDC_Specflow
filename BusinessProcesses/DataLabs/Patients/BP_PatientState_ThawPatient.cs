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
   public class BP_PatientState_ThawPatient
    {

       public static bool clickSaveBtnInThawPatient()
        {
            IControl saveBtn = DL_ThawPatientPage.SaveBtn;
            return Control_ActionUtilities.Click(saveBtn, "Unable to select save button");
        }

        public static bool clickCancelBtnInThawPatient()
        {
            IControl cancelBtn = DL_ThawPatientPage.CancelBtn;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click cancel button");
        }

        public static bool clickSelectAllBtnInThawPatient()
        {
            IControl cancelBtn = DL_ThawPatientPage.SelectAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Select All button");
        }

        public static bool clickClearAllBtnInThawPatient()
        {
            IControl cancelBtn = DL_ThawPatientPage.ClearAll;
            return Control_ActionUtilities.Click(cancelBtn, "Unable to click Clear All button");
        }
    }
}
