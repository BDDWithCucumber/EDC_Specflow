using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Pager
{
    public class DL_CRF_Comments_Pagination
    {
        public static IControl FirstPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblComments_first")); } }

        public static IControl PreviousPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblComments_previous")); } }

        public static IControl NextPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblComments_next")); } }

        public static IControl LastPageButton { get { return SyncUtilities.FindVisibleElement(By.Id("tblComments_last")); } }
    }
}
