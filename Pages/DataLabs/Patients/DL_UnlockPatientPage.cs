using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Patients
{
   public class DL_UnlockPatientPage
    {
        public static IControl SaveBtn
        {
            get
            {
                if (IsInUnlockPatientsPage())
                {
                    return SyncUtilities.FindElement(By.Id("PatientsFreezeLock_btnPatientAction"));
                }
                return null;
            }
        }
        public static IControl CancelBtn
        {
            get
            {
                if (IsInUnlockPatientsPage())
                {

                    return SyncUtilities.FindElement(By.Id("PatientsFreezeLock_btnCancel"));
                }
                return null;
            }
        }

        public static IControl SelectAll
        {
            get
            {
                if (IsInUnlockPatientsPage())
                {

                    return SyncUtilities.FindElement(By.Id("btnSelectAll"));
                }
                return null;
            }
        }

        public static IControl ClearAll
        {
            get
            {
                if (IsInUnlockPatientsPage())
                {

                    return SyncUtilities.FindElement(By.Id("btnClearAll"));
                }
                return null;
            }
        }

        static bool IsInUnlockPatientsPage()
        {
            IControl titleSpan = SyncUtilities.FindVisibleElement(By.Id("PatientsFreezeLock_lblPatients"));
            if (!Control_PropertyUtilities.IsControlNull(titleSpan))
            {
                return Control_PropertyUtilities.GetText(titleSpan).Equals("Unlock Patients", StringComparison.InvariantCultureIgnoreCase);
            }
            return false;
        }


    }
}
