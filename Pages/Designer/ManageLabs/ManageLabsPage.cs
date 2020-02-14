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
    public class ManageLabsPage
    {
        public static IControl AddLabDictionary
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".rgCommandCell > table > tbody > tr > td > div > a"));
            }
        }

        public static IControl DeleteLabDictionary
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//a[contains(text(),'Delete Lab Dictionary(s)')]"));
            }
        }

        public static IControl LabDictionaryTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ContentBody_grdManageLabs_ctl00"));
            }
        }

        public static IControl ImportLabDictionaryTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ContentBody_LabTestsControl_grdLabTests_ctl00"));
            }
        }

        public static IControl LabDictonaryTableRow1
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_LabTestsControl_grdLabTests_ctl00__1 > td:nth-child(1)"));


            }
        }

        public static IControl LabDictChoosefile
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("fileLabDictionary"));
            }
        }

        public static IControl LabDictContinue
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_btnContinue"));
            }
        }

        public static IControl LabDictImportLabel
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_txtImportLabel"));
            }
        }
        

        public static IControl ImportLabDictionary
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ContentBody_divHeaderAction > span:nth-of-type(2) > a"));
            }
        }

        public static IControl LabDictionaryName
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdManageLabs_ctl00_ctl02_ctl04_txtLabDictionaryName"));
            }
        }

        public static IControl LabDictionaryDesc
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdManageLabs_ctl00_ctl02_ctl04_txtLabDictionaryDesc"));
            }
        }

        public static IControl LabDictionarySave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_grdManageLabs_ctl00_ctl02_ctl04_btnSave"));
            }
        }
    }
}
