using Common;
using Framework.Actions;
using Interfaces;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace Pages.DataLabs.ManageReferenceRanges
{
    public class ReferenceRangesPage
    {
        public static IControl LabTest
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector("span.float-right.ng-binding"));
            }
        }
        public static IControl LabTestDetails
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector("span:first-child"));
            }
        }

        public static IControl Checkbox_NotApplicable { get { return SyncUtilities.FindVisibleElement(By.CssSelector("input[type='checkbox'][name='NotApplicable']")); } }

        public static IControl AddnewrecordButton
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@id='gridReferenceRanges']/div[1]/a[1]"));                
            }
        }

        public static IControl CancelButton
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector("a.k-button.k-button-icontext.k-grid-cancel.a-span-red"));
            }
        }

        public static IControl LabTestLink
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//a[contains(text(),'Test1')]"));
            }
        }

        public static IControl SuccessMessage(string Message)

        {
            //return SyncUtilities.FindVisibleElement(By.XPath("//td[@id,'tdConfirmMsg']"));
            //return SyncUtilities.FindVisibleElement(By.XPath("//td[@id='tdConfirmMsg']/b[text()='" + Message + "']"));
            return SyncUtilities.FindVisibleElement(By.XPath("//td[@id='tdConfirmMsg']/b"));
            // return SyncUtilities.FindVisibleElement(By.XPath("//b[contains(.,'Lab test reference range added successfully')]"));


        }

        public static IControl ErrorMessage(string Message)
        {
            //return SyncUtilities.FindElement(By.XPath("//td[@id='tdConfirmMsg']/b[text()='" + Message + "']"));
            return SyncUtilities.FindElement(By.CssSelector(".k-notification-wrap"));
        }

        public static IControl ErrorMessageOnDuplicateRecordSave(String errormessage)
        {
            IControl c = SyncUtilities.FindElement(By.CssSelector(".layout__item div:nth-child(1) > div.pagetitle.rulebtm"));
            IControl b = SyncUtilities.FindElement(By.CssSelector("#appendto > div > div .k-notification-wrap"));
            //IControl h = SyncUtilities.FindElement_Parent(By.CssSelector(c.WebElement, "div.pagetitle.rulebtm"))
            return SyncUtilities.FindVisibleElement_Parent(c.WebElement, By.CssSelector("#appendto > div > div .k-notification-wrap"));
            //return SyncUtilities.FindVisibleElement(By.XPath("*[@id = 'appendto']/div/div[contains() ='" + errormessage +"']"));
            
           // return SyncUtilities.FindVisibleElement(By.XPath("div[contains(text(), '" + errormessage + "')]"));
            //a[contains(text(), 'About us' or 'about us')]
            //*[@id="appendto"]/div/div[contains()='Duplicate reference range record cannot be entered.']
            //*[@id="appendto"]/div/div
        }

        public static IControl SaveButton
        {
            get
            {
                return SyncUtilities.FindElement(By.CssSelector("a.k-button.k-button-icontext.k-primary.save"));
            }
        }

        public static IControl ChkBoxSelection { get { return SyncUtilities.FindVisibleElement(By.CssSelector("#header-chb")); } }
        //*[@id="d8301756-afdc-4c87-b1d4-56c502947edf"]/label

        public static IControl GetFirstRow
        {
            get
            {
                return SyncUtilities.FindElement(By.XPath("//*[@id='gridReferenceRanges']/div[3]/table/tbody/tr[1]"));
            }
        }

        public static IControl SetDefaultItem()
        {
            String dropdonwItemsHostCSSSelector = ".k-animation-container > div > div.k-list-optionlabel";
            return SyncUtilities.FindVisibleElement(By.CssSelector(dropdonwItemsHostCSSSelector));
        }

        public static IControl DeleteAllChkBox { get { return SyncUtilities.FindVisibleElement(By.CssSelector("label[for='header-chb']")); } }

        public static IControl GetErrorControl(String columnname)
        {
            String cssSelector = "div[data-for='"+columnname+"']";
            //return SyncUtilities.FindElement(By.CssSelector(cssSelector));
            if(columnname.Equals(columnname, StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindElement(By.CssSelector(cssSelector));
            }
            return null;
        }
        public static IControl ReferenceRangesGrid()
        {
            string referenceRangeGridCssSelector = "#gridReferenceRanges > div.k-grid-content.k-auto-scrollable > table > tbody";
            return SyncUtilities.FindVisibleElement(By.CssSelector(referenceRangeGridCssSelector));
        }
        public static List<string> GetReferenceRangesID()
        {
            List<string> refernceRangeIdsList = new List<string>();
            IControl referenceRangeTable = ReferenceRangesGrid();
            ReadOnlyCollection<IControl> rows = SyncUtilities.FindVisibleElements_Parent(referenceRangeTable.WebElement,By.TagName("tr"));
            foreach(IControl row in rows)
            {
                IControl referenceRangeId = SyncUtilities.FindVisibleElement_Parent(row.WebElement, By.XPath(".//td[2]"));
                refernceRangeIdsList.Add(referenceRangeId.WebElement.Text);
            }
            return refernceRangeIdsList;
        }
        public static IControl GetEditableRow()
        {
            //string textCssSelector = "#gridReferenceRanges > div.k-grid-content.k-auto-scrollable > table > tbody > tr.k-alt.k-grid-edit-row";
            string xpathtext = "//tr[contains(@class,'edit-row')]";
            IControl EditableRow = SyncUtilities.FindVisibleElement(By.XPath(xpathtext));
            if (Control_PropertyUtilities.IsControlNull(EditableRow))
            {
                return null;
            }
            return EditableRow;
        }
    }
}
