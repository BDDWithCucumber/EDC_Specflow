using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using Framework;
using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using Framework.Actions;
using Common;
using OpenQA.Selenium.Support.UI;

namespace Pages.DataLabs.Patients
{
    public class DL_FreezePatientPage
    {
        public static IControl SaveBtn
        {
            get
            {
                if (IsInFreezePatientsPage())
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
                if (IsInFreezePatientsPage())
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
                if (IsInFreezePatientsPage())
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
                if (IsInFreezePatientsPage())
                {

                    return SyncUtilities.FindElement(By.Id("btnClearAll"));
                }
                return null;
            }
        }

        static bool IsInFreezePatientsPage()
        {
            IControl titleSpan = SyncUtilities.FindVisibleElement(By.Id("PatientsFreezeLock_lblPatients"));
            if (!Control_PropertyUtilities.IsControlNull(titleSpan))
            {
                return Control_PropertyUtilities.GetText(titleSpan).Equals("Freeze Patients", StringComparison.InvariantCultureIgnoreCase);
            }
            return false;
        }
        public static IControl PatientsTable { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id=\"bodyCol\"]/div[2]/table/tbody/tr/td/table")); } }

        public static IControl GetFreezeCheckBoxForPatient(string patientId)
        {
            ReadOnlyCollection<IControl> Rows = SyncUtilities.FindVisibleElements_Parent(DL_FreezePatientPage.PatientsTable.WebElement, By.TagName("tr"));
            
            foreach(IControl row in Rows)
            {
                ReadOnlyCollection<IControl> columns = SyncUtilities.FindVisibleElements_Parent(row.WebElement, By.TagName("td"));
                string PatientName = columns[0].WebElement.Text;
                PatientName = PatientName.Trim();
                if (patientId.Equals(PatientName, StringComparison.InvariantCultureIgnoreCase))
                {
                    return SyncUtilities.FindVisibleElement_Parent(columns[3].WebElement, By.TagName("input"));
                }
                
            }
            
            return null;
        }
    }
}
