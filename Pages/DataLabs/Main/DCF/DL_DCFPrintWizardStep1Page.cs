using Interfaces;
using OpenQA.Selenium;
using System.Collections.ObjectModel;
using Utilities;

namespace Pages.DataLabs.Main.DCF
{
    public class DL_DCFPrintWizardStep1Page
    {
        public static IControl DCFsTable
        {
            get
            {
                ReadOnlyCollection<IControl> tableList = SyncUtilities.FindElements(By.CssSelector("#tblMainContent.table100pct #bodyCol.bodyCol > table"));
                foreach (IControl table in tableList)
                {
                    ReadOnlyCollection<IControl> rowList = SyncUtilities.FindElements_Parent(table.WebElement, By.CssSelector("tr[id*='DCF_PrintWizDCFList']"));
                    if (rowList.Count > 0)
                    {
                        return table;
                    }
                }
                return null;
            }
        }

        public static IControl NextButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCF_PrintWizDCFList_btnNext"));
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCF_PrintWizDCFList_btnCancel"));
            }
        }

    }
}