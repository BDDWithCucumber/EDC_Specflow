using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.Scripting
{
    public class ScriptingPage
    {
        public static IControl Query
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_QueriesControl_grdQueries_ctl00_ctl02_ctl03_FilterTextBox_colName"));
            }
        }

        public static IControl ParName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_ucQueryParameters1_grdParameters_ctl00_ctl02_ctl02_txtParameterName"));
            }
        }

        public static IControl ParReference
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_ucQueryParameters1_grdParameters_ctl00_ctl02_ctl02_rcbParameterReference_Input']"));
            }
        }

        public static IControl ParSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Name("ctl00$ctl00$ContentBody$ContentBody$ucQueryParameters1$grdParameters$ctl00$ctl02$ctl02$btnSave"));
            }
        }

        public static IControl TestCaseSubTab
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//div[@id='ctl00_ctl00_ContentBody_ContentBody_ScriptTabs']/div/ul/li[4]/a/span/span/span"));
            }
        }

        public static IControl DropDownOptions
        {
            get
            {
                IControl c = SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_ucQueryTestCases1_grdTestCases_ctl00_ctl02_ctl02_rptParameters_ctl01_ddlTestParamOptions_cboDisplayOptions"));
                    return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
        }

        public static IControl DataFieldInReferenceBuilder
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rtSelected > .rtIn"));
            }
        }

        public static IControl SaveInQueryPage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_QueriesControl_grdQueries_ctl00_ctl02_ctl04_btnSave"));
            }
        }

        public static IControl QueryPage
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("td > h1"));
            }
        }

        public static IControl FilterIcon
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='ctl00_ctl00_ContentBody_ContentBody_QueriesControl_grdQueries_ctl00_ctl02_ctl03_Filter_colName']"));
            }
        }
        public static IControl CheckBox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Name("ctl00$ctl00$ContentBody$ContentBody$ucQueryParameters1$grdParameters$ctl00$ctl02$ctl01$colSelectSelectCheckBox"));
            }
        }
        
    }
}
