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

namespace Pages.Designer.MapLabDictionary
{
    public class MapLabDictionary
    {
        public static IControl CodeValueLabTest
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl04_ddlCodeid"));
            }
        }
        public static IControl LabValue
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabUnit_ctl00_ctl05_lblUnitCodeDescription"));
            }
        }
        public static IControl LabUnitTab
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.XPath("//li[2]/a/span/span/span"));
            }
        }

        public static IControl StudyPublishLabel
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ContentBody_txtPublishLabel"));
            }
        }

        public static IControl LabTestSelected { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rtsFirst > .rtsSelected")); } }

        public static IControl LabUnitSelected { get { return SyncUtilities.FindVisibleElement(By.CssSelector(".rtsLast > .rtsSelected")); } }

        public static IControl LabTest { get { return SyncUtilities.FindVisibleElement(By.CssSelector("li.rtsLI.rtsFirst > a")); } }

        public static IControl LabUnit { get { return SyncUtilities.FindVisibleElement(By.CssSelector("li.rtsLI.rtsLast > a")); } }

        public static IControl CheckAllLabTest { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl02_ctl02_colSelectSelectCheckBox")); } }

        public static IControl CheckAllLabUnit { get { return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabUnit_ctl00_ctl02_ctl02_colSelectSelectCheckBox")); } }

        public static IControl SelectLabTestCodeValueDropDown
        {
            get
            {
                return new Control(CodeValueLabTest.WebElement, new SelectElement(CodeValueLabTest.WebElement));
            }
        }

        public static IControl LabTestsListTable
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.CssSelector(".RadGrid.RadGrid_Designer > .rgMasterTable#ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00"));
            }
        }

        public static IControl CodeValueForSecondLabTest
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl05_ddlCodeid"));
            }
        }

        public static IControl SelectSecondLabTestCodeValueDropDown
        {
            get
            {
                return new Control(CodeValueForSecondLabTest.WebElement, new SelectElement(CodeValueForSecondLabTest.WebElement));
            }
        }

        public static IControl CodeValueLabUnit
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabUnit_ctl00_ctl04_ddlCodeid"));
            }
        }

        public static IControl RecordSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl06_btnSave"));
            }
        }

        public static IControl SingleRecordSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl08_btnSave"));
            }
        }

        public static IControl SelectLabUnitCodeValueDropDown
        {
            get
            {
                return new Control(CodeValueLabUnit.WebElement, new SelectElement(CodeValueLabUnit.WebElement));
            }
        }

        public static IControl SelectLabUnitCodeValueSecondDropDown
        {
            get
            { return new Control(SecondCodeValueLabUnit.WebElement, new SelectElement(SecondCodeValueLabUnit.WebElement));
            }
        }

        public static IControl SecondCodeValueLabUnit
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabUnit_ctl00_ctl05_ddlCodeid"));
            }
        }

        public static IControl MapLabDictSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_SaveBtn"));
            }
        }

        public static IControl MapLabDictUpdateSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnSave"));
            }
        }

        public static IControl MapLabDictUpdateUnitSave
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_btnSaveUnit"));
            }
        }

        public static IControl Labs { get { return SyncUtilities.FindVisibleElement(By.Id("Local Labs")); } }

        public static IControl LabDictItem
        {
            get
            {
                return SyncUtilities.FindElement(By.Id("ddlLabDictionaryName"));
            }
        }
        public static IControl SelectLabDictDropDown { get { return new Control(LabDictItem.WebElement, new SelectElement(LabDictItem.WebElement)); } }

        //public static IControl LabUnitLink
        //{
        //    get
        //    {
        //        return SyncUtilities.FindVisibleElement(By.CssSelector("#ctl00_ctl00_ContentBody_ContentBody_tabStripMapping > div >ul > li:nth-of-type(2) > a"));               
        //    }
        //}

        public static IControl LabUnitLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(linkName));
        }

        public static IControl LabTestLink(String linkName)
        {
            return SyncUtilities.FindVisibleElement(By.LinkText(linkName));
        }

        public static IControl DisplayInRRCheckBox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl05_ctl01"));
            }
        }

        public static IControl DisplayInRRCheckBoxOfATest
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl08_ctl01"));
            }
        }

        public static IControl DisplayInRRFirstTestCheckBox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl04_ctl01"));
            }
        }

        public static IControl DisplayInRRThirdTestCheckBox
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("ctl00_ctl00_ContentBody_ContentBody_grdLabTest_ctl00_ctl06_ctl01"));
            }
        }

        public static IControl HeaderText_H1()
        {
            return SyncUtilities.FindVisibleElement(By.CssSelector(".bodyCol h1"));
        }

    }
}
