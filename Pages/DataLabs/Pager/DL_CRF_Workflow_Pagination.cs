using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Pager
{
    public class DL_CRF_Workflow_Pagination
    {
        public static IControl FirstPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblWorkFlow_first")); } }

        public static IControl PreviousPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblWorkFlow_previous")); } }

        public static IControl NextPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblWorkFlow_next")); } }

        public static IControl LastPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblWorkFlow_last")); } }

    }
}
