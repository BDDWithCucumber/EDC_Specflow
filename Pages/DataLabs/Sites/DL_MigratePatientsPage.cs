using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Sites
{
    public class DL_MigratePatientsPage
    {
        public static IControl PatientsTable { get { return SyncUtilities.FindVisibleElement(By.Id("tblPatients")); } }

        public static IControl SaveButton { get { return SyncUtilities.FindVisibleElement(By.Id("SitePatientMigrate_btnSave")); } }
    }
}
