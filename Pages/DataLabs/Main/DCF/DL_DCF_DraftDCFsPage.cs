using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.Main.DCF
{
    public class DL_DCF_DraftDCFsPage
    {
        public static IControl DCFSearchResultsTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#tblMainContent.table100pct #bodyCol.bodyCol > table:nth-of-type(2)"));
            }
        }
    }
}