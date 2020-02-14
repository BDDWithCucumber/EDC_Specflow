using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Export
{
    public class DL_ArchiveExportPage
    {
        public static IControl AllDataArchiveExport_RadioButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ArchiveExport_radioAllDataArchiveExport"));
            }
        }

        public static IControl RoleBasedArchiveExport_RadioButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ArchiveExport_radioRoleBasedExport"));
            }
        }

        public static IControl SitesTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#tblMainContent #bodyCol > table:nth-of-type(2)"));
            }
        }

        public static IControl ExportButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ArchiveExport_btnExport"));
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ArchiveExport_btnCancel"));
            }
        }
    }
}
