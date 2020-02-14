using Interfaces;
using OpenQA.Selenium;
using Utilities;

namespace Pages.DataLabs.Pager
{
    public class DL_CRF_DCF_Pagination
    {
        public static IControl FirstPageButton { get { return SyncUtilities.FindElement(By.CssSelector("#tblDCF_paginate > #tblDCF_first")); } }

        public static IControl PreviousPageButton { get { return SyncUtilities.FindElement(By.CssSelector("#tblDCF_paginate > #tblDCF_previous")); } }

        public static IControl NextPageButton { get { return SyncUtilities.FindElement(By.CssSelector("#tblDCF_paginate > #tblDCF_next")); } }

        public static IControl LastPageButton { get { return SyncUtilities.FindElement(By.CssSelector("#tblDCF_paginate > #tblDCF_last")); } }
    }
}
