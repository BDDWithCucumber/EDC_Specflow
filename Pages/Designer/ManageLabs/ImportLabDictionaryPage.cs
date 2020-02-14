using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.Designer.ManageLabs
{
    public class ImportLabDictionaryPage
    {
        public static IControl AddLabDictionary
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_txtImportLabel"));
            }
        }


        public static IControl ImportLabDictErrorTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_DictionaryErrors_grdDictionaryErrors_GridData > #ctl00_ContentBody_DictionaryErrors_grdDictionaryErrors_ctl00"));
            }
        }

        public static IControl ImportLabDictErrorTableOkButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("btnOk"));
            }
        }

        public static IControl ErrorLink
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='ctl00_ContentBody_lnkErrorCount']"));
            }
        }
        

        public static IControl ImportLabDictError { get { return SyncUtilities.FindVisibleElement(By.XPath("//*[@id='tblErrorCount']/tbody/tr/td[2]")); } }

        public static IControl ImportLabDictErrorLink { get { return SyncUtilities.FindVisibleElement(By.Id("#ctl00_ContentBody_pnlErrorCount > table >tbody> tr> td:nth-of-type(2) >a")); } }

        public static IControl ErrorType { get { return SyncUtilities.FindVisibleElement(By.XPath("//input[@id='ctl00_ContentBody_DictionaryErrors_ddlErrorTypes_Input']")); } }      

        public static IControl SelectErrorFromDropDown(string SelectDropDownOption, string dropDownList)        
        {
            return SyncUtilities.FindVisibleElement(By.XPath("//ul/li/label[contains(.,'Conversion factor cannot be zero')]"));
        }
        public static IControl FilterOption { get { return SyncUtilities.FindVisibleElement(By.XPath("//a[contains(text(),'Show/Hide Filter')]")); } }

        public static IControl ErrorTable { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_DictionaryErrors_grdDictionaryErrors_ctl00 > tbody")); } }

    }
}
