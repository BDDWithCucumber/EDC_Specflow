using System;
using Common;
using Interfaces;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using Utilities;
using Framework.Actions;

namespace Pages.DataLabs.Common
{
    public class DL_DCFs_SearchPalette
    {
        public static IControl SearchPalette_ExpandCollapseIcon
        {
            get { return SyncUtilities.FindVisibleElement(By.Id("DCFSearch_imgToggle")); }
        }

        public static IControl GoButton
        {
            get
            {
                return SyncUtilities.FindVisibleElement(By.Id("btnGo"));
            }
        }

        public static IControl GetDropdown_SearchPalette(String dropdownName)
        {
            IControl c = null;
            if (dropdownName.Equals("Created By", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlCreatedBy"));
            }
            else if (dropdownName.Equals("DCF Status", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlDCFStatus"));
            }
            else if (dropdownName.Equals("CRF", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlCRF"));
            }
            else if (dropdownName.Equals("Open Aging", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlAging"));
            }
            else if (dropdownName.Equals("Ready To Print", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlReadyToPrint"));
            }
            else if (dropdownName.Equals("Custom Field", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlCustomField"));
            }
            else if (dropdownName.Equals("Custom Field Value", StringComparison.InvariantCultureIgnoreCase))
            {
                c = SyncUtilities.FindVisibleElement(By.Id("DCFSearch_ddlCustomFieldValue"));
            }

            if (!Control_PropertyUtilities.IsControlNull(c))
            {
                return new Control(c.WebElement, new SelectElement(c.WebElement));
            }
            return null;
        }

        public static IControl GetTextbox_SearchPalette(String textboxName)
        {
            if (textboxName.Equals("Patient ID", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCFSearch_txtPatientSearch"));
            }
            else if (textboxName.Equals("DCF ID", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCFSearch_txtDCFSearch"));
            }
            else if(textboxName.Equals("Days Old", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCFSearch_txtAgingDays"));
            }
            else  if(textboxName.Equals("Batch ID", StringComparison.InvariantCultureIgnoreCase))
            {
                return SyncUtilities.FindVisibleElement(By.Id("DCFSearch_txtBatchID"));
            }
            return null;
        }
    }
}